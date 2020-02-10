/**
 * Created by Administrator on 2016/9/30.
 */
var CustomerInfo = function () {

    var _self = "";
    return {
        customerId: "",
        init: function (id) {
            _self = this;
            _self.groupInit();
            _self.customerId = id;
            $(".change").click(function () {
                $(this).hide();
                $(".updateCustomer").show();
                $("input").removeAttr("readonly");
                $("select").removeAttr("readonly");
                EographicArea.initWith($("#beeperAddress").val());
                EographicArea.changeProvince();
                $("#areaDiv").show();
                $("#beeperAddress").hide();
            })


            //更新信息
            $(".updateCustomer").click(function () {
                if (!_self.checkSave()) {
                    return false;
                }
                $.post(window.apppath + "/admin/call/api/customer/update", {
                    id: $("input[name=id]").val(),
                    groupIds: $("#groupIds").val(),
                    beeperType: $("#beeperType").val(),
                    beeperId: $("#beeperId").val(),
                    beeperName: $("#beeperName option:selected").text(),
                    beeperNum: $("#beeperNum").val(),
                    timeStr: $("#beeperTime").val(),
                    beeperStatus: $("#beeperStatus").val(),
                    beeperAddress: EographicArea.getPosition2(),
                    beeperMoreAddress: $("#beeperMoreAddress").val(),
                    servicePer: $("#servicePer").val(),
                    serviceMobile: $("#serviceMobile").val(),
                    serviceWorkType: $("#serviceWorkType").val(),
                    serviceWorkUnit: $("#serviceWorkUnit").val(),
                    installNeed: $("#installNeed").val(),
                }, function (res) {
                    if (res != "") {
                        if (res.success) {
                            alertSuccess("添加呼叫客户", res.message, function () {
                                window.location.reload();
                            })
                        }
                    }
                }, "json");
            })
        },
        groupInit: function () {
            $.post(window.apppath + "/admin/call/api/customer/group/list", {}, function (res) {
                if (res.data) {
                    var html = "";
                    var data = res.data;
                    html += '<option value="">--请选择--</option>'
                    for (var i in data) {
                        if ($("#groupId").val() == data[i].id) {
                            html += '<option value="' + data[i].id + '" selected>' + data[i].name + '</option>'

                        } else {
                            html += '<option value="' + data[i].id + '">' + data[i].name + '</option>'
                        }
                    }
                    $("#groupIds").html(html);
                }
            }, 'json');
        },
        checkSave: function () {
            var beeperType = $("#beeperType").val();
            var beeperId = $("#beeperId").val();
            var beeperName = $("#beeperName option:selected").text();
            var beeperNum = $("#beeperNum").val();
            var timeStr = $("#beeperTime").val();
            var beeperStatus = $("#beeperStatus").val();
            var beeperAddress = EographicArea.getPosition2();
            if (beeperType == null || beeperType == "") {
                alert2("请选项呼叫器类型");
                return false;
            }
            if (beeperName == null || beeperName == "") {
                alert2("请选项呼叫器厂商");
                return false;
            }
            if (beeperId == null || beeperId == "") {
                alert2("请输入呼叫器设备号");
                return false;
            }
            if (timeStr == null || timeStr == "") {
                alert2("请输入呼叫器安装时间");
                return false;
            }
            if (beeperNum == null || beeperNum == "") {
                alert2("请输入呼叫器号码");
                return false;
            }
            if (beeperStatus == null || beeperStatus == "") {
                alert2("请选择安装状态");
                return false;
            }
            if (beeperAddress == null || beeperAddress == "") {
                alert2("请选择区域");
                return false;
            }
            return true;

        }
    }
}();