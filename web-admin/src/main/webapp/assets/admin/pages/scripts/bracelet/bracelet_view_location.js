/**
 * Created by liun on 2018/4/17.
 */
var BraceletViewLocation = function () {

    var _self = "";
    var points = [];

    var allAppOverlays = [];
    var markerClusterer = null;
    var centerPoint = null;
    var mapSize = "";
    return {
        map: "",
        lastOverlay: "",
        infoBox: null,
        isClick: true,
        init: function () {
            _self = this;
            _self.mapInit();

            $("#elderMap").click(function () {
                $(this).addClass("btn-import");
                _self.addElderMarker_random();
                // setInterval(_self.addElderMarker_random, 5000);
            })
        },
        mapInit: function () {
            // 百度地图API功能
            _self.map = new BMap.Map("myMap", {enableMapClick: false, minZoom: 1, maxZoom: 21});    // 创建Map实例
            _self.map.centerAndZoom(new BMap.Point(119.931159, 32.464293), 13);  // 初始化地图,设置中心点坐标和地图级别
            _self.map.setCurrentCity("鞍山");
            _self.map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
            //-----BEGIN-------地图位置搜索功能
            var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
                {
                    "input": "suggestId"
                    , "location": _self.map
                });
            ac.setLocation("内蒙古市");
            ac.addEventListener("onconfirm", function (e) {    //鼠标点击下拉列表后的事件
                var _value = e.item.value;
                var myValue = _value.province + _value.city + _value.district + _value.street + _value.business;
                setPlace(myValue);
            });

            //搜索后添加marker
            function setPlace(myValue) {
                //清空地图
                // _self.map.clearOverlays();
                function myFun() {
                    var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
                    _self.map.centerAndZoom(pp, 15);
                }

                var local = new BMap.LocalSearch(_self.map, { //智能搜索
                    onSearchComplete: myFun
                });
                local.search(myValue);
            }
        },
        addElderMarker_random: function () {
            _self.clearMarker();
            //添加marker
            $.post(window.apppath + "/admin/api/nurse/alarm/getOrbitByBraceletId?braceletId="+braceletId, {}, function (data) {
                if (data != null) {
                    var res = data.data;
                    for (var i = 0; i < res.length; i++) {
                        var myIcon = new BMap.Icon(window.apppath + "/assets/global/icon/icon1_1.png", new BMap.Size(30, 30));
                        myIcon.setImageSize(new BMap.Size(30, 30));
                        var marker = new BMap.Marker(_self.tobdMap(res[i].lng, res[i].lat), {icon: myIcon});  // 创建标注 new BMap.Point(res[i].lng, res[i].lat)
                        points.push(new BMap.Point(res[i].lng, res[i].lat));
                        var content = _self.createInfoDiv(res[i]);
                        var title = '<div style="border-bottom: 1px solid #CCCCCC">' + res[i].pid + '</div>';
                        if (_self.isClick) {// 将标注添加到地图中
                            _self.addClickHandler(title, content, marker);
                        }
                        _self.map.addOverlay(marker);
                    }
                    if (points.length > 1) {
                        _self.map.setViewport(points);
                    }
                    if (points.length == 1) {
                        _self.map.centerAndZoom(points[0], 13);
                    }
                }
            }, 'json');
        },
        tobdMap: function (x, y) {
            var x_pi = 3.14159265358979324 * 3000.0 / 180.0;
            var z = Math.sqrt(x * x + y * y) + 0.00002 * Math.sin(y * x_pi);
            var theta = Math.atan2(y, x) + 0.000003 * Math.cos(x * x_pi);
            var bd_lon = z * Math.cos(theta) + 0.0065;
            var bd_lat = z * Math.sin(theta) + 0.006;
            var pt = new BMap.Point(bd_lon, bd_lat);
            return pt;
        },
        createElderInfoDiv: function (res) {
            var html = "";
            var sighHtml = "";
            var signResult = res.signResult;
            for (var i in signResult) {
                sighHtml += ['            <div class="MapLocation_con_list" style="width: 100%">',
                    '                <img style="width: 14px;height:16px;" src="' + window.apppath + '/assets/admin/layout/img/demand_serviceType.png" alt=""/>',
                    '                <p style="margin-bottom: 2px"><strong>' + signTypeName[i] + '：</strong>' + signResult[i] + '</p>',
                    '            </div>'].join("");
            }
            html += ['<div class="alert_main MapLocation" style="position:static">',
                '    <div class="alert_wrap_con" style="width: 321px">',
                '        <div class="alert_head_wrap" style="height: inherit">',
                '            <h4 style="margin: 0px;padding: 10px">' + res.elderName + '</h4>',
                '            <a href="javascript:void(0)" style="right: 10px" onclick="NurseMap.closeInfoBox();">×</a>',
                '        </div>',
                '        <div class="MapLocation_con">',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:14px;height: 16px" src="' + window.apppath + '/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong>性别：</strong>' + ["", "男", "女"][res.elderSex] + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width: 14px;height:16px;" src="' + window.apppath + '/assets/admin/layout/img/demand_age.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong>年龄：</strong>' + res.elderAge + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width: 14px;height:16px;" src="' + window.apppath + '/assets/admin/layout/img/demand_star.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong>设备：</strong>' + res.source + '</p>',
                '            </div>',
                sighHtml,
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width: 14px;height:16px;" src="' + window.apppath + '/assets/admin/pages/img/map_location_ico_1.jpg" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong>更新时间：</strong>' + res.createTime + '</p>',
                '            </div>',
                '        </div>',
                '        <div class="maplocation_horn"><img src="' + window.apppath + '/assets/admin/pages/img/map_location_ico.png" alt=""/></div>',
                '    </div>',
                '</div>',
            ].join("");
            return html;
        },
        createElderAlarmDiv: function (res) {
            var html = "";
            html += ['<div class="alert_main MapLocation" style="position:static">',
                '    <div class="alert_wrap_con" style="width: 321px">',
                '        <div class="alert_head_wrap" style="height: inherit">',
                '            <h4 style="margin: 0px;padding: 10px">' + res.alarmType + '</h4>',
                '            <a href="javascript:void(0)" style="right: 10px" onclick="BraceletViewLocation.closeInfoBox();">×</a>',
                '        </div>',
                '        <div class="MapLocation_con">',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:14px;height: 16px" src="' + window.apppath + '/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong>姓名：</strong>' + res.elderName + '</p>',
                '            </div>', '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:14px;height: 16px" src="' + window.apppath + '/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong>性别：</strong>' + ["", "男", "女"][res.elderSex] + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width: 14px;height:16px;" src="' + window.apppath + '/assets/admin/layout/img/demand_age.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong>年龄：</strong>' + res.elderAge + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width: 14px;height:16px;" src="' + window.apppath + '/assets/admin/pages/img/map_location_ico_1.jpg" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong>告警时间：</strong>' + res.alarmTime + '</p>',
                '            </div>',
                '        </div>',
                '        <div class="maplocation_horn"><img src="' + window.apppath + '/assets/admin/pages/img/map_location_ico.png" alt=""/></div>',
                '    </div>',
                '</div>',
            ].join("");
            return html;
        },
        addMarker: function () {
            _self.clearMarker();
            var braceletId = $("#braceletId").val();
            if(braceletId == undefined){
                return;
            }
            //添加marker
            $.post(window.apppath + "/admin/api/nurse/alarm/getOrbitByBraceletId?braceletId="+braceletId, {}, function (data) {
                if (data != null) {
                    var res = data.data;
                    if (res == null) {
                        return;
                    }
                    if (markerClusterer != null) {
                        markerClusterer.removeMarkers(allAppOverlays);
                    }
                    allAppOverlays = [];
                    centerPoint = _self.map.getCenter();
                    mapSize = _self.map.getZoom();
                    var polylineArr = [];
                    for (var i = 0; i < res.length; i++) {
                        polylineArr.push(_self.tobdMap(res[i].lng, res[i].lat))
                        var warningType = "/assets/global/icon/icon1_1.png";
                        if (res[i].fenceType == "sos_loc") {
                            warningType = "/assets/global/icon/icon2_1.png";
                        }
                        var myIcon = new BMap.Icon(window.apppath + warningType, new BMap.Size(30, 30));
                        myIcon.setImageSize(new BMap.Size(30, 30));
                        var marker = new BMap.Marker(_self.tobdMap(res[i].lng, res[i].lat), {icon: myIcon});  // 创建标注
                        points.push(_self.tobdMap(res[i].lng, res[i].lat));
                        var content = _self.createInfoDiv(res[i]);
                        var title = '<div style="border-bottom: 1px solid #CCCCCC">' + res[i].pid + '</div>';
                        if (_self.isClick) {// 将标注添加到地图中
                            _self.addClickHandler(title, content, marker);
                        }
                        _self.map.addOverlay(marker);
                        allAppOverlays.push(marker);
                    }
                    var polyline = new BMap.Polyline(polylineArr, {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.4});
                    _self.map.addOverlay(polyline);

                }
            }, 'json');
        },
        createInfoDiv: function (bracelet) {
            var html = "";
            var pid = bracelet.number;
            var mp = bracelet.floor;
            var addr = bracelet.building;
            var timestamp = bracelet.timestamp;
            var elderName = bracelet.elderName;//老人姓名
            var jhrXm = bracelet.jhrXm;//监护人姓名
            var jhrPhone = bracelet.jhrPhone;//监护人电话
            var gx = bracelet.gx;//与监护人关系
            var battery = bracelet.fenceName;//电量
            var rate = bracelet.signResult;
            var time = bracelet.createTime;

            if (pid == "" || pid == null) pid = "无";
            if (mp == "" || mp == null) mp = "无";
            if (addr == "" || addr == null) addr = "无";
            if (timestamp == "" || timestamp == null) timestamp = "无";
            if (elderName == "" || elderName == null) elderName = "无";
            if (jhrXm == "" || jhrXm == null) jhrXm = "无";
            if (jhrPhone == "" || jhrPhone == null) jhrPhone = "无";
            if (gx == "" || gx == null) gx = "无";
            if (battery == "" || battery == null) battery = "无";
            if (rate == "" || rate == null) rate = "无";
            if (time == "" || time == null) time = "无";


            html = ['<div class="alert_main MapLocation" style="position:static">',
                '    <div class="alert_wrap_con" style="width: 321px">',
                '        <div class="alert_head_wrap" style="height: inherit">',
                '            <h4 style="margin: 0px;padding: 10px">' + pid + '</h4>',
                '            <a href="javascript:void(0)" style="right: 10px" onclick="BraceletViewLocation.closeInfoBox();">×</a>',
                '        </div>',
                '        <div class="MapLocation_con">',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:16px;height: 16px" src="' + window.apppath + '/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong style="float: left">老人姓名：</strong><span style="float: left;width: 70%;">' + elderName + '</span></p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:16px;height: 16px"  src="' + window.apppath + '/assets/admin/pages/img/map_location_ico_14.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong style="float: left">设备号码：</strong><span style="float: left;width: 70%;">' + pid + '</span></p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:16px;height: 16px" src="' + window.apppath + '/assets/admin/pages/img/map_location_ico_21.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong>联系方式：</strong>' + mp + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:16px;height: 16px" src="' + window.apppath + '/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong>监护人姓名：</strong>' + jhrXm + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:16px;height: 16px" src="' + window.apppath + '/assets/admin/pages/img/map_location_ico_21.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong>监护人电话：</strong>' + jhrPhone + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:16px;height: 16px" src="' + window.apppath + '/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong>关系：</strong>' + gx + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:16px;height: 16px" src="' + window.apppath + '/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong>电量：</strong>' + battery + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:16px;height: 16px" src="' + window.apppath + '/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong>心率：</strong>' + rate + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:16px;height: 16px" src="' + window.apppath + '/assets/admin/pages/img/map_location_ico_1.jpg" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong>定位时间：</strong>' + time + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="min-height: 50px;width: 100%">',
                '                <img style="width:16px;height: 16px" src="' + window.apppath + '/assets/admin/pages/img/map_location_ico_23.png" alt=""/>',
                '                <div style="overflow: visible"><strong style="float: left">位置信息：</strong><span style="float: left;width:  70%;overflow: auto;height: 45px">' + addr + '</span></div>',
                '            </div>',
                '           <div style="text-align: right;padding-right: 10px">',
                // '              <button class="btn btn-default" style="background-color: #02bf81;color: white;font-size: 12px;" onclick="BraceletViewLocation.showOrbit(\'' + pid + '\')">查看轨迹</button>',
                '            </div>',
                '        </div>',
                '        <div class="maplocation_horn"><img src="' + window.apppath + '/assets/admin/pages/img/map_location_ico.png" alt=""/></div>',
                '    </div>',
                '</div>',
            ].join("");
            return html;
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
        closeInfoBox: function () {
            if (_self.infoBox != null)
                _self.infoBox.close();
        },
        clearMarker: function () {
            _self.map.clearOverlays();
        }
    }
}();