var ElderlyMsgCommon = function () {
    var _method;
    var type = $("#type").val();
    // 反显人员类别选中的复选框
    var obj1 = document.getElementsByName("elderTypeDictIds");
    var scopes = "";
    if ("show" == type) {
        scopes = $("#elderTypeDictIds1").val();
    } else if ("edit" == type) {
        scopes = $("#elderTypeDictIds").val();
    }
    if (scopes != "" && scopes != null) {
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
    var scopes2 = "";
    if ("show" == type) {
        scopes2 = $("#serviceNeed1").val();
    } else if ("edit" == type) {
        scopes2 = $("#serviceNeed").val();
    }
    if (scopes2 != "" && scopes2 != null) {
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

    // 反显慢性疾病选中的复选框
    var obj3 = document.getElementsByName("otherSlow");
    var scopes3 = "";
    if ("show" == type) {
        scopes3 = $("#otherSlow1").val();
    } else if ("edit" == type) {
        scopes3 = $("#otherSlow").val();
    }
    if (scopes3 != "" && scopes3 != null) {
        var scope3 = scopes3.split(",");
        if (scopes3.length > 0) {
            for (var i = 0; i < obj3.length; i++) {
                for (var j = 0; j < scopes3.length; j++) {
                    if (obj3[i].value == scope3[j]) {
                        obj3[i].checked = true;
                    }
                }
            }
        }
    }

    $("#isDeath").change(function () {
        var isDeath = $("#isDeath").val();
        if (isDeath == 1 || isDeath == 2) {
            $("#editElderFrom").find("input[name=deathTimeString]").prop("disabled", true);
            $("#editElderFrom").find("input[name=cremationTimeString]").prop("disabled", true);
            $("#editElderFrom").find("input[name=deathTimeString]").val("");
            $("#editElderFrom").find("input[name=cremationTimeString]").val("");
        } else {
            $("#editElderFrom").find("input[name=deathTimeString]").prop("disabled", false);
            $("#editElderFrom").find("input[name=cremationTimeString]").prop("disabled", false);
        }
    });
    return {
        init: function (method) {
            $("#addElderForm").find("input:text").addClass("form-control");
            $("#addElderForm").find("select").addClass("form-control");
            $("#addElderForm").find("input:text").addClass("form-control");
            $("#addElderForm").find("select").addClass("form-control");
        },
        selectArea: function (method) {
            _method = method;
            $('#myModal').modal({
                keyboard: true
            });
        },
        getAreaValue: function (areaName, areaId, deptCode) {
            if (_method == 'edit') {
                document.getElementById("areaName").value = areaName;
                document.getElementById("areaId").value = areaId;
                document.getElementById("deptCode").value = deptCode;
            } else if (_method == 'add') {
                document.getElementById("areaName2").value = areaName;
                document.getElementById("areaId2").value = areaId;
                document.getElementById("deptCode2").value = deptCode;
            }
            $('#myModal').modal('hide');
        },
        notAllowEdit: function () {
            $("#editElderFrom").find("input:text").addClass("form-control");
            $("#editElderFrom").find("select").addClass("form-control");
            $("#editElderFrom").find("input:text").addClass("form-control");
            $("#editElderFrom").find("select").addClass("form-control");
            $("#editElderFrom").find("input:text").prop("disabled", true);//找到form表单下的所有input标签并置为不可编辑
            $("#editElderFrom").find("select").prop("disabled", true);//找到form表单下的所有select标签并置为不可编辑
            $("#editElderFrom").find("input:checkbox").prop("disabled", true);//找到form表单下的所有checkbox标签并置为不可编辑
            $("#editElderFrom").find("input:radio").prop("disabled", true);//找到form表单下的所有checkbox标签并置为不可编辑
            $("#editElderFrom").find("button[name=editElder]").prop("disabled", true);
            $("#editElderFrom").find("input:file").prop("disabled", true);
        },
        allowEdit: function () {
            $("#editElderFrom").find("input:text").prop("disabled", false);//找到form表单下的所有input标签并置为可编辑
            $("#editElderFrom").find("select").prop("disabled", false);//找到form表单下的所有select标签并置为可编辑
            $("#editElderFrom").find("input:checkbox").prop("disabled", false);//找到form表单下的所有checkbox标签并置为可编辑
            $("#editElderFrom").find("input:radio").prop("disabled", false);//找到form表单下的所有checkbox标签并置为可编辑
            $("#editElderFrom").find("button[name=editElder]").prop("disabled", false);
            $("#editElderFrom").find("button[name=btnAddRelate]").prop("disabled", false);
            $("#editElderFrom").find("input:file").prop("disabled", false);
            $("#editElderFrom").find("input[name=deathTimeString]").prop("disabled", true);
            $("#editElderFrom").find("input[name=cremationTimeString]").prop("disabled", true);
        },
        editElder: function () {
            var $btn = $(this);
            var formEdit = $('#editElderFrom');
            var areaName = $("#editElderFrom input[name=areaName]").val();
            if (areaName == "") {
                $("#labelmsg").text('请选择所属区域！').addClass("label-danger");
                return false;
            } else if ($("#editElderFrom input[name=elderName]").val() == "") {
                $("#labelmsg").text('请输入老人姓名！').addClass("label-danger");
                return false;
            } else if ($("#editElderFrom input[name=idcardno]").val() == "") {
                $("#labelmsg").text('请输入身份证号！').addClass("label-danger");
                return false;
            } else if ($("#errorIdCard").html() != null && $("#errorIdCard").html() != "" && $("#errorIdCard").html() != "身份证正确") {
                $("#labelmsg").text('请输入正确的身份证号！').addClass("label-danger");
                return false;
            } else if ($("#age").val() < 60) {
                $("#labelmsg").text('老人年龄必须在60岁以上！').addClass("label-danger");
                return false;
            } else {
                $("#labelmsg").text('');
                $btn.button('loading');
                    $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/elderly/update",
                    data: formEdit.serialize() + "&areaOrder=" + getAreaOrder(areaName),
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
        },
        clean: function () {
            $("#addElderFrom").find("input:text").val("");//找到form表单下的所有input标签并清空
            $("#addElderFrom").find("select").val("");//找到form表单下的所有select标签并清空
            $("#addElderFrom").find("input:checkbox").parent().removeClass("checked");//找到form表单下的所有checkbox标签并清空
            $("#addElderFrom").find("input:radio").parent().removeClass("checked");//找到form表单下的所有checkbox标签并清空
        },
        isDeath: function () {
            var isDeath = $("#isDeath").val();
            if (isDeath == 1) {
                $("#addElderForm").find("input[name=deathTimeString]").prop("disabled", true);
                $("#addElderForm").find("input[name=cremationTimeString]").prop("disabled", true);
            } else {
                $("#addElderForm").find("input[name=deathTimeString]").prop("disabled", false);
                $("#addElderForm").find("input[name=cremationTimeString]").prop("disabled", false);
            }
        }
    };
}();