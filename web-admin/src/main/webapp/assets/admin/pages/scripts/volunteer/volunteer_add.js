var VolunteerAdd = function () {

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
        submitAdd: function () {
            var $btn = $(this);
            var volunteerName = $("#volunteerName").val();
            var idcardno = $("#idcardno").val();
            var town = $("#town").val();
            if (town == "") {
                $("#labelmsg").text('请选择街道！').addClass("label-danger");
            } else if (volunteerName == "") {
                $("#labelmsg").text('请输入姓名！').addClass("label-danger");
            }  else if (idcardno == "") {
                $("#labelmsg").text('请输入身份证号！').addClass("label-danger");
            } else {
                $("#labelmsg").text('');
                $btn.button('loading');
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/volunteer/add",
                    data: $("#volunteerAddForm").serialize() + "&areaId=" + EographicArea.getSelectId() + "&areaName=" + EographicArea.getPosition2(),
                    dataType: "json",
                    success: function (res) {
                        $btn.button('reset');
                        if (res.success) {
                            alert(res.message, function () {
                                window.location.reload();
                            })
                        } else {
                            alert(res.message);

                        }
                    }
                });
            }
        }, validateIdCard: function () {
            var idCard = $("#idcardno").val();
            $.ajax({
                type: "POST",
                url: window.apppath + "/admin/api/validate/idCard",
                data: {idStr: idCard, flag: "fuwu"},
                dataType: "json",
                success: function (res) {
                    if (res.success) {
                        $("#errorIdCard").html(res.message);
                        $("#age").val(res.data.age);
                        if (res.data.gender == "男") {
                            $("#sexDictId").val(1);
                        } else {
                            $("#sexDictId").val(2);
                        }
                    } else {
                        $("#errorIdCard").html(res.message);
                    }

                }
            });
        },
    };
}();