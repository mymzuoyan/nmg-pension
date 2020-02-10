var assessDetails = function () {
    var _method;
    // 反显人员类别选中的复选框
    var obj1 = document.getElementsByName("elderTypeDictIds");
    var scopes = $("#elderTypeDictIds").val();
    if(scopes!=""&&scopes!=null)
    {
        var scope = scopes.split(",");
        if (scopes.length > 0) {
            for (var i = 0; i < obj1.length; i++) {
                for (var j = 0; j < scopes.length; j++) {
                    if (obj1[i].value == scope[j]) {
                        obj1[i].checked = true;
                    }
                }
            }
        }
    }
    // 反显服务需求选中的复选框
    var obj2 = document.getElementsByName("serviceNeed");
    var scopes2 = $("#serviceNeed").val();
    if(scopes2!=""&&scopes2!=null)
    {
        var scope2 = scopes2.split(",");
        if (scopes2.length > 0) {
            for (var i = 0; i < obj2.length; i++) {
                for (var j = 0; j < scopes2.length; j++) {
                    if (obj2[i].value == scope2[j]) {
                        obj2[i].checked = true;
                    }
                }
            }
        }
    }
    return {
        init: function (method) {
        },
        addSubmit:function () {
            var assEditForm = $('#assEditForm');
            assEditForm.validate({
                submitHandler: function (form) {
                    Metronic.blockUI({
                        message: '加载中...',
                        target: form,
                        overlayColor: 'none',
                        cenrerY: true,
                        boxed: true
                    });
                    $.post(window.apppath+"/admin/api/elderly/addAssess",assEditForm.serialize(),function(res) {
                        Metronic.unblockUI(form);
                        if (res.success) {
                            Metronic.alert({type: 'success', message: res.message, closeInSeconds: 3, icon: 'check'});
                        } else {
                            form.reset();
                            Metronic.alert({type: 'danger', message: res.message, closeInSeconds: 2, icon: 'warning'});
                        }
                    },'json');
                }
            });
        }
    };
}();