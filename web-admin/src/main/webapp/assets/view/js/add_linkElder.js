/**
 * Created by CoderQiang on 2017/5/16.
 */
var AddLinkElder = function () {
    var _self = "";
    return {
        init: function () {
            _self = this;
        },
        addOrUpdateLinkElder: function () {
            if (_self.checkForm()) {
                var id = $("input[name=id]").val().trim();
                var elderName = $("input[name=elderName]").val().trim();
                var elderMobile = $("input[name=elderMobile]").val().trim();
                var elderCardNo = $("input[name=elderCardNo]").val().trim();
                var elderAddress = $("input[name=elderAddress]").val().trim();
                $.post(window.apppath + "/view/api/user/addOrUpdateUserLinkElder", {
                    id:id,
                    elderName: elderName,
                    elderMobile: elderMobile,
                    elderCardNo: elderCardNo,
                    elderAddress: elderAddress
                }, function (res) {
                    if (res.success) {
                        $(".help_text").html(res.message);
                        $(".help_text").removeClass("error");
                        $(".help_text").addClass("success");
                        setTimeout(function () {
                            window.location.href = window.apppath + "/user/user_profile.html";
                        }, 1400)
                    } else {
                        $(".help_text").html(res.message);
                    }
                }, 'json');
            }

        },
        checkForm: function () {
            var elderName = $("input[name=elderName]").val().trim();
            var elderMobile = $("input[name=elderMobile]").val().trim();
            var elderCardNo = $("input[name=elderCardNo]").val().trim();
            var elderAddress = $("input[name=elderAddress]").val().trim();
            if (elderName == null || elderName == "") {
                return _self.hasError("请输入老人姓名");
            }
            if (elderMobile == null || elderMobile == "") {
                return _self.hasError("请输入老人联系方式");
            }
            if (elderCardNo == null || elderCardNo == "") {
                return _self.hasError("请输入老人身份证信息");
            }
            if (!isCardNo(elderCardNo)) {
                return _self.hasError("请输入正确的老人身份证信息");
            }
            if (!checkMobile(elderMobile)) {
                return _self.hasError("请输入正确的老人联系方式");
            }

            if (elderAddress == null || elderAddress == "") {
                return _self.hasError("请输入老人地址");
            }
            return true;
        },
        hasError: function (str) {
            $(".help_text").html(str);
            return false;
        }
    }
}();