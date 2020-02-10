/**
 * Created by Administrator on 2016/10/10.
 */
var ElderInfoAssessCheckAdd = function () {

    var _self = "";
    return {
        form:"",
        init: function () {
            _self = this;
            _self.form=$("#addCheck");

            $("#btnPublish").click(function () {
                _self.addCheck();
            })
        },
        addCheck: function () {
            if(_self.validation())
            {
                var value=_self.form.serialize();
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/elderMsg/assessCheck/add",
                    data:value,
                    dataType: "json",
                    success: function(data){
                        if(data.success)
                        {
                            Metronic.alert({type: 'success', message: data.message, closeInSeconds: 3, icon: 'check'});
                        }
                        else {
                            Metronic.alert({type: 'danger', message: data.message, closeInSeconds: 2, icon: 'warning'});
                        }

                    }
                });
            }

        },
        validation: function () {
            var BYCHECK_UNIT = $("#BYCHECK_UNIT").val();
            if (BYCHECK_UNIT.length == 0) {
                $("#labelmsg").text("请输入被检查单位").addClass("label-danger");
                return false;
            }
            var CHECK_RESULT = $("#CHECK_RESULT").val();
            if (CHECK_RESULT.length == 0) {
                $("#labelmsg").text("请输入检查结果").addClass("label-danger");
                return false;
            }
            $("#labelmsg").text("").removeClass("label-danger");
            return true;
        }
    }
}();