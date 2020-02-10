/**
 * Created by gengqiang on 2017/7/24.
 */
var ElderMsgGovBuyApply = function () {

    var waitContainer=$("#govbuyApplyForm").parent();
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
        },
        nextStep: function () {
            var str = ["是否接受受理"];
            var btn1 = ["受理"];
            var btn2 = ["不予受理"];
                window.parent.confirm3(str[parseInt(_self.status)], btn1[parseInt(_self.status)], btn2[parseInt(_self.status)], function () {
                    popIframe(window.apppath + "/admin/elderly/govbuy/apply/doc?applyId=" + $("input[name=id]").val() + "&via=1", 1000, 600);
                }, function () {
                    popIframe(window.apppath + "/admin/elderly/govbuy/apply/doc?applyId=" + $("input[name=id]").val() + "&via=2", 1000, 600);
                });
        },
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
                    url: window.apppath + "/admin/api/elderly/govbuy/apply/add",
                    data: $("#govbuyApplyForm").serialize()+"&status=0",
                    dataType: "json",
                    success: function (res) {
                        Metronic.unblockUI(waitContainer);
                        if (res.success) {
                            if (type != 1) {
                                window.location.reload();
                            }
                            else {
                                _self.nextStep();
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

        },
        checkForm:function () {
            return true;
            var s = $("input[name=elderId]").val();
            if(s==""){ alert("没有查询到老人相关信息，请输入正确的身份证号码！"); return false; }

            //姓名(ELDER_NAME.length==0)||
            var ELDER_NAME = $("input[name=name]").val();
            if (ELDER_NAME.length == 0) { alert("请输入姓名！"); return false; }
            //身份证号
            var IDCARDNO = $("input[name=idcardno]").val();
            if (IDCARDNO.length == 0) { alert("请输入身份证号！"); return false; }

            //固话
            var HOME_TEL = $("input[name=homeTel]").val();
            //手机
            var MOBILE = $("input[name=mobile]").val();
            if ((HOME_TEL.length == 0) && (MOBILE.length == 0)) { alert("请输入手机号码或固定号码！"); return false; }

            //户籍地址
            var REGISTRATION_PLACE = $("input[name=regPlace]").val();
            if (REGISTRATION_PLACE.length == 0) { alert("请输入户籍地址！"); return false; }

            //住址
            var ADDRESS = $("input[name=address]").val();
            if (ADDRESS.length == 0) { alert("请输入住址！"); return false; }

            /*常住 */
            var LIVE_YEAR_TYPE_DICT_ID = document.getElementsByName("liveYearDictId");
            var LIVE_YEAR_TYPE_DICT_ID_num = 0;
            for (var i = 0; i < LIVE_YEAR_TYPE_DICT_ID.length; i++) {
                if (LIVE_YEAR_TYPE_DICT_ID[i].checked) {
                    LIVE_YEAR_TYPE_DICT_ID_num = 1;
                }
            }
            if (LIVE_YEAR_TYPE_DICT_ID_num == 0) {
                alert("请选择常住！");
                return false;
            }

            /*人员类别*/
            var ELDER_TYPE_DICT_IDS = document.getElementsByName("elderTypeDictIds");
            var num = 0;
            for (var i = 0; i < ELDER_TYPE_DICT_IDS.length; i++) {
                if (ELDER_TYPE_DICT_IDS[i].checked) {
                    num = 1;
                }
            }
            if (num == 0) {
                alert("请选择人员类别！");
                return false;
            }

            //联系人1
            var LINK_MAN_NAME1 = $("input[name=linkManName1]").val();
            var LINK_MAN_RELATION1 = $("input[name=linkManRelat1]").val();
            var LINK_MAN_LINK1 = $("input[name=linkManLink1]").val();

            var LINK_MAN_HAS_KEY1 = document.getElementsByName("linkManKey1");
            var LINK_MAN_HAS_KEY1_num = 0;
            for (var i = 0; i < LINK_MAN_HAS_KEY1.length; i++) {
                if (LINK_MAN_HAS_KEY1[i].checked) {
                    LINK_MAN_HAS_KEY1_num = 1;
                }
            }



            //联系人2
            var LINK_MAN_NAME2 = $("input[name=linkManName2]").val();
            var LINK_MAN_RELATION2 = $("input[name=linkManRelat2]").val();
            var LINK_MAN_LINK2 = $("input[name=linkManLink2]").val();
            var LINK_MAN_HAS_KEY2 = document.getElementsByName("linkManKey2");
            var LLINK_MAN_HAS_KEY2_num = 0;
            for (var i = 0; i < LINK_MAN_HAS_KEY2.length; i++) {
                if (LINK_MAN_HAS_KEY2[i].checked) {
                    LLINK_MAN_HAS_KEY2_num = 1;
                }
            }


            //联系人3
            var LINK_MAN_NAME3 = $("input[name=linkManName3]").val();
            var LINK_MAN_RELATION3 = $("input[name=linkManRelat3]").val();
            var LINK_MAN_LINK3 = $("input[name=linkManLink3]").val();
            var LINK_MAN_HAS_KEY3 = document.getElementsByName("linkManKey3");
            var LINK_MAN_HAS_KEY3_num = 0;
            for (var i = 0; i < LINK_MAN_HAS_KEY3.length; i++) {
                if (LINK_MAN_HAS_KEY3[i].checked) {
                    LINK_MAN_HAS_KEY3_num = 1;
                }
            }

            //联系人总的判断
            if (((LINK_MAN_NAME1.length == 0) || (LINK_MAN_RELATION1.length == 0) || (LINK_MAN_LINK1.length == 0) || (LINK_MAN_HAS_KEY1_num == 0)) && ((LINK_MAN_NAME2.length == 0) || (LINK_MAN_RELATION2.length == 0) || (LINK_MAN_LINK2.length == 0) || (LLINK_MAN_HAS_KEY2_num == 0)) && ((LINK_MAN_NAME3.length == 0) || (LINK_MAN_RELATION3.length == 0) || (LINK_MAN_LINK3.length == 0) || (LINK_MAN_HAS_KEY3_num == 0))) {
                alert("请将联系人信息填写完整");
                return false;
            }

            //子女状况
            var HAS_CHILDREN = document.getElementsByName("childrenDictId");

            var HAS_CHILDREN_num = 0;
            for (var i = 0; i < HAS_CHILDREN.length; i++) {
                if (HAS_CHILDREN[i].checked) {
                    HAS_CHILDREN_num = 1;
                }
            }
            if (HAS_CHILDREN_num == 0) {
                alert("请选择子女状况！");
                return false;
            }
            //医疗类别
            var MEDICAL_TYPE_DICT_ID = document.getElementsByName("medicalType");
            var MEDICAL_TYPE_DICT_ID_num = 0;
            for (var i = 0; i < MEDICAL_TYPE_DICT_ID.length; i++) {
                if (MEDICAL_TYPE_DICT_ID[i].checked) {
                    MEDICAL_TYPE_DICT_ID_num = 1;
                }
            }
            if (MEDICAL_TYPE_DICT_ID_num == 0) {
                alert("请选择医疗类别！");
                return false;
            }
            //居住状况
            var RESIDENCE_DICT_ID = document.getElementsByName("residenceDictId");
            var RESIDENCE_DICT_ID_num = 0;
            for (var i = 0; i < RESIDENCE_DICT_ID.length; i++) {
                if (RESIDENCE_DICT_ID[i].checked) {
                    RESIDENCE_DICT_ID_num = 1;
                }
            }
            if (RESIDENCE_DICT_ID_num == 0) {
                alert("请选择居住状况！");
                return false;
            }
            //住房性质
            var HOUSE_TYPE_DICT_ID = document.getElementsByName("houseTypeDictId");
            var HOUSE_TYPE_DICT_ID_num = 0;
            for (var i = 0; i < HOUSE_TYPE_DICT_ID.length; i++) {
                if (HOUSE_TYPE_DICT_ID[i].checked) {
                    HOUSE_TYPE_DICT_ID_num = 1;
                }
            }
            if (HOUSE_TYPE_DICT_ID_num == 0) {
                alert("请选择住房性质！");
                return false;
            }
            //居住条件
            var HAS_ELEVATOR = document.getElementsByName("hasElevator");
            var HAS_ELEVATOR_num = 0;
            for (var i = 0; i < HAS_ELEVATOR.length; i++) {
                if (HAS_ELEVATOR[i].checked) {
                    HAS_ELEVATOR_num = 1;
                }
            }
            if (HAS_ELEVATOR_num == 0) {
                alert("请选择居住条件！");
                return false;
            }
            //居住楼层
            var FLOOR = document.getElementsByName("floor");
            var FLOOR_num = 0;
            for (var i = 0; i < FLOOR.length; i++) {
                if (FLOOR[i].checked) {
                    FLOOR_num = 1;
                }
            }
            if (FLOOR_num == 0) {
                alert("请选择居住楼层！");
                return false;
            }
            //室内洗浴设备
            var HAS_BATH = document.getElementsByName("hasBath");
            var HAS_BATH_num = 0;
            for (var i = 0; i < HAS_BATH.length; i++) {
                if (HAS_BATH[i].checked) {
                    HAS_BATH_num = 1;
                }
            }
            if (HAS_BATH_num == 0) {
                alert("请选择室内洗浴设备！");
                return false;
            }


            //服务需求
            var SERVICE_REQUIREMENT_DICT_IDS = document.getElementsByName("serviceNeed");
            var SERVICE_REQUIREMENT_DICT_IDS_num = 0;
            for (var i = 0; i < SERVICE_REQUIREMENT_DICT_IDS.length; i++) {
                if (SERVICE_REQUIREMENT_DICT_IDS[i].checked) {
                    SERVICE_REQUIREMENT_DICT_IDS_num = 1;
                }
            }
            if (SERVICE_REQUIREMENT_DICT_IDS_num == 0) {
                alert("请选择服务需求！");
                return false;
            }
            //心理状况
            var PSYCHOLOGIC_DICT_ID = document.getElementsByName("psychologicDictId");
            var PSYCHOLOGIC_DICT_ID_num = 0;
            for (var i = 0; i < PSYCHOLOGIC_DICT_ID.length; i++) {
                if (PSYCHOLOGIC_DICT_ID[i].checked) {
                    PSYCHOLOGIC_DICT_ID_num = 1;
                }
            }
            if (PSYCHOLOGIC_DICT_ID_num == 0) {
                alert("请选择心理状况！");
                return false;
            }
            //社会活动情况
            var SOCIAL_ACTIVITIES_DICT_ID = document.getElementsByName("socialActiDictId");
            var SOCIAL_ACTIVITIES_DICT_ID_num = 0;
            for (var i = 0; i < SOCIAL_ACTIVITIES_DICT_ID.length; i++) {
                if (SOCIAL_ACTIVITIES_DICT_ID[i].checked) {
                    SOCIAL_ACTIVITIES_DICT_ID_num = 1;
                }
            }
            if (SOCIAL_ACTIVITIES_DICT_ID_num == 0) {
                alert("请选择社会活动情况！");
                return false;
            }
            return true;

        }
    }

}();
function getScore1() {
    var score01 = document.getElementById("attr01").value;
    if (score01 == 1) {
        document.getElementById("score01").value = 0;
    } else if (score01 == 2) {
        document.getElementById("score01").value = 0;
    } else if (score01 == 3) {
        document.getElementById("score01").value = 3;
    } else if (score01 == 4) {
        document.getElementById("score01").value = 5;
    } else {
        document.getElementById("score01").value = "";
        alert("请选择相应的症状");
    }
    getAllScore();
}
function getScore2() {
    var score02 = document.getElementById("attr02").value;
    if (score02 == 1) {
        document.getElementById("score02").value = 0;
    } else if (score02 == 2) {
        document.getElementById("score02").value = 0;
    } else if (score02 == 3) {
        document.getElementById("score02").value = 3;
    } else if (score02 == 4) {
        document.getElementById("score02").value = 5;
    } else {
        document.getElementById("score02").value = "";
        alert("请选择相应的症状");
    }

    getAllScore();
}
function getScore3() {
    var score03 = document.getElementById("attr03").value;
    if (score03 == 1) {
        document.getElementById("score03").value = 0;
    } else if (score03 == 2) {
        document.getElementById("score03").value = 1;
    } else if (score03 == 3) {
        document.getElementById("score03").value = 5;
    } else if (score03 == 4) {
        document.getElementById("score03").value = 10;
    } else {
        document.getElementById("score03").value = "";
        alert("请选择相应的症状");
    }
    getAllScore();
}
function getScore4() {
    var score04 = document.getElementById("attr04").value;
    if (score04 == 1) {
        document.getElementById("score04").value = 0;
    } else if (score04 == 2) {
        document.getElementById("score04").value = 1;
    } else if (score04 == 3) {
        document.getElementById("score04").value = 5;
    } else if (score04 == 4) {
        document.getElementById("score04").value = 10;
    } else {
        document.getElementById("score04").value = "";
        alert("请选择相应的症状");
    }
    getAllScore();
}
function getScore5() {
    var score05 = document.getElementById("attr05").value;
    if (score05 == 1) {
        document.getElementById("score05").value = 0;
    } else if (score05 == 2) {
        document.getElementById("score05").value = 1;
    } else if (score05 == 3) {
        document.getElementById("score05").value = 3;
    } else if (score05 == 4) {
        document.getElementById("score05").value = 7;
    } else {
        document.getElementById("score05").value = "";
        alert("请选择相应的症状");
    }
    getAllScore();
}
function getScore6() {
    var score06 = document.getElementById("attr06").value;
    if (score06 == 1) {
        document.getElementById("score06").value = 0;
    } else if (score06 == 2) {
        document.getElementById("score06").value = 0;
    } else if (score06 == 3) {
        document.getElementById("score06").value = 3;
    } else if (score06 == 4) {
        document.getElementById("score06").value = 5;
    } else {
        document.getElementById("score06").value = "";
        alert("请选择相应的症状");
    }
    getAllScore();
}
function getScore7() {
    var score07 = document.getElementById("attr07").value;
    if (score07 == 1) {
        document.getElementById("score07").value = 0;
    } else if (score07 == 2) {
        document.getElementById("score07").value = 2;
    } else if (score07 == 3) {
        document.getElementById("score07").value = 5;
    } else if (score07 == 4) {
        document.getElementById("score07").value = 10;
    } else {
        document.getElementById("score07").value = "";
        alert("请选择相应的症状");
    }
    getAllScore();
}
function getScore8() {
    var score08 = document.getElementById("attr08").value;
    if (score08 == 1) {
        document.getElementById("score08").value = 0;
    } else if (score08 == 2) {
        document.getElementById("score08").value = 0;
    } else if (score08 == 3) {
        document.getElementById("score08").value = 5;
    } else if (score08 == 4) {
        document.getElementById("score08").value = 10;
    } else {
        document.getElementById("score08").value = "";
        alert("请选择相应的症状");
    }
    getAllScore();
}
function getScore9() {
    var score09 = document.getElementById("attr09").value;
    if (score09 == 1) {
        document.getElementById("score09").value = 0;
    } else if (score09 == 2) {
        document.getElementById("score09").value = 0;
    } else if (score09 == 3) {
        document.getElementById("score09").value = 5;
    } else if (score09 == 4) {
        document.getElementById("score09").value = 10;
    } else {
        document.getElementById("score09").value = "";
        alert("请选择相应的症状");
    }
    getAllScore();
}
function getScore10() {
    var score10 = document.getElementById("attr10").value;
    if (score10 == 1) {
        document.getElementById("score10").value = 0;
    } else if (score10 == 2) {
        document.getElementById("score10").value = 0;

    } else if (score10 == 3) {
        document.getElementById("score10").value = 5;
    } else if (score10 == 4) {
        document.getElementById("score10").value = 10;
    } else {
        document.getElementById("score10").value = "";
        alert("请选择相应的症状");
    }
    getAllScore();
}
function getScore11() {
    var score11 = document.getElementById("attr11").value;
    if (score11 == 1) {
        document.getElementById("score11").value = 0;
    } else if (score11 == 2) {
        document.getElementById("score11").value = 2;
    } else if (score11 == 3) {
        document.getElementById("score11").value = 6;
    } else if (score11 == 4) {
        document.getElementById("score11").value = 10;
    } else {
        document.getElementById("score11").value = "";
        alert("请选择相应的症状");
    }
    getAllScore();
}
function getScore12() {
    var score12 = document.getElementById("attr12").value;
    if (score12 == 1) {
        document.getElementById("score12").value = 0;
    } else if (score12 == 2) {
        document.getElementById("score12").value = 2;
    } else if (score12 == 3) {
        document.getElementById("score12").value = 6;
    } else if (score12 == 4) {
        document.getElementById("score12").value = 10;
    } else {
        document.getElementById("score12").value = "";
        alert("请选择相应的症状");
    }
    getAllScore();
}
function getScore13() {
    var score13 = document.getElementById("attr13").value;
    if (score13 == 1) {
        document.getElementById("score13").value = 0;
    } else if (score13 == 2) {
        document.getElementById("score13").value = 0;
    } else if (score13 == 3) {
        document.getElementById("score13").value = 1;
    } else if (score13 == 4) {
        document.getElementById("score13").value = 2;
    } else {
        document.getElementById("score13").value = "";
        alert("请选择相应的症状");
    }
    getAllScore();
}
function getScore14() {
    var score14 = document.getElementById("attr14").value;
    if (score14 == 1) {
        document.getElementById("score14").value = 0;
    } else if (score14 == 2) {
        document.getElementById("score14").value = 0;
    } else if (score14 == 3) {
        document.getElementById("score14").value = 5;
    } else if (score14 == 4) {
        document.getElementById("score14").value = 10;
    } else {
        document.getElementById("score14").value = "";
        alert("请选择相应的症状");
    }
    getAllScore();
}
function getScore15() {
    var score15 = document.getElementById("attr15").value;
    if (score15 == 1) {
        document.getElementById("score15").value = 0;
    } else if (score15 == 2) {
        document.getElementById("score15").value = 0;
    } else if (score15 == 3) {
        document.getElementById("score15").value = 0;
    } else if (score15 == 4) {
        document.getElementById("score15").value = 0;
    } else {
        document.getElementById("score15").value = "";
        alert("请选择相应的症状");
    }
    getAllScore();
}
function getAllScore() {
    var score01 = parseInt(document.getElementById("score01").value);
    if (isNaN(score01)) score01 = 0;
    var score02 = parseInt(document.getElementById("score02").value);
    if (isNaN(score02)) score02 = 0;
    var score03 = parseInt(document.getElementById("score03").value);
    if (isNaN(score03)) score03 = 0;
    var score04 = parseInt(document.getElementById("score04").value);
    if (isNaN(score04)) score04 = 0;
    var score05 = parseInt(document.getElementById("score05").value);
    if (isNaN(score05)) score05 = 0;
    var score06 = parseInt(document.getElementById("score06").value);
    if (isNaN(score06)) score06 = 0;
    var score07 = parseInt(document.getElementById("score07").value);
    if (isNaN(score07)) score07 = 0;
    var score08 = parseInt(document.getElementById("score08").value);
    if (isNaN(score08)) score08 = 0;
    var score09 = parseInt(document.getElementById("score09").value);
    if (isNaN(score09)) score09 = 0;
    var score10 = parseInt(document.getElementById("score10").value);
    if (isNaN(score10)) score10 = 0;
    var score11 = parseInt(document.getElementById("score11").value);
    if (isNaN(score11)) score11 = 0;
    var score12 = parseInt(document.getElementById("score12").value);
    if (isNaN(score12)) score12 = 0;
    var score13 = parseInt(document.getElementById("score13").value);
    if (isNaN(score13)) score13 = 0;
    var score14 = parseInt(document.getElementById("score14").value);
    if (isNaN(score14)) score14 = 0;
    var score15 = parseInt(document.getElementById("score15").value);
    if (isNaN(score15)) score15 = 0;

    document.getElementById("resultScore").value =
        (score01) + (score02) + (score03) + (score04) + (score05) + (score06) + (score07)
        + (score08) + (score09) + (score10) + (score11) + (score12) + (score13) + (score14) + (score15);

    if (document.getElementById("resultScore").value <= 5) {
        document.getElementById("pf1").checked = true;
        document.getElementById("pf2").checked = false;
        document.getElementById("pf3").checked = false;
    } else if (document.getElementById("resultScore").value > 5 && document.getElementById("resultScore").value <= 20) {
        document.getElementById("pf1").checked = false;
        document.getElementById("pf2").checked = true;
        document.getElementById("pf3").checked = false;
    } else {
        document.getElementById("pf1").checked = false;
        document.getElementById("pf2").checked = false;
        document.getElementById("pf3").checked = true;
    }
}