var StarAssessCommon = function () {
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
        show: function () {
            // 反显年内无责任事故选中的复选框
            var h1 = $("#fraction01s").val();
            //拆分
            var checkArray1 = h1.split(",");
            //获取所有复选框的值
            var checkBoxAll1 = $('#starRate input[name=fraction01]');
            for (var i = 0; i < checkArray1.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll1, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue1 = $(radio).val();
                    if (checkArray1[i] == checkValue1) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h2 = $("#fraction02s").val();
            //拆分
            var checkArray2 = h2.split(",");
            //获取所有复选框的值
            var checkBoxAll2 = $('#starRate input[name=fraction02]');
            for (var i = 0; i < checkArray2.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll2, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue2 = $(radio).val();
                    if (checkArray2[i] == checkValue2) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h3 = $("#fraction03s").val();
            //拆分
            var checkArray3 = h3.split(",");
            //获取所有复选框的值
            var checkBoxAll3 = $('#starRate input[name=fraction03]');
            for (var i = 0; i < checkArray3.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll3, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue3 = $(radio).val();
                    if (checkArray3[i] == checkValue3) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h4 = $("#fraction04s").val();
            //拆分
            var checkArray4 = h4.split(",");
            //获取所有复选框的值
            var checkBoxAll4 = $('#starRate input[name=fraction04]');
            for (var i = 0; i < checkArray4.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll4, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue4 = $(radio).val();
                    if (checkArray4[i] == checkValue4) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h5 = $("#fraction05s").val();
            //拆分
            var checkArray5 = h5.split(",");
            //获取所有复选框的值
            var checkBoxAll5 = $('#starRate input[name=fraction05]');
            for (var i = 0; i < checkArray5.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll5, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue5 = $(radio).val();
                    if (checkArray5[i] == checkValue5) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h6 = $("#fraction06s").val();
            //拆分
            var checkArray6 = h6.split(",");
            //获取所有复选框的值
            var checkBoxAll6 = $('#starRate input[name=fraction06]');
            for (var i = 0; i < checkArray6.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll6, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue6 = $(radio).val();
                    if (checkArray6[i] == checkValue6) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h7 = $("#fraction07s").val();
            //拆分
            var checkArray7 = h7.split(",");
            //获取所有复选框的值
            var checkBoxAll7 = $('#starRate input[name=fraction07]');
            for (var i = 0; i < checkArray7.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll7, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue7 = $(radio).val();
                    if (checkArray7[i] == checkValue7) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h8 = $("#fraction08s").val();
            //拆分
            var checkArray8 = h8.split(",");
            //获取所有复选框的值
            var checkBoxAll8 = $('#starRate input[name=fraction08]');
            for (var i = 0; i < checkArray8.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll8, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue8 = $(radio).val();
                    if (checkArray8[i] == checkValue8) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h9 = $("#fraction09s").val();
            //拆分
            var checkArray9 = h9.split(",");
            //获取所有复选框的值
            var checkBoxAll9 = $('#starRate input[name=fraction09]');
            for (var i = 0; i < checkArray9.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll9, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue9 = $(radio).val();
                    if (checkArray9[i] == checkValue9) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }


            var h10 = $("#fraction10s").val();
            //拆分
            var checkArray10 = h10.split(",");
            //获取所有复选框的值
            var checkBoxAll10 = $('#starRate input[name=fraction10]');
            for (var i = 0; i < checkArray10.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll10, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue10 = $(radio).val();
                    if (checkArray10[i] == checkValue10) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h11 = $("#fraction11s").val();
            //拆分
            var checkArray11 = h11.split(",");
            //获取所有复选框的值
            var checkBoxAll11 = $('#starRate input[name=fraction11]');
            for (var i = 0; i < checkArray11.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll11, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue11 = $(radio).val();
                    if (checkArray11[i] == checkValue11) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }

            var h12 = $("#fraction12s").val();
            //拆分
            var checkArray12 = h12.split(",");
            //获取所有复选框的值
            var checkBoxAll12 = $('#starRate input[name=fraction12]');
            for (var i = 0; i < checkArray12.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll12, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue12 = $(radio).val();
                    if (checkArray12[i] == checkValue12) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h13 = $("#fraction13s").val();
            //拆分
            var checkArray13 = h13.split(",");
            //获取所有复选框的值
            var checkBoxAll13 = $('#starRate input[name=fraction13]');
            for (var i = 0; i < checkArray13.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll13, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue13 = $(radio).val();
                    if (checkArray13[i] == checkValue13) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h14 = $("#fraction14s").val();
            //拆分
            var checkArray14 = h14.split(",");
            //获取所有复选框的值
            var checkBoxAll14 = $('#starRate input[name=fraction14]');
            for (var i = 0; i < checkArray14.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll14, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue14 = $(radio).val();
                    if (checkArray14[i] == checkValue14) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h15 = $("#fraction15s").val();
            //拆分
            var checkArray15 = h15.split(",");
            //获取所有复选框的值
            var checkBoxAll15 = $('#starRate input[name=fraction15]');
            for (var i = 0; i < checkArray15.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll15, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue15 = $(radio).val();
                    if (checkArray15[i] == checkValue15) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h16 = $("#fraction16s").val();
            //拆分
            var checkArray16 = h16.split(",");
            //获取所有复选框的值
            var checkBoxAll16 = $('#starRate input[name=fraction16]');
            for (var i = 0; i < checkArray16.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll16, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue16 = $(radio).val();
                    if (checkArray16[i] == checkValue16) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h17 = $("#fraction17s").val();
            //拆分
            var checkArray17 = h17.split(",");
            //获取所有复选框的值
            var checkBoxAll17 = $('#starRate input[name=fraction17]');
            for (var i = 0; i < checkArray17.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll17, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue17 = $(radio).val();
                    if (checkArray17[i] == checkValue17) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h18 = $("#fraction18s").val();
            //拆分
            var checkArray18 = h18.split(",");
            //获取所有复选框的值
            var checkBoxAll18 = $('#starRate input[name=fraction18]');
            for (var i = 0; i < checkArray18.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll18, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue18 = $(radio).val();
                    if (checkArray18[i] == checkValue18) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }

            var h19 = $("#fraction19s").val();
            //拆分
            var checkArray19 = h19.split(",");
            //获取所有复选框的值
            var checkBoxAll19 = $('#starRate input[name=fraction19]');
            for (var i = 0; i < checkArray19.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll19, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue19 = $(radio).val();
                    if (checkArray19[i] == checkValue19) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h20 = $("#fraction20s").val();
            //拆分
            var checkArray20 = h20.split(",");
            //获取所有复选框的值
            var checkBoxAll20 = $('#starRate input[name=fraction20]');
            for (var i = 0; i < checkArray20.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll20, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue20 = $(radio).val();
                    if (checkArray20[i] == checkValue20) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h21 = $("#fraction21s").val();
            //拆分
            var checkArray21 = h21.split(",");
            //获取所有复选框的值
            var checkBoxAll21 = $('#starRate input[name=fraction21]');
            for (var i = 0; i < checkArray21.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll21, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue21 = $(radio).val();
                    if (checkArray21[i] == checkValue21) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }

            var h22 = $("#fraction22s").val();
            //拆分
            var checkArray22 = h22.split(",");
            //获取所有复选框的值
            var checkBoxAll22 = $('#starRate input[name=fraction22]');
            for (var i = 0; i < checkArray22.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll22, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue22 = $(radio).val();
                    if (checkArray22[i] == checkValue22) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h23 = $("#fraction23s").val();
            //拆分
            var checkArray23 = h23.split(",");
            //获取所有复选框的值
            var checkBoxAll23 = $('#starRate input[name=fraction23]');
            for (var i = 0; i < checkArray23.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll23, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue23 = $(radio).val();
                    if (checkArray23[i] == checkValue23) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h24 = $("#fraction24s").val();
            //拆分
            var checkArray24 = h24.split(",");
            //获取所有复选框的值
            var checkBoxAll24 = $('#starRate input[name=fraction24]');
            for (var i = 0; i < checkArray24.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll24, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue24 = $(radio).val();
                    if (checkArray24[i] == checkValue24) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h25 = $("#fraction25s").val();
            //拆分
            var checkArray25 = h25.split(",");
            //获取所有复选框的值
            var checkBoxAll25 = $('#starRate input[name=fraction25]');
            for (var i = 0; i < checkArray25.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll25, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue25 = $(radio).val();
                    if (checkArray25[i] == checkValue25) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h26 = $("#fraction26s").val();
            //拆分
            var checkArray26 = h26.split(",");
            //获取所有复选框的值
            var checkBoxAll26 = $('#starRate input[name=fraction26]');
            for (var i = 0; i < checkArray26.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll26, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue26 = $(radio).val();
                    if (checkArray26[i] == checkValue26) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }

            var h27 = $("#fraction27s").val();
            //拆分
            var checkArray27 = h27.split(",");
            //获取所有复选框的值
            var checkBoxAll27 = $('#starRate input[name=fraction27]');
            for (var i = 0; i < checkArray27.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll27, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue27 = $(radio).val();
                    if (checkArray27[i] == checkValue27) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h28 = $("#fraction28s").val();
            //拆分
            var checkArray28 = h28.split(",");
            //获取所有复选框的值
            var checkBoxAll28 = $('#starRate input[name=fraction28]');
            for (var i = 0; i < checkArray28.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll28, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue28 = $(radio).val();
                    if (checkArray28[i] == checkValue28) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }

            var h29 = $("#fraction29s").val();
            //拆分
            var checkArray29 = h29.split(",");
            //获取所有复选框的值
            var checkBoxAll29 = $('#starRate input[name=fraction29]');
            for (var i = 0; i < checkArray29.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll29, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue29 = $(radio).val();
                    if (checkArray29[i] == checkValue29) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h30 = $("#fraction30s").val();
            //拆分
            var checkArray30 = h30.split(",");
            //获取所有复选框的值
            var checkBoxAll30 = $('#starRate input[name=fraction30]');
            for (var i = 0; i < checkArray30.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll30, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue30 = $(radio).val();
                    if (checkArray30[i] == checkValue30) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h31 = $("#fraction31s").val();
            //拆分
            var checkArray31 = h31.split(",");
            //获取所有复选框的值
            var checkBoxAll31 = $('#starRate input[name=fraction31]');
            for (var i = 0; i < checkArray31.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll31, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue31 = $(radio).val();
                    if (checkArray31[i] == checkValue31) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h32 = $("#fraction32s").val();
            //拆分
            var checkArray32 = h32.split(",");
            //获取所有复选框的值
            var checkBoxAll32 = $('#starRate input[name=fraction32]');
            for (var i = 0; i < checkArray32.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll32, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue32 = $(radio).val();
                    if (checkArray32[i] == checkValue32) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }

            var h33 = $("#fraction33s").val();
            //拆分
            var checkArray33 = h33.split(",");
            //获取所有复选框的值
            var checkBoxAll33 = $('#starRate input[name=fraction33]');
            for (var i = 0; i < checkArray33.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll33, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue33 = $(radio).val();
                    if (checkArray33[i] == checkValue33) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h34 = $("#fraction34s").val();
            //拆分
            var checkArray34 = h34.split(",");
            //获取所有复选框的值
            var checkBoxAll34 = $('#starRate input[name=fraction34]');
            for (var i = 0; i < checkArray34.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll34, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue34 = $(radio).val();
                    if (checkArray34[i] == checkValue34) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h35 = $("#fraction35s").val();
            //拆分
            var checkArray35 = h35.split(",");
            //获取所有复选框的值
            var checkBoxAll35 = $('#starRate input[name=fraction35]');
            for (var i = 0; i < checkArray35.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll35, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue35 = $(radio).val();
                    if (checkArray35[i] == checkValue35) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h36 = $("#fraction36s").val();
            //拆分
            var checkArray36 = h36.split(",");
            //获取所有复选框的值
            var checkBoxAll36 = $('#starRate input[name=fraction36]');
            for (var i = 0; i < checkArray36.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll36, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue36 = $(radio).val();
                    if (checkArray36[i] == checkValue36) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h37 = $("#fraction37s").val();
            //拆分
            var checkArray37 = h37.split(",");
            //获取所有复选框的值
            var checkBoxAll37 = $('#starRate input[name=fraction37]');
            for (var i = 0; i < checkArray37.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll37, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue37 = $(radio).val();
                    if (checkArray37[i] == checkValue37) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h38 = $("#fraction38s").val();
            //拆分
            var checkArray38 = h38.split(",");
            //获取所有复选框的值
            var checkBoxAll38 = $('#starRate input[name=fraction38]');
            for (var i = 0; i < checkArray38.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll38, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue38 = $(radio).val();
                    if (checkArray38[i] == checkValue38) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }

            var h39 = $("#fraction39s").val();
            //拆分
            var checkArray39 = h39.split(",");
            //获取所有复选框的值
            var checkBoxAll39 = $('#starRate input[name=fraction39]');
            for (var i = 0; i < checkArray39.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll39, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue39 = $(radio).val();
                    if (checkArray39[i] == checkValue39) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }

            var h40 = $("#fraction40s").val();
            //拆分
            var checkArray40 = h40.split(",");
            //获取所有复选框的值
            var checkBoxAll40 = $('#starRate input[name=fraction40]');
            for (var i = 0; i < checkArray40.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll40, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue40 = $(radio).val();
                    if (checkArray40[i] == checkValue40) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }

            var h41 = $("#fraction41s").val();
            //拆分
            var checkArray41 = h41.split(",");
            //获取所有复选框的值
            var checkBoxAll41 = $('#starRate input[name=fraction41]');
            for (var i = 0; i < checkArray41.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll41, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue41 = $(radio).val();
                    if (checkArray41[i] == checkValue41) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h42 = $("#fraction42s").val();
            //拆分
            var checkArray42 = h42.split(",");
            //获取所有复选框的值
            var checkBoxAll42 = $('#starRate input[name=fraction42]');
            for (var i = 0; i < checkArray42.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll42, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue42 = $(radio).val();
                    if (checkArray42[i] == checkValue42) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h43 = $("#fraction43s").val();
            //拆分
            var checkArray43 = h43.split(",");
            //获取所有复选框的值
            var checkBoxAll43 = $('#starRate input[name=fraction43]');
            for (var i = 0; i < checkArray43.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll43, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue43 = $(radio).val();
                    if (checkArray43[i] == checkValue43) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h44 = $("#fraction44s").val();
            //拆分
            var checkArray44 = h44.split(",");
            //获取所有复选框的值
            var checkBoxAll44 = $('#starRate input[name=fraction44]');
            for (var i = 0; i < checkArray44.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll44, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue44 = $(radio).val();
                    if (checkArray44[i] == checkValue44) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h45 = $("#fraction45s").val();
            //拆分
            var checkArray45 = h45.split(",");
            //获取所有复选框的值
            var checkBoxAll45 = $('#starRate input[name=fraction45]');
            for (var i = 0; i < checkArray45.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll45, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue45 = $(radio).val();
                    if (checkArray45[i] == checkValue45) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h46 = $("#fraction46s").val();
            //拆分
            var checkArray46 = h46.split(",");
            //获取所有复选框的值
            var checkBoxAll46 = $('#starRate input[name=fraction46]');
            for (var i = 0; i < checkArray46.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll46, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue46 = $(radio).val();
                    if (checkArray46[i] == checkValue46) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h47 = $("#fraction47s").val();
            //拆分
            var checkArray47 = h47.split(",");
            //获取所有复选框的值
            var checkBoxAll47 = $('#starRate input[name=fraction47]');
            for (var i = 0; i < checkArray47.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll47, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue47 = $(radio).val();
                    if (checkArray47[i] == checkValue47) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h48 = $("#fraction48s").val();
            //拆分
            var checkArray48 = h48.split(",");
            //获取所有复选框的值
            var checkBoxAll48 = $('#starRate input[name=fraction48]');
            for (var i = 0; i < checkArray48.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll48, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue48 = $(radio).val();
                    if (checkArray48[i] == checkValue48) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h49 = $("#fraction49s").val();
            //拆分
            var checkArray49 = h49.split(",");
            //获取所有复选框的值
            var checkBoxAll49 = $('#starRate input[name=fraction49]');
            for (var i = 0; i < checkArray49.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll49, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue49 = $(radio).val();
                    if (checkArray49[i] == checkValue49) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h50 = $("#fraction50s").val();
            //拆分
            var checkArray50 = h50.split(",");
            //获取所有复选框的值
            var checkBoxAll50 = $('#starRate input[name=fraction50]');
            for (var i = 0; i < checkArray50.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll50, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue50 = $(radio).val();
                    if (checkArray50[i] == checkValue50) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h51 = $("#fraction51s").val();
            //拆分
            var checkArray51 = h51.split(",");
            //获取所有复选框的值
            var checkBoxAll51 = $('#starRate input[name=fraction51]');
            for (var i = 0; i < checkArray51.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll51, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue51 = $(radio).val();
                    if (checkArray51[i] == checkValue51) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h52 = $("#fraction52s").val();
            //拆分
            var checkArray52 = h52.split(",");
            //获取所有复选框的值
            var checkBoxAll52 = $('#starRate input[name=fraction52]');
            for (var i = 0; i < checkArray52.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll52, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue52 = $(radio).val();
                    if (checkArray52[i] == checkValue52) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h53 = $("#fraction53s").val();
            //拆分
            var checkArray53 = h53.split(",");
            //获取所有复选框的值
            var checkBoxAll53 = $('#starRate input[name=fraction53]');
            for (var i = 0; i < checkArray53.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll53, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue53 = $(radio).val();
                    if (checkArray53[i] == checkValue53) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h54 = $("#fraction54s").val();
            //拆分
            var checkArray54 = h54.split(",");
            //获取所有复选框的值
            var checkBoxAll54 = $('#starRate input[name=fraction54]');
            for (var i = 0; i < checkArray54.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll54, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue54 = $(radio).val();
                    if (checkArray54[i] == checkValue54) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h55 = $("#fraction55s").val();
            //拆分
            var checkArray55 = h55.split(",");
            //获取所有复选框的值
            var checkBoxAll55 = $('#starRate input[name=fraction55]');
            for (var i = 0; i < checkArray55.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll55, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue55 = $(radio).val();
                    if (checkArray55[i] == checkValue55) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h56 = $("#fraction56s").val();
            //拆分
            var checkArray56 = h56.split(",");
            //获取所有复选框的值
            var checkBoxAll56 = $('#starRate input[name=fraction56]');
            for (var i = 0; i < checkArray56.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll56, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue56 = $(radio).val();
                    if (checkArray56[i] == checkValue56) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h57 = $("#fraction57s").val();
            //拆分
            var checkArray57 = h57.split(",");
            //获取所有复选框的值
            var checkBoxAll57 = $('#starRate input[name=fraction57]');
            for (var i = 0; i < checkArray57.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll57, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue57 = $(radio).val();
                    if (checkArray57[i] == checkValue57) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h58 = $("#fraction58s").val();
            //拆分
            var checkArray58 = h58.split(",");
            //获取所有复选框的值
            var checkBoxAll58 = $('#starRate input[name=fraction58]');
            for (var i = 0; i < checkArray58.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll58, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue58 = $(radio).val();
                    if (checkArray58[i] == checkValue58) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h59 = $("#fraction59s").val();
            //拆分
            var checkArray59 = h59.split(",");
            //获取所有复选框的值
            var checkBoxAll59 = $('#starRate input[name=fraction59]');
            for (var i = 0; i < checkArray59.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll59, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue59 = $(radio).val();
                    if (checkArray59[i] == checkValue59) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h60 = $("#fraction60s").val();
            //拆分
            var checkArray60 = h60.split(",");
            //获取所有复选框的值
            var checkBoxAll60 = $('#starRate input[name=fraction60]');
            for (var i = 0; i < checkArray60.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll60, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue60 = $(radio).val();
                    if (checkArray60[i] == checkValue60) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h61 = $("#fraction61s").val();
            //拆分
            var checkArray61 = h61.split(",");
            //获取所有复选框的值
            var checkBoxAll61 = $('#starRate input[name=fraction61]');
            for (var i = 0; i < checkArray61.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll61, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue61 = $(radio).val();
                    if (checkArray61[i] == checkValue61) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h62 = $("#fraction62s").val();
            //拆分
            var checkArray62 = h62.split(",");
            //获取所有复选框的值
            var checkBoxAll62 = $('#starRate input[name=fraction62]');
            for (var i = 0; i < checkArray62.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll62, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue62 = $(radio).val();
                    if (checkArray62[i] == checkValue62) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h63 = $("#fraction63s").val();
            //拆分
            var checkArray63 = h63.split(",");
            //获取所有复选框的值
            var checkBoxAll63 = $('#starRate input[name=fraction63]');
            for (var i = 0; i < checkArray63.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll63, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue63 = $(radio).val();
                    if (checkArray63[i] == checkValue63) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h64 = $("#fraction64s").val();
            //拆分
            var checkArray64 = h64.split(",");
            //获取所有复选框的值
            var checkBoxAll64 = $('#starRate input[name=fraction64]');
            for (var i = 0; i < checkArray64.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll64, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue64 = $(radio).val();
                    if (checkArray64[i] == checkValue64) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h65 = $("#fraction65s").val();
            //拆分
            var checkArray65 = h65.split(",");
            //获取所有复选框的值
            var checkBoxAll65 = $('#starRate input[name=fraction65]');
            for (var i = 0; i < checkArray65.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll65, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue65 = $(radio).val();
                    if (checkArray65[i] == checkValue65) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h66 = $("#fraction66s").val();
            //拆分
            var checkArray66 = h66.split(",");
            //获取所有复选框的值
            var checkBoxAll66 = $('#starRate input[name=fraction66]');
            for (var i = 0; i < checkArray66.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll66, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue66 = $(radio).val();
                    if (checkArray66[i] == checkValue66) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h67 = $("#fraction67s").val();
            //拆分
            var checkArray67 = h67.split(",");
            //获取所有复选框的值
            var checkBoxAll67 = $('#starRate input[name=fraction67]');
            for (var i = 0; i < checkArray67.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll67, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue67 = $(radio).val();
                    if (checkArray67[i] == checkValue67) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h68 = $("#fraction68s").val();
            //拆分
            var checkArray68 = h68.split(",");
            //获取所有复选框的值
            var checkBoxAll68 = $('#starRate input[name=fraction68]');
            for (var i = 0; i < checkArray68.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll68, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue68 = $(radio).val();
                    if (checkArray68[i] == checkValue68) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h69 = $("#fraction69s").val();
            //拆分
            var checkArray69 = h69.split(",");
            //获取所有复选框的值
            var checkBoxAll69 = $('#starRate input[name=fraction69]');
            for (var i = 0; i < checkArray69.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll69, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue69 = $(radio).val();
                    if (checkArray69[i] == checkValue69) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h70 = $("#fraction70s").val();
            //拆分
            var checkArray70 = h70.split(",");
            //获取所有复选框的值
            var checkBoxAll70 = $('#starRate input[name=fraction70]');
            for (var i = 0; i < checkArray70.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll70, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue70 = $(radio).val();
                    if (checkArray70[i] == checkValue70) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h71 = $("#fraction71s").val();
            //拆分
            var checkArray71 = h71.split(",");
            //获取所有复选框的值
            var checkBoxAll71 = $('#starRate input[name=fraction71]');
            for (var i = 0; i < checkArray71.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll71, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue71 = $(radio).val();
                    if (checkArray71[i] == checkValue71) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h72 = $("#fraction72s").val();
            //拆分
            var checkArray72 = h72.split(",");
            //获取所有复选框的值
            var checkBoxAll72 = $('#starRate input[name=fraction72]');
            for (var i = 0; i < checkArray72.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll72, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue72 = $(radio).val();
                    if (checkArray72[i] == checkValue72) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h73 = $("#fraction73s").val();
            //拆分
            var checkArray73 = h73.split(",");
            //获取所有复选框的值
            var checkBoxAll73 = $('#starRate input[name=fraction73]');
            for (var i = 0; i < checkArray73.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll73, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue73 = $(radio).val();
                    if (checkArray73[i] == checkValue73) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h74 = $("#fraction74s").val();
            //拆分
            var checkArray74 = h74.split(",");
            //获取所有复选框的值
            var checkBoxAll74 = $('#starRate input[name=fraction74]');
            for (var i = 0; i < checkArray74.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll74, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue74 = $(radio).val();
                    if (checkArray74[i] == checkValue74) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h75 = $("#fraction75s").val();
            //拆分
            var checkArray75 = h75.split(",");
            //获取所有复选框的值
            var checkBoxAll75 = $('#starRate input[name=fraction75]');
            for (var i = 0; i < checkArray75.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll75, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue75 = $(radio).val();
                    if (checkArray75[i] == checkValue75) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h76 = $("#fraction76s").val();
            //拆分
            var checkArray76 = h76.split(",");
            //获取所有复选框的值
            var checkBoxAll76 = $('#starRate input[name=fraction76]');
            for (var i = 0; i < checkArray76.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll76, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue76 = $(radio).val();
                    if (checkArray76[i] == checkValue76) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h77 = $("#fraction77s").val();
            //拆分
            var checkArray77 = h77.split(",");
            //获取所有复选框的值
            var checkBoxAll77 = $('#starRate input[name=fraction77]');
            for (var i = 0; i < checkArray77.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll77, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue77 = $(radio).val();
                    if (checkArray77[i] == checkValue77) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h78 = $("#fraction78s").val();
            //拆分
            var checkArray78 = h78.split(",");
            //获取所有复选框的值
            var checkBoxAll78 = $('#starRate input[name=fraction78]');
            for (var i = 0; i < checkArray78.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll78, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue78 = $(radio).val();
                    if (checkArray78[i] == checkValue78) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            var h79 = $("#fraction79s").val();
            //拆分
            var checkArray79 = h79.split(",");
            //获取所有复选框的值
            var checkBoxAll79 = $('#starRate input[name=fraction79]');
            for (var i = 0; i < checkArray79.length; i++) {
                //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                $.each(checkBoxAll79, function (j, radio) {
                    //获取复选框的value属性
                    var checkValue79 = $(radio).val();
                    if (checkArray79[i] == checkValue79) {
                        $(radio).attr("checked","checked");
                        $(radio).parent("span").attr("class", "checked");
                    }
                })
            }
            Layout.init();

            $("label").click();
        },

        submitEdit: function () {
            var in09Score = $(".in09").val();
            var in11Score = $(".in11").val();
            var in18Score = $(".in18").val();
            var in21Score = $(".in21").val();
            var in26Score = $(".in26").val();
            var in28Score = $(".in28").val();
            var in32Score = $(".in32").val();
            var in38Score = $(".in38").val();
            var in39Score = $(".in39").val();
            var in40Score = $(".in40").val();
            var in54Score = $(".in54").val();
            var in57Score = $(".in57").val();
            var starClass = $("#starRate select[name=starClass]").val();
            var serviceOrgId = $("#starRate input[name=serviceOrgId]").val();
            var starId = $("#starRate input[name=starId]").val();
            var type = $("#starRate input[name=type]").val();
            var userId = $("#starRate input[name=userId]").val();
            var area = "1";
            var proportRequirements = "1";
            var professionalRequirements = "1";
            var proportion = "1";
            var rehabilitationAreaRequirements = "1";
            var educationalRequirements = "1";
            var occupancyRate = "1";
            var diningAreaRequirements = "1";
            var serviceItems = "1";
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

            totalScore = fraction01Score + fraction02Score + fraction03Score + fraction04Score + fraction05Score
                + fraction06Score + fraction07Score + fraction08Score + fraction09Score + fraction10Score
                + fraction11Score + fraction12Score + fraction13Score + fraction14Score + fraction15Score
                + fraction16Score + fraction17Score + fraction18Score + fraction19Score + fraction20Score
                + fraction21Score + fraction22Score + fraction23Score + fraction24Score + fraction25Score + fraction26Score + fraction27Score
                + fraction28Score + fraction29Score + fraction30Score + fraction31Score + fraction32Score
                + fraction33Score + fraction34Score + fraction35Score + fraction36Score + fraction37Score
                + fraction38Score + fraction39Score + fraction40Score + fraction41Score + fraction42Score + fraction43Score + fraction44Score + fraction45Score + fraction46Score
                + fraction47Score + fraction48Score + fraction49Score + fraction50Score + fraction51Score
                + fraction52Score + fraction53Score + fraction54Score + fraction55Score + fraction56Score
                + fraction57Score + fraction58Score + fraction59Score + fraction60Score + fraction61Score
                + fraction62Score + fraction63Score + fraction64Score + fraction65Score + fraction66Score + fraction67Score
                + fraction68Score + fraction69Score + fraction70Score + fraction71Score + fraction72Score
                + fraction73Score + fraction74Score + fraction75Score + fraction76Score + fraction77Score
                + fraction78Score + fraction79Score;


            $.post(window.apppath + "/admin/api/elderly/updateAssess", {
                starClass: starClass,
                serviceOrgId: serviceOrgId,
                area: area,
                type: type,
                userId: userId,
                listDetail: 1,
                in09Score: in09Score,
                in11Score: in11Score,
                in18Score: in18Score,
                in21Score: in21Score,
                in26Score: in26Score,
                in28Score: in26Score,
                in32Score: in32Score,
                in38Score: in38Score,
                in32Score: in32Score,
                in38Score: in38Score,
                in39Score: in39Score,
                in40Score: in40Score,
                in54Score: in54Score,
                in57Score: in57Score,
                proportRequirements: proportRequirements,
                professionalRequirements: professionalRequirements,
                proportion: proportion,
                rehabilitationAreaRequirements: rehabilitationAreaRequirements,
                educationalRequirements: educationalRequirements,
                occupancyRate: occupancyRate,
                diningAreaRequirements: diningAreaRequirements,
                serviceItems: serviceItems,
                totalScore: totalScore,
                fraction01: fraction01,
                fraction02: fraction02,
                fraction03: fraction03,
                fraction04: fraction04,
                fraction05: fraction05,
                fraction06: fraction06,
                fraction07: fraction07,
                fraction08: fraction08,
                fraction09: fraction09,
                fraction10: fraction10,
                fraction11: fraction11,
                fraction12: fraction12,
                fraction13: fraction13,
                fraction14: fraction14,
                fraction15: fraction15,
                fraction16: fraction16,
                fraction17: fraction17,
                fraction18: fraction18,
                fraction19: fraction19,
                fraction20: fraction20,
                fraction21: fraction21,
                fraction22: fraction22,
                fraction23: fraction23,
                fraction24: fraction24,
                fraction25: fraction25,
                fraction26: fraction26,
                fraction27: fraction27,
                fraction28: fraction28,
                fraction29: fraction29,
                fraction30: fraction30,
                fraction31: fraction31,
                fraction32: fraction32,
                fraction33: fraction33,
                fraction34: fraction34,
                fraction35: fraction35,
                fraction36: fraction36,
                fraction37: fraction37,
                fraction38: fraction38,
                fraction39: fraction39,
                fraction40: fraction40,
                fraction41: fraction41,
                fraction42: fraction42,
                fraction43: fraction43,
                fraction44: fraction44,
                fraction45: fraction45,
                fraction46: fraction46,
                fraction47: fraction47,
                fraction48: fraction48,
                fraction49: fraction49,
                fraction50: fraction50,
                fraction51: fraction51,
                fraction52: fraction52,
                fraction53: fraction53,
                fraction54: fraction54,
                fraction55: fraction55,
                fraction56: fraction56,
                fraction57: fraction57,
                fraction58: fraction58,
                fraction59: fraction59,
                fraction60: fraction60,
                fraction61: fraction61,
                fraction62: fraction62,
                fraction63: fraction63,
                fraction64: fraction64,
                fraction65: fraction65,
                fraction66: fraction66,
                fraction67: fraction67,
                fraction68: fraction68,
                fraction69: fraction69,
                fraction70: fraction70,
                fraction71: fraction71,
                fraction72: fraction72,
                fraction73: fraction73,
                fraction74: fraction74,
                fraction75: fraction75,
                fraction76: fraction76,
                fraction77: fraction77,
                fraction78: fraction78,
                fraction79: fraction79
            }, function (res) {
                if (res.success) {
                    window.location.href = window.apppath + "/admin/serviceOrg/subsidy/infoStarRateAssess/" + starId + "/" + userId;
                } else {

                }
            }, 'json');
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