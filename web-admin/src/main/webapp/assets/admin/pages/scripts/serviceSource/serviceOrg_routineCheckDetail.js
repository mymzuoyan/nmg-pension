var RoutineCheckDetail = function () {
    var _method;
    return {
        init: function () {
            $("#routineCheckUpdateForm").find("input").prop("disabled", true);//找到form表单下的所有input标签并置为可编辑
            $("#routineCheckUpdateForm").find("select").prop("disabled", true);//找到form表单下的所有select标签并置为可编辑
            $("#routineCheckUpdateForm").find("textarea").prop("disabled", true);
            $("#routineCheckUpdateForm").find("button[name=formEdit]").prop("disabled", true);
        },
        allowEdit: function () {
            $("#routineCheckUpdateForm").find("input").prop("disabled", false);//找到form表单下的所有input标签并置为可编辑
            $("#routineCheckUpdateForm").find("select").prop("disabled", false);//找到form表单下的所有select标签并置为可编辑
            $("#routineCheckUpdateForm").find("textarea").prop("disabled", false);
            $("#routineCheckUpdateForm").find("button[name=formEdit]").prop("disabled", false);
        }
    };

}();