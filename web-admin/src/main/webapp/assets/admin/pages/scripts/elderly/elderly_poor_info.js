/**
 * Created by gengqiang on 2017/7/24.
 */
var ElderMsgPoorInfo = function () {
    var waitContainer = $("#poorApplyForm").parent();
    var applyId = $("input[name=id]").val();
    var _self = "";
    return {
        status: "",
        init: function (str, b) {
            _self = this;
            _self.status = str;
            _self.nextStatus = b;
        },
        nextStep: function () {
            var str = ["下一步", "下一步", "下一步", "下一步", "下一步","下一步"]
            var btn1 = ["审核通过", "公示", "", "公示无异议", "审核通过","审核通过"]
            var btn2 = ["审核不通过", "取消", "", "公示有异议", "审核不通过","审核不通过"]
            var nextStatusArray1 = [1, 3, 0, 4, 6,1];
            var nextStatusArray2 = [2, 0, 0, 5, 7,2];
            window.parent.confirm4(str[parseInt(_self.status)], btn1[parseInt(_self.status)], btn2[parseInt(_self.status)], function () {
                _self.handleApply(nextStatusArray1[_self.status])
            }, function () {
                if (_self.status != 1)
                {
                    _self.handleApply(nextStatusArray2[_self.status])
                }
            });
        },
        handleApply: function (nextStatus) {
            Metronic.blockUI({
                message: '处理中...',
                target: waitContainer,
                overlayColor: 'none',
                cenrerY: true,
                boxed: true
            });
            $.post(window.apppath + "/admin/api/elderly/poor/apply/handlePoorApply", {
                id: applyId,
                status: nextStatus,
                note:$("#confrimModal4 input[name=content]",window.parent.document).val()
            }, function (res) {
                $("#confrimModal4 input[name=content]",window.parent.document).val("")
                Metronic.unblockUI(waitContainer);
                if (res.success) {
                    window.parent.updateTab("elder_poor_handle_list");
                    window.parent.closeTab("poor-applyInfo");
                }
            }, 'json');
        },
        queryElder: function () {
            var idcardno = $("input[name=idcardno]").val().trim();
            if (idcardno.length == 0) {
                alert("请输入身份证号码");
                return false;
            }
            $.post(window.apppath + "/admin/api/elderly/getElderByCardNo", {cardNo: idcardno}, function (res) {
                console.log(res);
                var areaName = $("input[name=areaName]").val();
                if (res.areaName.indexOf(areaName) == -1) {
                    alert("该老人不在当前所辖范围内，请重新查询！");
                    return;
                }
                if (res.id) $("input[name=elderId]").val(res.id);
                if (res.elderName) $("input[name=name]").val(res.elderName);
                if (res.mobile) $("input[name=mobile]").val(res.mobile);
                if (res.homeTel) $("input[name=homeTel]").val(res.homeTel);
                if (res.regPlace) $("input[name=regPlace]").val(res.regPlace);
                if (res.realAddress) $("input[name=address]").val(res.realAddress);
                if (res.age) $("input[name=age]").val(res.age);
                if (res.sexDictId) $("input[name=sex]").val(res.sexDictId);
                if (res.areaName) {
                    if (res.areaName.split(",").length >= 2)
                        $("input[name=region1]").val(res.areaName.split(",")[1])
                    if (res.areaName.split(",").length >= 3)
                        $("input[name=region2]").val(res.areaName.split(",")[2])
                    if (res.areaName.split(",").length >= 4)
                        $("input[name=region3]").val(res.areaName.split(",")[3])
                }
            }, 'json');
        }
        ,
        saveApply: function (type) {
            //保存登记
            if (_self.checkForm()) {
                Metronic.blockUI({
                    message: '保存中...',
                    target: waitContainer,
                    overlayColor: 'none',
                    cenrerY: true,
                    boxed: true
                });
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/elderly/poor/apply/update",
                    data: $("#poorApplyForm").serialize(),
                    dataType: "json",
                    success: function (res) {
                        Metronic.unblockUI(waitContainer);
                        if (res.success) {
                            if (type != 1) {
                                window.location.reload();
                            }
                            else {
                                _self.nextStep();
                                return true;
                            }
                        }
                        else {
                            alert(res.message);
                        }
                        return false;
                    }, error: function () {
                        Metronic.unblockUI(waitContainer);
                        return false;

                    }

                });
            }

        }
        ,
        checkForm: function () {
            var s = $("input[name=elderId]").val();
            if (s == "") {
                alert("没有查询到老人相关信息，请输入正确的身份证号码！");
                return false;
            }

            //姓名(ELDER_NAME.length==0)||
            var ELDER_NAME = $("input[name=name]").val();
            if (ELDER_NAME.length == 0) {
                alert("请输入姓名！");
                return false;
            }
            //身份证号
            var IDCARDNO = $("input[name=idcardno]").val();
            if (IDCARDNO.length == 0) {
                alert("请输入身份证号！");
                return false;
            }
            //性别
            var IDCARDNO = $("input[name=sex]").val();
            if (IDCARDNO.length == 0) {
                alert("请选择性别！");
                return false;
            }
            //民族
            var nation = $("select[name=nation] option:selected").val();
            if (nation.length == 0) {
                alert("请选择民族！");
                return false;
            }

            //出生日期
            var birthday = $("input[name=birthday]").val();
            if (birthday.length == 0) {
                alert("请选择出生日期！");
                return false;
            }

            //固话
            var HOME_TEL = $("input[name=homeTel]").val();

            //户籍地址
            var REGISTRATION_PLACE = $("input[name=regPlace]").val();
            if (REGISTRATION_PLACE.length == 0) {
                alert("请输入户籍地址！");
                return false;
            }

            //住址
            var ADDRESS = $("input[name=address]").val();
            if (ADDRESS.length == 0) {
                alert("请输入住址！");
                return false;
            }

            return true;
        }
    }

}();
