var VolStoreOrDrawDetail = function () {
    var _method;

    $(".table-group-action-reload").click(function () {
        $('input[name=serviceName]').val($("#serviceName1").val());
    });
    $(".table-group-action-reload1").click(function () {
       $("input[name=targetName]").val($("#targetName1").val());
    });
    return {
        //main function to initiate the module
        init: function () {

        },
        submitAdd: function () {
            var $btn = $(this);
            var targetName = $('#targetName').val();
            var serviceTimeString = $("#serviceTimeString").val();
            var county = $("#county").val();
            var receiverId = $("#receiverId").val();
            var receiverChoose = $("#receiverId option:selected").text();
             if (county == "") {
                $("#labelmsg").text('请选择行政区！').addClass("label-danger");
            } else if (receiverId == "") {
                $("#labelmsg").text('请选择接受组织！').addClass("label-danger");
            }else if (targetName == "") {
                $("#labelmsg").text('请输入服务对象！').addClass("label-danger");
            } else if (serviceTimeString == "") {
                $("#labelmsg").text('请选择时间！').addClass("label-danger");
            }else {
                $("#labelmsg").text('');
                $btn.button('loading');
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/volStoreOrDrawAdd?receiverChoose=" + receiverChoose,
                    data: $("#volStoreOrDrawAddForm").serialize(),
                    dataType: "json",
                    success: function (res) {
                        $btn.button('reset');
                        if (res.success) {
                            $("#labelmsg").text(res.message).addClass("label-success");
                            $('#cz').click();
                        } else {
                            $("#labelmsg").text(res.message).addClass("label-danger");
                        }
                    }
                });
            }
        }/*,
        submitEdit: function () {
            var $btn = $(this);
            var targetName = $('#targetName1').val();
            var serviceTimeString = $("#serviceTimeString1").val();
            if (targetName == "") {
                $("#labelmsg1").text('请输入服务对象！').addClass("label-danger");
            } else if (serviceTimeString == "") {
                $("#labelmsg1").text('请选择时间！').addClass("label-danger");
            } else {
                $("#labelmsg1").text('');
                $btn.button('loading');
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/volStoreOrDrawEdit",
                    data: $("#volStoreOrDrawEditForm").serialize(),
                    dataType: "json",
                    success: function (res) {
                        $btn.button('reset');
                        if (res.success) {
                            Metronic.alert({type: 'success', message: res.message, closeInSeconds: 2, icon: 'check'});
                        } else {
                            Metronic.alert({type: 'danger', message: res.message, closeInSeconds: 2, icon: 'warning'});
                        }
                    }
                });
            }
        }*/
    };
}();