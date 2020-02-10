/**
 * Created by Administrator on 2016/9/13.
 */
var EographicArea = function () {

    var _self = "";
    return {
        selectId: -1,
        selectStr: "",
        init: function () {
            _self = this;
        },
        initWith: function (str) {
            _self = this;
            _self.selectStr = str;

        },
        changeProvince: function (callBack) {
            $("#city option").remove();
            $("#city").append("<option value=''>直辖市、地级市</option>");
            $("#city").attr("readonly", true);

            $("#county option").remove();
            $("#county").append("<option value=''>行政区</option>");
            $("#county").attr("readonly", true);

            $("#town option").remove();
            $("#town").append("<option value=''>街道、镇</option>");
            $("#town").attr("readonly", true);

            $("#village option").remove();
            $("#village").append("<option value=''>社区、村</option>");
            $("#village").attr("readonly", true);

            $("#receiverId option").remove();
            $("#receiverId").append("<option value=''>组织</option>");
            $("#receiverId").attr("readonly", true);

            var province = $.trim($("#province").val());
            if (province.length == 0)
                return;
            _self.selectId = province;
            $.post(
                window.apppath + "/api/position/getChildPosition",
                {
                    pid: province
                },
                function (res) {
                    if (res.success) {
                        var data = res.data;
                        for (var i in data) {
                            if (_self.selectStr != "" && _self.selectStr.indexOf(data[i].name) >= 0) {
                                $("#city").append("<option value='" + data[i].id + "' data='" + data[i].districtId + "' selected>" + data[i].name + "</option>");
                                _self.selectStr.replace(data[i].name, "");
                                _self.changeCity();
                            }
                            else {
                                $("#city").append("<option value='" + data[i].id + "' data='" + data[i].districtId + "'>" + data[i].name + "</option>");

                            }
                            $("#city").attr("readonly", false);
                        }
                    }
                    if (callBack != null)
                        callBack();
                }, "json");
        },
        changeCity: function (callBack) {
            $("#county option").remove();
            $("#county").append("<option value=''>行政区</option>");
            $("#county").attr("readonly", true);

            $("#town option").remove();
            $("#town").append("<option value=''>街道、镇</option>");
            $("#town").attr("readonly", true);

            $("#village option").remove();
            $("#village").append("<option value=''>社区、村</option>");
            $("#village").attr("readonly", true);

            $("#receiverId option").remove();
            $("#receiverId").append("<option value=''>组织</option>");
            $("#receiverId").attr("readonly", true);

            var province = $.trim($("#province").val());
            var city = $.trim($("#city").val());
            _self.selectId = city;
            if (province.length == 0 || city.length == 0)
                return;
            $.post(
                window.apppath + "/api/position/getChildPosition",
                {
                    pid: city
                },
                function (res) {
                    if (res.success) {
                        var data = res.data;
                        for (var i in data) {
                            if (_self.selectStr != "" && _self.selectStr.indexOf(data[i].name) >= 0) {
                                $("#county").append("<option value='" + data[i].id + "' data='" + data[i].districtId + "' selected>" + data[i].name + "</option>");
                                _self.selectStr.replace(data[i].name, "");
                                _self.changeCounty();
                            }
                            else {
                                $("#county").append("<option value='" + data[i].id + "' data='" + data[i].districtId + "'>" + data[i].name + "</option>");

                            }
                            $("#county").attr("readonly", false);
                        }
                    }
                    if (callBack != null)
                        callBack();
                }, "json");
        },
        changeCounty: function (callBack) {
            $("#town option").remove();
            $("#town").append("<option value=''>街道、镇</option>");
            $("#town").attr("readonly", true);

            $("#village option").remove();
            $("#village").append("<option value=''>社区、村</option>");
            $("#village").attr("readonly", true);

            $("#receiverId option").remove();
            $("#receiverId").append("<option value=''>组织</option>");
            $("#receiverId").attr("readonly", true);

            var province = $.trim($("#province").val());
            var city = $.trim($("#city").val());
            var county = $.trim($("#county").val());
            _self.selectId = county;
            if (province.length == 0 || city.length == 0 || county.length == 0)
                return;
            $.post(
                window.apppath + "/api/position/getChildPosition",
                {
                    pid: county
                },
                function (res) {
                    if (res.success) {
                        var data = res.data;
                        for (var i in data) {
                            if (_self.selectStr != "" && _self.selectStr.indexOf(data[i].name) >= 0) {
                                $("#town").append("<option value='" + data[i].id + "' data='" + data[i].districtId + "' selected>" + data[i].name + "</option>");
                                _self.selectStr.replace(data[i].name, "");
                                _self.changeTown();
                            }
                            else {
                                $("#town").append("<option value='" + data[i].id + "' data='" + data[i].districtId + "'>" + data[i].name + "</option>");

                            }
                            $("#town").attr("readonly", false);
                        }
                    }
                    if (callBack != null)
                        callBack();
                }, "json");
        },
        changeTown: function (callBack) {
            $("#village option").remove();
            $("#village").append("<option value=''>社区、村</option>");
            $("#village").attr("readonly", true);

            $("#receiverId option").remove();
            $("#receiverId").append("<option value=''>组织</option>");
            $("#receiverId").attr("readonly", true);

            var province = $.trim($("#province").val());
            var city = $.trim($("#city").val());
            var county = $.trim($("#county").val());
            var town = $.trim($("#town").val());

            if (province.length == 0 || city.length == 0 || county.length == 0 || town.length == 0)
                return;
            _self.selectId = town;
            $.post(
                window.apppath + "/api/position/getChildPosition",
                {
                    pid: town
                },
                function (res) {
                    if (res.success) {
                        var data = res.data;
                        for (var i in data) {
                            if (_self.selectStr != "" && _self.selectStr.indexOf(data[i].name) >= 0) {
                                $("#village").append("<option value='" + data[i].id + "' data='" + data[i].districtId + "' selected>" + data[i].name + "</option>");
                                _self.selectStr.replace(data[i].name, "");
                                _self.changeVillage();
                            }
                            else {
                                $("#village").append("<option value='" + data[i].id + "' data='" + data[i].districtId + "'>" + data[i].name + "</option>");

                            }
                            $("#village").attr("readonly", false);
                        }
                    }
                    if (callBack != null)
                        callBack();
                }, "json");
        },
        changeVillage: function (callBack) {
            $("#receiverId option").remove();
            $("#receiverId").append("<option value=''>组织</option>");
            $("#receiverId").attr("readonly", true);

            var province = $.trim($("#province").val());
            var city = $.trim($("#city").val());
            var county = $.trim($("#county").val());
            var town = $.trim($("#town").val());
            var village = $.trim($("#village").val());

            if (province.length == 0 || city.length == 0 || county.length == 0 || town.length == 0 || village.length == 0)
                return;
            _self.selectId = village;
            $.post(
                window.apppath + "/api/position/getServiceOrg",
                {
                    areaId: village
                },
                function (res) {
                    if (res.success) {
                        var data = res.data;
                        for (var i in data) {
                            if (_self.selectStr != "" && _self.selectStr.indexOf(data[i].institutionName) >= 0) {
                                $("#receiverId").append("<option value='" + data[i].id + "' data='" + data[i].orgCode + "' selected>" + data[i].institutionName + "</option>");
                                _self.selectStr.replace(data[i].institutionName, "");
                            }
                            else {
                                $("#receiverId").append("<option value='" + data[i].id + "' data='" + data[i].orgCode + "'>" + data[i].institutionName + "</option>");

                            }
                            $("#receiverId").attr("readonly", false);
                        }
                    }
                    if (callBack != null)
                        callBack();
                }, "json");
        },
        changeServiceOrg: function () {
            var receiverId = $.trim($("#receiverId").val());
            _self.selectId = receiverId;
        },
        getPosition: function () {
            var ids = ["province", "city", "county", "town", "village","receiverId"];
            var result = "";
            for (var i in ids) {
                var val = $("#" + ids[i] + " option:selected").val();
                if (val != null && val != "")
                    result += $("#" + ids[i] + " option:selected").text() + "  ";
            }
            return result;
        },
        getPosition2: function () {
            var ids = ["city", "county", "town", "village","receiverId"];
            var result = "";
            for (var i in ids) {
                var val = $("#" + ids[i] + " option:selected").val();
                if (val != null && val != "")
                    result += $("#" + ids[i] + " option:selected").text() + ",";
            }
            if (result.length > 1)
                result = result.substr(0, result.length - 1);
            return result;
        },
        getAreaCode: function () {
            var ids = ["county"];
            var result = "";
            for (var i in ids) {
                var val = $("#" + ids[i] + " option:selected").val();
                if (val != null && val != "")
                    result += $("#" + ids[i] + " option:selected").attr("data");
            }
            /*if (result.length > 1)
             result = result.substr(0, result.length - 1);*/
            return result;
        },
        getSelectId: function () {
            return _self.selectId;
        }
    }
}();