/**
 * Created by MaiBenBen on 2017/1/19.
 */
var DispatchMap = function () {

    var _self = "";
    var allCallOverlays = [];
    var allAppOverlays = [];
    var markerClusterer = null;
    var nowData = [];
    var flag = 0;
    var centerPoint = null;
    var mapSize = "";
    return {
        map: "",
        infoBox: "",
        init: function () {
            _self = this;
            _self.mapInit();
            setInterval(_self.getDemands, 2000);
            setInterval(_self.getCounts, 2000);
            $("#today_task_p").click(function () {
                if ($("#today_task_div").css("display") == "none") {
                    $("#today_task_div").show();
                    $(".arrow-left").show();
                    $.post(window.apppath + "/admin/dispatch/api/getTodayTaskCount", {}, function (res) {
                        if (res != null) {
                            for (var i in res) {
                                $("#" + i).html(res[i]);
                            }
                        }
                    }, 'json');
                }
                else {
                    $("#today_task_div").hide();
                    $(".arrow-left").hide();
                }
            })

        },
        mapInit: function () {
            // 百度地图API功能
            _self.map = new BMap.Map("dispatchMap", {enableMapClick: false});    // 创建Map实例
            _self.map.centerAndZoom(new BMap.Point(Global.lat,Global.lng), 13);  // 初始化地图,设置中心点坐标和地图级别
            _self.map.setCurrentCity("鞍山");
            _self.map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
        },
        getCounts: function () {
            $.post(window.apppath + "/admin/dispatch/api/getCount", {}, function (res) {
                var allCount = 0;
                var today_allCount = 0;
                for (var i in res) {
                    if (i.indexOf("today") < 0) {
                        allCount += parseInt(res[i]);
                    } else {
                        today_allCount += parseInt(res[i]);
                    }
                    $("#" + i).html(res[i]);
                }
                $("#allCount").html(allCount);
                $("#today_allCount").html(today_allCount);
                $("#statics_data").show();
                //    需求切换
                $(".needs_nav span").click(function () {
                    $(this).addClass('active').siblings().removeClass('active');
                    $(".needs_info_box .needs_info").eq($(this).index()).show().siblings().hide();
                    $("#today_task_div").hide();
                    $(".arrow-left").hide();
                });
                //  需求显隐
                $(".box-btn span").click(function () {
                    if ($(this).index() == 0) {
                        $(this).hide().siblings().show().parent('.box-btn').siblings().hide();
                    } else {
                        $(this).hide().siblings().show().parent('.box-btn').siblings().show();
                    }
                });
            }, "json");
        },
        getCallingNum: function () {
            $.post(window.apppath + "/admin/dispatch/api/getCallingNum", {}, function (res) {
                if (res != null) {
                    var addOverlays = [];
                    var newOverlays = _self.removeOverlay_call(res);
                    var flag = 0;
                    for (var i in res) {
                        (function (num) {
                            flag++;
                            if (newOverlays.indexOf(res[num].id) >= 0) {
                                var myGeo = new BMap.Geocoder();
                                // 将地址解析结果显示在地图上,并调整地图视野
                                myGeo.getPoint(res[num].moreAddress, function (point) {
                                    if (point) {
                                        var myIcon = new BMap.Icon(window.apppath + "/assets/admin/pages/img/calling.gif", new BMap.Size(40, 40));
                                        myIcon.setImageSize(new BMap.Size(40, 40));
                                        var marker = new BMap.Marker(point, {icon: myIcon});
                                        marker.setTitle(res[num].id)
                                        var content = _self.createCallInfo(res[num]);
                                        var title = '<div style="border-bottom: 1px solid #CCCCCC">来电号码：' + res[num].beeperNum + '</div>';
                                        allCallOverlays.push(marker);
                                        addOverlays.push(marker);
                                        _self.addClickHandler(title, content, marker, "app");
                                        if (flag == res.length) {
                                            if (markerClusterer != null) {
                                                markerClusterer.addMarkers(addOverlays);
                                            }
                                            else
                                                markerClusterer = new BMapLib.MarkerClusterer(_self.map, {markers: allCallOverlays});
                                        }
                                    } else {
                                        console.log("您选择地址没有解析到结果!");
                                    }
                                }, res[i].address.split(",")[0]);
                            }
                        })(i);
                    }
                }
            }, "json");
        },
        getDemands: function () {
            $.post(window.apppath + "/admin/dispatch/api/getDemands", {}, function (res) {
                res = eval("(" + res + ")");
                if (_self.overlay_app_isChanged(res)) {
                    centerPoint = _self.map.getCenter();
                    mapSize = _self.map.getZoom();
                    nowData = [];
                    //重新加载
                    _self.closeInfoBox();
                    if (markerClusterer != null)
                        markerClusterer.removeMarkers(allAppOverlays);
                    allAppOverlays = [];
                    var points = [];
                    for (var i in res) {
                        var data = res[i];
                        if (data.mapStatus == 2) {
                            continue;
                        }
                        if (data.lng != "" && data.lng != null && data.lng != 0 && data.lat != "" && data.lat != null && data.lat != 0) {
                            var gifs = ["", "demand_red.gif", "demand_yellow.gif", "demand_green.gif"]
                            var status = data.status;
                            if ((status < 9 && status >= 3) || status == 11) {
                                status = 2;
                            }
                            else if (status == 9 || status == 10) {
                                status = 3;
                            }
                            var myIcon = new BMap.Icon(window.apppath + "/assets/admin/pages/img/" + gifs[status], new BMap.Size(30, 30));
                            myIcon.setImageSize(new BMap.Size(30, 30));
                            var point = new BMap.Point(data.lng.toFixed(5), data.lat.toFixed(5));
                            points.push(point);
                            var removeMarker = function (e, ee, marker) {
                                var content = marker.getLabel().content;
                                //删除
                                if (content != null && content != "") {
                                    var taskId = content.split(",")[0];
                                    $.post(window.apppath + "/admin/api/task/removeTaskCacheFromMap", {
                                        id: taskId
                                    }, function (res) {
                                        markerClusterer.removeMarker(marker);
                                    }, "json");
                                }
                            }
                            var showMarkInfo = function (e, ee, marker) {
                                BMapLib.EventWrapper.trigger(marker, 'click');
                            }
                            //创建右键菜单
                            var markerMenu = new BMap.ContextMenu();
                            markerMenu.addItem(new BMap.MenuItem('清除', removeMarker.bind(marker), {width: 50}));
                            markerMenu.addItem(new BMap.MenuItem('查看', showMarkInfo.bind(marker), {width: 50}));
                            var marker = new BMap.Marker(point, {icon: myIcon});
                            marker.addContextMenu(markerMenu);
                            var label = new BMap.Label(data.id + "," + data.status);
                            label.setStyle({display: "none"})
                            marker.setLabel(label);
                            var content = _self.createTaskInfo(data);
                            var title = '<div style="border-bottom: 1px solid #CCCCCC">' + data.elderName + '发出的需求</div>';
                            allAppOverlays.push(marker);
                            _self.addClickHandler(title, content, marker, "demand");
                        }
                    }
                    if (markerClusterer != null) {
                        markerClusterer.addMarkers(allAppOverlays);
                    }
                    else
                        markerClusterer = new BMapLib.MarkerClusterer(_self.map, {markers: allAppOverlays});
                    _self.map.setCenter(centerPoint);
                    _self.map.setZoom(mapSize);
                }
            });
        },
        overlay_app_isChanged: function (res) {
            var oldContent = [];
            if (allAppOverlays.length > 0) {
                for (var i in allAppOverlays) {
                    if (allAppOverlays[i].getLabel() != null) {
                        oldContent.push(allAppOverlays[i].getLabel().content);
                    }
                }
            }
            var count = 0;
            for (var i in res) {
                count++;
                var data = res[i];
                if (data.lng != "" && data.lng != null && data.lng != 0 && data.lat != "" && data.lat != null && data.lat != 0 && data.mapStatus != 2) {
                    var content = data.id + "," + data.status;
                    if (oldContent.indexOf(content) < 0) {
                        //有新的需求或者需求状态改变
                        return true;
                    }
                }
            }
            return false;
        },
        removeOverlay_call: function (res) {
            var removes = [];
            var newOverlays = [];
            for (var j in res) {
                newOverlays.push(res[j].id);
            }
            for (var i in allCallOverlays) {
                //removeOverlay
                var title = allCallOverlays[i].getTitle();
                //呼叫器相应marker
                var flag = false;
                for (var j in newOverlays) {
                    if (newOverlays[j] == title) {
                        flag = true;
                        newOverlays.splice(j, 1)
                    }
                }
                if (!flag) {
                    removes.push(allCallOverlays[i])
                    allCallOverlays.splice(i, 1);
                }
            }
            if (markerClusterer != null)
                markerClusterer.removeMarkers(removes);
            return newOverlays;
        },
        addClickHandler: function (title, content, marker) {
            BMapLib.EventWrapper.addListener(marker, 'click', function (e) {
                _self.openInfo(title, content, marker);
            });
        },
        openInfo: function (title, content, marker) {
            _self.closeInfoBox();
            _self.infoBox = new BMapLib.InfoBox(_self.map, content,
                {
                    boxStyle: {
                        left: "600px"
                    },
                    offset: new BMap.Size(0, 20),
                    enableAutoPan: true,
                    closeIconUrl: 'null',
                    align: 1
                });
            _self.infoBox.open(marker);

        },
        createTaskInfo: function (data) {
            var html = "";
            var strs = ["", "待响应", "组织已响应", "组织已派遣", "组织已拒绝", "服务人员已接单", "服务人员已上门", "服务人员已拒绝", "待付款", "已完成", "已评价", "已调度"];
            html += ['<div  id="taskInfo" class="alert_main MapLocation" style="position:static">',
                '    <div class="alert_wrap_con" style="width: 321px">',
                '        <div class="alert_head_wrap" style="height: 40px;">',
                '            <h4 style="margin: 0px;padding: 10px 0px">' + data.creatorPhone + '的服务需求</h4>',
                '            <a href="javascript:void(0)"  onclick="DispatchMap.closeInfoBox();">×</a>',
                '        </div>',
                '        <div class="MapLocation_con">',
                '            <div class="MapLocation_con_list" style="display: inline-block;width: 185px;padding: 5px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                '                <p style="width: 135px"><strong>服务对象: </strong>' + data.elderName + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="display: inline-block;width: 127px;padding:5px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/layout/img/demand_age.png" alt=""/>',
                '                <p style="width: 85px"><strong>年龄: </strong>' + (data.elderAge == "undefined" || data.elderAge == "null" ? "" : data.elderAge) + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="display: inline-block;width: 185px;padding: 5px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_21.png" alt=""/>',
                '                <p style="width: 148px"><strong>联系电话: </strong>' + data.elderMobile + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="display: inline-block;width: 127px;padding:5px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/layout/img/demand_serviceType.png" alt=""/>',
                '                <p style="width: 90px"><strong>服务项目: </strong>' + data.serviceType + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_14.png" alt=""/>',
                '                <p><strong style="    display: inline-block; margin-right: 3px;">服务地址: </strong><span style="    display: inline-block;vertical-align: text-top; width: 183px;">' + data.serviceAddress + '</span></p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_1.jpg" alt=""/>',
                '                <p><strong>服务时间: </strong>' + data.serviceTime + '</p>',
                '            </div>',
            ].join("");
            html += ['            <div class="MapLocation_con_list" style="text-align: right;">'].join("");
            if (data.status == 1 && (data.receiverName == null || data.receiverName == "")) {
                html += ['<button class="btn btn-default" style="background-color: #02bf81;color: white;font-size: 12px" onclick="DispatchMap.dispatchADemand(\'' + data.id + '\')">需求调度</button>',
                ].join("");
            }
            nowData.push(data);
            html += ['<button class="btn btn-default" style="background-color: #02bf81;color: white;font-size: 12px;margin-left: 10px" onclick="DispatchMap.showInfo(\'' + data.id + '\')">查看详情</button>',
                '            </div>'].join("");
            html += ['        </div>',
                '        <div class="maplocation_horn"><img src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico.png" alt=""/></div>',
                '    </div>',
                '</div>'
            ].join("");
            return html;
        },
        createCallInfo: function (customer) {
            var html = "";
            var address = customer.address;
            var name = customer.name;
            var moreAddress = customer.moreAddress;
            if (address == "" || address == null)
                address = "无";
            if (moreAddress == "" || moreAddress == null)
                moreAddress = "无";
            if (name == "" || name == null)
                name = "无";
            html = ['<div class="alert_main MapLocation" style="position:static">',
                '    <div class="alert_wrap_con" style="width: 321px">',
                '        <div class="alert_head_wrap">',
                '            <h3 style="margin: 0px;padding: 10px">来电号码：' + customer.callNum + '</h3>',
                '            <a href="javascript:void(0)" onclick="DispatchMap.closeInfoBox();">×</a>',
                '        </div>',
                '        <div class="MapLocation_con">',
                '            <div class="MapLocation_con_list">',
                '                <img src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_14.png" alt=""/>',
                '                <p><strong>所属区域: </strong>' + address + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list">',
                '                <img src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                '                <p><strong>详细地址: </strong>' + moreAddress + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list">',
                '                <img src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_21.png" alt=""/>',
                '                <p><strong>来电姓名: </strong>' + name + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list">',
                '                <img src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_23.png" alt=""/>',
                '                <div><strong>来电类型: </strong>' + customer.callType + '</div>',
                '            </div>',
                '        </div>',
                '        <div class="maplocation_horn"><img src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico.png" alt=""/></div>',
                '    </div>',
                '</div>',
            ].join("");
            return html;
        },
        dispatchADemand: function (id) {
            _self.closeInfoBox();
            window.parent.open(window.apppath + "/admin/dispatch/dispatchADemand/" + id);
        },
        showInfo: function (id) {
            var data = "";
            for (var i in nowData) {
                data = nowData[i];
                if (data.id == id) {
                    break;
                }
            }
            $("#taskInfo").html(_self.createTaskMoreInfo(data))
        },
        createTaskMoreInfo: function (data) {
            var html = "";
            var strs = ["", "待响应", "组织已响应", "组织已派遣", "组织已拒绝", "服务人员已接单", "服务人员已上门", "服务人员已拒绝", "待付款", "已完成", "已评价", "已调度"];
            html += [
                '    <div class="alert_wrap_con" style="width: 321px">',
                '        <div class="alert_head_wrap" style="height: 40px;">',
                '            <h4 style="margin: 0px;padding: 10px 0px">' + data.creatorPhone + '的服务需求</h4>',
                '            <a href="javascript:void(0)"  onclick="DispatchMap.closeInfoBox();">×</a>',
                '        </div>',
                '        <div class="MapLocation_con">',
                '            <div class="MapLocation_con_list" style="display: inline-block;width: 185px;padding: 5px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                '                <p style="width: 135px"><strong>服务对象: </strong>' + data.elderName + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="display: inline-block;width: 127px;padding:5px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/layout/img/demand_age.png" alt=""/>',
                '                <p style="width: 85px"><strong>年龄: </strong>' + data.elderAge + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_21.png" alt=""/>',
                '                <p style="width: 148px"><strong>联系电话: </strong>' + data.elderMobile + '</p>',
                '            </div>',
                // '            <div class="MapLocation_con_list" style="display: inline-block;width: 127px;padding:5px">',
                // '                <img style="width: 14px;height:16px;" src="' + window.apppath + '/assets/admin/pages/img/map_location_ico_23.png" alt=""/>',
                // '                <p style="width: 85px"><strong>服务项目: </strong>' + data.serviceType + '</p>',
                // '            </div>',
                '            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_14.png" alt=""/>',
                '                <p><strong style="    display: inline-block; margin-right: 3px;">服务地址: </strong><span style="    display: inline-block;vertical-align: text-top; width: 183px;">' + data.serviceAddress + '</span></p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_1.jpg" alt=""/>',
                '                <p><strong>服务时间: </strong>' + data.serviceTime + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_23.png" alt=""/>',
                '                <p><strong>服务需求: </strong>' + data.serviceType + "-" + data.serviceName + "-" + data.content + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_1.jpg" alt=""/>',
                '                 <p><strong>状态: </strong>' + strs[data.status] + '</p>',
                '            </div>',
            ].join("");
            if (data.receiverServiceOrg != null && data.receiverServiceOrg != "") {
                _self.canDispatch = false;
                html += ['            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                    '                <img style="width: 14px;height:16px;"  src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                    '                 <p><strong>接收组织: </strong>' + data.receiverServiceOrg + '</p>',
                    '            </div>'].join("");
            }
            if (data.receiverName != null && data.receiverName != "") {
                _self.canDispatch = false;
                html += ['            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                    '                <img style="width: 14px;height:16px;"  src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                    '                 <p><strong>接收人: </strong>' + data.receiverName + '</p>',
                    '            </div>'].join("");
            }
            if (data.level != null && data.level != "") {
                html += ['            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                    '                <img style="width: 14px;height:16px;"  src=' + window.apppath + '"/assets/admin/layout/img/demand_star.png" alt=""/>',
                    '                 <p><strong>评价星级: </strong>' + data.level + '星</p>',
                    '            </div>'].join("");
            }
            if (data.comment != null && data.comment != "") {
                html += ['            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                    '                <img style="width: 14px;height:16px;"  src=' + window.apppath + '"/assets/admin/layout/img/demand_content.png" alt=""/>',
                    '                 <p ><strong>评价内容: </strong>' + data.comment + '</p>',
                    '            </div>'].join("");
            }
            if (data.status == 9 || data.status == 10) {
                if (data.money != null) {
                    html += ['            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                        '                <img style="width: 14px;height:16px;"  src=' + window.apppath + '"/assets/admin/layout/img/demand_content.png" alt=""/>',
                        '                 <p ><strong>消费金额: </strong>' + data.money + '元</p>',
                        '            </div>'].join("");
                }
                if (data.payType != null) {
                    var typeName = ["现金支付", "刷卡支付", "支付宝支付", "微信支付", "线上支付"]
                    html += ['            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                        '                <img style="width: 14px;height:16px;"  src=' + window.apppath + '"/assets/admin/layout/img/demand_content.png" alt=""/>',
                        '                 <p ><strong>支付方式: </strong>' + typeName[data.payType] + '</p>',
                        '            </div>'].join("");
                }
            }
            else if (data.priceInfo != null) {
                html += ['            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                    '                <img style="width: 14px;height:16px;"  src=' + window.apppath + '"/assets/admin/layout/img/demand_content.png" alt=""/>',
                    '                 <p ><strong>工单定价: </strong>' + data.priceInfo + '</p>',
                    '            </div>'].join("");
            }
            html += ['            <div class="MapLocation_con_list" style="text-align: right;">'].join("");
            if (data.status == 1 && (data.receiverName == null || data.receiverName == "")) {
                html += ['<button class="btn btn-default" style="background-color: #02bf81;color: white;font-size: 12px" onclick="DispatchMap.dispatchADemand(\'' + data.id + '\')">需求调度</button>',
                ].join("");
            }
            html += ['        </div>',
                '        <div class="maplocation_horn"><img src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico.png" alt=""/></div>',
                '    </div>',
            ].join("");
            return html;
        },
        closeInfoBox: function () {
            if (_self.infoBox != null && _self.infoBox != "")
                _self.infoBox.close();
            _self.infoBox = "";
        }
    }
}();
