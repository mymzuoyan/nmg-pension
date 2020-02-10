var VolunteerDetail = function () {
    var _method;


    return {
        //main function to initiate the module
        init: function () {
            $("#volunteerEditForm").find("input:text").prop("disabled", true);//找到form表单下的所有input标签并置为可编辑
            $("#volunteerEditForm").find("select").prop("disabled", true);//找到form表单下的所有select标签并置为可编辑
            $("#volunteerEditForm").find("button[name=editVolunteer]").prop("disabled", true);

        },
        allowEdit: function () {
            $("#volunteerEditForm").find("input:text").prop("disabled", false);//找到form表单下的所有input标签并置为可编辑
            $("#volunteerEditForm").find("select").prop("disabled", false);//找到form表单下的所有select标签并置为可编辑
            $("#volunteerEditForm").find("button[name=editVolunteer]").prop("disabled", false);
        },
        submitEdit: function () {
            var $btn = $(this);
            var volunteerName = $("#volunteerName1").val();
            var sexDictId = $("#sexDictId1").val();
            var idcardno = $("#idcardno1").val();
            var town = $("#town").val();
            if (town == "") {
                $("#labelmsg").text('请选择街道！').addClass("label-danger");
            } else if (volunteerName == "") {
                $("#labelmsg1").text('请输入姓名！').addClass("label-danger");
            } else if (sexDictId == "") {
                $("#labelmsg1").text('请选择性别！').addClass("label-danger");
            } else if (idcardno == "") {
                $("#labelmsg1").text('请输入身份证号！').addClass("label-danger");
            } else {
                $("#labelmsg1").text('');
                $btn.button('loading');
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/volunteer/update",
                    data: $("#volunteerAddForm").serialize() + "&areaId=" + EographicArea.getSelectId() + "&areaName=" + EographicArea.getPosition2(),
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
        }
    };
}();