/**
 * Created by CoderQiang on 2017/2/13.
 */
var DispatchADemand = function () {
    var _self = "";
    var allUserOverlays = [];
    return {
        map: "",
        taskId: "",
        init: function (id) {
            _self = this;
            _self.taskId = id;
            _self.mapInit();
            _self.getTaskInfo();
            _self.getServiceUsers();
            setInterval(_self.getTaskInfo, 2000);
            setInterval(_self.getServiceUsers, 2000);
        },
        mapInit: function () {
            // 百度地图API功能
            _self.map = new BMap.Map("dispatchMap", {enableMapClick: false});    // 创建Map实例
            _self.map.centerAndZoom(new BMap.Point(Global.lat,Global.lng), 13);  // 初始化地图,设置中心点坐标和地图级别
            _self.map.setCurrentCity("鞍山");
            _self.map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
        },
        getTaskInfo: function () {
            //获取需求详情
            $.post(window.apppath + "/admin/api/task/getTask", {
                taskId: _self.taskId
            }, function (data) {
                var gifs = ["", "demand_red.gif", "demand_yellow.gif", "demand_green.gif"]
                var status = data.status;
                if (_self.status == status) {
                    return true;
                }
                _self.closeInfoBox();
                _self.map.clearOverlays();
                if ((status < 8 && status >= 3) || status == 10) {
                    status = 2;
                }
                else if (status == 9 || status == 8) {
                    status = 3;
                }
                var myIcon = new BMap.Icon(window.apppath + "/assets/admin/pages/img/" + gifs[status], new BMap.Size(30, 30));
                myIcon.setImageSize(new BMap.Size(30, 30));
                var marker = new BMap.Marker(new BMap.Point(data.lng, data.lat), {icon: myIcon});
                _self.map.centerAndZoom(new BMap.Point(data.lng, data.lat), 15);
                marker.setTitle(data.id);
                _self.status = data.status;
                var content = _self.createTaskInfo(data);
                var title = '<div style="border-bottom: 1px solid #CCCCCC">' + data.elderName + '发出的需求</div>';
                _self.addClickHandler(title, content, marker);
                _self.map.addOverlay(marker);
                if (_self.status == 1 && drawingManager == null)
                    _self.initDrawingManager();
            }, "json");
        },
        addClickHandler: function (title, content, marker) {
            marker.addEventListener("click", function (e) {
                    _self.openInfo(title, content, marker);
                }
            );
        },
        openInfo: function (title, content, marker) {
            if (_self.infoBox != null)
                _self.infoBox.close();
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
            var strs = ["", "待响应", "组织已响应", "组织已派遣", "组织已拒绝", "服务人员已接单", "服务人员已上门", "服务人员已拒绝", "待付款","已完成", "已评价", "已调度"];
            html += ['<div class="alert_main MapLocation" style="position:static">',
                '    <div class="alert_wrap_con" style="width: 321px">',
                '        <div class="alert_head_wrap" style="height: 40px;">',
                '            <h4 style="margin: 0px;padding: 10px 0px">' + data.creatorPhone + '的服务需求</h4>',
                '            <a href="javascript:void(0)"  onclick="DispatchADemand.closeInfoBox();">×</a>',
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
                '                <p style="width: 135px"><strong>联系电话: </strong>' + data.elderMobile + '</p>',
                '            </div>',
                // '            <div class="MapLocation_con_list" style="display: inline-block;width: 127px;padding:5px">',
                // '                <img style="width: 14px;height:16px;" src="' + window.apppath + '/assets/admin/pages/img/map_location_ico_23.png" alt=""/>',
                // '                <p style="width: 85px"><strong>服务项目: </strong>' + data.serviceType + '</p>',
                // '            </div>',
                '            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_14.png" alt=""/>',
                '                <p><strong style=" display: inline-block; margin-right: 3px;">服务地址: </strong><span style="    display: inline-block;vertical-align: text-top; width: 183px;">' + data.serviceAddress + '</span></p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_1.jpg" alt=""/>',
                '                <p><strong>服务时间: </strong>' + data.serviceTime + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_23.png" alt=""/>',
                '                <p><strong>服务需求: </strong>' + data.serviceType+'-'+data.serviceName+'-'+data.content + '</p>',
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
            if (data.money != null ) {
                html += ['            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                    '                <img style="width: 14px;height:16px;"  src=' + window.apppath + '"/assets/admin/layout/img/demand_content.png" alt=""/>',
                    '                 <p ><strong>消费金额: </strong>' + data.money + '元</p>',
                    '            </div>'].join("");
            }
            if (data.payType != null) {
                var typeName=["现金支付","刷卡支付","支付宝支付","微信支付","线上支付"]
                html += ['            <div class="MapLocation_con_list" style="padding: 4px 9px">',
                    '                <img style="width: 14px;height:16px;"  src=' + window.apppath + '"/assets/admin/layout/img/demand_content.png" alt=""/>',
                    '                 <p ><strong>支付方式: </strong>' +typeName[data.payType]  + '</p>',
                    '            </div>'].join("");
            }
            html += ['        </div>',
                '        <div class="maplocation_horn"><img src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico.png" alt=""/></div>',
                '    </div>',
                '</div>'
            ].join("");
            return html;
        },
        alert: function (res, callback) {
            $("#alertModal .alertModalMes").html(res);
            $("#alertModal").show();
            $("#alertModal .confirm").unbind('click').click(function () {
                $("#alertModal").hide()
                callback();
            })

            $("#alertModal .cancel").unbind('click').click(function () {
                $("#alertModal").hide()
            })
        },
        closeInfoBox: function () {
            if (_self.infoBox != null)
                _self.infoBox.close();
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
            if (data.userStatus == 0) {
                //繁忙，显示工单信息
                html += ['            <div class="MapLocation_con_list" style="text-align: right;">'].join("");
                html += ['<button class="btn btn-default" style="background-color: #02bf81;color: white;font-size: 12px;margin-left: 10px" onclick="DispatchADemand.demandTaskToUser(\'' + _self.taskId + '\',\'' +data.uid+ '\')">派单</button>',
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
                    var content = TaskAllList.createTaskInfo(res);
                    $("#myModalLabel").html("工单信息");
                    $("#taskInfoDiv .modal-body").html(content);
                    $("#taskInfoDiv").modal("show");

                }
            }, 'json');
        },
        demandTaskToUser:function (id,userId) {
            //获取工单详情
            $.post(window.apppath + "/admin/dispatch/api/insertTaskReceive", {
                taskId: id,
                receiveId:userId
            }, function (res) {
               if(res.success)
               {
                   _self.alert(res.message,function () {
                   })
               }
               else{
                   _self.alert(res.message);
               }
            }, 'json');
        }

    }
}();