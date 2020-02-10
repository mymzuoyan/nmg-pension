/**
 * Created by MaiBenBen on 2017/1/19.
 */
var DispatchMap = function () {

    var _self = "";
    var allAppOverlays = [];
    var markerClusterer = null;
    var nowData = [];
    var centerPoint = null;
    var mapSize = "";
    var allUserOverlays = [];
    return {
        map: "",
        infoBox: "",
        init: function () {
            _self = this;
            _self.mapInit();
            // setInterval(_self.getCounts, 2000);
            setInterval(_self.getDemands, 5000);
            _self.getServiceUsers();
            _self.getCounts();
        },
        mapInit: function () {
            // 百度地图API功能
            _self.map = new BMap.Map("dispatchMap", {enableMapClick: false});    // 创建Map实例
            _self.map.centerAndZoom(new BMap.Point(Global.lat,Global.lng), 13);  // 初始化地图,设置中心点坐标和地图级别
            _self.map.setCurrentCity("鞍山");
            _self.map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
        },
        getCounts: function () {
            $.post(window.apppath + "/admin/dispatch/api/getServiceTaskCount", {}, function (res) {
                var allCount = 0;
                for (var i in res) {
                    $("#" + i).html(res[i]);
                }
                $("#statics_data").show();
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
        getDemands: function () {
            $.post(window.apppath + "/admin/dispatch/api/getDemands", {}, function (res) {
                res = eval("(" + res + ")");
                if (_self.overlay_app_isChanged(res)) {
                    centerPoint = _self.map.getCenter();
                    mapSize = _self.map.getZoom();
                    nowData = [];
                    _self.getServiceUsers();
                    _self.getCounts();
                    //重新加载
                    _self.closeInfoBox();
                    if (markerClusterer != null)
                        markerClusterer.removeMarkers(allAppOverlays);
                    allAppOverlays = [];
                    var points = [];
                    for (var i in res) {
                        var data = res[i];
                        if (data.lng != "" && data.lng != null && data.lng != 0 && data.lat != "" && data.lat != null && data.lat != 0) {
                            var gifs = ["", "demand_red.gif", "demand_yellow.gif", "demand_green.gif"]
                            var status = data.status;
                            if ((status < 8 && status >= 3) || status == 10) {
                                status = 2;
                            }
                            else if (status == 9 || status == 8) {
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
                                    $.post(window.apppath + "/admin/api/task/deleteCache", {
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
                            if(data.status!=1)
                            {
                                markerMenu.addItem(new BMap.MenuItem('清除', removeMarker.bind(marker), {width: 50}));
                            }
                            markerMenu.addItem(new BMap.MenuItem('查看', showMarkInfo.bind(marker), {width: 50}));
                            var marker = new BMap.Marker(point, {icon: myIcon});
                            marker.addContextMenu(markerMenu);
                            var label = new BMap.Label(data.id + "," + data.status);
                            label.setStyle({display: "none"})
                            marker.setLabel(label);
                            var content = _self.createMapTaskInfo(data);
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
                if (data.lng != "" && data.lng != null && data.lng != 0 && data.lat != "" && data.lat != null && data.lat != 0) {
                    var content = data.id + "," + data.status;
                    if (oldContent.indexOf(content) < 0) {
                        //有新的需求或者需求状态改变
                        return true;
                    }
                }
            }
            return false;
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
        createMapTaskInfo: function (data) {
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
                '                <p style="width: 85px"><strong>服务项目: </strong>' + data.serviceType + '</p>',
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
            nowData.push(data);
            if (data.status == 1) {
                html += ['<button class="btn btn-default" style="background-color: #02bf81;color: white;font-size: 12px" onclick="DispatchMap.acceptTask(\'' + data.id + '\',\'' + data.receiverServiceOrg + '\')">接受工单</button>',
                ].join("");
            }
            if (data.status == 2) {
                html += ['<button class="btn btn-default" style="background-color: #02bf81;color: white;font-size: 12px" onclick="DispatchMap.sendUser(\'' + data.id + '\')">派遣工单</button>',
                ].join("");
            }
            html += ['<button class="btn btn-default" style="background-color: #02bf81;color: white;font-size: 12px;margin-left: 10px" onclick="DispatchMap.showMapInfo(\'' + data.id + '\')">查看详情</button>',
                '            </div>'].join("");

            html += ['        </div>',
                '        <div class="maplocation_horn"><img src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico.png" alt=""/></div>',
                '    </div>',
                '</div>'
            ].join("");
            return html;
        },
        showMapInfo: function (id) {
            var data = "";
            for (var i in nowData) {
                data = nowData[i];
                if (data.id == id) {
                    break;
                }
            }
            $("#taskInfo").html(_self.createTaskMoreInfo(data))
        },
        dispatchADemand: function (id) {
            _self.closeInfoBox();
            window.parent.open(window.apppath + "/admin/dispatch/dispatchADemand/" + id);
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
                    var typeName = ["现金支付", "刷卡支付", "支付宝支付", "微信支付","线上支付"]
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
            if (data.status == 1) {
                html += ['<button class="btn btn-default" style="background-color: #02bf81;color: white;font-size: 12px" onclick="DispatchMap.acceptTask(\'' + data.id + '\',\'' + data.receiverServiceOrg + '\')">接受工单</button>',
                ].join("");
            }
            if (data.status == 2) {
                html += ['<button class="btn btn-default" style="background-color: #02bf81;color: white;font-size: 12px" onclick="DispatchMap.sendUser(\'' + data.id + '\')">派遣工单</button>',
                ].join("");
            }
            html += ['        </div>',
                '        <div class="maplocation_horn"><img src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico.png" alt=""/></div>',
                '    </div>',
            ].join("");
            return html;
        },
        acceptTask: function (id, receiverOrgName) {
            if(receiverOrgName==null||receiverOrgName=="null")
            {
                receiverOrgName="";
            }
            $.post(window.apppath + "/admin/dispatch/api/acceptTask", {
                id: id,
                receiverOrgName: receiverOrgName
            }, function (res) {
                if (res.success) {
                    alert2(res.message,function () {
                        // window.location.reload();
                    });
                }
                else
                {
                    alert2(res.message)
                }
            }, 'json');
        },
        sendUser:function (id) {
            _self.closeInfoBox();
            window.parent.open(window.apppath + "/admin/dispatch/dispatchADemand/" + id);
        },
        closeInfoBox: function () {
            if (_self.infoBox != null && _self.infoBox != "")
                _self.infoBox.close();
            _self.infoBox = "";
        },
        getServiceUsers: function () {
            $.post(window.apppath + "/admin/dispatch/api/getServiceUsers", {}, function (res) {
                if (res != null) {
                    _self.clearMarkers(allUserOverlays);
                    allUserOverlays = [];
                    for (var i in res) {
                        var data = res[i];
                        if (data.lng != "" && data.lng != null && data.lng != 0 && data.lat != "" && data.lat != null && data.lat != 0) {
                            var pngs = ["user_idle.png", "user_busy.png"]
                            var status = data.userStatus;
                            var myIcon = new BMap.Icon(window.apppath + "/assets/admin/pages/img/" + pngs[status], new BMap.Size(30, 30));
                            myIcon.setImageSize(new BMap.Size(30, 30));
                            var point = new BMap.Point(data.lng.toFixed(5), data.lat.toFixed(5));
                            var marker = new BMap.Marker(point, {icon: myIcon});
                            var label = new BMap.Label(data.id + "," + status);
                            label.setStyle({display: "none"})
                            marker.setLabel(label);
                            _self.map.addOverlay(marker);
                            allUserOverlays.push(marker);
                            var content = _self.createUserInfo(data);
                            var title = '<div style="border-bottom: 1px solid #CCCCCC">服务人员：' + data.userName + '</div>';
                            _self.addClickHandler(title, content, marker);
                        }
                    }
                }
            }, 'json');
        },
        clearMarkers: function (markers) {
            for (var i in markers) {
                _self.map.removeOverlay(markers[i]);
            }
        },
        createUserInfo: function (data) {
            var html = "";
            var strs = ["空闲", "繁忙"];
            html += ['<div  id="taskInfo" class="alert_main MapLocation" style="position:static">',
                '    <div class="alert_wrap_con" style="width: 321px">',
                '        <div class="alert_head_wrap" style="height: 40px;">',
                '            <h4 style="margin: 0px;padding: 10px 0px">服务人员：' + data.userName + '</h4>',
                '            <a href="javascript:void(0)"  onclick="DispatchMap.closeInfoBox();">×</a>',
                '        </div>',
                '        <div class="MapLocation_con">',
                '            <div class="MapLocation_con_list" style="display: inline-block;width: 185px;padding: 5px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                '                <p style="width: 135px"><strong>服务人员: </strong>' + data.userName + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="display: inline-block;width: 127px;padding:5px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/layout/img/demand_age.png" alt=""/>',
                '                <p style="width: 85px"><strong>性别: </strong>' + data.gender + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/layout/img/demand_serviceType.png" alt=""/>',
                '                <p><strong style="    display: inline-block; margin-right: 3px;">服务类型: </strong><span style="    display: inline-block;vertical-align: text-top; width: 183px;">' + data.serviceType + '</span></p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_21.png" alt=""/>',
                '                <p style=""><strong>联系电话: </strong>' + data.phone + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_14.png" alt=""/>',
                '                <p><strong style="    display: inline-block; margin-right: 3px;">所在组织: </strong><span style="    display: inline-block;vertical-align: text-top; width: 183px;">' + data.serviceOrgName + '</span></p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_14.png" alt=""/>',
                '                <p><strong style="    display: inline-block; margin-right: 3px;">状态: </strong><span style="    display: inline-block;vertical-align: text-top; width: 183px;">' + strs[data.userStatus] + '</span></p>',
                '            </div>',
            ].join("");
            if (data.userStatus == 1) {
                //繁忙，显示工单信息
                html += ['            <div class="MapLocation_con_list" style="text-align: right;">'].join("");
                html += ['<button class="btn btn-default" style="background-color: #02bf81;color: white;font-size: 12px;margin-left: 10px" onclick="DispatchMap.showInfo(\'' + data.taskId + '\')">查看工单详情</button>',
                    '            </div>'].join("");
            }
            html += ['        </div>',
                '        <div class="maplocation_horn"><img src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico.png" alt=""/></div>',
                '    </div>',
                '</div>'
            ].join("");
            return html;
        }, showInfo: function (id) {
            //获取工单详情
            $.post(window.apppath + "/admin/api/task/getTaskHandle", {
                taskId: id
            }, function (res) {
                if (res != null && res != "") {
                    $("#taskInfo .modal-body").html("");
                    var content = _self.createTaskInfo(res);
                    $("#myModalLabel").html("工单信息");
                    $("#taskInfoDiv .modal-body").html(content);
                    $("#taskInfoDiv").modal("show");

                }
            }, 'json');
        },
        createTaskInfo: function (res) {
            var data = res.task;
            var html = "";
            var strs = ["", "待响应", "组织已响应", "组织已派遣", "组织已拒绝", "服务人员已接单", "服务人员已上门", "服务人员已拒绝", "待付款", "已完成", "已评价", "已调度"];
            html += ['<div class="" style="position:static">',
                '    <div class="" style="width: 100%">',
                '        <div class="MapLocation_con">',
                '        <div class="MapLocation_con">',
                '            <div class="MapLocation_con_list" style="display: inline-block;width: 30%;padding:4px 1%">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                '                <p ><strong>工单编号: </strong>' + data.number + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="display: inline-block;width: 30%;padding:4px 1%">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                '                <p ><strong>需求发布人: </strong>' + data.creatorName + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list"style="display: inline-block;width: 33%;padding:4px 1%">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_1.jpg" alt=""/>',
                '                <p><strong>服务时间: </strong>' + data.serviceTime + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="display: inline-block;width: 30%;padding: 4px 1%">',
                '                <img style=" vertical-align: top;width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                '                <p ><strong>服务对象: </strong>' + data.elderName + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="display: inline-block;width: 30%;padding:4px 1%">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/layout/img/demand_age.png" alt=""/>',
                '                <p ><strong>性别: </strong>' + (data.elderSex == 1 ? '男' : "女") + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="display: inline-block;width: 33%;padding:4px 1%">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/layout/img/demand_age.png" alt=""/>',
                '                <p ><strong>年龄: </strong>' + data.elderAge + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="padding: 4px 1%">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_14.png" alt=""/>',
                '                <p><strong>服务地址: </strong>' + data.serviceAddress + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="padding: 4px 1%">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_23.png" alt=""/>',
                '                <p><strong>服务项目: </strong>' + data.serviceType + '，' + data.serviceName + '，' + data.content + '</p>',
                '            </div>',
            ].join("");
            if (data.receiverServiceOrg != null && data.receiverServiceOrg != "") {
                _self.canDispatch = false;
                html += ['            <div class="MapLocation_con_list" style="display: inline-block;width: 30%;padding:4px 1%">',
                    '                <img style="width: 14px;height:16px;"  src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                    '                <p><strong style="    display: inline-block; margin-right: 3px;">服务组织: </strong><span style="    display: inline-block;vertical-align: text-top; width:155px;overflow: hidden">' + data.receiverServiceOrg + '</span></p>',
                    '            </div>'].join("");
            }
            if (data.receiverName != null && data.receiverName != "") {
                _self.canDispatch = false;
                html += ['            <div class="MapLocation_con_list" style="display: inline-block;width: 30%;padding:4px 1%">',
                    '                <img style="width: 14px;height:16px;"  src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                    '                <p><strong style="    display: inline-block; margin-right: 3px;">服务人员: </strong><span style="    display: inline-block;vertical-align: text-top; width:155px;overflow: hidden">' + data.receiverName + '</span></p>',
                    '            </div>'].join("");
            }
            html += ['            <div class="MapLocation_con_list" style="display: inline-block;width: 33%;padding: 4px 1%">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_21.png" alt=""/>',
                '                <p ><strong>联系电话: </strong>' + data.elderMobile + '</p>',
                '            </div>'].join("");
            html += ['            <div class="MapLocation_con_list" style="display: inline-block;width: 30%;padding:4px 1%">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_1.jpg" alt=""/>',
                '                 <p><strong>状态: </strong>' + strs[data.status] + '</p>',
                '            </div>',].join("");
            if (data.status == 9 || data.status == 10) {
                if (data.money != null) {
                    html += ['            <div class="MapLocation_con_list"style="display: inline-block;width: 30%;padding:4px 1%">',
                        '                <img style="width: 14px;height:16px;"  src=' + window.apppath + '"/assets/admin/layout/img/demand_content.png" alt=""/>',
                        '                 <p ><strong>消费金额: </strong>' + data.money + '元</p>',
                        '            </div>'].join("");
                }
                if (data.payType != null) {
                    var typeName = ["现金支付", "刷卡支付", "支付宝支付", "微信支付","线上支付"]
                    html += ['            <div class="MapLocation_con_list" style="display: inline-block;width: 30%;padding:4px 1%">',
                        '                <img style="width: 14px;height:16px;"  src=' + window.apppath + '"/assets/admin/layout/img/demand_content.png" alt=""/>',
                        '                 <p ><strong>支付方式: </strong>' + typeName[data.payType] + '</p>',
                        '            </div>'].join("");
                }
            }
            else {
                if (data.priceInfo != null) {
                    html += ['            <div class="MapLocation_con_list"style="display: inline-block;width: 30%;padding:4px 1%">',
                        '                <img style="width: 14px;height:16px;"  src=' + window.apppath + '"/assets/admin/layout/img/demand_content.png" alt=""/>',
                        '                 <p ><strong>工单定价: </strong>' + data.priceInfo + '</p>',
                        '            </div>'].join("");
                }
            }

            var level = "待评价";
            var comment = "";
            if (data.level != null && data.level != "") {
                level = data.level + '星';
            }
            if (data.comment != null && data.comment != "") {
                comment = ',' + data.comment;
            }
            html += ['            <div class="MapLocation_con_list" style="display: inline-block;width: 45%;padding:4px 1%">',
                '                <img style="width: 14px;height:16px;"  src=' + window.apppath + '"/assets/admin/layout/img/demand_star.png" alt=""/>',
                '                 <p><strong>评价星级: </strong>' + level + comment + '</p>',
                '            </div>'].join("");
            html += ['        </div>',
                '    </div>',
                '</div>'
            ].join("");

            html += ' <div class="about4_main">' +
                ' <h4>工单流程</h4>' +
                ' <ul>';
            var handles = res.handle;
            var ObjectStrs = ["", "服务对象", "服务组织", "服务组织", "服务组织", "服务人员", "服务人员", "服务人员", "服务人员", "服务人员", "服务对象", "资源调度平台"];
            var statusStrs = ["已删除", "发布工单", "响应工单", "派遣工单", "拒绝工单", "接受工单", "已上门", "已拒绝", "请求支付", "已完成", "已评价", "已调度"];
            for (var i in handles) {
                html += '<li>' +
                    handles[i].handleTime + '     ：' + ObjectStrs[handles[i].handleStatus] + handles[i].handleName + statusStrs[handles[i].handleStatus]
                '</li>';
            }
            html += ' </ul>' +
                '</div>';
            return html;
        },
        getServiceOrgLocation: function (serviceOrgId) {
            $.post(window.apppath + "/admin/dispatch/api/getServiceOrgLocation", {
                id: serviceOrgId
            }, function (res) {
                if (res != null) {
                    var iconUrl = "";
                    if (res.institutionTypeDictId != null && res.institutionTypeDictId != "") {
                        iconUrl = "/assets/global/icon/icon_a" + res.gradeDictId + ".png";
                    }
                    else {
                        iconUrl = "/assets/global/icon/icon1_1.png";
                    }
                    var myIcon = new BMap.Icon(window.apppath + iconUrl, new BMap.Size(19, 30));
                    myIcon.setImageSize(new BMap.Size(19, 30));
                    var marker = new BMap.Marker(new BMap.Point(res.lng, res.lat), {icon: myIcon});  // 创建标注
                    var content = _self.createInfoDiv(res);
                    var title = '<div style="border-bottom: 1px solid #CCCCCC">' + res.name + '</div>';
                    _self.map.addOverlay(marker);
                    _self.addClickHandler(title, content, marker);
                }
            }, 'json');
        },
        createInfoDiv: function (serviceOrg) {
            var html = "";
            var address = serviceOrg.address;
            var linkMan = serviceOrg.linkMan;
            var phone = serviceOrg.phone;
            var serviceProjectName = serviceOrg.serviceProjectName;
            if (address == "" || address == null)
                address = "无";
            if (linkMan == "" || linkMan == null)
                linkMan = "无";
            if (phone == "" || phone == null)
                phone = "无";
            if (serviceProjectName == "" || serviceProjectName == null)
                serviceProjectName = "无";
            html = ['<div class="alert_main MapLocation" style="position:static">',
                '    <div class="alert_wrap_con" style="width: 321px">',
                '        <div class="alert_head_wrap" style="height: inherit">',
                '            <h4 style="margin: 0px;padding: 10px">' + serviceOrg.serviceOrgName + '</h4>',
                '            <a href="javascript:void(0)" style="right: 10px" onclick="DispatchMap.closeInfoBox();">×</a>',
                '        </div>',
                '        <div class="MapLocation_con">',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:16px;height: 16px"  src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_14.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong style="float: left">组织地址：</strong><span style="float: left;width: 70%;">' + address + '</span></p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:16px;height: 16px" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong>联<strong style="margin: 6px">系</strong>人：</strong>' + linkMan + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:16px;height: 16px" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_21.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong>联系方式：</strong>' + phone + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="min-height: 50px;width: 100%">',
                '                <img style="width:16px;height: 16px" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_23.png" alt=""/>',
                '                <div style="overflow: visible"><strong style="float: left">服务内容：</strong><span style="float: left;width:  70%;overflow: auto;height: 45px">' + serviceProjectName + '</span></div>',
                '            </div>',
                '        </div>',
                '        <div class="maplocation_horn"><img src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico.png" alt=""/></div>',
                '    </div>',
                '</div>',
            ].join("");
            return html;
        }

    }
}();
