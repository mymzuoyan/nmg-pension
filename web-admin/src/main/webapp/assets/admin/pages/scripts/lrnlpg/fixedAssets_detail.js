var FixedAssetsDetail = function () {
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
            var id = $("#id").val();
            var areaName = $("#county option:selected").text() + $("#town option:selected").text() + $("#village option:selected").text() + $("#receiverId option:selected").text();
            var village = $("#village").val();
            var receiverId = $("#receiverId").val();
            var classification = $("select[name=classification]").val();
            var name = $("#name").val();
            var unit = $("#unit").val();
            var count = $("#count").val();
            var model = $("#model").val();
            var money = $("#money").val();
            var foodPicture = $("#foodPicture").val();
            var invoice = $("#invoice").val();
            var remarks = $("#remarks").val();
            if (classification == "") {
                $("#labelmsg").text('请选择资产分类！').addClass("label-danger");
            } else if (receiverId == "") {
                $("#labelmsg").text('请选择组织！').addClass("label-danger");
            } else if (name == "") {
                $("#labelmsg").text('请输入名称！').addClass("label-danger");
            } else if (unit == "") {
                $("#labelmsg").text('请输入单位！').addClass("label-danger");
            } else if (count == "") {
                $("#labelmsg").text('请输入数量！').addClass("label-danger");
            } else if (model == "") {
                $("#labelmsg").text('请输入型号！').addClass("label-danger");
            } else if (money == "") {
                $("#labelmsg").text('请输入金额！').addClass("label-danger");
            } else if (remarks == "") {
                $("#labelmsg").text('请输入备注！').addClass("label-danger");
            } else {
                console.log(1);
                $("#labelmsg").text('');
                $btn.button('loading');
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/power/socialDonation/fixedAssetsUpdate",
                    data:{
                        id: id,
                        areaId: village,
                        serviceOrgId: receiverId,
                        areaName: areaName,
                        classification: classification,
                        name: name,
                        unit: unit,
                        count: count,
                        model: model,
                        money: money,
                        foodPicture: foodPicture,
                        invoice: invoice,
                        remarks: remarks
                    },
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
        }
    };
}();