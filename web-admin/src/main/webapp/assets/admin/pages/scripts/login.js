var Login = function () {

    var _self = "";
    var flag = false;
    return {
        //main function to initiate the module
        init: function () {
            _self = this;
            _self.handleLogin();
            $("#loginBtn").click(function () {
                flag = true;
                $('.login-form').submit();
            });
        },
        handleLogin: function () {
            $('.login-form').validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                rules: {
                    login_name: {
                        required: true
                    },
                    pass_word: {
                        required: true
                    },
                    remember: {
                        required: false
                    }
                },

                messages: {
                    login_name: {
                        required: "请输入用户名."
                    },
                    pass_word: {
                        required: "请输入密码."
                    }
                },
                success: function (label) {
                    label.closest('.form-group').removeClass('has-error');
                    label.remove();
                },

                errorPlacement: function (error, element) {
                    error.insertAfter(element.closest('.input-icon'));
                },

                submitHandler: function (form) {
                    var login_name=$("input[name=login_name]").val();
                    var pass_word=$("input[name=pass_word]").val();
                    var codevalidate=$("input[name=codevalidate]").val();
                    if (!flag) {
                        pass_word= hex_md5(pass_word);
                        //判断是否已登陆
                        $.post(window.apppath + "/admin/beforeLogin", {
                            login_name: login_name,
                            pass_word: pass_word,
                            codevalidate:codevalidate
                        }, function (res) {
                            if (res.success) {
                                if (res.data == 1) {
                                    $("input[name=pass_word]").val(pass_word);
                                    form.submit();
                                }
                                else {
                                    $("#confirm").show();
                                }
                            }
                            else {
                                _self.alert(res.message,function () {
                                });
                            }
                        }, "json");
                    }
                    else {
                        pass_word= hex_md5(pass_word);
                        $("input[name=pass_word]").val(pass_word);
                        form.submit();
                    }
                }
            });

            $('.login-form input').keypress(function (e) {
                if (e.which == 13) {
                    if ($('.login-form').validate().form()) {
                        $('.login-form').submit();
                    }
                    return false;
                }
            });
        },
        showError: function (message) {
            $('.alert-danger span', $('.login-form')).html(message);
            $('.alert-danger', $('.login-form')).show();
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
        alert: function (res, callback) {
            $("#alertModal .alertModalMes").html(res);
            $('#alertModal').show();
            $("#alertModal .lg_btn").unbind('click').click(function () {
                $('#alertModal').hide();
                if (callback != null)
                    callback();
            })
        }

    };

}();