/**
 * Created by MaiBenBen on 2017/1/9.
 */
var ServiceOrgStarAdd = function () {

    var _self = "";
    return {
        //main function to initiate the module

        form: "",
        error: "",
        success: "",
        "grid": "",
        init: function () {
            _self = this;
            _self.form = $('#addElderForm');
            _self.error = $('.alert-danger', _self.form);
            _self.success = $('.alert-success', _self.form);
            _self.wizardInit();
            if ($("#elderId").val() != null && $("#elderId").val() != "") {
                _self.relationshipInit();
            }

            $('#elderInfo_add').find('.button-previous').hide();
            $('#elderInfo_add .button-submit').click(function () {
                /*alert("添加成功");*/
            }).hide();

            $("#btnAddRelate").click(function () {
                $("#addRelateModal input").removeAttr("disabled");
                $("#addRelateModal select").removeAttr("disabled");
                $("#addRelateModal").modal("show");
                $("#addForm")[0].reset();
                if ($("id").val() != null && $("id").val() != "") {
                    $("#updateForm")[0].reset();
                }
                $(".modal-footer").html('<button type="button" class="btn blue addRelate" onclick="ElderlyMsgAdd.addRelate();">添加</button>' +
                    '<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>');
            });

        },
        wizardInit: function () {
            if (!jQuery().bootstrapWizard) {
                return;
            }
            // default form wizard
            $('#elderInfo_add').bootstrapWizard({
                'nextSelector': '.button-next',
                'previousSelector': '.button-previous',
                onTabClick: function (tab, navigation, index, clickedIndex) {
                    return false;
                    /*
                     success.hide();
                     error.hide();
                     if (form.valid() == false) {
                     return false;
                     }
                     handleTitle(tab, navigation, clickedIndex);
                     */
                },
                onNext: function (tab, navigation, index) {
                    _self.success.hide();
                    _self.error.hide();
                    var starClass = $("#addElderForm select[name=starClass]").val();
                    var serviceOrgId = $("#addElderForm input[name=serviceOrgId]").val();
                    var area = $("#addElderForm input[name='area']:checked").val();
                    var proportRequirements = $("#addElderForm input[name='proportRequirements']:checked").val();
                    var professionalRequirements = $("#addElderForm input[name='professionalRequirements']:checked").val();
                    var proportion = $("#addElderForm input[name='proportion']:checked").val();
                    var rehabilitationAreaRequirements = $("#addElderForm input[name='rehabilitationAreaRequirements']:checked").val();
                    var educationalRequirements = $("#addElderForm input[name='educationalRequirements']:checked").val();
                    var occupancyRate = $("#addElderForm input[name='occupancyRate']:checked").val();
                    var diningAreaRequirements = $("#addElderForm input[name='diningAreaRequirements']:checked").val();
                    var serviceItems = $("#addElderForm input[name='serviceItems']:checked").val();
                    if (index == 1) {
                        if(starClass == null || starClass == ""){
                            _self.error.html('<button class="close" data-dismiss="alert"></button>请先选择星级！');
                            _self.error.show();
                            Metronic.scrollTo(_self.error, -200);
                            return false;
                        }

                        if (area == "2" || proportRequirements == "2" || professionalRequirements == "2" || proportion == "2"
                            || rehabilitationAreaRequirements == "2" || educationalRequirements == "2" || occupancyRate == "2"
                            || diningAreaRequirements == "2" || serviceItems == "2") {
                            _self.error.html('<button class="close" data-dismiss="alert"></button>有不满足项，无法通过评定');
                            _self.error.show();
                            Metronic.scrollTo(_self.error, -200);
                            return false;
                        }

                        if(starClass=="1"||starClass=="2"){
                            if (proportRequirements == null || proportRequirements == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足护理员与入住老人配比要求');
                                _self.error.show();
                                Metronic.scrollTo(_self.error, -200);
                                return false;
                            } else if(educationalRequirements == null || educationalRequirements == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足院长、副院长学历要求');
                                _self.error.show();
                                Metronic.scrollTo(_self.error, -200);
                                return false;
                            } else if(occupancyRate == null || occupancyRate == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足养老机构入住率');
                                _self.error.show();
                                Metronic.scrollTo(_self.error, -200);
                                return false;
                            } else if(diningAreaRequirements == null || diningAreaRequirements == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足就餐功能区域要求');
                                _self.error.show();
                                Metronic.scrollTo(_self.error, -200);
                                return false;
                            } else if(serviceItems == null || serviceItems == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足提供的服务项目');
                                _self.error.show();
                                Metronic.scrollTo(_self.error, -200);
                                return false;
                            } else {
                                var submitForm = $('#addElderForm');
                                //同步提交
                                $.ajax({
                                    type: "post",
                                    url: window.apppath + "/admin/api/elderly/addStarRate",
                                    dataType: "json",   //返回格式为json
                                    data: submitForm.serialize(),
                                    async: false,
                                    success: function (res) {
                                        if (res.success) {
                                            $("#elderId").val(res.data);
                                            $("#id").val(res.data);
                                            $('#elderInfo_add').bootstrapWizard('show', 1);
                                        } else {
                                            $("#elderId").val("");
                                            $("#id").val("");
                                            _self.error.html('<button class="close" data-dismiss="alert"></button>' + res.message);
                                            _self.error.show();
                                            Metronic.scrollTo(_self.error, -200);
                                            return false;
                                        }
                                    }
                                });
                                return false;
                            }
                        } else if (starClass=="3") {
                            if(proportRequirements == null || proportRequirements == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足护理员与入住老人配比要求');
                                _self.error.show();
                                Metronic.scrollTo(_self.error, -200);
                                return false;
                            } else if(educationalRequirements == null || educationalRequirements == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足院长、副院长学历要求');
                                _self.error.show();
                                Metronic.scrollTo(_self.error, -200);
                                return false;
                            } else if(professionalRequirements == null || professionalRequirements == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足配备专业人员要求');
                                _self.error.show();
                                Metronic.scrollTo(_self.error, -200);
                                return false;
                            } else if(proportion == null || proportion == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足设独立卫生间的老年人居室占居室总数的比例');
                                _self.error.show();
                                Metronic.scrollTo(_self.error, -200);
                                return false;
                            } else if(occupancyRate == null || occupancyRate == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足养老机构入住率');
                                _self.error.show();
                                Metronic.scrollTo(_self.error, -200);
                                return false;
                            } else if(diningAreaRequirements == null || diningAreaRequirements == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足就餐功能区域要求');
                                _self.error.show();
                                Metronic.scrollTo(_self.error, -200);
                                return false;
                            } else if(rehabilitationAreaRequirements == null || rehabilitationAreaRequirements == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足康复区域要求');
                                _self.error.show();
                                Metronic.scrollTo(_self.error, -200);
                                return false;
                            } else if(serviceItems == null || serviceItems == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足提供的服务项目');
                                _self.error.show();
                                Metronic.scrollTo(_self.error, -200);
                                return false;
                            } else {
                                var submitForm = $('#addElderForm');
                                //同步提交
                                $.ajax({
                                    type: "post",
                                    url: window.apppath + "/admin/api/elderly/addStarRate",
                                    dataType: "json",   //返回格式为json
                                    data: submitForm.serialize(),
                                    async: false,
                                    success: function (res) {
                                        if (res.success) {
                                            $("#elderId").val(res.data);
                                            $("#id").val(res.data);
                                            $('#elderInfo_add').bootstrapWizard('show', 1);
                                        } else {
                                            $("#elderId").val("");
                                            $("#id").val("");
                                            _self.error.html('<button class="close" data-dismiss="alert"></button>' + res.message);
                                            _self.error.show();
                                            Metronic.scrollTo(_self.error, -200);
                                            return false;
                                        }
                                    }
                                });
                                return false;
                            }
                        } else {
                            if (area == null || area == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足建筑面积中通过消防验收的面积');
                                _self.error.show();
                                Metronic.scrollto(_self.error, -200);
                                return false;
                            } else if(proportRequirements == null || proportRequirements == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足护理员与入住老人配比要求');
                                _self.error.show();
                                Metronic.scrollto(_self.error, -200);
                                return false;
                            } else if(educationalRequirements == null || educationalRequirements == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足院长、副院长学历要求');
                                _self.error.show();
                                Metronic.scrollto(_self.error, -200);
                                return false;
                            } else if(professionalRequirements == null || professionalRequirements == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足配备专业人员要求');
                                _self.error.show();
                                Metronic.scrollto(_self.error, -200);
                                return false;
                            } else if(proportion == null || proportion == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足设独立卫生间的老年人居室占居室总数的比例');
                                _self.error.show();
                                Metronic.scrollto(_self.error, -200);
                                return false;
                            } else if(occupancyRate == null || occupancyRate == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足养老机构入住率');
                                _self.error.show();
                                Metronic.scrollto(_self.error, -200);
                                return false;
                            } else if(diningAreaRequirements == null || diningAreaRequirements == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足就餐功能区域要求');
                                _self.error.show();
                                Metronic.scrollto(_self.error, -200);
                                return false;
                            } else if(rehabilitationAreaRequirements == null || rehabilitationAreaRequirements == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足康复区域要求');
                                _self.error.show();
                                Metronic.scrollto(_self.error, -200);
                                return false;
                            } else if(serviceItems == null || serviceItems == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>请选择是否满足提供的服务项目');
                                _self.error.show();
                                Metronic.scrollto(_self.error, -200);
                                return false;
                            } else {
                                var submitForm = $('#addElderForm');
                                //同步提交
                                $.ajax({
                                    type: "post",
                                    url: window.apppath + "/admin/api/elderly/addStarRate",
                                    dataType: "json",   //返回格式为json
                                    data: submitForm.serialize(),
                                    async: false,
                                    success: function (res) {
                                        if (res.success) {
                                            $("#elderId").val(res.data);
                                            $("#id").val(res.data);
                                            $('#elderInfo_add').bootstrapWizard('show', 1);
                                        } else {
                                            $("#elderId").val("");
                                            $("#id").val("");
                                            _self.error.html('<button class="close" data-dismiss="alert"></button>' + res.message);
                                            _self.error.show();
                                            Metronic.scrollTo(_self.error, -200);
                                            return false;
                                        }
                                    }
                                });
                                return false;
                            }
                        }
                    }

                    if (index == 2) {
                        var totalScore = 0;
                        var fraction01 = obj1_1_1;
                        var fraction01Score = obj1_1_1_score;
                        var fraction02 = obj2_2_2;
                        var fraction02Score = obj2_2_2_score;
                        var fraction03 = obj3_3_3;
                        var fraction03Score = obj3_3_3_score;
                        var fraction04 = obj4_4_4;
                        var fraction04Score = obj4_4_4_score;
                        var fraction05 = obj5_5_5;
                        var fraction05Score = obj5_5_5_score;
                        var fraction06 = obj6_6_6;
                        var fraction06Score = obj6_6_6_score;
                        var fraction07 = obj7_7_7;
                        var fraction07Score = obj7_7_7_score;
                        var fraction08 = obj8_8_8;
                        var fraction08Score = obj8_8_8_score;
                        var fraction09 = obj9_9_9;
                        var fraction09Score = obj9_9_9_score;
                        var fraction10 = obj10_10_10;
                        var fraction10Score = obj10_10_10_score;
                        var fraction11 = obj11_11_11;
                        var fraction11Score = obj11_11_11_score;
                        var fraction12 = obj12_12_12;
                        var fraction12Score = obj12_12_12_score;
                        var fraction13 = obj13_13_13;
                        var fraction13Score = obj13_13_13_score;
                        var fraction14 = obj14_14_14;
                        var fraction14Score = obj14_14_14_score;
                        var fraction15 = obj15_15_15;
                        var fraction15Score = obj15_15_15_score;
                        var fraction16 = obj16_16_16;
                        var fraction16Score = obj16_16_16_score;
                        var fraction17 = obj17_17_17;
                        var fraction17Score = obj17_17_17_score;
                        var fraction18 = obj18_18_18;
                        var fraction18Score = obj18_18_18_score;
                        var fraction19 = obj19_19_19;
                        var fraction19Score = obj19_19_19_score;
                        var fraction20 = obj20_20_20;
                        var fraction20Score = obj20_20_20_score;
                        var fraction21 = obj21_21_21;
                        var fraction21Score = obj21_21_21_score;
                        var fraction22 = obj22_22_22;
                        var fraction22Score = obj22_22_22_score;

                        totalScore = fraction01Score + fraction02Score+ fraction03Score+ fraction04Score + fraction05Score
                            + fraction06Score+ fraction07Score+ fraction08Score+ fraction09Score+ fraction10Score
                            + fraction11Score+ fraction12Score+ fraction13Score+ fraction14Score+ fraction15Score
                            + fraction16Score+ fraction17Score+ fraction18Score+ fraction19Score+ fraction20Score
                            + fraction21Score+ fraction22Score;

                        var submitForm = $('#addElderForm');
                        $.post(window.apppath + "/admin/api/elderly/updateStarRateSecurity", {
                            starClass:starClass,
                            serviceOrgId:serviceOrgId,
                            area:area,
                            proportRequirements:proportRequirements,
                            professionalRequirements:professionalRequirements,
                            proportion:proportion,
                            rehabilitationAreaRequirements:rehabilitationAreaRequirements,
                            educationalRequirements:educationalRequirements,
                            occupancyRate:occupancyRate,
                            diningAreaRequirements:diningAreaRequirements,
                            serviceItems:serviceItems,
                            totalScore:totalScore,
                            fraction01:fraction01,
                            fraction02:fraction02,
                            fraction03:fraction03,
                            fraction04:fraction04,
                            fraction05:fraction05,
                            fraction06:fraction06,
                            fraction07:fraction07,
                            fraction08:fraction08,
                            fraction09:fraction09,
                            fraction10:fraction10,
                            fraction11:fraction11,
                            fraction12:fraction12,
                            fraction13:fraction13,
                            fraction14:fraction14,
                            fraction15:fraction15,
                            fraction16:fraction16,
                            fraction17:fraction17,
                            fraction18:fraction18,
                            fraction19:fraction19,
                            fraction20:fraction20,
                            fraction21:fraction21,
                            fraction22:fraction22
                        }, function (res) {
                            if (res.success) {

                            } else {

                            }
                        }, 'json');
                    }
                    if (index == 3) {
                        var totalScore = 0;
                        var fraction23 = obj23_23_23;
                        var fraction23Score = obj23_23_23_score;
                        var fraction24 = obj24_24_24;
                        var fraction24Score = obj24_24_24_score;
                        var fraction25 = obj25_25_25;
                        var fraction25Score = obj25_25_25_score;
                        var fraction26 = obj26_26_26;
                        var fraction26Score = obj26_26_26_score;
                        var fraction27 = obj27_27_27;
                        var fraction27Score = obj27_27_27_score;
                        var fraction28 = obj28_28_28;
                        var fraction28Score = obj28_28_28_score;
                        var fraction29 = obj29_29_29;
                        var fraction29Score = obj29_29_29_score;
                        var fraction30 = obj30_30_30;
                        var fraction30Score = obj30_30_30_score;
                        var fraction31 = obj31_31_31;
                        var fraction31Score = obj31_31_31_score;
                        var fraction32 = obj32_32_32;
                        var fraction32Score = obj32_32_32_score;
                        var fraction33 = obj33_33_33;
                        var fraction33Score = obj33_33_33_score;
                        var fraction34 = obj34_34_34;
                        var fraction34Score = obj34_34_34_score;
                        var fraction35 = obj35_35_35;
                        var fraction35Score = obj35_35_35_score;
                        var fraction36 = obj36_36_36;
                        var fraction36Score = obj36_36_36_score;
                        var fraction37 = obj37_37_37;
                        var fraction37Score = obj37_37_37_score;
                        var fraction38 = obj38_38_38;
                        var fraction38Score = obj38_38_38_score;
                        var fraction39 = obj39_39_39;
                        var fraction39Score = obj39_39_39_score;
                        var fraction40 = obj40_40_40;
                        var fraction40Score = obj40_40_40_score;
                        var fraction41 = obj41_41_41;
                        var fraction41Score = obj41_41_41_score;

                        totalScore = fraction23Score + fraction24Score+ fraction25Score+ fraction26Score + fraction27Score
                            + fraction28Score+ fraction29Score+ fraction30Score+ fraction31Score+ fraction32Score
                            + fraction33Score+ fraction34Score+ fraction35Score+ fraction36Score+ fraction37Score
                            + fraction38Score+ fraction39Score+ fraction40Score+ fraction41Score;


                        var submitForm = $('#addElderForm');
                        $.post(window.apppath + "/admin/api/elderly/updateStarRateService", {
                            totalScore:totalScore,
                            starClass:starClass,
                            serviceOrgId:serviceOrgId,
                            area:area,
                            type:1,
                            proportRequirements:proportRequirements,
                            professionalRequirements:professionalRequirements,
                            proportion:proportion,
                            rehabilitationAreaRequirements:rehabilitationAreaRequirements,
                            educationalRequirements:educationalRequirements,
                            occupancyRate:occupancyRate,
                            diningAreaRequirements:diningAreaRequirements,
                            serviceItems:serviceItems,
                            fraction23:fraction23,
                            fraction24:fraction24,
                            fraction25:fraction25,
                            fraction26:fraction26,
                            fraction27:fraction27,
                            fraction28:fraction28,
                            fraction29:fraction29,
                            fraction30:fraction30,
                            fraction31:fraction31,
                            fraction32:fraction32,
                            fraction33:fraction33,
                            fraction34:fraction34,
                            fraction35:fraction35,
                            fraction36:fraction36,
                            fraction37:fraction37,
                            fraction38:fraction38,
                            fraction39:fraction39,
                            fraction40:fraction40,
                            fraction41:fraction41
                        }, function (res) {
                            if (res.success) {
                            } else {

                            }
                        }, 'json');
                    }
                    if (index == 4) {
                        var totalScore = 0;
                        var fraction42 = obj42_42_42;
                        var fraction42Score = obj42_42_42_score;
                        var fraction43 = obj43_43_43;
                        var fraction43Score = obj43_43_43_score;
                        var fraction44 = obj44_44_44;
                        var fraction44Score = obj44_44_44_score;
                        var fraction45 = obj45_45_45;
                        var fraction45Score = obj45_45_45_score;
                        var fraction46 = obj46_46_46;
                        var fraction46Score = obj46_46_46_score;
                        var fraction47 = obj47_47_47;
                        var fraction47Score = obj47_47_47_score;
                        var fraction48 = obj48_48_48;
                        var fraction48Score = obj48_48_48_score;
                        var fraction49 = obj49_49_49;
                        var fraction49Score = obj49_49_49_score;
                        var fraction50 = obj50_50_50;
                        var fraction50Score = obj50_50_50_score;
                        var fraction51 = obj51_51_51;
                        var fraction51Score = obj51_51_51_score;
                        var fraction52 = obj52_52_52;
                        var fraction52Score = obj52_52_52_score;
                        var fraction53 = obj53_53_53;
                        var fraction53Score = obj53_53_53_score;
                        var fraction54 = obj54_54_54;
                        var fraction54Score = obj54_54_54_score;
                        var fraction55 = obj55_55_55;
                        var fraction55Score = obj55_55_55_score;
                        var fraction56 = obj56_56_56;
                        var fraction56Score = obj56_56_56_score;
                        var fraction57 = obj57_57_57;
                        var fraction57Score = obj57_57_57_score;
                        var fraction58 = obj58_58_58;
                        var fraction58Score = obj58_58_58_score;
                        var fraction59 = obj59_59_59;
                        var fraction59Score = obj59_59_59_score;
                        var fraction60 = obj60_60_60;
                        var fraction60Score = obj60_60_60_score;
                        var fraction61 = obj61_61_61;
                        var fraction61Score = obj61_61_61_score;
                        var fraction62 = obj62_62_62;
                        var fraction62Score = obj62_62_62_score;

                        totalScore = fraction42Score + fraction43Score+ fraction44Score+ fraction45Score + fraction46Score
                            + fraction47Score+ fraction48Score+ fraction49Score+ fraction50Score+ fraction51Score
                            + fraction52Score+ fraction53Score+ fraction54Score+ fraction55Score+ fraction56Score
                            + fraction57Score+ fraction58Score+ fraction59Score+ fraction60Score+fraction61Score
                            + fraction62Score;

                        var submitForm = $('#addElderForm');
                        $.post(window.apppath + "/admin/api/elderly/updateStarRateAdmin",{
                            totalScore:totalScore,
                            starClass:starClass,
                            serviceOrgId:serviceOrgId,
                            area:area,
                            type:1,
                            proportRequirements:proportRequirements,
                            professionalRequirements:professionalRequirements,
                            proportion:proportion,
                            rehabilitationAreaRequirements:rehabilitationAreaRequirements,
                            educationalRequirements:educationalRequirements,
                            occupancyRate:occupancyRate,
                            diningAreaRequirements:diningAreaRequirements,
                            serviceItems:serviceItems,
                            fraction42:fraction42,
                            fraction43:fraction43,
                            fraction44:fraction44,
                            fraction45:fraction45,
                            fraction46:fraction46,
                            fraction47:fraction47,
                            fraction48:fraction48,
                            fraction49:fraction49,
                            fraction50:fraction50,
                            fraction51:fraction51,
                            fraction52:fraction52,
                            fraction53:fraction53,
                            fraction54:fraction54,
                            fraction55:fraction55,
                            fraction56:fraction56,
                            fraction57:fraction57,
                            fraction58:fraction58,
                            fraction59:fraction59,
                            fraction60:fraction60,
                            fraction61:fraction61,
                            fraction62:fraction62
                        }, function (res) {
                            if (res.success) {
                                $(".button-submit").show();
                                $(".button-submit").click(function () {
                                    var totalScore = 0;
                                    var fraction63 = obj63_63_63;
                                    var fraction63Score = obj63_63_63_score;
                                    var fraction64 = obj64_64_64;
                                    var fraction64Score = obj64_64_64_score;
                                    var fraction65 = obj65_65_65;
                                    var fraction65Score = obj65_65_65_score;
                                    var fraction66 = obj66_66_66;
                                    var fraction66Score = obj66_66_66_score;
                                    var fraction67 = obj67_67_67;
                                    var fraction67Score = obj67_67_67_score;
                                    var fraction68 = obj68_68_68;
                                    var fraction68Score = obj68_68_68_score;
                                    var fraction69 = obj69_69_69;
                                    var fraction69Score = obj69_69_69_score;
                                    var fraction70 = obj70_70_70;
                                    var fraction70Score = obj70_70_70_score;
                                    var fraction71 = obj71_71_71;
                                    var fraction71Score = obj71_71_71_score;
                                    var fraction72 = obj72_72_72;
                                    var fraction72Score = obj72_72_72_score;
                                    var fraction73 = obj73_73_73;
                                    var fraction73Score = obj73_73_73_score;
                                    var fraction74 = obj74_74_74;
                                    var fraction74Score = obj74_74_74_score;
                                    var fraction75 = obj75_75_75;
                                    var fraction75Score = obj75_75_75_score;
                                    var fraction76 = obj76_76_76;
                                    var fraction76Score = obj76_76_76_score;
                                    var fraction77 = obj77_77_77;
                                    var fraction77Score = obj77_77_77_score;
                                    var fraction78 = obj78_78_78;
                                    var fraction78Score = obj78_78_78_score;
                                    var fraction79 = obj79_79_79;
                                    var fraction79Score = obj79_79_79_score;

                                    totalScore = fraction63Score + fraction64Score+ fraction65Score+ fraction66Score + fraction67Score
                                        + fraction68Score+ fraction69Score+ fraction70Score+ fraction71Score+ fraction72Score
                                        + fraction73Score+ fraction74Score+ fraction75Score+ fraction76Score+ fraction77Score
                                        + fraction78Score+ fraction79Score;

                                    $.post(window.apppath + "/admin/api/elderly/updateStarRateFacilities",{
                                        totalScore:totalScore,
                                        starClass:starClass,
                                        serviceOrgId:serviceOrgId,
                                        area:area,
                                        type:1,
                                        proportRequirements:proportRequirements,
                                        professionalRequirements:professionalRequirements,
                                        proportion:proportion,
                                        rehabilitationAreaRequirements:rehabilitationAreaRequirements,
                                        educationalRequirements:educationalRequirements,
                                        occupancyRate:occupancyRate,
                                        diningAreaRequirements:diningAreaRequirements,
                                        serviceItems:serviceItems,
                                        fraction63:fraction63,
                                        fraction64:fraction64,
                                        fraction65:fraction65,
                                        fraction66:fraction66,
                                        fraction67:fraction67,
                                        fraction68:fraction68,
                                        fraction69:fraction69,
                                        fraction70:fraction70,
                                        fraction71:fraction71,
                                        fraction72:fraction72,
                                        fraction73:fraction73,
                                        fraction74:fraction74,
                                        fraction75:fraction75,
                                        fraction76:fraction76,
                                        fraction77:fraction77,
                                        fraction78:fraction78,
                                        fraction79:fraction79
                                    }, function (res) {
                                        if (res.success) {
                                                window.location.href=window.apppath +"/admin/serviceOrg/subsidy/starList?type=2&object=1";
                                        } else {

                                        }
                                    }, 'json');

                                })
                            } else {

                            }
                        }, 'json');

                    }

                    _self.handleTitle(tab, navigation, index);
                },
                onPrevious: function (tab, navigation, index) {
                    _self.success.hide();
                    _self.error.hide();

                    _self.handleTitle(tab, navigation, index);
                },
                onTabShow: function (tab, navigation, index) {
                    var total = navigation.find('li').length;
                    var current = index + 1;
                    var $percent = (current / total) * 100;
                    $('#elderInfo_add').find('.progress-bar').css({
                        width: $percent + '%'
                    });
                }
            });
        },
        handleTitle: function (tab, navigation, index) {
            var total = navigation.find('li').length;
            var current = index + 1;
            $('.step-title', $('#elderInfo_add')).text('Step ' + (index + 1) + ' of ' + total);
            jQuery('li', $('#elderInfo_add')).removeClass("done");
            var li_list = navigation.find('li');
            for (var i = 0; i < index; i++) {
                jQuery(li_list[i]).addClass("done");
            }

            if (current == 1) {
                $('#elderInfo_add').find('.button-previous').hide();
            } else {
                $('#elderInfo_add').find('.button-previous').show();
            }
            if (current >= total) {
                $('#elderInfo_add').find('.button-next').hide();
                $('#elderInfo_add').find('.button-submit').hide();
            } else {
                $('#elderInfo_add').find('.button-next').show();
                $('#elderInfo_add').find('.button-submit').hide();
            }
            Metronic.scrollTo($('.page-title'));
        },
        format: function (state) {
            if (!state.id) return state.text; // optgroup
            return "<img class='flag' src='../../assets/global/img/flags/" + state.id.toLowerCase() + ".png'/>&nbsp;&nbsp;" + state.text;
        },
        importFile: function (file, msg) {
            var typeFile = $("#" + file).val().trim();
            if (typeFile != null && typeFile != "") {
                var suffix = typeFile.substr(typeFile.lastIndexOf("."), typeFile.length);
                if (suffix == ".jpg") {
                    $.ajaxFileUpload({
                        url: window.apppath + "/admin/api/elderly/uploadPhoto",
                        secureuri: false,
                        fileElementId: file,//file控件id
                        dataType: 'json',
                        success: function (data, status) {
                            $("#" + msg).text(data.message).addClass("label-danger");
                            $("#photoImg").attr("src", window.apppath + data.data);
                            $("#photoImg").css("width", "168px");
                            $("#photoImg").css("height", "164px");
                            $("#photo").val(data.data);
                        },
                        error: function (data, status, e) {
                            console.log(e);
                        }
                    });
                } else {
                    window.parent.alert("请选择格式为jpg的图片");
                }

            } else {
                $("#" + msg).text("请选择文件！").addClass("label-danger");
            }
        },
        addRelate: function () {
            var value = $("#addForm").serialize();
            var linkName = $("#addForm input[name=linkName]").val();
            var linkTel = $("#addForm input[name=linkTel]").val();
            var relationship = $("#addForm select[name=relationship]").val();
            var haveKey = $('#addForm select[name=haveKey]').val();
            if ($("#elderId").val() == "" || $("#elderId").val() == null) {
                window.parent.alert("添加失败");
                return false;
            } else if (linkName == null || linkName == "") {
                window.parent.alert("请输入联系人姓名");
                return false;
            } else if (linkTel == null || linkTel == "" || !_self.isMoblie(linkTel)) {
                window.parent.alert("请输入正确的联系方式");
                return false;
            } else if (relationship == null || relationship == "") {
                window.parent.alert("请选择与老人关系");
                return false;
            } else if (haveKey == null || haveKey == "") {
                window.parent.alert("请选择是否有老人钥匙");
                return false;
            } else {
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/elderLinkMan/addElderLinkMan",
                    data: value,
                    dataType: "json",
                    success: function (res) {
                        if (res.success) {
                            $("#addForm")[0].reset();
                            $("#addRelateModal").modal("hide");
                            if (_self.grid == "") {
                                _self.relationshipInit();
                            }
                            else {
                                _self.grid.getDataTable().ajax.reload();
                            }
                        } else {
                            window.parent.alert(res.message);
                        }

                    }
                });
            }
        },
        updateRelate: function () {
            var value = $("#updateForm").serialize();
            var linkName = $("#updateForm input[name=linkName]").val();
            var linkTel = $("#updateForm input[name=linkTel]").val();
            var relationship = $("#updateForm select[name=relationship]").val();
            var haveKey = $("#updateForm select[name=haveKey]").val();
            if ($("#elderId").val() == "" || $("#elderId").val() == null) {
                window.parent.alert("添加失败");
                return false;
            } else if (linkName == null || linkName == "") {
                window.parent.alert("请输入联系人姓名");
                return false;
            } else if (linkTel == null || linkTel == "" || !_self.isMoblie(linkTel)) {
                window.parent.alert("请输入正确的联系方式");
                return false;
            } else if (relationship == null || relationship == "") {
                window.parent.alert("请选择与老人关系");
                return false;
            } else if (haveKey == null || haveKey == "") {
                window.parent.alert("请选择是否有老人钥匙");
                return false;
            } else {
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/elderLinkMan/updateElderLinkMan",
                    data: value,
                    dataType: "json",
                    success: function (res) {
                        if (res.success) {
                            $("#updateForm")[0].reset();
                            $("#updateRelateModal").modal("hide");
                            if (_self.grid == "") {
                                _self.relationshipInit();
                            }
                            else {
                                _self.grid.getDataTable().ajax.reload();
                            }
                        } else {
                            window.parent.alert(res.message);
                        }

                    }
                });
            }
        },
        g_alert: function (type, cont, url) {
            //html
            var html = '<div id="g_all"></div><div id="g_box" style="z-index:1; position:fixed"><div id="g_title">提示信息</div><div id="g_cont"><img width="100px" height="100px"><span id="g_msg">' + cont + '</span></div><div id="g_buttom"><div id="g_button"><a class="butt" id="ok">确定</a> <a class="butt" id="false">取消</a></div></div></div>';
            $('body').append(html);

            //css
            var css = "<style id='g_css'>#g_title{height:40px; background:#0095d9;border-radius:5px 5px 0 0; border-bottom:1px solid #eef0f1;line-height:40px;padding-left:25px; font-size:16px; font-weight:700; color:#fff}";
            css += "#g_cont{height:130px; background:#fff;padding-top:15px; text-align:center;}";
            css += "#g_all{width:100%; height:100%; z-index:1; position:fixed;filter:Alpha(opacity=50); background:#666666;top:0;left:0;opacity: 0.6}";
            css += "#g_msg{position:relative; top:-50px; font-size:25px;margin-left:40px;}";
            css += "#g_buttom{height:40px; border-top:1px solid #eef0f1; border-radius:0px 0px 5px 5px; background:#fff; line-height:60px;}";
            css += "#g_button{width:200px; height:100%; margin-right:10px; float:right;}";
            css += ".butt{display:block; margin-top:5px;cursor:pointer; float:left;width:80px;height:30px;line-height:30px;text-align:center;color:#FFFFFF;border-radius:5px;}"
            css += "#ok{background:#0095d9; color:#FFFFFF; float:right;}";
            css += "#false{background:#546a79; color:#FFFFFF; float:left;}";
            css += "#g_box{width:400px;}</style>";
            $('head').append(css);

            //类型为alert
            if (type == 'success') {
                $('#g_cont img').attr('src', '../assets/view/images/ok.png');
                $('#false').hide();
            }

            if (type == 'error') {
                $('#g_cont img').attr('src', '../assets/view/images/fail.png');
                $('#false').hide();
            }

            //类型为confirm
            if (type == 'warn') {
                $('#g_cont img').attr('src', '../assets/view/images/warn.jpg');
                $('#false').hide();
            }

            //类型为confirm
            if (type == 'confirm') {
                $('#g_cont img').attr('src', '../assets/view/images/confirm.jpg');
            }

            //点击OK
            $('#ok').click(function () {
                $('#g_all').remove();
                $('#g_box').remove();
                $('#g_css').remove();
                if (url) {
                    window.location = url;
                }
                return true;
            });

            //点击false
            $('#false').click(function () {
                $('#g_all').remove();
                $('#g_box').remove();
                $('#g_css').remove();
                if (type != 'confirm') {
                    if (url) {
                        window.location = url;
                    }
                }
                return false;
            });


            //居中
            var _widht = document.documentElement.clientWidth; //屏幕宽
            var _height = document.documentElement.clientHeight; //屏幕高

            var boxWidth = $("#g_box").width();
            var boxHeight = $("#g_box").height();

            $("#g_box").css({top: (_height - boxHeight) / 4 + "px", left: (_widht - boxWidth) / 2 + "px"});

        },
        isDeath: function () {
            var isDeath = $("#isDeath").val();
            if (isDeath == 1 || isDeath == 2) {
                $("#addElderForm").find("input[name=deathTimeString]").prop("disabled", true);
                $("#addElderForm").find("input[name=cremationTimeString]").prop("disabled", true);
                $("#addElderForm").find("input[name=deathTimeString]").val("");
                $("#addElderForm").find("input[name=cremationTimeString]").val("");
            } else {
                $("#addElderForm").find("input[name=deathTimeString]").prop("disabled", false);
                $("#addElderForm").find("input[name=cremationTimeString]").prop("disabled", false);
            }
        },
        isSocialCardCode: function (str) {
            var reg = /^\d*$/;
            return reg.test(str);
        },
        isZipcode: function (str) {
            var reg = /^\d{6}$/;
            return reg.test(str);
        },
        isMoblie: function (str) {
            var reg = /^1\d{10}$/;
            return reg.test(str);
        },
        isPhone: function (str) {
            /*var reg = /^0\d{2,3}-?\d{7,8}$/;*/
            var reg = /^\d{7,8}$/;
            return reg.test(str);
        },
        validateIdCard: function () {
            var idCard = $("#idcardno").val();
            $.ajax({
                type: "POST",
                url: window.apppath + "/admin/api/validate/idCard",
                data: {idStr: idCard, flag: "elder"},
                dataType: "json",
                async: false,
                success: function (res) {
                    if (res.success) {
                        $("#errorIdCard").html(res.message);
                        $("#age").val(res.data.age);
                        $("#sexDictId").val(res.data.sexDictId);
                        $("#birthday").val(res.data.birthday);
                    } else {
                        $("#errorIdCard").html(res.message);
                    }

                }
            });
        },
        relationshipInit: function () {
            _self.grid = new Datatable();
            /*var tableContainer = $("#retionship_list").parents(".table-container");*/
            _self.grid.init({
                src: $("#datatable_retionship_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/elderLinkMan/selectLinkManList", {
                            length: params.length,
                            start: params.start,
                            elderId: $("#elderId").val()
                        }, function (res) {
                            if (res) {
                                callback(res);
                            } else {
                                callback({
                                    data: null,
                                    recordsFiltered: 0
                                });
                            }
                        }, 'json');
                    },
                    "searching": false,
                    "ordering": false,
                    "columns": [
                        // {
                        //     "data": "id", render: function (data, type, row, meta) {
                        //     return '<input type="checkbox" name="deleteId" value="' + row.id + '">';
                        // }
                        // },
                        {
                            "data": "linkName", render: function (data, type, row, meta) {
                            return data;
                        }
                        },
                        {
                            "data": "linkTel", render: function (data, type, row, meta) {
                            return data;
                        }
                        },
                        {
                            "data": "relationship", render: function (data, type, row, meta) {
                            return data;
                        }
                        },
                        {"data": "haveKey"},
                        {
                            "data": "remark", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return '<div title="' + data + '" style="text-align: center;vertical-align: middle;text-overflow: ellipsis;overflow: hidden;white-space: nowrap">' + data + '</div>';
                            } else {
                                return "";
                            }
                        }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            if ($("#type").val() == "edit") {
                                return '' /*+ '<a href="' + window.apppath + '/admin/elderly/update/' + data + '?method=show" class="btn default btn-xs green-stripe">详细</a>' */ +
                                    '<button type="button" data="' + data + '" class="btn btn-xs green-stripe edit">更新</button>';

                            } else {
                                return "";
                            }
                        }
                        }
                    ]
                }
            });

            _self.grid.getTable().on("click", "button.edit", function () {
                if ($("#updateForm")[0]) {

                }
                $("#updateForm")[0].reset();
                var id = $(this).attr("data");
                $.post(window.apppath + "/admin/api/elderLinkMan/getLinkManById", {
                    id: id
                }, function (res) {
                    if (res != "") {
                        $("#updateForm input[name=id]").val(res.id);
                        $("#updateForm input[name=linkName]").val(res.linkName);
                        $("#updateForm input[name=linkTel]").val(res.linkTel);
                        $("#updateForm select[name=relationship]").val(res.relationship);
                        $("#updateForm select[name=haveKey]").val(res.haveKey);
                        $("#updateForm input[name=remark]").val(res.remark);
                    }
                    $("#updateRelateModal").modal("show");

                    $(".modal-footer").html('<button type="button" class="btn blue updateRelate" onclick="ElderlyMsgAdd.updateRelate();">更新</button>' +
                        '<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>');
                }, "json");
            });

        }

    };

}();