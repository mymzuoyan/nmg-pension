/**
 * Created by Administrator on 2016/9/13.
 */
var AddMonitor = function () {

    var _self = "";
    return {
        type:"",//监控方式,
        count:0,
        rangeTable:"",
        rangeStr:[],
        init: function () {
            _self = this;

            $("#btnPublish").click(function () {
                _self.submitForm();
            })

        },
        submitForm: function () {
            if (_self.checkInput()) {
                var queueName = "";
                $('input[name="queueName"]:checked').each(function(){
                    queueName+=($(this).val())+",";
                });
                if(queueName.length>1)
                    queueName=queueName.substr(0,queueName.length-1);
                $.post(window.apppath + "/admin/call/api/monitor/add", {
                    groupId:$("#groupId").val(),
                    groupName:$("#groupId  option:selected").text(),
                    login_name: $.trim($("input[name=login_name]").val()),
                    pass_word: $.trim($("input[name=pass_word]").val()),
                    nick_name: $.trim($("input[name=nick_name]").val()),
                    areaId:EographicArea.getSelectId(),
                    areaName:EographicArea.getPosition2(),
                    queueName:queueName,
                    extension:$.trim($("input[name=extension]").val()),
                    status:1
                }, function (res) {
                    $("#btnPublish").button('reset');
                    if (res.success) {
                        $("#labelmsg").text(res.message).addClass("label-success");
                        setTimeout(function () {
                            window.location.reload();
                        },1000);
                    } else {
                        $("#labelmsg").text(res.message).addClass("label-danger");
                    }
                }, "json");

            }
        },
        checkInput: function () {

            $("#labelmsg").text('').removeClass("label-danger");

            var groupId=$("#groupId").val();
            var account = $.trim($("input[name=login_name]").val());
            var password = $.trim($("input[name=pass_word]").val());
            var password2 = $.trim($("input[name=pass_word2]").val());
            var name = $.trim($("input[name=nick_name]").val());
            var queueName = "";
            var areaId=EographicArea.getSelectId();
            var areaName=EographicArea.getPosition2();
            $('input[name="queueName"]:checked').each(function(){
                queueName+=($(this).val())+",";
            });
            if(queueName.length>1)
                queueName=queueName.substr(0,queueName.length-1);
            var extension = $.trim($("input[name=extension]").val());
            if (groupId==null||groupId =="-1") {
                $("#labelmsg").text('请选择坐席组').addClass("label-danger");
                return false;
            }
            else  if (account == null || account == "") {
                $("#labelmsg").text('请输入账号').addClass("label-danger");
                return false;
            }
            else if (name == null || name == "") {
                $("#labelmsg").text('请输入姓名').addClass("label-danger");
                return false;
            }
            else if (password == null || password == "") {
                $("#labelmsg").text('请输入密码').addClass("label-danger");
                return false;
            }
            else if (password != password2) {
                $("#labelmsg").text('两次输入的密码不一样').addClass("label-danger");
                return false;
            }
            else if (areaName== null || areaName == "") {
                $("#labelmsg").text('请选择区域').addClass("label-danger");
                return false;
            }
            else if (queueName == null || queueName == "") {
                $("#labelmsg").text('请选择监控范围').addClass("label-danger");
                return false;
            }
            else if (extension == null || extension == "") {
                $("#labelmsg").text('请输入分机号').addClass("label-danger");
                return false;
            }
            else if (isNaN(extension)) {
                $("#labelmsg").text('请输入正确的分机号').addClass("label-danger");
                return false;
            }
            return true;


        },

    }

}();