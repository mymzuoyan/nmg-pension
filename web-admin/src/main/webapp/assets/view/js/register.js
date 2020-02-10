/**
 * Created by CoderQiang on 2017/5/12.
 */
var Register = function () {
    var _self = "";
    return {
        init: function () {
            _self = this;
            //返回
            $(".cancel").click(function () {
                window.history.back();
            });
            $("input").change(function () {
                $(this).parent().parent().removeClass("has-error");
                $(this).parent().find(".help-block").html("");
            });
        },
        submitForm:function () {
            if(_self.checkForm())
            {
                var login_name = ($("input[name=login_name]").val()).trim();
                var pass_word = ($("input[name=pass_word]").val()).trim();
                var password=hex_md5(pass_word);
                $.post(window.apppath + "/api/serviceObject/register", {
                    login_name: login_name,
                    pass_word: password,
                    nick_name:login_name,
                    phone:login_name
                }, function (res) {
                    if (res.success) {
                        window.location.href=window.apppath+"/home.html";
                    }
                    else {
                        alert(res.message);
                    }
                }, 'json');
            }
        },
        checkForm: function () {
            var login_name = ($("input[name=login_name]").val()).trim();
            var pass_word = ($("input[name=pass_word]").val()).trim();
            var pass_word2 = ($("input[name=pass_word2]").val()).trim();
            var identifyCode = ($("input[name=identifyCode]").val()).trim();
            var code = _self.getCookie("verificationCode");
            if (login_name == null || login_name == "") {
                _self.hasError("login_name", "请输入手机号码");
                return false;
            }
            else if (!checkMobile(login_name)) {
                _self.hasError("login_name", "请输入正确的手机号码");
                return false;
            }
            if (pass_word == null || pass_word == "") {
                _self.hasError("pass_word", "请输入密码");
                return false;
            }
            if (pass_word2 == null || pass_word2 == "") {
                _self.hasError("pass_word2", "请再次输入密码");
                return false;
            }
            if(pass_word2!=pass_word)
            {
                _self.hasError("pass_word2", "和第一次输入不一样");
                return false;
            }
            if (identifyCode == null || identifyCode == "") {
                _self.hasError("identifyCode", "请输入验证码");
                return false;
            }
            if (code!=identifyCode) {
                _self.hasError("identifyCode", "验证码不正确");
                return false;
            }
            return true;
        },
        sendCode: function () {
            var phone = ($("input[name=login_name]").val()).trim();
            if (phone == null || phone == "") {
                _self.hasError("login_name", "请输入手机号码");
            }
            else if (!checkMobile(phone)) {
                _self.hasError("login_name", "请输入正确的手机号码");
            }
            var code = _self.randomString(4);
            $.post(window.apppath + "/api/sendVerificationCode", {
                phone: phone,
                num: code
            }, function (res) {
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

                }
            }, 'json');
        },
        hasError: function (name, text) {
            $("input[name=" + name + "]").parent().parent().addClass("has-error");
            $("input[name=" + name + "]").parent().find(".help-block").html(text);
        },
        randomString: function (len) {
            len = len || 32;
            var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';
            /****默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1****/
            var maxPos = $chars.length;
            var pwd = '';
            for (i = 0; i < len; i++) {
                pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
            }
            return pwd;
        }, getCookie: function (name) {
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
    }
}();