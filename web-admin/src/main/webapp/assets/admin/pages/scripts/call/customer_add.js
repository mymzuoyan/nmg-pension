/**
 * Created by Administrator on 2016/9/14.
 */
var CustomerAdd = function () {

    var _self = "";
    return {
        init: function () {
            _self = this;
            _self.groupInit();
            $("#addCustomer .search").click(function () {
                var cardNo = $("#elderNo").val();
                if (cardNo != null & cardNo != "") {
                    _self.searchElder(cardNo);
                }
                else
                    alert2("请输入身份证号码");
            });
            $(".addCustomer").click(function () {
                _self.addCustomer();
            });
        },
        groupInit: function () {
            $.post(window.apppath + "/admin/call/api/customer/group/list", {}, function (res) {
                if (res.data) {
                    var html = "";
                    var data = res.data;
                    html += '<option value="">--请选择--</option>'
                    for (var i in data) {
                        html += '<option value="' + data[i].id + '">' + data[i].name + '</option>'
                    }
                    $("#groupIds").html(html);
                }
            }, 'json');
        },
        addCustomer: function () {
            if (!_self.checkSave()) {
                return false;
            }
            $.post(window.apppath + "/admin/call/api/customer/add", {
                elderId: $("#elderId").val(),
                groupIds: $("#groupIds").val(),
                beeperType: $("#beeperType").val(),
                beeperId: $("#beeperId").val(),
                beeperName: $("#beeperName option:selected").text(),
                beeperNum: $("#beeperNum").val(),
                timeStr: $("#beeperTime").val(),
                beeperStatus: $("#beeperStatus").val(),
                beeperAddress: EographicArea.getPosition2(),
                beeperMoreAddress: $("#beeperMoreAddress").val()
            }, function (res) {
                if (res != "") {
                    if (res.success) {
                        alertSuccess("添加呼叫客户", res.message, function () {
                            window.location.reload();
                        })
                    }
                    else {
                        alert(res.message);
                    }
                }
            }, "json");
        },
        searchElder: function (cardNo) {
            $.post(window.apppath + "/admin/api/elderMsg/getElderByCardNo", {
                cardNo: cardNo
            }, function (res) {
                if (res != null) {
                    $("#elderId").val(res.id);
                    $("#areaNameDiv").html(res.areaName);
                    $("#elderName").html(res.elderName);
                    $("#homeTel").html(res.homeTel);
                    $("#mobile").html(res.mobile);
                    $("#address").html(res.realAddress);
                    if (res.elderTypeDictIds != null & res.elderTypeDictIds != "") {
                        var data = res.elderTypeDictIds;
                        var arr = {
                            "1": "城市三无/农村五保", "2": "低保/低保边缘", "3": "经济困难的失能/半失能老人", "4": "70周岁及以上的计生特扶老人",
                            "5": "百岁老人", "9": "空巢", "10": "独居"
                        };
                        var scopes = '';
                        if (data != "" && data != null) {
                            var scope = data.split(",");
                            for (var i = 0; i < scope.length; i++) {
                                if (arr[scope[i]] != "" && arr[scope[i]] != null) {
                                    scopes += arr[scope[i]] + ','
                                }
                            }
                            scopes = scopes.substr(0, (scopes.length - 1));
                        }
                        $("#elderType").html(scopes);
                    }
                    if (res.childrenDictId != null & res.childrenDictId != "") {
                        var data = res.childrenDictId;
                        arr = {"270": "有子女", "271": "未生育子女", "272": "失去独生子女"};
                        $("#hasChildren").html(arr[data]);
                    }
                    if (res.residenceDictId != null & res.residenceDictId != "") {
                        var result = "";
                        if (res.residenceDictId == 280) {
                            result = "独居";
                        } else if (res.residenceDictId == 511) {
                            result = "空巢";
                        } else if (res.residenceDictId == 284) {
                            result = "合居";
                        } else {
                            result = "";
                        }
                        $("#residence").html(result);
                    }
                }
            }, 'json');
        }, checkSave: function () {
            var elderId = $("#elderId").val();
            var beeperType = $("#beeperType").val();
            var beeperId = $("#beeperId").val();
            var beeperName = $("#beeperName option:selected").text();
            var beeperNum = $("#beeperNum").val();
            var timeStr = $("#beeperTime").val();
            var beeperStatus = $("#beeperStatus").val();
            var beeperAddress = EographicArea.getPosition2();
            if (elderId == null || elderId == "") {
                alert2("请输入身份证号码来查询老人");
                return false;
            }
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