<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/9/8
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>申请组织账号</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/style.css?v=2.4"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/alertStyle.css"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/favicon.ico"/>
    <style>
        body, html {
            width: 100%;
            height: 100%;
        }

        .remove {
            color: red;
            font-size: 17px;
            cursor: pointer;
            text-decoration: none;
        }

        .removeImg {
            z-index: 2;
            width: 10px;
            height: 10px;
            position: absolute;
            right: 0px;
            background-image: url("${pageContext.request.contextPath }/assets/global/img/delete.png");
            background-position: 50% 50%;
        }

        .file-box {
            position: relative;
            z-index: 100;
            width: 65px;
            height: 30px;
            /*border: 1px solid #D9D9D9;*/
            cursor: pointer;
            /*margin-left: 10px\9;*/ /*IE8及以下 */
        }

        .file-box input {
            position: absolute;
            z-index: 1;
            top: 0;
            left: 0;
            width: 100%;
            width: 108% \9; /*IE8及以下 */
            height: 100%;
            opacity: 0;
        }

        .back {
            margin-top: 10px;
            margin-left: 74px;
            color: #3e7ad4;
            font-size: 16px;
            position: relative;
            vertical-align: top;
            cursor: pointer;
            border: 0px;
            width: 118px;
            height: 43px;
            background: url(${pageContext.request.contextPath }/assets/view/images/reg_btn_retun_03.png) no-repeat center;
        }

        .tips {
            padding: 50px 24px 0 24px;
            color: #666666;
            position: absolute;
            line-height: 26px;
            overflow: hidden;
            right: 23px;
            width: 317px;
            height: 414px;
            top: 0;
            background: url(${pageContext.request.contextPath }/assets/view/images/register_tips_03.png) no-repeat center;

        }

        .tips p {
            text-indent: 2em;
        }

        #sendCodeBtn, #sendCodeBtn2 {
            height: 33px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: white;
            vertical-align: top
        }

        .fuwu_show1 {
            position: absolute;
            left: 47px;
            top: 38px;
        }

        .fuwu_show2 {
            position: absolute;
            left: 47px;
            top: 275px;
        }

        #fuwu11 {
            display: block;
        }

        #fuwu22 {
            display: none;
        }

        #fuwu11, #fuwu22 {
            width: 820px;
            height: 506px;
        }

        .register-con input[type=password] {
            color: #666666;
            font-size: 15px;
            padding-left: 4px;
            height: 34px;
            line-height: 34px;
            background: #fff;
            width: 300px;
            outline: none;
            border: 1px solid #DDDDDD;
            border-radius: 2px;
        }

        .need {
            vertical-align: sub;
            color: red;
        }

        .register-con .name {
            width: 5em;
        }

        .file-box {
            position: relative;
            width: 80px;
            height: 80px;
            border: 1px solid #D9D9D9;
            background-image: url("${pageContext.request.contextPath }/assets/admin/pages/img/add.png");
        }

        .file-div {
            width: 80px;
            height: 80px;
            margin-right: 10px;
            display: inline-block;
            position: relative;
            vertical-align: text-bottom;
        }

        .file-div img {
            width: 100%;
            height: 100%;
        }

        .file-box input {
            position: absolute;
            z-index: 1;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
        }

        .file-box-list {
            vertical-align: top;
        }
    </style>
    <script type="text/javascript">
        function fuwu_show1() {
            window.location.href = "/serviceOrg_apply.html";
        }

        function fuwu_show2() {
            window.location.href = "/system_account_apply.html";
        }
    </script>
</head>
<body style="overflow-x: hidden;">
<div id="register">
    <div class="register-warp">
        <img src="${pageContext.request.contextPath }/assets/view/images/reg-title_02.png" class="reg_tit" alt=""/>
        <div class="register-con-wrap" style="padding-bottom: 15px;padding-top:20px;position: relative;">
            <div class="fuwu_show1" onclick="fuwu_show1()"><img
                    src="${pageContext.request.contextPath }/assets/view/images/fuwu_show1.png"></div>
            <div class="register-con">
                <div action="" style=" position: relative;">
                    <div class='tips'>
                        <p id="note1">
                            养老服务组织申请须以具体服务站点为单位，请如实填写服务组织名称，以及所属的行政区、街道，并上传民非登记证书或组织机构代码证等验证材料照片。注册邮箱请按格式正确填写，
                            申请成功后用户名及密码将在3个工作日内发送至所填邮箱，请服务组织注意查收。服务组织使用本平台时，必须严格遵守国家关于网络信息安全保护的相关法律规定，不得向任何第三方泄露平台数据，确保平台个人电子信息及各类服务数据的安全，造成平台及个人权益受侵害的，依法承担法律责任。</p>
                    </div>
                    <!-- 服务组织账号申请 -->
                    <div id="fuwu11">

                        <label class="two_list" style="display: none">
                        <span class="name">城市
                             <span class="need"> *
                        </span>
                        </span>
                            <input type="hidden" id="province" value="0">
                            <select name="city" id="city"
                                    onChange="EographicArea.changeCity();"
                                    readonly="readonly" style="width: 112px;">
                                <option value="1">内蒙古市</option>
                            </select>
                        </label>
                        <label class="two_list">
                        <span class="name">行政区
                         <span class="need"> *
                        </span></span>

                            <select name="area" id="county"
                                    onChange="EographicArea.changeCounty();"
                                    readonly="readonly" style="width: 120px;">
                                <option value="">行政区，市，县</option>
                            </select>
                        </label>
                        <label class="two_list">
                            <span class="name">街道
                             <span class="need"> *</span>
                            </span>

                            <select name="street" id="town"
                                    onChange="EographicArea.changeTown();"
                                    readonly="readonly" style="width: 120px;">
                                <option value="">街道，乡，镇</option>
                            </select>
                        </label>
                        <label style="clear: both;">
                            <span class="name">社区</span>
                            <select name="village" id="village"
                                    onChange="EographicArea.changeVillage();"
                                    readonly="readonly" style="width: 300px;">
                                <option value="">社区，村</option>
                            </select>
                        </label>
                        <label>
                            <span class="name">组织名称
                                                         <span class="need"> *</span>
                            </span>

                            <input type="text" id="serviceName">
                        </label>
                        <div>
                             <span class="name">组织类型
                                                         <span class="need"> *</span>
                            </span>
                            <div style="display: inline-block;vertical-align: top;width: 320px;">
                                <span style="display: inline-block;width: 160px;font-size:12px;">
                                     <input type="radio"
                                            name="institutionTypeDictId"
                                            value="1"
                                            style='margin: 0 5px;vertical-align: middle;'
                                     />区域性居家养老服务中心
                                </span>
                                <span style="display: inline-block;width: 150px;font-size:12px;">
                                     <input type="radio"
                                            name="institutionTypeDictId"
                                            value="2"
                                            style='margin: 0 5px;vertical-align: middle;'
                                     />社区养老服务站
                                </span>

                                <span style="display: inline-block;width: 150px;font-size:12px;">
                                        <input type="radio" style='margin: 0 5px;vertical-align: middle;'
                                               name="institutionTypeDictId"
                                               value="3"
                                        />养老机构
                                </span>

                            </div>
                        </div>
                        <div>
                             <span class="name"> 验证材料
                                    <span class="need"> *
                                </span>
                            </span>
                            <div style="display: inline-block">
                                <div class="file-box-list attachInput"
                                     style="display: inline-block;margin: 0px"></div>
                                <div style="display: inline-block" class="file-box">
                                    <input type="file" name="attach" id="attachInput"
                                           onchange="UploadFile('serviceOrg/subsidy/apply/attach','attachInput','attach')"
                                           style="opacity: 0;">
                                    <input type="hidden" id="attach">
                                </div>
                            </div>
                        </div>
                        <label class='two_list'>
                            <span class="name">申请人
                            <span class="need"> *
                        </span></span>

                            <input type="text" id="applyName">
                        </label>
                        <label class='two_list'>
                            <span class="name">固话</span>

                            <input type="text" id="phone" style="width:100px;">
                        </label>

                        <label class='two_list' style='clear:left'>
                            <span class="name">身份证号
                            <span class="need"> *
                        </span></span>

                            <input type="email" id="applyIdcardNo" style="width: 300px">
                        </label>

                        <label class='two_list' style='clear:left'>
                            <span class="name">联系邮箱
                            <span class="need"> *
                        </span></span>

                            <input type="email" id="email" style="width: 300px">
                        </label>
                        <div style='clear:both'>
                            <span class="name">手机
                            <span class="need"> *
                        </span></span>

                            <input type="text" id="mobile" style="width: 120px">
                            <input type="text" name="identifyCode" id="identifyCode"
                                   placeholder="验证码" style="width: 95px">
                            <button id="sendCodeBtn" type="button" style="cursor: pointer" onclick="sendCode();">获取验证码
                            </button>
                        </div>
                        <span style="display: inline-block;width: 450px;font-size:12px;">
                                 <input type="checkbox"
                                        name="readandsubmit" id="readandsubmit" value="1"
                                        style='margin: 0 5px;vertical-align: middle;'/>
                        <a href="#">我已阅读《申请须知》并遵守相关规定</a>
                    </span>
                        <div style='clear:both'><span style="visibility: hidden">用户名</span>
                            <input id="apply" type="button" class="submit instantly_submit" value=""/>
                            <button class="back" onclick="window.location.href='/admin/login.jsp'"></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="alertModal" class='alert_wrap' style="display: none;">
        <div class="alert_main">
            <div class="alert_wrap_con">
                <div class="alert_head_wrap">
                    <h2>提示信息</h2>
                    <a class="cancel" href="javascript:void(0)">×</a>
                </div>
                <div class="alert_info_con">
                    <p style="text-align: center;margin: 25px;font-size: 22px" class="alertModalMes">
                    </p>
                </div>
                <div class="alert_btm_con">
                    <a href="javascript:void(0)" class="confirm lg_btn">确定</a>
                </div>
            </div>
        </div>
    </div>

    <div id="successModal" class='alert_wrap' style="display: none;" class='alert_wrap'>
        <div class="alert_main">
            <div class="alert_wrap_con">
                <div class="alert_head_wrap">
                    <h2>提交成功</h2>
                    <a class="cancel" href="javascript:void(0)">×</a>
                </div>
                <div class="alert_info_con">
                    <img src="${pageContext.request.contextPath }/assets/admin/pages/img/success.png" alt=""/>
                    <p style="text-align: center">提交成功</p>
                </div>
                <div class="alert_btm_con">
                    <a href="javascript:void(0)" class="confirm lg_btn">确定</a>
                </div>
            </div>
        </div>
    </div>


    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/view/js/jquery-1.9.1.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js?v=1.7"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js"></script>

    <script>
        $(function () {
            $("body").css({"width": window.innerWidth, "height": window.innerHeight});
            window.apppath = "${pageContext.request.contextPath }";
            EographicArea.init();
            EographicArea.changeCity();
            $("#apply").click(function () {
                var obj1 = document.getElementsByName("institutionTypeDictId");
                var institutionTypeDictId = '';
                for (var i = 0; i < obj1.length; i++) {
                    if (obj1[i].checked) {
                        institutionTypeDictId += obj1[i].value + ',';
                    }
                }
                if (institutionTypeDictId.length > 1)
                    institutionTypeDictId = institutionTypeDictId.substr(0, institutionTypeDictId.length - 1);

                var attach = "";
                $(".remove").each(function () {
                    attach += $(this).attr("data") + ",";
                })
                if (attach.length > 1)
                    attach = attach.substr(0, attach.length - 1);

                var areaOrder = getAreaOrder(EographicArea.getPosition2());
                if (check()) {
                    var type = 1;
                    if (institutionTypeDictId == "3") {
                        type = 2;
                    }
                    //申请组织
                    $.post(window.apppath + "/view/api/serviceOrg/apply", {
                        areaId: EographicArea.getSelectId(),
                        areaName: EographicArea.getPosition2(),
                        institutionName: $("#serviceName").val(),
                        applyName: $("#applyName").val(),
                        applyIdcardNo:$("#applyIdcardNo").val(),
                        applyEmail: $("#email").val(),
                        attach: attach,
                        zipcode: EographicArea.getAreaCode(),
                        institutionTypeDictId: institutionTypeDictId,
                        phone: $("#phone").val(),
                        mobile: $("#mobile").val(),
                        status: 0,
                        type: type,
                        areaOrder: areaOrder
                    }, function (res) {
                        if (res.success) {
                            alertSuccess(res.message, function () {
                                window.history.back(-1);
                            });
                        }
                        else {
                            alert(res.message);
                        }
                    }, 'json');
                }
            });

        });

        function UploadFile(path, id, name) {
            var fileName = $("#" + id).val();
            if (fileName == null || fileName == "") {
                return false;
            }
            if (!(/\.(jpe?g|gif|png|ico)$/i).test(fileName)) {
                alert("请上传图片格式（jpe|jpeg|jpg|gif|png|ico）");
                $("#" + id).val("");
                return false;
            }
            $.ajaxFileUpload({
                url: window.apppath + "/file/upload?path=serviceOrg&createThumbnail=true&thumbnailWidth=80&thumbnailHeight=80",
                secureuri: false,
                fileElementId: id,//file控件id
                dataType: 'json',
                success: function (data, status) {
                    if (data.error == 0) {

                        fileName = fileName.substr(fileName.lastIndexOf("\\") + 1, fileName.length - 1);
                        var html = "";
                        if (!(/\.(jpe?g|gif|png|ico)$/i).test(fileName)) {
                            html = "<label class='uploadFile' style='margin: 0px;    vertical-align: top'>" + fileName + "<a style='text-decoration: none,display: none' data='" + data.url + "' class='remove removeFile'>&times;</a></label>"
                        }
                        else {
                            var path = data.url.substr(0, data.url.lastIndexOf(".")) + "_80_80" + data.url.substr(data.url.lastIndexOf("."))
                            html = "<div class='file-div''><img class='uploadImg' src='" + window.apppath + path + "'><a style='text-decoration: none;display: none' data='" + data.url + "' class=' remove removeImg'></a></div>"
                        }
                        $("." + id + "").append(html);
                        $(".remove").click(function () {
                            var url = $(this).attr("data");
                            $(this).parent().remove();
                            var urls = $("#" + name).val();
                            urls = urls.replace(url + ",", "")
                            $("#" + name).val(urls);
                        });
                        $(".uploadImg").hover(function () {
                            $(this).parent().find(".remove").css("display", "inherit");
                        })
                        $(".uploadFile").hover(function () {
                            $(this).parent().find(".remove").css("display", "inherit");
                        })
                        $(".remove").hover(function () {
                        }, function () {
                            $(this).hide();
                        })
                        $("#" + id).val("");
                        $("#" + name).val($("#" + name).val() + data.url + ",");
                    }
                }
            });
        }


        function sendCode() {
            var mobile = $("#mobile").val();
            if (mobile == null || mobile == "") {
                alert("请填写手机号码");
                return false;
            }
            else if (mobile != null && mobile != "" && !isMoblie(mobile)) {
                alert("请填写正确的手机号码");
                return false;
            }
            var code = randomString(4);
            $.post(window.apppath + "/api/sendVerificationCode", {
                phone: mobile,
                num: code
            }, function (res) {
                console.log(res);
                if (res.success) {
                    document.cookie = "verificationCode=" + code;
                    $("#sendCodeBtn").attr("disabled", "disabled");
                    var n = 120;
                    var interval = setInterval(function () {
                        $("#sendCodeBtn").html(--n + "s");
                        if (n == 0) {
                            clearInterval(interval);
                            $("#sendCodeBtn").removeAttr("disabled");
                            $("#sendCodeBtn").html("获取验证码");
                        }
                    }, 1000)

                } else {
                    alert(res.message);
                    return false;
                }
            }, 'json');
        }


        function randomString(len) {
            len = len || 32;
            var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';
            /****默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1****/
            var maxPos = $chars.length;
            var pwd = '';
            for (i = 0; i < len; i++) {
                pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
            }
            return pwd;
        }

        function check() {
            var serviceName = $("#serviceName").val();
            var areaId = EographicArea.getSelectId();
            var applyName = $("#applyName").val();
            var obj1 = document.getElementsByName("institutionTypeDictId");
            var flag1 = false;
            for (var i = 0; i < obj1.length; i++) {
                if (obj1[i].checked) {
                    flag1 = true;
                }
            }
            // 同意复选框选中
            var flag2 = $("#readandsubmit").prop("checked");
            var email = $("#email").val().trim();
            var phone = $("#phone").val().trim();
            var mobile = $("#mobile").val().trim();
            var applyIdcardNo=$("#applyIdcardNo").val();
            var identifyCode = ($("input[name=identifyCode]").val()).trim();
            var code = getCookie("verificationCode");
            var attach = "";
            $(".remove").each(function () {
                attach += $(this).attr("data") + ",";
            });
            if (attach.length > 1)
                attach = attach.substr(0, attach.length - 1);
            if (areaId == 0) {
                alert("请选择区域");
                return false;
            }
            else if (serviceName == null || serviceName == "") {
                alert("请填写组织名称");
                return false;
            }
            else if (!flag1) {
                alert("请选择组织类型");
                return false;
            }
            else if (attach == null || attach == "") {
                alert("请上传相关材料");
                return false;
            }
            else if (applyName == null || applyName == "") {
                alert("请填写申请人");
                return false;
            }
            else if (email == null || email == "" || !isEmail(email)) {
                alert("请填写正确的联系邮箱");
                return false;
            }
            else if (phone != null && phone != "" && !isPhone(phone)) {
                alert("请填写正确的固话");
                return false;
            } else if (mobile == null || mobile == "") {
                alert("请填写手机号码");
                return false;
            }
            else if (mobile != null && mobile != "" && !isMoblie(mobile)) {
                alert("请填写正确的手机号码");
                return false;
            }else if (applyIdcardNo == null || applyIdcardNo == "" || !isIdCardNo(applyIdcardNo)){
                alert("请填写正确的身份证号码");
                return false;
            }
            if (identifyCode == null || identifyCode == "") {
                alert("请输入验证码");
                return false;
            }
            if (code != identifyCode) {
                alert("验证码不正确");
                return false;
            } else if (!flag2) {
                alert("您必须同意才可以注册！");
                return false;
            }
            return true;
        }


        //增加身份证验证
        function isIdCardNo(num) {
            console.log("111");
            var factorArr = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1);
            var parityBit = new Array("1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2");
            var varArray = new Array();
            var intValue;
            var lngProduct = 0;
            var intCheckDigit;
            var intStrLen = num.length;
            var idNumber = num;
            // initialize
            if ((intStrLen != 15) && (intStrLen != 18)) {
                return false;
            }
            // check and set value
            for (i = 0; i < intStrLen; i++) {
                varArray[i] = idNumber.charAt(i);
                if ((varArray[i] < '0' || varArray[i] > '9') && (i != 17)) {
                    return false;
                } else if (i < 17) {
                    varArray[i] = varArray[i] * factorArr[i];
                }
            }

            if (intStrLen == 18) {
                //check date
                var date8 = idNumber.substring(6, 14);
                if (isDate8(date8) == false) {
                    return false;
                }
                // calculate the sum of the products
                for (i = 0; i < 17; i++) {
                    lngProduct = lngProduct + varArray[i];
                }
                // calculate the check digit
                intCheckDigit = parityBit[lngProduct % 11];
                // check last digit
                if (varArray[17] != intCheckDigit) {
                    return false;
                }
            }
            else {        //length is 15
                //check date
                var date6 = idNumber.substring(6, 12);
                if (isDate6(date6) == false) {
                    return false;
                }
            }
            return true;
        }

        function isDate6(sDate) {
            if (!/^[0-9]{6}$/.test(sDate)) {
                return false;
            }
            var year, month, day;
            year = sDate.substring(0, 4);
            month = sDate.substring(4, 6);
            if (year < 1700 || year > 2500) return false
            if (month < 1 || month > 12) return false
            return true
        }

        function isDate8(sDate) {
            if (!/^[0-9]{8}$/.test(sDate)) {
                return false;
            }
            var year, month, day;
            year = sDate.substring(0, 4);
            month = sDate.substring(4, 6);
            day = sDate.substring(6, 8);
            var iaMonthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
            if (year < 1700 || year > 2500) return false
            if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) iaMonthDays[1] = 29;
            if (month < 1 || month > 12) return false
            if (day < 1 || day > iaMonthDays[month - 1]) return false
            return true
        }




        //    姑且把邮箱地址分成“第一部分@第二部分”这样
        //    第一部分：由字母、数字、下划线、短线“-”、点号“.”组成，
        //    第二部分：为一个域名，域名由字母、数字、短线“-”、域名后缀组成，
        //    而域名后缀一般为.xxx或.xxx.xx，一区的域名后缀一般为2-4位，如cn,com,net，现在域名有的也会大于4位
        function isEmail(str) {
            var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
            return reg.test(str);
        }

        //区号+号码，区号以0开头，3位或4位
        //号码由7位或8位数字组成
        //区号与号码之间可以无连接符，也可以“-”连接
        function isPhone(str) {
            /*var reg = /^0\d{2,3}-?\d{7,8}$/;*/
            var reg = /^\d{7,8}$/;
            return reg.test(str);
        }

        //11位数字，以1开头
        function isMoblie(str) {
            var reg = /^1\d{10}$/;
            return reg.test(str);
        }

        function alertSuccess(res, callback) {
            $("#successModal").show();
            $("#successModal .confirm").unbind('click').click(function () {
                $("#successModal").hide();
                callback();
            })

            $("#successModal .cancel").unbind('click').click(function () {
                $("#successModal").hide()
            })
        }

        function alert(res, callback) {
            $("#alertModal .alertModalMes").html(res);
            $("#alertModal").show();
            $("#alertModal .confirm").unbind('click').click(function () {
                $("#alertModal").hide()
                callback();
            })

            $("#alertModal .cancel").unbind('click').click(function () {
                $("#alertModal").hide()
            })
        }

        function getCookie(name) {
            var strCookie = document.cookie;
            //将多cookie切割为多个名/值对
            var arrCookie = strCookie.split("; ");
            var value;
            //遍历cookie数组，处理每个cookie对
            for (var i = 0; i < arrCookie.length; i++) {
                var arr = arrCookie[i].split("=");
                //找到名称为userId的cookie，并返回它的值
                if (name == arr[0]) {
                    value = arr[1];
                    break;
                }
            }
            return value;
        }

    </script>
</body>
</html>