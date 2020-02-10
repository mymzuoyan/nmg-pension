/**
 * Created by Administrator on 2016/9/13.
 */
var ElderMsgPoorVerification=function () {
    var _self="";
    var waitContainer = $("#poorApplyForm").parent();

    return {
        id:0,
        applyId:0,
        init:function (param1,param2) {
            _self=this;
            _self.id=param1;
            _self.applyId=param2;
        },
        verification:function () {
            window.parent.confirm4("年审是否通过","通过","不通过", function () {
                _self.handleVerification(1)
            }, function () {
                _self.handleVerification(2)

            });
        },
        handleVerification:function (result) {

            Metronic.blockUI({
                message: '处理中...',
                target: waitContainer,
                overlayColor: 'none',
                cenrerY: true,
                boxed: true
            });
            $.post(window.apppath + "/admin/api/elderly/poor/verification", {
                id: _self.id,
                result:result,
                note:$("#confrimModal4 input[name=content]",window.parent.document).val()
            }, function (res) {
                $("#confrimModal4 input[name=content]",window.parent.document).val("")
                Metronic.unblockUI(waitContainer);
                if (res.success) {
                    window.parent.updateTab("elder_poor_verification_list");
                    window.parent.closeTab("poor-verificationInfo");
                }
            }, 'json');
        },
    }
}();