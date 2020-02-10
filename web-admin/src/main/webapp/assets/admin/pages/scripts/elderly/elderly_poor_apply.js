/**
 * Created by gengqiang on 2017/7/24.
 */
var ElderMsgPoorApply = function () {

    var waitContainer = $("#poorApplyForm").parent();
    var _self = "";
    return {
        init: function () {
            _self = this;
        },
        queryElder: function () {
            var idcardno = $("input[name=idcardno]").val().trim();
            if (idcardno.length == 0) {
                alert("请输入身份证号码");
                return false;
            }
            if (!isCardNo(idcardno)) {
                alert("请输入正确身份证号码");
                return false;
            }
            $.post(window.apppath + "/admin/api/elderly/getElderByCardNo", {cardNo: idcardno}, function (res) {
                if(res)
                {
                    if (res.id) $("input[name=elderId]").val(res.id);
                    if (res.elderName) $("input[name=name]").val(res.elderName);
                    if (res.areaName) $("input[name=regPlace]").val(res.areaName.replace(/,/g, ""));
                    if (res.realAddress) $("input[name=address]").val(res.realAddress);
                    if (res.age) $("input[name=age]").val(res.age);
                    $("input[name=sex]").each(function () {
                        if ($(this).val() == res.sexDictId) {
                            $(this).attr("checked", "true");
                            $(this).parent().addClass("checked");
                        }
                    })
                    if (res.birthday)
                    {
                        $("input[name=birthday]").val(res.birthday);
                    }else {
                        $("input[name=birthday]").val(getBirthdatByIdNo(idcardno));
                    }
                }
                else {
                    $("input[name=birthday]").val(getBirthdatByIdNo(idcardno));
                    $("input[name=sex]").each(function () {
                        if ($(this).val() == getSexByIdcardo(idcardno)) {
                            $(this).attr("checked", "true");
                            $(this).parent().addClass("checked");
                        }
                    })
                }
            }, 'json');
        },
        nextStep: function () {
            var str = ["是否接受受理"];
            var btn1 = ["受理"];
            var btn2 = ["不予受理"];
            window.parent.confirm3(str[parseInt(_self.status)], btn1[parseInt(_self.status)], btn2[parseInt(_self.status)], function () {
            }, function () {
            });
        },
        saveApply: function () {
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
                    url: window.apppath + "/admin/api/elderly/poor/apply/add",
                    data: $("#poorApplyForm").serialize() + "&status=0&region1=" + $("#county option:selected").text() + "&region2=" + $("#town option:selected").text() + "&region3=" + $("#village option:selected").text(),
                    dataType: "json",
                    success: function (res) {
                        Metronic.unblockUI(waitContainer);
                        if (res.success) {
                            alert(res.message, function () {
                                window.location.reload();

                            });
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

        },
        checkForm: function () {
            // var s = $("input[name=elderId]").val();
            // if (s == "") {
            //     alert("没有查询到老人相关信息，请输入正确的身份证号码！");
            //     return false;
            // }

            //姓名(ELDER_NAME.length==0)||
            var ELDER_NAME = $("select[name=county] option:selected").val();
            if (ELDER_NAME.length == 0) {
                alert("请选择所在区域！");
                return false;
            }
            var ELDER_NAME = $("select[name=town] option:selected").val();
            if (ELDER_NAME.length == 0) {
                alert("请选择所在街道！");
                return false;
            }
            var ELDER_NAME = $("#village option:selected").val();
            if (ELDER_NAME.length == 0) {
                alert("请选择所在社区！");
                return false;
            }
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
            if (!isCardNo(IDCARDNO)) {
                alert("请输入正确身份证号码");
                return false;
            }
            /*性别 */
            var LIVE_YEAR_TYPE_DICT_ID = document.getElementsByName("sex");
            var LIVE_YEAR_TYPE_DICT_ID_num = 0;
            for (var i = 0; i < LIVE_YEAR_TYPE_DICT_ID.length; i++) {
                if (LIVE_YEAR_TYPE_DICT_ID[i].checked) {
                    LIVE_YEAR_TYPE_DICT_ID_num = 1;
                }
            }
            if (LIVE_YEAR_TYPE_DICT_ID_num == 0) {
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
            //头像
            var avatar = $("input[name=avatar]").val();
            if (avatar.length == 0) {
                alert("请上传头像！");
                return false;
            }
            //住址
            var identification = $("input[name=identification]").val();
            if (identification.length == 0) {
                alert("请上传户口簿、居民身份证、第二代《中华人民共和国残疾证》等有效身份证明！");
                return false;
            }
            //收入证明
            var incomeCertificate = $("input[name=incomeCertificate]").val();
            if (incomeCertificate.length == 0) {
                alert("请上传收入证明！");
                return false;
            }
            //房产证明
            var propertyCertificate = $("input[name=propertyCertificate]").val();
            if (propertyCertificate.length == 0) {
                alert("请上传房产证明！");
                return false;
            }
            //劳动能力、生活来源、财产状况以及赡养、抚养、扶养情况的书面声明
            var writtenStatement = $("input[name=writtenStatement]").val();
            if (writtenStatement.length == 0) {
                alert("请上传劳动能力、生活来源、财产状况以及赡养、抚养、扶养情况的书面声明！");
                return false;
            }
            //承诺所提供信息真实、完整的承诺书
            var commitment = $("input[name=commitment]").val();
            if (commitment.length == 0) {
                alert("请上传承诺所提供信息真实、完整的承诺书！");
                return false;
            } //住址
            var otherAttches = $("input[name=otherAttches]").val();
            if (otherAttches.length == 0) {
                alert("请上传能证明特困人员的其它材料");
                return false;
            }
            return true;

        },
        checkIdCardno: function () {
            var idcardno = $("input[name=idcardno]").val().trim();
            $.ajax({
                type: "POST",
                url: window.apppath + "/admin/api/validate/idCard",
                data: {idStr: idcardno, flag: "elder"},
                dataType: "json",
                async: false,
                success: function (res) {
                    if (res.success) {

                    } else {
                        alert(res.message);
                    }

                }
            });
        }
    }

}();
