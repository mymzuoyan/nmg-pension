var AdminProfile = function () {

    var _self = "";
    return {
        type: '0',
        //main function to initiate the module
        init: function (str) {

            _self = this;
            $("#btnSubmit").click(function () {
                _self.updeteUserInfo();
            })
            if (str != "")
                _self.type = "1";
            $("#updatePwd").click(function () {
                _self.updatePwd();
            })
        },
        updeteUserInfo: function () {
            var userId = $("#user_id").val();
            var nick_name = $("#form-info input[name=nick_name]").val();
            var login_name = $("#form-info input[name=login_name]").val();
            var queueName = "";
            $('input[name="queueName"]:checked').each(function () {
                queueName += ($(this).val()) + ",";
            });
            if (queueName.length > 1)
                queueName = queueName.substr(0, queueName.length - 1);
            var extension = $.trim($("input[name=extension]").val());

            if (nick_name == null || nick_name == "") {
                $("#labelmsg").text('请输入昵称').addClass("label-danger");
                return false;
            }
            if (_self.type == "1") {
               if (extension == "") {
                    $("#labelmsg").text('请输入分机号').addClass("label-danger");
                    return false;
                }
            }
            Metronic.blockUI({
                message: '处理中...',
                overlayColor: 'none',
                cenrerY: true,
                boxed: true
            });
            $.post(window.apppath + "/admin/api/user/updateUserInfo", {
                uid: userId,
                nick_name: nick_name,
                /*login_name: login_name,*/
                extension: extension,
                queueName:"200"
            }, function (res) {
                Metronic.unblockUI();
                $("#btnSubmit").button('reset');
                if (res.success) {
                    $("#labelmsg").text(res.message).addClass("label-success");
                    $('.username', parent.document).html(nick_name);
                    setTimeout(function () {
                        window.location.reload();
                    }, 1000);
                } else {
                    $("#labelmsg").text(res.message).addClass("label-danger");
                }

            }, "json");

        },
        updatePwd: function () {

            var a_old_pwd = $("#form-password").find('input[type="password"]').eq(0).val();
            var a_new_pwd = $("#form-password").find('input[type="password"]').eq(1).val();
            var a_new_pwd2 = $("#form-password").find('input[type="password"]').eq(2).val();
            if (a_old_pwd == null || a_old_pwd == "") {
                $("#updatePwdMsg").text('旧密码不能为空').addClass("label-danger");
                return false;
            }
            else if (a_new_pwd == null || a_new_pwd == "") {
                $("#updatePwdMsg").text('新密码不能为空').addClass("label-danger");
                return false;
            }
            else if (a_new_pwd2 == null || a_new_pwd2 == "") {
                $("#updatePwdMsg").text('请输入确认密码').addClass("label-danger");
                return false;
            }
            else if (a_new_pwd2 != a_new_pwd) {
                $("#updatePwdMsg").text('两次输入的密码不一样').addClass("label-danger");
                return false;
            }
            Metronic.blockUI({
                message: '处理中...',
                overlayColor: 'none',
                cenrerY: true,
                boxed: true
            });
            $.post(window.apppath + "/admin/api/user/updatepwd",
                {uid: $("#user_id").val(), currentPassword: a_old_pwd, newPassword: a_new_pwd}, function (res) {
                    Metronic.unblockUI();
                    if (res.success) {
                        alertSuccess("提示信息","修改成功",function(){
                            setTimeout(function () {
                                window.location.reload();
                            }, 1000);
                        });
                        $("#updatePwdMsg").addClass("label-success");
                    } else {
                        alert("修改失败");
                        $("#updatePwdMsg").addClass("label-danger");
                    }
                    $("#updatePwdMsgw").text(res.message);

                }, 'json');
        }
    }

}();