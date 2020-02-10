/**
 * Created by CoderQiang on 2017/5/16.
 */
var SendDemand = function () {
    var _self = "";
    var lat = 0;
    var lng = 0;
    var elderData = [];
    var nowData = null;
    var serviceOrgId = "";
    var receiverName = "";
    var serviceName = "";
    return {
        init: function () {
            _self = this;
            _self.serviceTypeInit();
            _self.elderListInit();
            $("select[name=serviceType]").change(function () {
                $(".help_text").html("");
                var serviceType = $(this).val();
                var serviceTypeId = $("select[name=serviceType] option:selected").attr("data");
                //加载项目列表
                $.post(window.apppath + "/view/api/task/serviceProject/list", {
                    serviceTypeId: serviceTypeId,
                }, function (res) {
                    if (res.success) {
                        var data = res.data;
                        var html = ' <option value="">请选择服务项目</option>';
                        for (var i in data) {
                            html += '<option data="' + data[i].id + '" value="' + data[i].serviceName + '">' + data[i].serviceName + '</option>'
                        }
                        $("select[name=serviceName]").html(html);
                        $("#serviceNameDiv").show();
                    }
                }, "json");
            })
            $("select[name=serviceName]").change(function () {
                $(".help_text").html("");
                serviceName = $(this).val();
                var serviceProjectId = $("select[name=serviceType] option:selected").val();
                if (nowData == null) {
                    return _self.hasError("请选择老人");
                }
                if (lat == 0) {
                    return _self.hasError("没有准确位置，请补充老人地理位置");
                }
                //加载组织列表
                $.post(window.apppath + "/view/api/serviceOrg/list", {
                    serviceProjectId: serviceProjectId,
                    orderType: 'range',
                    lat: lat,
                    lng: lng
                }, function (res) {
                    if (res.success) {
                        var data = res.data;
                        var html = ' <option value="">请选择服务组织(非必选)</option>';
                        for (var i in data) {
                            html += '<option value="' + data[i].serviceOrgId + '">' + data[i].serviceOrgName + '</option>'
                        }
                        $("select[name=serviceOrgId]").html(html);
                        $("select[name=serviceOrgId]").change(function () {
                            serviceOrgId = $("select[name=serviceOrgId] option:selected").val();
                        });
                    }
                }, "json");
            })

            $("select[name=elderId]").change(function () {
                $(".help_text").html("");
                //加载组织列表
                var id = $(this).val();
                for (var i in elderData) {
                    if (elderData[i].id == id) {
                        nowData = elderData[i];
                    }
                }
                if (nowData != null) {
                    //解析经纬度
                    // 创建地址解析器实例
                    var myGeo = new BMap.Geocoder();
                    myGeo.getPoint(nowData.elderAddress, function (point) {
                        if (point) {
                            lat = point.lat;
                            lng = point.lng;
                        } else {
                            alert("您选择老人精确不到地理位置!");
                        }
                    }, "南京市");
                }
            })


        },
        sendADemand: function () {
            $(".help_text").html("");
            if (_self.checkForm()) {
                var serviceType = $("select[name=serviceType] option:selected").text().trim();
                var date = $("input[name=date]").val().trim();
                var time = $("input[name=time]").val().trim();
                var content = $("textarea[name=content]").val().trim();
                $.post(window.apppath + "/view/api/task/sendADemand", {
                    title: "网站发布需求",
                    elderId: nowData.id,
                    elderMobile: nowData.elderMobile,
                    elderName: nowData.elderName,
                    elderAge: nowData.elderAge,
                    timeStr: date + " " + time,
                    serviceOrgId: serviceOrgId,
                    receiverName: receiverName,
                    serviceType: serviceType,
                    serviceName: serviceName,
                    content: content,
                    serviceAddress: nowData.elderAddress,
                    lat: lat,
                    lng: lng
                }, function (res) {
                    if (res.success) {
                        $(".help_text").html(res.message);
                        $(".help_text").removeClass("error");
                        $(".help_text").addClass("success");
                        setTimeout(function () {
                            window.location.reload();
                        }, 1400)
                    } else {
                        $(".help_text").html(res.message);
                    }
                }, 'json')
            }

        },
        serviceTypeInit: function () {
            $.post(window.apppath + "/view/api/task/serviceType/list", {
                status: 1
            }, function (res) {
                if (res.success) {
                    var data = res.data;
                    var html = ' <option value="">请选择服务类型</option>';
                    for (var i in data) {
                        html += '<option value="' + data[i].id + '">' + data[i].name + '</option>'
                    }
                    $("select[name=serviceType]").html(html);
                }
            }, "json");
        },
        elderListInit: function () {
            //获取关联老人列表
            $.post(window.apppath + "/view/api/user/getLinkElderList", {}, function (res) {
                if (res.success == 1) {
                    var data = res.data;
                    var count = 0;
                    var html = "";
                    for (var i in data) {
                        html += _self.createHtml(data[i]);
                        elderData.push(data[i]);
                        count++;
                    }
                    if (count == 0) {
                        alert("暂时没有关联老人，请立即关联老人。", function () {
                            window.location.href = window.apppath + "/view/add_linkElder.jsp"
                        });
                    }
                    $("#link_elder_list").append(html);

                }
            }, "json");
        },
        createHtml: function (data) {
            return '<option value="' + data.id + '">' + data.elderName + '</option>';
        },
        checkForm: function () {
            var elderId = $("select[name=elderId] option:selected").val().trim();
            var serviceType = $("select[name=serviceType] option:selected").val().trim();
            var date = $("input[name=date]").val().trim();
            var time = $("input[name=time]").val().trim();
            if (elderId == null || elderId == "") {
                return _self.hasError("请选择老人");
            }
            if (serviceType == null || serviceType == "") {
                return _self.hasError("请选择服务类型");
            }
            if (date == null || date == "") {
                return _self.hasError("请输入服务日期");
            }
            if (time == null || time == "") {
                return _self.hasError("请输入服务时间");
            }
            if (lat == 0) {
                return _self.hasError("没有准确位置，请补充老人地理位置");
            }
            if (lng == 0) {
                return _self.hasError("没有准确位置，请补充老人地理位置");
            }
            return true;
        },
        hasError: function (str) {
            $(".help_text").html(str);
            return false;
        }
    }
}();