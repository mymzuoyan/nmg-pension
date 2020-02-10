/**
 * Created by Administrator on 2016/9/27.
 */
var InstitutionMap = function () {

    var _self = "";
    var points = [];
    return {
        type: 2,
        map: "",
        drawingManager: "",//鼠标绘制工具
        lastOverlay: "",
        flag: false,//是否更新地址
        update: false,
        infoBox: null,
        isClick: true,
        init: function () {
            _self = this;
            _self.mapInit();
            $("#serviceProject").hide();

        },
        searchInit: function () {
            var areaName = "";
            var area2 = $("#area2").val();
            if (area2 == "-1") {
                areaName = $("#area1 option:selected").html();
            }
            else {
                areaName = $("#area2 option:selected").html();
            }
            $.post(window.apppath + "/admin/api/institution/all", {
                areaName: areaName,
                type: _self.type,
            }, function (res) {
                var source = [];
                if (res != "") {
                    for (var i in res) {
                        if (res[i].lat != null && res[i].lng != null && res[i].lat != "" && res[i].lng != "")
                            source.push(res[i].serviceOrgName);
                    }
                }
                if (source.length > 0) {
                    $('#name').completer({
                            source: source,
                            suggest: true
                        }
                    );
                }
            }, "json");

        },
        setUpdate: function (str) {
            _self.update = str;
        },
        setIsClick: function (str) {
            _self.isClick = str;
        },
        mapInit: function () {
            // 百度地图API功能
            _self.map = new BMap.Map("allmap", {enableMapClick: false, minZoom: 10, maxZoom: 15});    // 创建Map实例
            _self.map.centerAndZoom(new BMap.Point(Global.lat,Global.lng), 13);  // 初始化地图,设置中心点坐标和地图级别
            _self.map.setCurrentCity("鞍山");
            _self.map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
            // var b = new BMap.Bounds(new BMap.Point(118.252122,31.291834),new BMap.Point(119.296743,32.573453));
            // try {
            //     BMapLib.AreaRestriction.setBounds( _self.map, b);
            // } catch (e) {
            //     console.log(e);
            // }
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
        addMarker: function (areaName, name) {
            //清除
            _self.clearMarker();
            //添加marker
            $.post(window.apppath + "/admin/api/institution/all", {
                areaName: areaName,
                serviceOrgName: name,
                type: _self.type
            }, function (res) {
                if (res != null) {
                    for (var i = 0; i < res.length; i++) {
                        //图标
                        var iconUrl = "";
                        if (res[i].institutionTypeDictId != null && res[i].institutionTypeDictId != "") {
                            if (res[i].gradeDictId) {
                                iconUrl = "/assets/global/icon/icon_a" + (parseInt(res[i].gradeDictId) + 1) + ".png";

                            }
                            else {
                                iconUrl = "/assets/global/icon/icon_a" + res[i].gradeDictId + ".png";

                            }
                        }
                        else {
                            iconUrl = "/assets/global/icon/icon_anull.png";
                        }
                        var myIcon = new BMap.Icon(window.apppath + iconUrl, new BMap.Size(19, 30));
                        myIcon.setImageSize(new BMap.Size(19, 30));
                        var marker = new BMap.Marker(new BMap.Point(res[i].lng, res[i].lat), {icon: myIcon});  // 创建标注
                        points.push(new BMap.Point(res[i].lng, res[i].lat))
                        var content = _self.createInfoDiv(res[i]);
                        var title = '<div style="border-bottom: 1px solid #CCCCCC">' + res[i].name + '</div>';
                        _self.map.addOverlay(marker);
                        if (_self.isClick)// 将标注添加到地图中
                            _self.addClickHandler(title, content, marker);
                    }
                    // if (points.length > 1) {
                    //     _self.map.setViewport(points);
                    // }
                    // if (points.length == 1) {
                    //     _self.map.centerAndZoom(points[0], 13);
                    // }
                }
            }, 'json');
        },
        searchArea: function () {
            var area1 = $("#area1").val();
            var area2 = $("#area2").val();
            var name = $("#name").val();
            if (area2 == "-1") {
                _self.addMarker($("#area1 option:selected").html(), name);
            }
            else {
                _self.addMarker($("#area2 option:selected").html(), name);
            }
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
                '            <a href="javascript:void(0)" style="right: 10px" onclick="InstitutionMap.closeInfoBox();">×</a>',
                '        </div>',
                '        <div class="MapLocation_con">',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:16px;height: 16px"  src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_14.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong style="float: left">机构地址：</strong><span style="float: left;width: 70%;">' + address + '</span></p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:16px;height: 16px" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong>联<strong style="margin: 6px">系</strong>人：</strong>' + linkMan + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:16px;height: 16px" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_21.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong>联系方式：</strong>' + phone + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:16px;height: 16px" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_23.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong style="float: left">普通住宿床位：</strong><span style="float: left;width: 60%;">' + serviceOrg.bedCount + '（' + serviceOrg.bedMoney + '元(个)／月）</span></p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="width: 100%">',
                '                <img style="width:16px;height: 16px" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_23.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong style="float: left">护理床位：</strong><span style="float: left;width: 70%;">' + serviceOrg.bedNurseCount + '（' + serviceOrg.bedNurseMoney + '元(个)／月）</span></p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="min-height: 50px;width: 100%">',
                '                <img style="width:16px;height: 16px" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_23.png" alt=""/>',
                '                <p style="margin-bottom: 2px"><strong style="float: left">日间照料床位：</strong><span style="float: left;width: 60%;">' + serviceOrg.bedCareCount + '（' + serviceOrg.bedCareMoney + '元(个)／天）</span></p>',
                '            </div>',
                '        </div>',
                '            <div class="MapLocation_con_list" style="width: 100%;text-align:right">',
                '<button class="btn btn-default" style="background-color: #02bf81;color: white;font-size: 12px;margin-left: 10px" onclick="InstitutionMap.toComment('+serviceOrg.serviceOrgId+')">评价</button></div>',
                '        <div class="maplocation_horn"><img src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico.png" alt=""/></div>',
                '    </div>',
                '</div>',
            ].join("");
            return html;
        },
        toComment:function(id){
            window.location.href="/serviceOrg/comment/"+id
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
        },
        //服务组织定位
        showMarker: function (areaName, serviceOrgId, type) {
            //清除
            _self.clearMarker();

            //添加marker
            $.post(window.apppath + "/admin/api/serviceOrg/locationList", {
                areaName: areaName,
                serviceOrgId: serviceOrgId,
                type: type
            }, function (res) {
                if (res != null && res.length > 0) {
                    //图标
                    var iconUrl = "";
                    if (res[0].institutionTypeDictId != null && res[0].institutionTypeDictId != "") {
                        iconUrl = "/assets/global/icon/icon_a" + res[0].gradeDictId + ".png";
                    }
                    else {
                        iconUrl = "/assets/global/icon/icon_anull.png";
                    }
                    var myIcon = new BMap.Icon(window.apppath + iconUrl, new BMap.Size(19, 30));
                    myIcon.setImageSize(new BMap.Size(19, 30));
                    var marker = new BMap.Marker(new BMap.Point(res[0].lng, res[0].lat), {icon: myIcon});  // 创建标注
                    _self.lastOverlay = marker;
                    var content = _self.createInfoDiv(res[0]);
                    var title = '<div style="border-bottom: 1px solid #CCCCCC">' + res[0].name + '</div>';
                    _self.map.addOverlay(marker);
                    _self.openInfo(title, content, marker);
                    _self.addClickHandler(title, content, marker);
                    _self.map.centerAndZoom(new BMap.Point(res[0].lng, res[0].lat), 15);

                }
                _self.addDrawingManager();
            }, 'json');
        },
        addDrawingManager: function () {
            _self.drawingManager = new BMapLib.DrawingManager(_self.map, {
                isOpen: false, //是否开启绘制模式
                enableDrawingTool: true, //是否显示工具栏
                drawingToolOptions: {
                    anchor: BMAP_ANCHOR_TOP_RIGHT, //位置
                    offset: new BMap.Size(5, 5), //偏离值
                    drawingModes: [BMAP_DRAWING_MARKER]
                }
                //添加鼠标绘制工具监听事件，用于获取绘制结果
            });
            _self.drawingManager.addEventListener('overlaycomplete', _self.overlaycomplete);
        },
        overlaycomplete: function (e) {

            if (_self.lastOverlay != "") {
                _self.map.removeOverlay(_self.lastOverlay);
            }

            if (_self.infoBox != null)
                _self.infoBox.close();
            //完成
            _self.lastOverlay = e.overlay;
            _self.flag = true;
            _self.drawingManager.close();//关闭
        }
    }
}();