var AreaHomePensionStars = function () {
    var _method;
    var type = $("#type").val();

    $("#isDeath").change(function () {
        var isDeath = $("#isDeath").val();
        if (isDeath == 1 || isDeath == 2) {
            $("#editElderFrom").find("input[name=deathTimeString]").prop("disabled", true);
            $("#editElderFrom").find("input[name=cremationTimeString]").prop("disabled", true);
            $("#editElderFrom").find("input[name=deathTimeString]").val("");
            $("#editElderFrom").find("input[name=cremationTimeString]").val("");
        } else {
            $("#editElderFrom").find("input[name=deathTimeString]").prop("disabled", false);
            $("#editElderFrom").find("input[name=cremationTimeString]").prop("disabled", false);
        }
    });
    return {
        show: function(){
            // 反显年内无责任事故选中的复选框
            var input1 = document.getElementsByName("input1");
            var safetyScore1=$("#safetyScore1").val();
            var splitSafetyScore1 =safetyScore1.split(",");
            for(var i=0;i<splitSafetyScore1.length;i++){
                if(splitSafetyScore1[i]!="0"&&splitSafetyScore1[i]!=""){
                    input1[i].checked=true;
                }
            }


            var input2 = document.getElementsByName("input2");
            var safetyScore2=$("#safetyScore2").val();
            var splitSafetyScore2 =safetyScore2.split(",");
            for(var i=0;i<splitSafetyScore2.length;i++){
                if(splitSafetyScore2[i]!="0"&&splitSafetyScore2[i]!=""){
                    input2[i].checked=true;
                }
            }

            var input3 = document.getElementsByName("input3");
            var safetyScore3=$("#safetyScore3").val();
            var splitSafetyScore3 =safetyScore3.split(",");
            for(var i=0;i<splitSafetyScore3.length;i++){
                if(splitSafetyScore3[i]!="0"&&splitSafetyScore3[i]!=""){
                    input3[i].checked=true;
                }
            }
            var input4 = document.getElementsByName("input4");
            var safetyScore4=$("#safetyScore4").val();
            var splitSafetyScore4 =safetyScore4.split(",");
            for(var i=0;i<splitSafetyScore4.length-1;i++){
                if(splitSafetyScore4[i]!="0"&&splitSafetyScore4[i]!=""){
                    input4[i].checked=true;
                }
            }

            $(".in4").val(splitSafetyScore4[splitSafetyScore4.length-1]);

            var input5 = document.getElementsByName("input5");
            var safetyScore5=$("#safetyScore5").val();
            var splitSafetyScore5 =safetyScore5.split(",");
            for(var i=0;i<splitSafetyScore5.length;i++){
                if(splitSafetyScore5[i]!="0"&&splitSafetyScore5[i]!=""){
                    input5[i].checked=true;
                }
            }
            var input6 = document.getElementsByName("input6");
            var safetyScore6=$("#safetyScore6").val();
            var splitSafetyScore6 =safetyScore6.split(",");
            for(var i=0;i<splitSafetyScore6.length;i++){
                if(splitSafetyScore6[i]!="0"&&splitSafetyScore6[i]!=""){
                    input6[i].checked=true;
                }
            }
            var input7 = document.getElementsByName("input7");
            var safetyScore7=$("#safetyScore7").val();
            var splitSafetyScore7 =safetyScore7.split(",");
            for(var i=0;i<splitSafetyScore7.length-1;i++){
                if(splitSafetyScore7[i]!="0"&&splitSafetyScore7[i]!=""){
                    input7[i].checked=true;
                }
            }
            $(".in7").val(splitSafetyScore7[splitSafetyScore7.length-1]);
            var input8 = document.getElementsByName("input8");
            var safetyScore8=$("#safetyScore8").val();
            var splitSafetyScore8 =safetyScore8.split(",");
            for(var i=0;i<splitSafetyScore8.length;i++){
                if(splitSafetyScore8[i]!="0"&&splitSafetyScore8[i]!=""){
                    input8[i].checked=true;
                }
            }
            var input9 = document.getElementsByName("input9");
            var safetyScore9=$("#safetyScore9").val();
            var splitSafetyScore9 =safetyScore9.split(",");
            for(var i=0;i<splitSafetyScore9.length-1;i++){
                if(splitSafetyScore9[i]!="0"&&splitSafetyScore9[i]!=""){
                    input9[i].checked=true;
                }
            }
            $(".in9").val(splitSafetyScore9[splitSafetyScore9.length-1]);
            var input10 = document.getElementsByName("input10");
            var safetyScore10=$("#safetyScore10").val();
            var splitSafetyScore10 =safetyScore10.split(",");
            for(var i=0;i<splitSafetyScore10.length;i++){
                if(splitSafetyScore10[i]!="0"&&splitSafetyScore10[i]!=""){
                    input10[i].checked=true;
                }
            }
            var input11 = document.getElementsByName("input11");
            var safetyScore11=$("#safetyScore11").val();
            var splitSafetyScore11 =safetyScore11.split(",");
            for(var i=0;i<splitSafetyScore11.length;i++){
                if(splitSafetyScore11[i]!="0"&&splitSafetyScore11[i]!=""){
                    input11[i].checked=true;
                }
            }
            var input12 = document.getElementsByName("input12");
            var safetyScore12=$("#safetyScore12").val();
            var splitSafetyScore12 =safetyScore12.split(",");
            for(var i=0;i<splitSafetyScore12.length;i++){
                if(splitSafetyScore12[i]!="0"&&splitSafetyScore12[i]!=""){
                    input12[i].checked=true;
                }
            }
            var input13 = document.getElementsByName("input13");
            var safetyScore13=$("#safetyScore13").val();
            var splitSafetyScore13 =safetyScore13.split(",");
            for(var i=0;i<splitSafetyScore13.length;i++){
                if(splitSafetyScore13[i]!="0"&&splitSafetyScore13[i]!=""){
                    input13[i].checked=true;
                }
            }
            var input14 = document.getElementsByName("input14");
            var safetyScore14=$("#safetyScore14").val();
            var splitSafetyScore14 =safetyScore14.split(",");
            for(var i=0;i<splitSafetyScore14.length;i++){
                if(splitSafetyScore14[i]!="0"&&splitSafetyScore14[i]!=""){
                    input14[i].checked=true;
                }
            }
                      var input15 = document.getElementsByName("input15");
            var safetyScore15=$("#safetyScore15").val();
            var splitSafetyScore15 =safetyScore15.split(",");
            for(var i=0;i<splitSafetyScore15.length;i++){
                if(splitSafetyScore15[i]!="0"&&splitSafetyScore15[i]!=""){
                    input15[i].checked=true;
                }
            }

            var input16 = document.getElementsByName("input16");
            var safetyScore16=$("#safetyScore16").val();
            var splitSafetyScore16 =safetyScore16.split(",");
            for(var i=0;i<splitSafetyScore16.length-1;i++){
                if(splitSafetyScore16[i]!="0"&&splitSafetyScore16[i]!=""){
                    input16[i].checked=true;
                }
            }
            $(".in16").val(splitSafetyScore16[splitSafetyScore16.length-1]);

            var input17 = document.getElementsByName("input17");
            var safetyScore17=$("#safetyScore17").val();
            var splitSafetyScore17 =safetyScore17.split(",");
            for(var i=0;i<splitSafetyScore17.length-1;i++){
                if(splitSafetyScore17[i]!="0"&&splitSafetyScore17[i]!=""){
                    input17[i].checked=true;
                }
            }
            $(".in17").val(splitSafetyScore17[splitSafetyScore17.length-1]);

          var input18 = document.getElementsByName("input18");
            var safetyScore18=$("#safetyScore18").val();
            var splitSafetyScore18 =safetyScore18.split(",");
            for(var i=0;i<splitSafetyScore18.length;i++){
                if(splitSafetyScore18[i]!="0"&&splitSafetyScore18[i]!=""){
                    input18[i].checked=true;
                }
            }

            var input19 = document.getElementsByName("input19");
            var safetyScore19=$("#safetyScore19").val();
            var splitSafetyScore19 =safetyScore19.split(",");
            for(var i=0;i<splitSafetyScore19.length-1;i++){
                if(splitSafetyScore19[i]!="0"&&splitSafetyScore19[i]!=""){
                    input19[i].checked=true;
                }
            }
            $(".in19").val(splitSafetyScore19[splitSafetyScore19.length-1]);
            var input20 = document.getElementsByName("input20");
            var safetyScore20=$("#safetyScore20").val();
            var splitSafetyScore20 =safetyScore20.split(",");
            for(var i=0;i<splitSafetyScore20.length-1;i++){
                if(splitSafetyScore20[i]!="0"&&splitSafetyScore20[i]!=""){
                    input20[i].checked=true;
                }
            }
            $(".in20").val(splitSafetyScore20[splitSafetyScore20.length-1]);
            var input210 = document.getElementsByName("input210");
            var safetyScore210=$("#safetyScore210").val();
            var splitSafetyScore210 =safetyScore210.split(",");
            for(var i=0;i<splitSafetyScore210.length;i++){
                if(splitSafetyScore210[i]!="0"&&splitSafetyScore210[i]!=""){
                    input210[i].checked=true;
                }
            }



            var input21 = document.getElementsByName("input21");
            var serviceScore1=$("#serviceScore1").val();
            var splitServiceScore1 =serviceScore1.split(",");
            for(var i=0;i<splitServiceScore1.length-1;i++){
                if(splitServiceScore1[i]!="0"&&splitServiceScore1[i]!=""){
                    input21[i].checked=true;
                }
            }
            $(".in21").val(splitServiceScore1[splitServiceScore1.length-1]);
            var input22 = document.getElementsByName("input22");
            var serviceScore2=$("#serviceScore2").val();
            var splitServiceScore2 =serviceScore2.split(",");
            for(var i=0;i<splitServiceScore2.length-1;i++){
                if(splitServiceScore2[i]!="0"&&splitServiceScore2[i]!=""){
                    input22[i].checked=true;
                }
            }
            $(".in22").val(splitServiceScore2[splitServiceScore2.length-1]);
            var input23 = document.getElementsByName("input23");
            var serviceScore3=$("#serviceScore3").val();
            var splitServiceScore3 =serviceScore3.split(",");
            for(var i=0;i<splitServiceScore3.length-1;i++){
                if(splitServiceScore3[i]!="0"&&splitServiceScore3[i]!=""){
                    input23[i].checked=true;
                }
            }
            $(".in23").val(splitServiceScore3[splitServiceScore3.length-1]);
            var input24 = document.getElementsByName("input24");
            var serviceScore4=$("#serviceScore4").val();
            var splitServiceScore4 =serviceScore4.split(",");
            for(var i=0;i<splitServiceScore4.length-1;i++){
                if(splitServiceScore4[i]!="0"&&splitServiceScore4[i]!=""){
                    input24[i].checked=true;
                }
            }
            $(".in24").val(splitServiceScore4[splitServiceScore4.length-1]);
            var input25 = document.getElementsByName("input25");
            var serviceScore5=$("#serviceScore5").val();
            var splitServiceScore5 =serviceScore5.split(",");
            for(var i=0;i<splitServiceScore5.length-1;i++){
                if(splitServiceScore5[i]!="0"&&splitServiceScore5[i]!=""){
                    input25[i].checked=true;
                }
            }
            $(".in25").val(splitServiceScore5[splitServiceScore5.length-1]);
            var input26 = document.getElementsByName("input26");
            var serviceScore6=$("#serviceScore6").val();
            var splitServiceScore6 =serviceScore6.split(",");
            for(var i=0;i<splitServiceScore6.length-1;i++){
                if(splitServiceScore6[i]!="0"&&splitServiceScore6[i]!=""){
                    input26[i].checked=true;
                }
            }
            $(".in26").val(splitServiceScore6[splitServiceScore6.length-1]);
            var input27 = document.getElementsByName("input27");
            var serviceScore7=$("#serviceScore7").val();
            var splitServiceScore7 =serviceScore7.split(",");
            for(var i=0;i<splitServiceScore7.length-1;i++){
                if(splitServiceScore7[i]!="0"&&splitServiceScore7[i]!=""){
                    input27[i].checked=true;
                }
            }
            $(".in27").val(splitServiceScore7[splitServiceScore7.length-1]);
            var input28 = document.getElementsByName("input28");
            var serviceScore8=$("#serviceScore8").val();
            var splitServiceScore8 =serviceScore8.split(",");
            for(var i=0;i<splitServiceScore8.length-1;i++){
                if(splitServiceScore8[i]!="0"&&splitServiceScore8[i]!=""){
                    input28[i].checked=true;
                }
            }
            $(".in28").val(splitServiceScore8[splitServiceScore8.length-1]);

            var input29 = document.getElementsByName("input29");
            var serviceScore9=$("#serviceScore9").val();
            var splitServiceScore9 =serviceScore9.split(",");
            for(var i=0;i<splitServiceScore9.length-1;i++){
                if(splitServiceScore9[i]!="0"&&splitServiceScore9[i]!=""){
                    input29[i].checked=true;
                }
            }
            $(".in29").val(splitServiceScore9[splitServiceScore9.length-1]);

            var input30 = document.getElementsByName("input30");
            var serviceScore10=$("#serviceScore10").val();
            var splitServiceScore10 =serviceScore10.split(",");
            for(var i=0;i<splitServiceScore10.length;i++){
                if(splitServiceScore10[i]!="0"&&splitServiceScore10[i]!=""){
                    input30[i].checked=true;
                }
            }


            var input310 = document.getElementsByName("input310");
            var serviceScore11=$("#serviceScore11").val();
            var splitServiceScore11 =serviceScore11.split(",");
            for(var i=0;i<splitServiceScore11.length-1;i++){
                if(splitServiceScore11[i]!="0"&&splitServiceScore11[i]!=""){
                    input310[i].checked=true;
                }
            }
            $(".in310").val(splitServiceScore11[splitServiceScore11.length-1]);


            var input31 = document.getElementsByName("input31");
            var manageScore1=$("#manageScore1").val();
            var splitManageScore1 =manageScore1.split(",");
            for(var i=0;i<splitManageScore1.length-1;i++){
                if(splitManageScore1[i]!="0"&&splitManageScore1[i]!=""){
                    input31[i].checked=true;
                }
            }
            $(".in31").val(splitManageScore1[splitManageScore1.length-1]);
            var input32 = document.getElementsByName("input32");
            var manageScore2=$("#manageScore2").val();
            var splitManageScore2 =manageScore2.split(",");
            for(var i=0;i<splitManageScore2.length;i++){
                if(splitManageScore2[i]!="0"&&splitManageScore2[i]!=""){
                    input32[i].checked=true;
                }
            }
            var input33 = document.getElementsByName("input33");
            var manageScore3=$("#manageScore3").val();
            var splitManageScore3 =manageScore3.split(",");
            for(var i=0;i<splitManageScore3.length;i++){
                if(splitManageScore3[i]!="0"&&splitManageScore3[i]!=""){
                    input33[i].checked=true;
                }
            }
            var input34 = document.getElementsByName("input34");
            var manageScore4=$("#manageScore4").val();
            var splitManageScore4 =manageScore4.split(",");
            for(var i=0;i<splitManageScore4.length;i++){
                if(splitManageScore4[i]!="0"&&splitManageScore4[i]!=""){
                    input34[i].checked=true;
                }
            }
            var input35 = document.getElementsByName("input35");
            var manageScore5=$("#manageScore5").val();
            var splitManageScore5 =manageScore5.split(",");
            for(var i=0;i<splitManageScore5.length-1;i++){
                if(splitManageScore5[i]!="0"&&splitManageScore5[i]!=""){
                    input35[i].checked=true;
                }
            }
            $(".in35").val(splitManageScore5[splitManageScore5.length-1]);
            var input36 = document.getElementsByName("input36");
            var manageScore6=$("#manageScore6").val();
            var splitManageScore6 =manageScore6.split(",");
            for(var i=0;i<splitManageScore6.length;i++){
                if(splitManageScore6[i]!="0"&&splitManageScore6[i]!=""){
                    input36[i].checked=true;
                }
            }
            var input37 = document.getElementsByName("input37");
            var manageScore7=$("#manageScore7").val();
            var splitManageScore7 =manageScore7.split(",");
            for(var i=0;i<splitManageScore7.length-1;i++){
                if(splitManageScore7[i]!="0"&&splitManageScore7[i]!=""){
                    input37[i].checked=true;
                }
            }
            $(".in37").val(splitManageScore7[splitManageScore7.length-1]);
            var input38 = document.getElementsByName("input38");
            var manageScore8=$("#manageScore8").val();
            var splitManageScore8 =manageScore8.split(",");
            for(var i=0;i<splitManageScore8.length-1;i++){
                if(splitManageScore8[i]!="0"&&splitManageScore8[i]!=""){
                    input38[i].checked=true;
                }
            }
            $(".in38").val(splitManageScore8[splitManageScore8.length-1]);
            var input39 = document.getElementsByName("input39");
            var manageScore9=$("#manageScore9").val();
            var splitManageScore9 =manageScore9.split(",");
            for(var i=0;i<splitManageScore9.length-1;i++){
                if(splitManageScore9[i]!="0"&&splitManageScore9[i]!=""){
                    input39[i].checked=true;
                }
            }
            $(".in39").val(splitManageScore9[splitManageScore9.length-1]);

            var input40 = document.getElementsByName("input40");
            var manageScore10=$("#manageScore10").val();
            var splitManageScore10 =manageScore10.split(",");
            for(var i=0;i<splitManageScore10.length;i++){
                if(splitManageScore10[i]!="0"&&splitManageScore10[i]!=""){
                    input40[i].checked=true;
                }
            }

            var input410 = document.getElementsByName("input410");
            var manageScore11=$("#manageScore11").val();
            var splitManageScore11 =manageScore11.split(",");
            for(var i=0;i<splitManageScore11.length;i++){
                if(splitManageScore11[i]!="0"&&splitManageScore11[i]!=""){
                    input410[i].checked=true;
                }
            }

            var input420 = document.getElementsByName("input420");
            var manageScore12=$("#manageScore12").val();
            var splitManageScore12 =manageScore12.split(",");
            for(var i=0;i<splitManageScore12.length;i++){
                if(splitManageScore12[i]!="0"&&splitManageScore12[i]!=""){
                    input420[i].checked=true;
                }
            }






            var input41 = document.getElementsByName("input41");
            var facilityScore1=$("#facilityScore1").val();
            var splitFacilityScore1 =facilityScore1.split(",");
            for(var i=0;i<splitFacilityScore1.length;i++){
                if(splitFacilityScore1[i]!="0"&&splitFacilityScore1[i]!=""){
                    input41[i].checked=true;
                }
            }


            var input42 = document.getElementsByName("input42");
            var facilityScore2=$("#facilityScore2").val();
            var splitFacilityScore2 =facilityScore2.split(",");
            for(var i=0;i<splitFacilityScore2.length;i++){
                if(splitFacilityScore2[i]!="0"&&splitFacilityScore2[i]!=""){
                    input42[i].checked=true;
                }
            }
            var input43 = document.getElementsByName("input43");
            var facilityScore3=$("#facilityScore3").val();
            var splitFacilityScore3 =facilityScore3.split(",");
            for(var i=0;i<splitFacilityScore3.length;i++){
                if(splitFacilityScore3[i]!="0"&&splitFacilityScore3[i]!=""){
                    input43[i].checked=true;
                }
            }

            var input44 = document.getElementsByName("input44");
            var facilityScore4=$("#facilityScore4").val();
            var splitFacilityScore4 =facilityScore4.split(",");
            for(var i=0;i<splitFacilityScore4.length;i++){
                if(splitFacilityScore4[i]!="0"&&splitFacilityScore4[i]!=""){
                    input44[i].checked=true;
                }
            }

            var input45 = document.getElementsByName("input45");
            var facilityScore5=$("#facilityScore5").val();
            var splitFacilityScore5 =facilityScore5.split(",");
            for(var i=0;i<splitFacilityScore5.length;i++){
                if(splitFacilityScore5[i]!="0"&&splitFacilityScore5[i]!=""){
                    input45[i].checked=true;
                }
            }

            var input46 = document.getElementsByName("input46");
            var facilityScore6=$("#facilityScore6").val();
            var splitFacilityScore6 =facilityScore6.split(",");
            for(var i=0;i<splitFacilityScore6.length;i++){
                if(splitFacilityScore6[i]!="0"&&splitFacilityScore6[i]!=""){
                    input46[i].checked=true;
                }
            }

            var input47 = document.getElementsByName("input47");
            var facilityScore7=$("#facilityScore7").val();
            var splitFacilityScore7 =facilityScore7.split(",");
            for(var i=0;i<splitFacilityScore7.length;i++){
                if(splitFacilityScore7[i]!="0"&&splitFacilityScore7[i]!=""){
                    input47[i].checked=true;
                }
            }

            var input48 = document.getElementsByName("input48");
            var facilityScore8=$("#facilityScore8").val();
            var splitFacilityScore8 =facilityScore8.split(",");
            for(var i=0;i<splitFacilityScore8.length;i++){
                if(splitFacilityScore8[i]!="0"&&splitFacilityScore8[i]!=""){
                    input48[i].checked=true;
                }
            }

            var input49 = document.getElementsByName("input49");
            var facilityScore9=$("#facilityScore9").val();
            var splitFacilityScore9 =facilityScore9.split(",");
            for(var i=0;i<splitFacilityScore9.length;i++){
                if(splitFacilityScore9[i]!="0"&&splitFacilityScore9[i]!=""){
                    input49[i].checked=true;
                }
            }

            var input50 = document.getElementsByName("input50");
            var facilityScore10=$("#facilityScore10").val();
            var splitFacilityScore10 =facilityScore10.split(",");
            for(var i=0;i<splitFacilityScore10.length-1;i++){
                if(splitFacilityScore10[i]!="0"&&splitFacilityScore10[i]!=""){
                    input50[i].checked=true;
                }
            }
            $(".in50").val(splitFacilityScore10[splitFacilityScore10.length-1]);

            var input51 = document.getElementsByName("input51");
            var facilityScore11=$("#facilityScore11").val();
            var splitFacilityScore11 =facilityScore11.split(",");
            for(var i=0;i<splitFacilityScore11.length;i++){
                if(splitFacilityScore11[i]!="0"&&splitFacilityScore11[i]!=""){
                    input51[i].checked=true;
                }
            }

            var input52 = document.getElementsByName("input52");
            var facilityScore12=$("#facilityScore12").val();
            var splitFacilityScore12 =facilityScore12.split(",");
            for(var i=0;i<splitFacilityScore12.length;i++){
                if(splitFacilityScore12[i]!="0"&&splitFacilityScore12[i]!=""){
                    input52[i].checked=true;
                }
            }

            var input53 = document.getElementsByName("input53");
            var facilityScore13=$("#facilityScore13").val();
            var splitFacilityScore13 =facilityScore13.split(",");
            for(var i=0;i<splitFacilityScore13.length;i++){
                if(splitFacilityScore13[i]!="0"&&splitFacilityScore13[i]!=""){
                    input53[i].checked=true;
                }
            }

            var input54 = document.getElementsByName("input54");
            var facilityScore14=$("#facilityScore14").val();
            var splitFacilityScore14 =facilityScore14.split(",");
            for(var i=0;i<splitFacilityScore14.length;i++){
                if(splitFacilityScore14[i]!="0"&&splitFacilityScore14[i]!=""){
                    input54[i].checked=true;
                }
            }


            var input55 = document.getElementsByName("input55");
            var facilityScore15=$("#facilityScore15").val();
            var splitFacilityScore15 =facilityScore15.split(",");
            for(var i=0;i<splitFacilityScore15.length-1;i++){
                if(splitFacilityScore15[i]!="0"&&splitFacilityScore15[i]!=""){
                    input55[i].checked=true;
                }
            }
            $(".in55").val(splitFacilityScore15[splitFacilityScore15.length-1]);


            var input56 = document.getElementsByName("input56");
            var facilityScore16=$("#facilityScore16").val();
            var splitFacilityScore16 =facilityScore16.split(",");
            for(var i=0;i<splitFacilityScore16.length;i++){
                if(splitFacilityScore16[i]!="0"&&splitFacilityScore16[i]!=""){
                    input56[i].checked=true;
                }
            }






















        },

        init: function (method) {
            $("#starRate").find("input:text").addClass("form-control");
            $("#starRate").find("select").addClass("form-control");
            $("#starRate").find("input:text").addClass("form-control");
            $("#starRate").find("select").addClass("form-control");
        },
        selectArea: function (method) {
            _method = method;
            $('#myModal').modal({
                keyboard: true
            });
        },
        getAreaValue: function (areaName, areaId, deptCode) {
            if (_method == 'edit') {
                document.getElementById("areaName").value = areaName;
                document.getElementById("areaId").value = areaId;
                document.getElementById("deptCode").value = deptCode;
            } else if (_method == 'add') {
                document.getElementById("areaName2").value = areaName;
                document.getElementById("areaId2").value = areaId;
                document.getElementById("deptCode2").value = deptCode;
            }
            $('#myModal').modal('hide');
        },
        notAllowEdit: function () {
            $("#editElderFrom").find("input:text").addClass("form-control");
            $("#editElderFrom").find("select").addClass("form-control");
            $("#editElderFrom").find("input:text").addClass("form-control");
            $("#editElderFrom").find("select").addClass("form-control");
            $("#editElderFrom").find("input:text").prop("disabled", true);//找到form表单下的所有input标签并置为不可编辑
            $("#editElderFrom").find("select").prop("disabled", true);//找到form表单下的所有select标签并置为不可编辑
            $("#editElderFrom").find("input:checkbox").prop("disabled", true);//找到form表单下的所有checkbox标签并置为不可编辑
            $("#editElderFrom").find("input:radio").prop("disabled", true);//找到form表单下的所有checkbox标签并置为不可编辑
            $("#editElderFrom").find("button[name=editElder]").prop("disabled", true);
            $("#editElderFrom").find("input:file").prop("disabled", true);
        },
        allowEdit: function () {
            $("#editElderFrom").find("input:text").prop("disabled", false);//找到form表单下的所有input标签并置为可编辑
            $("#editElderFrom").find("select").prop("disabled", false);//找到form表单下的所有select标签并置为可编辑
            $("#editElderFrom").find("input:checkbox").prop("disabled", false);//找到form表单下的所有checkbox标签并置为可编辑
            $("#editElderFrom").find("input:radio").prop("disabled", false);//找到form表单下的所有checkbox标签并置为可编辑
            $("#editElderFrom").find("button[name=editElder]").prop("disabled", false);
            $("#editElderFrom").find("button[name=btnAddRelate]").prop("disabled", false);
            $("#editElderFrom").find("input:file").prop("disabled", false);
            $("#editElderFrom").find("input[name=deathTimeString]").prop("disabled", true);
            $("#editElderFrom").find("input[name=cremationTimeString]").prop("disabled", true);
        },
        editElder: function () {
            var $btn = $(this);
            var formEdit = $('#editElderFrom');
            var areaName = $("#editElderFrom input[name=areaName]").val();
            if (areaName == "") {
                $("#labelmsg").text('请选择所属区域！').addClass("label-danger");
                return false;
            } else if ($("#editElderFrom input[name=elderName]").val() == "") {
                $("#labelmsg").text('请输入老人姓名！').addClass("label-danger");
                return false;
            } else if ($("#editElderFrom input[name=idcardno]").val() == "") {
                $("#labelmsg").text('请输入身份证号！').addClass("label-danger");
                return false;
            } else if ($("#errorIdCard").html() != null && $("#errorIdCard").html() != "" && $("#errorIdCard").html() != "身份证正确") {
                $("#labelmsg").text('请输入正确的身份证号！').addClass("label-danger");
                return false;
            } else if ($("#age").val() < 60) {
                $("#labelmsg").text('老人年龄必须在60岁以上！').addClass("label-danger");
                return false;
            } else {
                $("#labelmsg").text('');
                $btn.button('loading');
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/elderly/update",
                    data: formEdit.serialize() + "&areaOrder=" + getAreaOrder(areaName),
                    dataType: "json",
                    success: function (res) {
                        $btn.button('reset');
                        if (res.success) {
                            Metronic.alert({type: 'success', message: res.message, closeInSeconds: 2, icon: 'check'});
                        } else {
                            Metronic.alert({type: 'danger', message: res.message, closeInSeconds: 2, icon: 'warning'});
                        }
                    }
                });
            }
        },
        clean: function () {
            $("#addElderFrom").find("input:text").val("");//找到form表单下的所有input标签并清空
            $("#addElderFrom").find("select").val("");//找到form表单下的所有select标签并清空
            $("#addElderFrom").find("input:checkbox").parent().removeClass("checked");//找到form表单下的所有checkbox标签并清空
            $("#addElderFrom").find("input:radio").parent().removeClass("checked");//找到form表单下的所有checkbox标签并清空
        },
        isDeath: function () {
            var isDeath = $("#isDeath").val();
            if (isDeath == 1) {
                $("#starRate").find("input[name=deathTimeString]").prop("disabled", true);
                $("#starRate").find("input[name=cremationTimeString]").prop("disabled", true);
            } else {
                $("#starRate").find("input[name=deathTimeString]").prop("disabled", false);
                $("#starRate").find("input[name=cremationTimeString]").prop("disabled", false);
            }
        }
    };
}();