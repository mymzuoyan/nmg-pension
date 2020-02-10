/**
 * Created by Administrator on 2016/9/19.
 */
var UserFuwuInfo = function () {

    var _self = "";
    var serviceType = "";
    return {
        "grid": "",
        init: function () {
            _self = this;
            this.serviceTypeInit();
        },
        checkSave: function () {
            $("#labelmsg").text("").removeClass("label-danger");
            var name = $("input[name=name]").val();
            var idcardno = $("input[name=idcardno]").val();
            var mobile = $.trim($("input[name=mobile]").val());
            var serviceOrgName = $("input[name=serviceOrgName]").val();
            var entryTime = $("input[name=entryTime]").val();
            //var volflag = $("input[type=radio][name=volFlag]:checked").val();
            if (serviceOrgName == null || serviceOrgName == "") {
                $("#labelmsg").text("请选择组织").addClass("label-danger");
                return false;
            }
            if (name == null || name == "") {
                $("#labelmsg").text("请输入姓名").addClass("label-danger");
                return false;
            }
            if (idcardno == null || idcardno == "") {
                $("#labelmsg").text("请输入身份证号").addClass("label-danger");
                return false;
            }
            if (idcardno != null && idcardno != "" && $("#errorIdCard").val() != "" && $("#errorIdCard").val() != "身份证正确") {
                $("#labelmsg").text("请输入正确的身份证号").addClass("label-danger");
                return false;
            }
            if (mobile == null || mobile == "") {
                $("#labelmsg").text("请输入手机号码").addClass("label-danger");
                return false;
            }
            if (mobile != null && mobile != "") {
                if (!_self.checkMobile(mobile)) {
                    $("#labelmsg").text('请输入正确的手机号码！').addClass("label-danger");
                    return false;
                }

            }
            if (entryTime == null || entryTime == "") {
                $("#labelmsg").text("请选择入职时间").addClass("label-danger");
                return false;
            }
            if ($("input[name=adminFlag]").val() == 2) {
                var workType = $("#workType").val();
                var certificate = $("input[type=radio][name=certificate]:checked").val();
                var train = $("input[type=radio][name=train]:checked").val();
                if (workType == null || workType == "") {
                    $("#labelmsg").text("请选择工作类型").addClass("label-danger");
                    return false;
                }
                if (certificate == null || certificate == "") {
                    $("#labelmsg").text("请选择是否有证书").addClass("label-danger");
                    return false;
                }
                if (train == null || train == "") {
                    $("#labelmsg").text("请选择是否培训过").addClass("label-danger");
                    return false;
                }

            }
            /*if (volflag == null || volflag == "") {
             $("#labelmsg").text("请选择是否是志愿者").addClass("label-danger");
             return false;
             }*/
            $("#labelmsg").text("").removeClass("label-danger");
            return true;
        },
        checkMobile: function (sMobile) {
            var pattern = /(^1(3[0-9]|4[5,7]|5[0-35-9]|8[0-9]|7[06-8])\d{8}$)/;
            if (pattern.test(sMobile)) {
                return true;
            }
            return false;
        },
        submitForm: function () {
            if (_self.checkSave()) {
                var idPhotos = "";
                $(".remove").each(function () {
                    idPhotos += $(this).attr("data") + ",";
                });
                if (idPhotos.length > 1)
                    idPhotos = idPhotos.substr(0, idPhotos.length - 1);
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/user/fuwu/add",
                    data: $("#addForm").serialize() + "&idPhotos=" + idPhotos,
                    dataType: "json",
                    async: true,
                    success: function (res) {
                        if (res.success) {
                            alertSuccess("提示信息", "添加成功", function () {
                                window.location.reload();
                            });
                        } else {
                            alert(res.message);
                        }
                    }
                });
            }
        },
        submitEditForm: function () {
            if (_self.checkSave()) {
                var idPhotos = "";
                $(".remove").each(function () {
                    idPhotos += $(this).attr("data") + ",";
                });
                if (idPhotos.length > 1)
                    idPhotos = idPhotos.substr(0, idPhotos.length - 1);
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/user/fuwu/update",
                    data: $("#editForm").serialize() + "&idPhotos=" + idPhotos,
                    dataType: "json",
                    success: function (res) {
                        if (res.success) {
                            alertSuccess("提示信息", "提交成功", function () {
                                window.location.reload();
                            });
                        } else {
                            alert("提交失败");
                        }
                    }
                });
            }
        },
        allowEdit: function () {
            $("#editForm").find("input:text").attr("disabled", false);
            $("#editForm").find("input:radio").attr("disabled", false);
            $("#editForm").find("input:file").attr("disabled", false);
            $("#editForm").find("button[name=btnPublish]").attr("disabled", false);
            $("#editForm").find("input[name=areaName]").attr("disabled", true);
            $("#editForm").find("input[name=serviceOrgName]").attr("disabled", true);
            //服务项目可以选择
            $("#serviceType").prop("disabled", false);
            $('.ms-elem-selectable').removeClass("disabled");
            $('.ms-elem-selection').removeClass("disabled");
            1
        },
        validateIdCard: function () {
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
                        $("#gender").val(res.data.gender);
                    } else {
                        $("#errorIdCard").html(res.message);
                    }

                }
            });
        },
        showSelectServiceOrgModel: function (method) {
            $("#selectServiceOrg").modal("show");
            if (_self.grid == "") {
                _self.serviceOrgInit();
            }
            else {
                //重置
                if (method == "add") {
                    $("#addForm").find("input[name=serviceOrgName]").val("");//找到form表单下的所有input标签并清空
                } else if (method == "edit") {
                    $("#editForm").find("input[name=serviceOrgName]").val("");//找到form表单下的所有input标签并清空
                }
                _self.grid.getDataTable().ajax.reload();
            }
        },
        selectServiceOrg: function () {
            _self.serviceOrgId = $("#datatable_selectOrg_list input[name=selectId]:checked").val();
            _self.serviceOrgName = $("#datatable_selectOrg_list input[name=selectId]:checked").attr("data-orgname");
            _self.areaName = $("#datatable_selectOrg_list input[name=selectId]:checked").attr("data-areaname");
            $("input[name=serviceOrgId]").val(_self.serviceOrgId);
            $("input[name=serviceOrgName]").val(_self.serviceOrgName);
            $("input[name=areaName]").val(_self.areaName);
            $("#selectServiceOrg").modal("hide");
            $("body").animate({scrollTop: '0px'}, 200);
        },
        serviceOrgInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_selectOrg_list"),
                onSuccess: function (grid, res) {
                    // execute some code after table records loaded
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/serviceOrgList",
                            {
                                length: params.length,
                                start: params.start,
                                type: $('#serviceOrgType').val(),
                                institutionName: $('input[name=orgName]').val()
                            }, function (res) {
                                if (res) {
                                    callback(res);
                                } else {
                                    callback({
                                        data: null,
                                        recordFiltered: 0
                                    });
                                }
                            }, 'json');
                    },
                    "searching": false,
                    "ordering": false,
                    "pageLength": 4,
                    "deferLoading": "0",
                    "columns": [
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            return '<input type="radio" name="selectId"  data-areaname="' + row.areaName + '" data-orgname="' + row.institutionName + '" value="' + row.id + '">';
                        }
                        },
                        {
                            "data": "areaName"
                        },// 所属区域
                        {
                            "data": "institutionName"
                        }
                    ]
                }
            });

            $(".table-group-action-submit").click(function () {
                _self.grid.getDataTable().ajax.reload();
            });

            $(".table-group-action-reload").click(function () {
                $("#selectOrg-form").find("input:text").val("");//找到form表单下的所有input标签并清空
            });
        },
        setServiceType: function (strs) {
            serviceType = strs;
        },
        serviceTypeInit: function () {
            //初始化服务项目
            $.post(window.apppath + "/admin/api/ServiceProject/serviceType/list", {},
                function (res) {
                    if (res.data != "") {
                        var html = "";
                        var strs = "";
                        if (serviceType != "")
                            strs = serviceType.split(",");
                        for (var i = 0; i < res.data.length; i++) {
                            html += '  <optgroup label="服务项目">';
                            if (serviceType != "" && strs.indexOf(res.data[i].name) >= 0) {
                                html += '<option value="' + res.data[i].name + '" selected>' + res.data[i].name + '</option>';
                            }
                            else
                                html += '<option value="' + res.data[i].name + '">' + res.data[i].name + '</option>';
                            html += '  </optgroup>';
                        }
                        $("#serviceType").html(html);
                        if (serviceType != "")
                            $("#serviceType").prop("disabled", true);
                        $('#serviceType').multiSelect({
                            selectableOptgroup: true
                        });
                    }
                }, 'json');
        }
    }
}();