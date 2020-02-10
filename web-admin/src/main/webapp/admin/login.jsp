<%@ page import="java.util.Date" %><%--
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
    <title>内蒙古市养老服务信息平台</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/style.css?v=2"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/alertStyle.css"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/favicon.ico"/>
    <style>
        body, html {
            width: 100%;
            height: 100%;
        }

        .register {
            display: inline-block;
            margin-left: 4px;
            height: 43px;
            outline: none;
            width: 130px;
            border: none;
            cursor: pointer;
            vertical-align: top;
        <%--background: url(images/login_apply_btn_03.png)no-repeat 0 0/100% 100%;--%>
        }

        .alertModalMes {
            text-align: center;
        }

    </style>
</head>
<body>
<div id="login">
    <div class="login-form-wrap">
        <form class="login-form" action="${pageContext.request.contextPath }/admin/login" method="post"
              onsubmit="return check();" style="top:110px">
            <div style="margin-bottom:10px ">
                <span>用<label style="margin: 0px 7px 0px 7px">户</label>名:</span> <input
                    class="form-control placeholder-no-fix" type="text" autocomplete="off"
                    placeholder="请输入用户名"
                    name="login_name" autofocus="autofocus"/>
            </div>
            <div style="margin-bottom:10px ">
                <span>密<span style="visibility: hidden">密</span><span style="visibility: hidden">密</span>码:</span>
                <input id="pass_word" class="" type="text" id="password" onfocus="this.type='password'"
                       autocomplete="off"
                       placeholder="请输入密码"
                       name="pass_word" autofocus="autofocus"/>
            </div>
            <div style="margin-bottom:10px ">
                <span style="vertical-align: top">验<label style="margin: 0px 7px 0px 7px">证</label>码:</span>
                <input class="" type="text" style="display: inline-block;width: 112px;vertical-align: top"
                       name="codevalidate" autofocus="autofocus"/>
                <img id="codevalidate" src="${pageContext.request.contextPath }/code/<%=new Date().getTime()%>"
                     width="90" height="28" style="margin-left: 10px" onclick="changeUrl()">
            </div>
            <div style="margin-bottom: 0px">
                <input type="submit" value="" autofocus="autofocus" class="login-form_input"/>
                <a class="register" href="${pageContext.request.contextPath }/serviceOrg_apply.html"><img
                        src='${pageContext.request.contextPath }/assets/view/images/login_apply_btn_03.png'
                        style="width:130px;height:43px"></a>
            </div>
            <div style="text-align: right">
                <a href="${pageContext.request.contextPath }/forgetPassword.html" style="cursor: pointer">忘记密码?</a>
            </div>
        </form>
    </div>
</div>
<div id="alertModal" class='alert_wrap' style="display: none">
    <div class="alert_main">
        <div class="alert_wrap_con">
            <div class="alert_head_wrap">
                <h2>提示信息</h2>
                <a href="javascript:void(0)">×</a>
            </div>
            <div class="alert_info_con">
                <img src="${pageContext.request.contextPath }/assets/admin/pages/img/error_03.jpg" alt=""/>
                <p class="alertModalMes">
                </p>
            </div>
            <div class="alert_btm_con">
                <a href="javascript:void(0)" class="confirm  lg_btn">确定</a>
            </div>
        </div>
    </div>
</div>
<div id="confirm" class='alert_wrap' style="display: none">
    <div class="alert_main">
        <div class="alert_wrap_con">
            <div class="alert_head_wrap">
                <h2>确认信息</h2>
                <a href="javascript:void(0)">×</a>
            </div>
            <div class="alert_info_con">

                <img src="${pageContext.request.contextPath }/assets/admin/pages/img/user.png" alt=""/>
                <p style="text-align: center">当前用户在线，是否确认登录？</p>

            </div>
            <div class="alert_btm_con">
                <a href="javascript:void(0)" id="loginBtn" class="loginBtn confirm">确定</a>
                <a href="javascript:void(0)" class="cancel">取消</a>
            </div>
        </div>
    </div>
</div>
<%--<div id="foot_link">--%>
<%--<span>运营单位：南京市12349</span>--%>
<%--<span style="margin-left: 50px">研发单位：南京援通养老服务发展中心</span>--%>
<%--<span style="margin-left: 200px">指导单位：南京市民政局</span>--%>
<%--<span style="margin-left: 50px">南京市居家社区养老服务协会</span>--%>
<%--</div>--%>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/global/plugins/jquery.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/jquery-migrate.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/login.js?v=1"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/scripts/md5.js"
        type="text/javascript"></script>
<script>
    jQuery(document).ready(function () {
        window.apppath = "${pageContext.request.contextPath }";
        if (window.top != window.self) {//存在父页面
            window.parent.location.reload();
        }
        $("body").css({"width": window.innerWidth, "height": window.innerHeight});
        $(".alert_head_wrap a").click(function () {
            $('.alert_wrap').hide();
        });
        $(".alert_wrap .cancel").click(function () {
            $('.alert_wrap').hide();
        });
        Login.init();
        var message = "${requestScope.message_login}";
        if (message != "") {
            Login.alert(message, function () {
                window.location.href = window.apppath + "/admin/login.jsp";
            });
        }
        /*changeUrl();*/
        setInterval(changeUrl, 120000);
    });
    <%--页面缩放时重新绘制--%>
    window.onresize = function () {
        $("body").css({"width": window.innerWidth, "height": window.innerHeight});
    };
    function check() {
        var login_name = $("input[name=login_name]").val();
        var pass_word = $("input[name=pass_word]").val();
        var codevalidate = $("input[name=codevalidate]").val();
        if (login_name == null || login_name == "") {
            Login.alert("请输入用户名");
            s;
            return false;

        } else if (pass_word == null || pass_word == "") {
            Login.alert("请输入密码");
            return false;
        }
        else if (codevalidate == null || codevalidate == "") {
            Login.alert("请输入验证码");
            return false;
        }
        return true;
    }

    function changeUrl() {
        var url = $("#codevalidate").prop('src');
        url = url.substr(0, url.lastIndexOf('/') + 1);
        url = url + (new Date()).valueOf();
        $("#codevalidate").prop('src', url);
    }
    <!--处理键盘事件 禁止后退键（Backspace）密码或单行、多行文本框除外 -->

    function banBackSpace(e){
        var ev = e || window.event;//获取event对象
        var obj = ev.target || ev.srcElement;//获取事件源

        var t = obj.type || obj.getAttribute('type');//获取事件源类型

    //获取作为判断条件的事件类型
        var vReadOnly = obj.getAttribute('readonly');
        var vEnabled = obj.getAttribute('enabled');
    //处理null值情况
        vReadOnly = (vReadOnly == null) ? false : vReadOnly;
        vEnabled = (vEnabled == null) ? true : vEnabled;

    //当敲Backspace键时，事件源类型为密码或单行、多行文本的，
    //并且readonly属性为true或enabled属性为false的，则退格键失效
        var flag1=(ev.keyCode == 8 && (t=="password" || t=="text" || t=="textarea")
            && (vReadOnly==true || vEnabled!=true))?true:false;

    //当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效
        var flag2=(ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea")
            ?true:false;

    //判断
        if(flag2){
            return false;
        }
        if(flag1){
            return false;
        }
    }

    //禁止后退键 作用于Firefox、Opera
    document.οnkeypress=banBackSpace;
    //禁止后退键 作用于IE、Chrome
    document.οnkeydοwn=banBackSpace;


</script>
</body>
</html>