var layer;
var laydate;
layui.use('layer', function () {
    layer = layui.layer;
});
layui.use('element', function () {
    var $ = layui.jquery
        , element = layui.element;
});
var thisIndex = 0;
$("#rightClick").click(function () {
    thisIndex = thisIndex + 100;
    $(".layui-tab-title").scrollLeft(thisIndex);
    if (thisIndex >= $(".layui-tab-title").scrollLeft()) {
        thisIndex = $(".layui-tab-title").scrollLeft();
    }
});
$("#leftClick").click(function () {
    thisIndex = thisIndex - 100;
    $(".layui-tab-title").scrollLeft(thisIndex);
    if (thisIndex <= $(".layui-tab-title").scrollLeft()) {
        thisIndex = $(".layui-tab-title").scrollLeft();
    }
});
$(function () {
    $.ajax({
        url: "/admin/serviceOrg/ConsoleManager/findTowerCourtyardNumByServiceOrgId",
        type: "JSON",
        success: function (data) {
            data = JSON.parse(data);
            for (var i = 0; i < data.length; i++) {
                var newLi = "<li>" + data[i] + "</li>";
                $(".layui-tab-title").append(newLi);
            }
            $(".layui-tab-title li:first-of-type").addClass('layui-this').trigger('click');
        }
    });

    /*window.onload = function () {
        $(".layui-tab-title li:first-of-type").trigger('click');
    };*/
});
$(".layui-tab-title").on('click', 'li', function () {
    $(".xiangQing div,.xinXi p,.xinXi ul").remove();
    var tapClick = $(this).text();
    $.ajax({
        url: "/admin/serviceOrg/ConsoleManager/findOldManAndbedRoomByTowerCourtyardNum?towerCourtyardNum=" + tapClick,
        type: "JSON",
        success: function (data) {
            data = JSON.parse(JSON.parse(JSON.stringify(data)));
            var bedNull = 0;
            var newXinXi = "<p>" + tapClick + "信息</p>" +
                "<ul>" +
                "<li>房间数：</li>" +
                "<li><span>" + data.rooms + "</span>间</li>" +
                "<li>床位数：</li>" +
                "<li><span>" + data.bedNum + "</span>张</li>" +
                "<li>老人数：</li>" +
                "<li><span>" + data.checkInElderNum + "</span>位</li>" +
                "<li>空余床位：</li>" +
                "<li><span class='bedNull'></span>张</li>" +
                "</ul>";
            $(".xinXi").append(newXinXi);
            for (var i = 0; i < data.floor.length; i++) {
                var newXiangQing = "<div><ul></ul></div>";
                $(".xiangQing").append(newXiangQing);
                for (var y = 0; y < data.floor[i].length; y++) {
                    bedNull += data[data.floor[i][y]];
                    $(".bedNull").html(bedNull);
                    var newLi = "<li><span class='roomId'>" + data[data.floor[i][y]] + "</span><br/><span>" + data.floor[i][y] + "</span></li>";
                    $(".xiangQing").find("div:nth-of-type(" + (i + 1) + ") ul").append(newLi);
                }
            }
        }
    })
});
$(document).on('click', '.roomId', function () {
    $("#right_ul li").remove();
    $("#right_type ul").remove();
    var roomId = $(this).parent().find('span:last-of-type').text();
    roomAjax(roomId);
});
$("#right_p button").click(function () {
    $("#right_ul li").remove();
    $("#right_type ul").remove();
    var roomId = $("#right_p input").val();
    roomAjax(roomId);
});
function roomAjax(roomId) {
    $.ajax({
        url: "/admin/serviceOrg/ConsoleManager/findElderAndRoomNumByroomNum?roomNum=" + roomId,
        type: "JSON",
        success: function (data) {
            data = JSON.parse(data);
            layer.msg(data.message);
            if(data.message == "查询异常") $("#right_p span").html("");
            else $("#right_p span").html(roomId);
            var auxiliaryFacilities = [];  //辅助用房设施
            var auxiliaryFacilitiesText = [];  //辅助用房设施
            if (data.data.auxiliaryFacilities != null) {
                auxiliaryFacilities = data.data.auxiliaryFacilities.split(",");
                for (var i = 0; i < auxiliaryFacilities.length; i++) {
                    if (auxiliaryFacilities[i] == 1) auxiliaryFacilitiesText.push("卫生间");
                    else if (auxiliaryFacilities[i] == 2) auxiliaryFacilitiesText.push("厨房");
                    else if (auxiliaryFacilities[i] == 3) auxiliaryFacilitiesText.push("客厅");
                    else if (auxiliaryFacilities[i] == 4) auxiliaryFacilitiesText.push("阳台");
                }
            }
            var roomEquipment = []; //设备
            var roomEquipmentText = []; //设备
            if (data.data.roomEquipment != null) {
                roomEquipment = data.data.roomEquipment.split(",");
                for (var i = 0; i < roomEquipment.length; i++) {
                    if (roomEquipment[i] == 1) roomEquipmentText.push("呼叫器");
                    else if (roomEquipment[i] == 2) roomEquipmentText.push("床头灯");
                    else if (roomEquipment[i] == 3) roomEquipmentText.push("电视机");
                    else if (roomEquipment[i] == 4) roomEquipmentText.push("电风扇");
                    else if (roomEquipment[i] == 5) roomEquipmentText.push("暖气");
                    else if (roomEquipment[i] == 6) roomEquipmentText.push("空调");
                    else if (roomEquipment[i] == 7) roomEquipmentText.push("电冰箱");
                    else if (roomEquipment[i] == 8) roomEquipmentText.push("电话");
                    else if (roomEquipment[i] == 9) roomEquipmentText.push("洗衣机");
                    else if (roomEquipment[i] == 10) roomEquipmentText.push("电脑");
                    else if (roomEquipment[i] == 11) roomEquipmentText.push("网络");
                    else if (roomEquipment[i] == 12) roomEquipmentText.push("其他");
                }
            }
            var roomType = data.data.roomType; //房间类型
            var orientation = data.data.orientation; //朝向
            if (orientation == 1) orientation = "朝东";
            else if (orientation == 2) orientation = "朝南";
            else if (orientation == 3) orientation = "朝西";
            else if (orientation == 4) orientation = "朝北";
            if (roomType == 1) roomType = "自理老人房间";
            else if (roomType == 2) roomType = "半自理或完全不能自理老人房间";
            var rightUl = "<li>房间类型：<span>" + roomType + "</span></li>" +
                "<li>朝向：<span>" + orientation + "</span></li>" +
                "<li>房间面积：<span>" + data.data.roomArea + "</span></li>" +
                "<li>辅助用房设施：<span>" + auxiliaryFacilitiesText + "</span></li>" +
                "<li>其他辅助用房设施：<span>" + data.data.elseAuxiliaryFacilities + "</span></li>" +
                "<li>房间设备：<span>" + roomEquipmentText + "</span></li>";
            $("#right_ul").append(rightUl);
            var sexDictId; //性别
            var selfcareAbility; //人员自理能力
            var linkName; //联系人
            var linkTel; //联系电话
            for (var i = 0; i < data.data.elderlyMsgs.length; i++) {
                var elderTypeDictIds = []; //人员类别
                var elderTypeDictIdsText = []; //人员类别
                sexDictId = data.data.elderlyMsgs[i].sexDictId;
                if (sexDictId == 1) sexDictId = "男";
                else if (sexDictId == 2) sexDictId = "女";
                selfcareAbility = data.data.elderlyMsgs[i].selfcareAbility;
                if (selfcareAbility == 0) selfcareAbility = "失能";
                else if (selfcareAbility == 1) selfcareAbility = "半失能";
                else if (selfcareAbility == 2) selfcareAbility = "自理";
                linkName = data.data.elderlyMsgs[i].linkName;
                if (linkName == null) linkName = "";
                linkTel = data.data.elderlyMsgs[i].linkTel;
                if (linkTel == null) linkTel = "";
                console.log(data.data.elderlyMsgs[i].elderTypeDictIds);
                if (data.data.elderlyMsgs[i].elderTypeDictIds != null) {
                    elderTypeDictIds = data.data.elderlyMsgs[i].elderTypeDictIds.split(",")
                    for (var y = 0; y < elderTypeDictIds.length; y++) {
                        if (elderTypeDictIds[y] == 1) elderTypeDictIdsText.push("城市三无/农村五保");
                        else if (elderTypeDictIds[y] == 2) elderTypeDictIdsText.push("低保/低保边缘");
                        else if (elderTypeDictIds[y] == 3) elderTypeDictIdsText.push("经济困难的失能/半失能老人");
                        else if (elderTypeDictIds[y] == 4) elderTypeDictIdsText.push("70周岁及以上的计生特扶老人");
                        else if (elderTypeDictIds[y] == 5) elderTypeDictIdsText.push("百岁老人");
                        else if (elderTypeDictIds[y] == 6) elderTypeDictIdsText.push("空巢");
                        else if (elderTypeDictIds[y] == 7) elderTypeDictIdsText.push("独居");
                        //alert(elderTypeDictIds[i]+elderTypeDictIdsText)
                    }
                }
                var newUl = "<ul>" +
                    "<li style='display: none'>" + data.data.elderlyMsgs[i].idcardno + "</li>" +
                    "<li class=right_type_key>床位编号：</li>" +
                    "<li>" + data.data.elderlyMsgs[i].bedNumber + "</li>" +
                    "<li class=right_type_key>姓名：</li>" +
                    "<li>" + data.data.elderlyMsgs[i].elderName + "</li>" +
                    "<li class=right_type_key>性别：</li>" +
                    "<li>" + sexDictId + "</li>" +
                    "<br/>" +
                    "<li class=right_type_key>年龄：</li>" +
                    "<li>" + data.data.elderlyMsgs[i].age + "</li>" +
                    "<li class=right_type_key>人员类别：</li>" +
                    "<li><input value='" + elderTypeDictIdsText + "'></li>" +
                    "<li class=right_type_key>生活自理能力：</li>" +
                    "<li>" + selfcareAbility + "</li>" +
                    "<br/>" +
                    "<li class=right_type_key>入院时间：</li>" +
                    "<li>" + data.data.elderlyMsgs[i].checkInTime + "</li>" +
                    "<li class=right_type_key>联系人：</li>" +
                    "<li>" + linkName + "</li>" +
                    "<li class=right_type_key>联系电话：</li>" +
                    "<li>" + linkTel + "</li>" +
                    "<br/>" +
                    "<li class=right_type_key>现病史：</li>" +
                    "<li>" + data.data.elderlyMsgs[i].otherSlow + "</li>" +
                    "<li style='display: none'>" + data.data.elderlyMsgs[i].id + "</li>" +
                    "<p class=touX><img style='width: 100%;height: 100%' src="+data.data.elderlyMsgs[i].photo+"></p>" +
                    "<p class=clickT><span> 基本信息</span><span>出院</span></p>" +
                    "</ul>";
                $("#right_type").append(newUl);
            }
            var bedKong = data.data.bedNum - data.data.elderlyMsgs.length;
            for (var i = 0; i < data.data.leisureBedNumber.length; i++) {
                var newUl = "<ul>" +
                    "<li class=right_type_key>床位编号：</li><li>"+data.data.leisureBedNumber[i]+"</li>" +
                    "<li class=right_type_key>姓名：</li><li></li>" +
                    "<li class=right_type_key>性别：</li><li></li>" +
                    "<br/>" +
                    "<li class=right_type_key>年龄：</li><li></li>" +
                    "<li class=right_type_key>人员类别：</li><li></li>" +
                    "<li class=right_type_key>失能状况：</li><li></li>" +
                    "<br/>" +
                    "<li class=right_type_key>入院时间：</li><li></li>" +
                    "<li class=right_type_key>联系人：</li><li></li>" +
                    "<li class=right_type_key>联系电话：</li><li></li>" +
                    "<br/>" +
                    "<li class=right_type_key>现病史：</li><li></li>" +
                    "<p class=touX layui-icon layui-icon-friends></p>" +
                    "<p class=clickZ><span> 入住</span></p>" +
                    "</ul>";
                $("#right_type").append(newUl);
            }
        }
    });
}
//基本信息
$(document).on('click','.clickT span:first-of-type',function () {
    var oldId = $(this).parent().parent().find("li:last-of-type").text();
    layer.open({
        type: 2,
        title:false,
        closeBtn:false,
        shadeClose: true,
        shade: 0.8,
        area: ['100%', '100%'],
        content: '/admin/elderly/update/'+oldId+'?method=edit',
        success: function(layero, index){
            var body = layer.getChildFrame('body', index);
            var iframeWin = window[layero.find('iframe')[0]['name']];
            body.find('.back').click(function () {
                layer.closeAll();
            })
        }
    });
});
//出院
$(document).on('click','.clickT span:nth-of-type(2)',function () {
    var oldId = $(this).parent().parent().find("li:last-of-type").text();
    var idCardNo = $(this).parent().parent().find("li:first-of-type").text();
    layer.open({
        type: 2,
        title:false,
        closeBtn:false,
        shadeClose: true,
        shade: 0.8,
        area: ['100%', '100%'],
        content: '/admin/institution/elderly/add2',
        success: function(layero, index){
            var body = layer.getChildFrame('body', index);
            var iframeWin = window[layero.find('iframe')[0]['name']];
            body.find('#idcardno').val(idCardNo).attr("readonly","readonly");
            body.find('.search').click();
            body.find('.btn-default').click(function () {
                layer.closeAll();
            });
            body.find('.addGovBuy').click(function () {
                layer.closeAll();

                layer.msg("保存成功")
            })

        }
    });
});
//老人入住
$(document).on('click','.clickZ span:first-of-type',function () {
    var bedNum = $(this).parent().parent().find("li:nth-of-type(2)").text();
    var roomId = $(this).parent().parent().parent().parent().parent().find("#right_p span").text();
    layer.open({
        type: 2,
        title:false,
        closeBtn:false,
        shadeClose: true,
        shade: 0.8,
        area: ['100%', '100%'],
        content: '/admin/institution/elderly/add1',
        success: function(layero, index){
            var body = layer.getChildFrame('body', index);
            var iframeWin = window[layero.find('iframe')[0]['name']];
            body.find('#roomNum').val(roomId).attr("readonly","readonly");
            body.find('#bedInfo').val("空闲");
            body.find('#bedNumber').val(bedNum);
            body.find('.back').click(function () {
                layer.closeAll();
            });
            body.find('.baoCun').click(function () {
                layer.closeAll();
                layer.msg("保存成功")
            })

        }
    });
});