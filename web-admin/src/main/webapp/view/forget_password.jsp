<%--
  Created by IntelliJ IDEA.
  User: MaiBenBen
  Date: 2017/4/10
  Time: 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <title>忘记密码</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/style.css?v=1"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/alertStyle.css"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/favicon.ico"/>
    <style>
        body, html {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        .register-con-wrap {
            background: #fff url('${pageContext.request.contextPath }/assets/view/images/forget_password_03.jpg') no-repeat center right;
            -webkit-background-size: contain;
            -o-background-size: contain;
            background-size: contain;
            height: 472px;
        }

        .forget_password_tit {
            color: #1F97D8;
            font-size: 18px;
        }

        .register-con label {
            margin-bottom: 20px;
        }

        .register-con label span {
            display: inline-block;
            width: 100px;
            margin-right: 10px;
            text-align: right;
        }

        .register-con input[type=button] {
            background: #1B97D8;
            color: #fff;
            width: 300px;
            text-align: center;
            font-size: 16px;
        }

        .getYzm {
            display: inline-block;
            width: 140px;
            text-align: center;
            background: #7F7F7F;
            color: #fff;
            height: 34px;
            line-height: 34px;
            vertical-align: top;
            margin-left: 10px;
        }

        .getYzm:hover {
            color: #1F97D8;
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
    </style>
</head>
<body>
<div id="register">
    <div class="register-warp">
        <img src="${pageContext.request.contextPath }/assets/view/images/reg-title_02.png" class="reg_tit" alt=""/>
        <div class="register-con-wrap">
            <div class="register-con" style="margin-left: 50px;margin-top: 20px">
                <h2 class="forget_password_tit">忘记密码</h2>
                <form action="" style="margin-top: 30px">
                    <label>
                        <span>账号名称</span><input name="login_name" type="text"/>
                    </label>
                    <label>
                        <span>手机号码</span><input name="phone" type="text"/>
                    </label>
                    <label>
                        <span>验证码</span><input name="codevalidate" type="text" style="width: 150px"/><a class="getYzm"
                                                                                                        style="cursor: pointer">
                        获取验证码</a>
                    </label>
                    <label>
                        <span>输入新密码</span><input name="new_password" type="password"/>
                    </label>
                    <label>
                        <span>确认新密码</span><input name="new_password2" type="password"/>
                    </label>
                    <label>
                        <input id="submit" type="button" value="提交" style="width: 150px;margin-left: 50px;margin-right: 50px"/>
                        <input onclick="history.go(-1)" type="button" style="width: 150px" value="返回" style=""/>
                    </label>
                </form>

            </div>
        </div>
    </div>
</div>
<!--底部链接 star-->
<div id="foot_link">
    <span>运营单位：南京市12349</span>
    <span style="margin-left: 50px">研发单位：颐倍康南京养老服务有限公司</span>
    <span style="margin-left: 200px">指导单位：南京市民政局</span>
    <span style="margin-left: 50px">南京市居家社区养老服务协会</span>
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
<!--底部链接 end-->
<script src="${pageContext.request.contextPath }/assets/view/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath }/assets/global/scripts/md5.js"
        type="text/javascript"></script>
<script>
    $(function () {
        var code = "0";
        var uid = "0";
        $("body").css({"width": window.innerWidth, "height": window.innerHeight})
        window.apppath = "${pageContext.request.contextPath }";
        //发验证码
        $(".getYzm").click(function () {
            var login_name = $("input[name=login_name]").val();
            var phone = $("input[name=phone]").val();
            if (login_name == null || login_name == "") {
                alert("请输入用户名")
            }
            if (phone == null || phone == "") {
                alert("请输入手机号码")
            }
            //sendValidateCode
            $.post(window.apppath + "/view/api/user/sendValidateCode", {
                login_name: login_name,
                phone: phone
            }, function (data) {
                if (data != "" && data != null) {
                    if (data.success != true) {
                        alert(data.message);
                    }
                    else {
                        code = data.data.code;
                        uid = data.data.uid;
                    }
                }
            }, "json");
        });
        $("#submit").click(function () {
            //更新密码
            var password = $("input[name=new_password]").val().trim();
            var password2 = $("input[name=new_password2]").val().trim();
            var codevalidate = $("input[name=codevalidate]").val().trim();
            var login_name = $("input[name=login_name]").val().trim();
            var phone = $("input[name=phone]").val().trim();
            if (login_name == null || login_name == "") {
                alert("请输入用户名")
            }
            if (phone == null || phone == "") {
                alert("请输入手机号码")
            }
            if (codevalidate == null || codevalidate == "") {
                alert("请输入验证码")
            }
            if (password == null || password == "") {
                alert("请输入新的密码")
            }
            if (password2 == null || password2 == "") {
                alert("请输入确认密码")
            }
            if (code == codevalidate) {
                //更新
                $.post(window.apppath + "/view/api/user/updatePwd", {
                    userId: uid,
                    newPwd: hex_md5(password)
                }, function (data) {
                    if (data != "" && data != null) {
                        alert(data.message,function () {
                            window.location.reload();
                        });
                    }
                }, "json");
            }
        });

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

    });
</script>
</body>
</html>
