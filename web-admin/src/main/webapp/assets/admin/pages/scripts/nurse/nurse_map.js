/**
 * Created by gengqiang on 2017/8/22.
 */
var NurseMap = function () {

    var _self = "";
    var points = [];
    return {
        map: "",
        lastOverlay: "",
        infoBox: null,
        init: function () {
            _self = this;
            _self.mapInit();
            _self.addElderMarker_random();
        },
        mapInit: function () {
            // 百度地图API功能
            _self.map = new BMap.Map("allmap", {enableMapClick: false, minZoom: 10, maxZoom: 15});    // 创建Map实例
            _self.map.centerAndZoom(new BMap.Point(Global.lat, Global.lng), 13);  // 初始化地图,设置中心点坐标和地图级别
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
        addAlarmMarker: function () {
        },
        addElderMarker_random: function () {
            _self.clearMarker();
            $.post(window.apppath + "/admin/api/nurse/location/list", {}, function (res) {
                if (res != null) {
                    console.log(res);
                    for (var i in res) {
                        for(var j=0;j<10;j++)
                        {
                            var marker = "";
                            if (j % 2 == 0)
                                marker = new BMap.Marker(new BMap.Point(res[i].lng + Math.random() * 0.051, res[i].lat + Math.random() * 0.051));  // 创建标注
                            else
                                marker = new BMap.Marker(new BMap.Point(res[i].lng - Math.random() * 0.051, res[i].lat - Math.random() * 0.051));  // 创建标注
                            var content = "";
                            content = _self.createElderInfoDiv(res[i]);
                            var title = '';
                            _self.map.addOverlay(marker);
                            _self.addClickHandler(title, content, marker);
                        }
                    }
                }
            }, 'json');
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
        addMarker: function (areaName, name) {
            //清除
            _self.clearMarker();

            var institutionTypeDictId = $("#institutionTypeDictId").val();
            if (institutionTypeDictId == null || institutionTypeDictId == "")
                institutionTypeDictId = null;
            //添加marker
            $.post(window.apppath + "/admin/api/nurse/serviceOrg/location/list", {
                areaName: areaName,
                serviceOrgName: name,
                institutionTypeDictId: institutionTypeDictId
            }, function (res) {
                if (res != null) {
                    for (var i = 0; i < res.length; i++) {
                        //图标
                        var iconUrl = "";
                        if (res[i].institutionTypeDictId != null && res[i].institutionTypeDictId != "") {
                            iconUrl = "/assets/global/icon/icon_a" + res[i].gradeDictId + ".png";
                        }
                        else {
                            iconUrl = "/assets/global/icon/icon1_1.png";
                        }
                        var myIcon = new BMap.Icon(window.apppath + iconUrl, new BMap.Size(19, 30));
                        myIcon.setImageSize(new BMap.Size(19, 30));
                        var marker = new BMap.Marker(new BMap.Point(res[i].lng, res[i].lat), {icon: myIcon});  // 创建标注
                        points.push(new BMap.Point(res[i].lng, res[i].lat))
                        var content = _self.createInfoDiv(res[i]);
                        var title = '<div style="border-bottom: 1px solid #CCCCCC">' + res[i].name + '</div>';
                        _self.map.addOverlay(marker);
                        _self.addClickHandler(title, content, marker);
                    }
                    _self.map.centerAndZoom(new BMap.Point(Global.lat, Global.lng), 13);  // 初始化地图,设置中心点坐标和地图级别

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
                '            <a href="javascript:void(0)" style="right: 10px" onclick="NurseMap.closeInfoBox();">×</a>',
                '        </div>',
                '        <div class="MapLocation_con">',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:16px;height: 16px"  src="' + window.apppath + '/assets/admin/pages/img/map_location_ico_14.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong style="float: left">组织地址：</strong><span style="float: left;width: 70%;">' + address + '</span></p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:16px;height: 16px" src="' + window.apppath + '/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong>联<strong style="margin: 6px">系</strong>人：</strong>' + linkMan + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:16px;height: 16px" src="' + window.apppath + '/assets/admin/pages/img/map_location_ico_21.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong>联系方式：</strong>' + phone + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="min-height: 50px;width: 100%">',
                '                <img style="width:16px;height: 16px" src="' + window.apppath + '/assets/admin/pages/img/map_location_ico_23.png" alt=""/>',
                '                <div style="overflow: visible"><strong style="float: left">服务内容：</strong><span style="float: left;width:  70%;overflow: auto;height: 45px">' + serviceProjectName + '</span></div>',
                '            </div>',
                '<div style="text-align: right;padding-right: 10px">',
                '<button class="btn btn-default" style="background-color: #02bf81;color: white;font-size: 12px;" onclick="NurseMap.showDirectAccress()">查看详情</button>',
                '        </div>',
                '        </div>',
                '        <div class="maplocation_horn"><img src="' + window.apppath + '/assets/admin/pages/img/map_location_ico.png" alt=""/></div>',
                '    </div>',
                '</div>',
            ].join("");
            return html;
        },
        showDirectAccress: function () {
            window.parent.addTab("directAccress", "楼层实时监控", "http://121.41.108.119:2080/xungeng/monitor/directAccress.htm?username=wl&pwd=123456");
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