/**
 * Created by CoderQiang on 2017/2/13.
 */
var DispatchADemand = function () {
    var _self = "";
    //实例化鼠标绘制工具
    var drawingManager = null;
    var table = "";
    return {
        map: "",
        taskId: "",
        status: 0,
        infoBox: null,
        canDispatch: true,
        init: function (id) {
            _self = this;
            _self.taskId = id;
            _self.mapInit();
            _self.getTaskInfo();
            setInterval(_self.getTaskInfo, 2000);
            $("#dispatchBtn").click(function () {
                if (!_self.canDispatch) {
                    _self.alert("该订单不需要人工派单");
                }
                var self = this;
                //派单
                var selectId = $("#dataTable_serviceOrgs input[name=serviceOrgId]:checked").val();
                var receiverName = $("#dataTable_serviceOrgs input[name=serviceOrgId]:checked").attr("data");
                if (selectId != null && selectId != "") {
                    $(self).attr("disabled", "disabled");
                    //派单
                    $.post(window.apppath + "/admin/api/task/dispatch", {
                        taskId: _self.taskId,
                        selectId: selectId,
                        receiverName: receiverName,
                    }, function (res) {
                        $(self).removeAttr("disabled");
                        if (res.success) {
                            _self.alert("派单成功");
                            $('#serviceOrgs_modal').modal("hide");
                            _self.status = 2;
                            _self.mapInit();
                            drawingManager.close();
                        } else {
                            _self.alert(res.message);
                        }
                    }, "json");
                }
                else {
                    _self.alert("请选择要派单的组织");
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
                if ((status < 8 && status >= 3) || status == 10|| status == 11) {
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
                '            <div class="MapLocation_con_list" style="display: inline-block;width: 185px;padding: 5px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_21.png" alt=""/>',
                '                <p style="width: 135px"><strong>联系电话: </strong>' + data.elderMobile + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="display: inline-block;width: 127px;padding:5px">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_23.png" alt=""/>',
                '                <p style="width: 85px"><strong>服务项目: </strong>' + data.serviceType + '</p>',
                '            </div>',
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
                '                <p><strong>服务需求: </strong>' + data.content + '</p>',
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
        /**
         * 初始化鼠标绘制工具
         */
        initDrawingManager: function () {
            var overlay = null;
            var ids = "";//用户ids
            var userNames = "";//用户姓名
            var label = "";
            var overlaycomplete = function (e) {
                //初始化
                ids = "";
                userNames = "";
                _self.map.removeOverlay(label);
                overlay = e.overlay;
                centerPoint = null;
                var radius = e.overlay.getRadius();
                var path = e.overlay.getCenter();
                //获取被圈选的用户
                $.post(window.apppath + "/admin/api/getServiceOrgsByCircle", {
                    lat: path.lat, lng: path.lng, radius: radius
                }, function (res) {
                    if (res != null) {
                        //展示组织列表
                        _self.dataTableInit(res);

                        $('#serviceOrgs_modal').modal("show");
                    }
                }, 'json');
            };
            //监听modal hide事件
            $('#serviceOrgs_modal').on('hidden.bs.modal', function (e) {
                // do something...
                _self.map.removeOverlay(overlay);
                centerPoint = null;
            });
            var styleOptions = {
                strokeColor: "red",    //边线颜色。
                fillColor: "red",      //填充颜色。当参数为空时，圆形将没有填充效果。
                strokeWeight: 3,       //边线的宽度，以像素为单位。
                strokeOpacity: 0.8,	   //边线透明度，取值范围0 - 1。
                fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
                strokeStyle: 'solid' //边线的样式，solid或dashed。
            };
            //实例化鼠标绘制工具
            drawingManager = new BMapLib.DrawingManager(_self.map, {
                isOpen: false, //是否开启绘制模式
                enableDrawingTool: true, //是否显示工具栏
                drawingToolOptions: {
                    anchor: BMAP_ANCHOR_TOP_LEFT, //位置
                    offset: new BMap.Size(5, 5), //偏离值
                    drawingModes: [BMAP_DRAWING_CIRCLE]
                },
                circleOptions: styleOptions //矩形的样式
            });
            //添加鼠标绘制工具监听事件，用于获取绘制结果
            drawingManager.addEventListener('overlaycomplete', overlaycomplete);
            var centerPoint = null;

            function showInfo(e) {
                if (drawingManager._mask != null) {
                    drawingManager._mask.addEventListener('mousedown', getCenter);
                    _self.map.removeEventListener("mousemove", showInfo);
                }
            }

            var getCenter = function (e) {
                if (centerPoint == null) {
                    centerPoint = e.point;
                    drawingManager._mask.addEventListener("mousemove", showRadis);
                }
            };
            var showRadis = function (e) {
                var radius = drawingManager._map.getDistance(centerPoint, e.point);
                if (!isNaN(radius)) {
                    _self.map.removeOverlay(label);
                    //添加文字标签
                    var opts = {
                        position: e.point,    // 指定文本标注所在的地理位置
                        offset: new BMap.Size(0, 0)    //设置文本偏移量
                    }
                    label = new BMap.Label("当前半径" + (radius / 1000).toFixed(2) + "公里", opts);  // 创建文本标注对象
                    label.setStyle({
                        border: "1px solid #ccc",
                        maxWidth: "none "
                    });
                    _self.map.addOverlay(label);
                }
            };
            _self.map.addEventListener("mousemove", showInfo);
        },
        dataTableInit: function (data) {
            if (table != "") {
                table.destroy();
            }
            var tableHtml = "";
            for (var i in data) {
                var institutionTypeDicts = ["", "居家养老服务中心", "城镇小型托老所", "农村老年关爱之家", "助餐点", "老年活动中心", "其他","","公益志愿者组织"];
                tableHtml += '<tr>' +
                    '<td style="text-align: center"> ' +
                    '<input type="radio" name="serviceOrgId" data="' + data[i].serviceOrgName + '" value="' + data[i].serviceOrgId + '">' +
                    '</td>' +
                    '<td>' +
                    data[i].serviceOrgName +
                    '</td>' +
                    '<td>' +
                    institutionTypeDicts[(data[i].institutionTypeDictId == null || data[i].institutionTypeDictId == "" ? 0 : data[i].institutionTypeDictId.split(",")[0])] +
                    '</td>' +
                    '<td>' +
                    data[i].areaName +
                    '</td>' +
                    '<td>' +
                    ( data[i].address == null ? "" : data[i].address) +
                    '</td>' +
                    '</tr>';
            }
            $("#dataTable_serviceOrgs tbody").html(tableHtml);
            table = $('#dataTable_serviceOrgs').DataTable(
                {
                    "lengthChange": false,
                    "pageLength": 5, // default records per page
                    "language": { // language settings
                        // metronic spesific
                        "metronicGroupActions": "_TOTAL_ 条记录被选中",
                        "metronicAjaxRequestGeneralError": "请求服务器失败，请检查网络连接",
                        "sProcessing": "正在加载数据...",
                        // data tables spesific
                        "lengthMenu": "<span class='seperator'>|</span>每页显示 _MENU_ 条记录",
                        "info": "共 _TOTAL_ 条记录",
                        "infoEmpty": "暂无数据",
                        "infoFiltered": "",
                        "emptyTable": "没有数据",
                        "zeroRecords": "",
                        "paginate": {
                            "previous": "上一页",
                            "next": "下一页",
                            "last": "末页",
                            "first": "首页",
                        },

                    },
                }
            );
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
        }
    }
}();