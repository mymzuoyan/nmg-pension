var OrgAssessDetail = function () {
    var _self = "";
    var flag=false;
    var generalRequirement = "";
    var qualification = "";
    var basicFunction = "";
    var projectAndScale = "";
    var servicePerformance = "";
    var securityAssurance = "";
    var infrastructure = "";
    var personnelAllocation = "";
    var regulatoryFramework = "";
    var supervision = "";

    $("#qustandard").change(function () {
        var qustandard = $("#qustandard").val();
        if (qustandard == 0) {
            $("#qushow").css("display", "initial");
        } else {
            $("#qushow").css("display", "none");
        }
    });
    $("#standard").change(function () {
        var standard = $("#standard").val();
        if (standard == 0) {
            $("#show").css("display", "initial");
        } else {
            $("#show").css("display", "none");
        }
    });
    return {
        "grid": "",
        //main function to initiate the module
        init: function () {
            _self = this;
        },
        allowEdit: function () {

        },
        editInit: function () {
            generalRequirement = $("input[name=generalRequirement]").val();
            qualification = $("input[name=qualification]").val();
            basicFunction = $("input[name=basicFunction]").val();
            projectAndScale = $("input[name=projectAndScale]").val();
            servicePerformance = $("input[name=servicePerformance]").val();
            securityAssurance = $("input[name=securityAssurance]").val();
            infrastructure = $("input[name=infrastructure]").val();
            personnelAllocation = $("input[name=personnelAllocation]").val();
            regulatoryFramework = $("input[name=regulatoryFramework]").val();
            supervision = $("input[name=supervision]").val();
        },
        showSelectServiceOrgModel: function () {
            $("#selectServiceOrg").modal("show");
            if (_self.grid == "") {
                _self.serviceOrgInit();
            }
            else {
                //重置
                $("#orgAssessAddForm").find("input[name=institutionName]").val("");//找到form表单下的所有input标签并清空
                _self.grid.getDataTable().ajax.reload();
            }
        },
        selectServiceOrg: function () {
            _self.serviceOrgId = $("#datatable_selectOrg_list input[name=selectId]:checked").val();
            _self.institutionName = $("#datatable_selectOrg_list input[name=selectId]:checked").attr("data");
            $("input[name=serviceOrgId]").val(_self.serviceOrgId);
            $("input[name=institutionName]").val(_self.institutionName);
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
                            return '<input type="radio" name="selectId"  data="' + row.institutionName + '" value="' + row.id + '">';
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
        import: function (file, msg) {
            var serviceOrgId = $('#serviceOrgId').val();
            var html = "";
            if (serviceOrgId != null && serviceOrgId != "") {
                var typeFile = $("#" + file).val().trim();
                if (typeFile != null && typeFile != "") {
                    var suffix = typeFile.substr(typeFile.lastIndexOf("."), typeFile.length);
                    if (suffix == ".jpg"||suffix == ".png"||suffix == ".JPG") {
                        $.ajaxFileUpload({
                            url: window.apppath + "/admin/api/orgAssess/assessUpload?id=" + serviceOrgId + "&type=" + file,
                            secureuri: false,
                            fileElementId: file,//file控件id
                            dataType: 'json',
                            success: function (data, status) {
                                var datas = data.data;
                                if (file == 'generalRequirement') {
                                    generalRequirement += datas;
                                    $("input[name=generalRequirement]").val(generalRequirement);
                                }
                                if (file == 'qualification') {
                                    qualification += datas;
                                    $("input[name=qualification]").val(qualification);
                                }
                                if (file == 'basicFunction') {
                                    basicFunction += datas;
                                    $("input[name=basicFunction]").val(basicFunction);
                                }
                                if (file == 'projectAndScale') {
                                    projectAndScale += data.data;
                                    $("input[name=projectAndScale]").val(projectAndScale);
                                }

                                if (file == 'servicePerformance') {
                                    servicePerformance += datas;
                                    $("input[name=servicePerformance]").val(servicePerformance);
                                }
                                if (file == 'securityAssurance') {
                                    securityAssurance += data.data;
                                    $("input[name=securityAssurance]").val(securityAssurance);
                                }
                                if (file == 'infrastructure') {
                                    infrastructure += data.data;
                                    $("input[name=infrastructure]").val(infrastructure);
                                }
                                if (file == 'personnelAllocation') {
                                    personnelAllocation += data.data;
                                    $("input[name=personnelAllocation]").val(personnelAllocation);
                                }
                                if (file == 'regulatoryFramework') {
                                    regulatoryFramework += data.data;
                                    $("input[name=regulatoryFramework]").val(regulatoryFramework);
                                }
                                if (file == 'supervision') {
                                    supervision += datas;
                                    $("input[name=supervision]").val(supervision);
                                }
                                $("#" + msg).text(data.message).addClass("label-danger");
                                var imgs = datas.split(",");
                                for (var i = 0; i < imgs.length - 1; i++) {
                                    html += '<div style="float: left"><img src="' + window.apppath + imgs[i] + '" style="width: 150px;height: 100px;float: left">' +
                                        '<a data="' + window.apppath + imgs[i] + '" class=" remove removeImg" style="position: initial;margin-left: -15px;">&times;</a></div>';
                                }
                                $("." + file).append(html);
                                $("#" + file).val("");
                                $(".remove").click(function () {
                                    var deteleImg = $(this).attr("data") + ",";
                                    $(this).parent().remove();
                                    datas = datas.replace(deteleImg, "");
                                    if (file == 'generalRequirement') {
                                        generalRequirement = datas;
                                        $("input[name=generalRequirement]").val(generalRequirement);
                                    }
                                    if (file == 'qualification') {
                                        qualification = datas;
                                        $("input[name=qualification]").val(qualification);
                                    }
                                    if (file == 'basicFunction') {
                                        basicFunction = datas;
                                        $("input[name=basicFunction]").val(basicFunction);
                                    }
                                    if (file == 'projectAndScale') {
                                        projectAndScale = datas;
                                        $("input[name=projectAndScale]").val(projectAndScale);
                                    }
                                    if (file == 'servicePerformance') {
                                        servicePerformance = datas;
                                        $("input[name=servicePerformance]").val(servicePerformance);
                                    }
                                    if (file == 'securityAssurance') {
                                        securityAssurance = datas;
                                        $("input[name=securityAssurance]").val(securityAssurance);
                                    }
                                    if (file == 'infrastructure') {
                                        infrastructure = datas;
                                        $("input[name=infrastructure]").val(infrastructure);
                                    }
                                    if (file == 'personnelAllocation') {
                                        personnelAllocation = datas;
                                        $("input[name=personnelAllocation]").val(personnelAllocation);
                                    }
                                    if (file == 'regulatoryFramework') {
                                        regulatoryFramework = datas;
                                        $("input[name=regulatoryFramework]").val(regulatoryFramework);
                                    }
                                    if (file == 'supervision') {
                                        supervision = datas;
                                        $("input[name=supervision]").val(supervision);
                                    }
                                });
                            },
                            error: function (data, status, e) {
                                console.log(e);
                            }
                        });
                    } else {
                        alert("请选择格式为jpg或png的图片");
                    }
                } else {
                    $("#" + msg).text("请选择文件！").addClass("label-danger");
                }
            } else {
                $("#" + msg).text("请选择评估组织！").addClass("label-danger");
            }
        },
        submitAdd: function () {
            var serviceOrgId = $('#serviceOrgId').val();
            var gradeDictId = $("#gradeDictId").val();
            if (gradeDictId == "") {
                $("#labelmsg").text('请选择申报等级！').addClass("label-danger");
            } else if ($("#orgAssessAddForm input[name=generalRequirement]").val() == "") {
                $("#labelmsg").text('请选择总体要求资料！').addClass("label-danger");
            } else if ($("#orgAssessAddForm input[name=qualification]").val() == "") {
                $("#labelmsg").text('请选择资质条件资料！').addClass("label-danger");
            } else if ($("#orgAssessAddForm input[name=basicFunction]").val() == "") {
                $("#labelmsg").text('请选择基本职能资料！').addClass("label-danger");
            } else if ($("#orgAssessAddForm input[name=projectAndScale]").val() == "") {
                $("#labelmsg").text('请选择服务项目资料！').addClass("label-danger");
            } else if ($("#orgAssessAddForm input[name=servicePerformance]").val() == "") {
                $("#labelmsg").text('请选择服务绩效资料！').addClass("label-danger");
            } else if ($("#orgAssessAddForm input[name=securityAssurance]").val() == "") {
                $("#labelmsg").text('请选择安全保障资料！').addClass("label-danger");
            } else if ($("#orgAssessAddForm input[name=infrastructure]").val() == "") {
                $("#labelmsg").text('请选择基础设施资料！').addClass("label-danger");
            } else if ($("#orgAssessAddForm input[name=personnelAllocation]").val() == "") {
                $("#labelmsg").text('请选择人员配备资料！').addClass("label-danger");
            } else if ($("#orgAssessAddForm input[name=regulatoryFramework]").val() == "") {
                $("#labelmsg").text('请选择规章制度资料！').addClass("label-danger");
            } else if ($("#orgAssessAddForm input[name=supervision]").val() == "") {
                $("#labelmsg").text('请选择监督管理资料！').addClass("label-danger");
            } else {
                if(flag)
                {
                    return false;
                }
                $("#labelmsg").text('');
                flag=true;
                var tableContainer= $("#orgAssessAddForm");
                Metronic.blockUI({
                    message: '处理中...',
                    target: tableContainer,
                    overlayColor: 'none',
                    cenrerY: true,
                    boxed: true
                });
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/orgAssess/addAssess",
                    data: $("#orgAssessAddForm").serialize(),
                    dataType: "json",
                    success: function (res) {
                        Metronic.unblockUI(tableContainer);
                        $("#submitAdd").removeAttr("disabled");
                        if (res.success) {
                            alertSuccess("提交信息", "提交成功", function () {
                                window.location.href = window.apppath + '/admin/orgAssessShow';
                            });
                        } else {
                            alertSuccess("提交信息", "提交失败");
                        }
                    },error:function () {
                        flag=false;
                        Metronic.unblockUI(tableContainer);

                    }
                });
            }
        },
        submitEdit: function () {
            var $btn = $(this);
            var serviceOrgId = $("#orgAssessShowForm input[name=serviceOrgId]").val();

            var flag1 = _self.checkStandard("standard1");
            var flag2 = _self.checkStandard("standard2");
            var flag3 = _self.checkStandard("standard3");
            var flag4 = _self.checkStandard("standard4");
            var flag5 = _self.checkStandard("standard5");
            var flag6 = _self.checkStandard("standard6");
            var flag7 = _self.checkStandard("standard7");
            var flag8 = _self.checkStandard("standard8");
            var flag9 = _self.checkStandard("standard9");
            var flag10 = _self.checkStandard("standard10");
            var qustandard = $("#qustandard").val();
            var standard = $("#standard").val();
            if (!flag1) {
                $("#labelmsg1").text('请选择总体要求评定结果！').addClass("label-danger");
            } else if (!flag2) {
                $("#labelmsg1").text('请选择资质条件评定结果！').addClass("label-danger");
            } else if (!flag3) {
                $("#labelmsg1").text('请选择基本职能评定结果！').addClass("label-danger");
            } else if (!flag4) {
                $("#labelmsg1").text('请选择服务项目评定结果！').addClass("label-danger");
            } else if (!flag9) {
                $("#labelmsg1").text('请选择服务绩效评定结果！').addClass("label-danger");
            } else if (!flag5) {
                $("#labelmsg1").text('请选择安全保障评定结果！').addClass("label-danger");
            } else if (!flag6) {
                $("#labelmsg1").text('请选择基础设施评定结果！').addClass("label-danger");
            } else if (!flag7) {
                $("#labelmsg1").text('请选择人员配备评定结果！').addClass("label-danger");
            } else if (!flag8) {
                $("#labelmsg1").text('请选择规章制度评定结果！').addClass("label-danger");
            } else if (!flag10) {
                $("#labelmsg1").text('请选择监督管理评定结果！').addClass("label-danger");
            } else {
                var roleId = $("#roleId").val();
                if (roleId == 3) {
                    if (qustandard == "") {
                        $("#labelmsg1").text('请选择评定结果！').addClass("label-danger");
                    } else if (qustandard == 0) {
                        if ($("#qucontent").val() == null || $("#qucontent").val() == "") {
                            $("#labelmsg1").text('请输入备注！').addClass("label-danger");
                        } else if (qustandard == 0) {
                            confirm2("是否确认该组织不通过此次审核", function () {
                                _self.updateAssess();
                            });
                        }
                    } else if (qustandard == 1) {
                        confirm2("是否确认该组织通过此次审核", function () {
                            _self.updateAssess();
                        });
                    }

                } else {
                    if (standard == "") {
                        $("#labelmsg1").text('请选择评定结果！').addClass("label-danger");
                    } else if (standard == 0) {
                        if ($("#content").val() == null || $("#content").val() == "") {
                            $("#labelmsg1").text('请输入备注！').addClass("label-danger");
                        } else if (standard == 0) {
                            confirm2("是否确认该组织不通过此次审核", function () {
                                _self.updateAssess();
                            });
                        }
                    } else if (standard == 1) {
                        confirm2("是否确认该组织通过此次审核", function () {
                            _self.updateAssess();
                        });
                    }
                }
            }
        },
        updateAssess: function () {
            $("#labelmsg1").text('');
            var tableContainer= $("#orgAssessAddForm");
            Metronic.blockUI({
                message: '处理中...',
                target: tableContainer,
                overlayColor: 'none',
                cenrerY: true,
                boxed: true
            });
            $.ajax({
                type: "POST",
                url: window.apppath + "/admin/api/orgAssess/updateAssess",
                data: $("#orgAssessShowForm").serialize(),
                dataType: "json",
                success: function (res) {
                    Metronic.unblockUI(tableContainer);
                    if (res.success) {
                        window.location.href = window.apppath + "/admin/orgAssessShow";
                    } else {
                        alert(res.message);
                    }
                },
                error:function () {
                    Metronic.unblockUI(tableContainer);

                }
            });
        },
        checkStandard: function (standard) {
            var standard = document.getElementsByName(standard);
            var flag = false;
            for (var i = 0; i < standard.length; i++) {
                if (standard[i].checked) {
                    flag = true;
                }
            }
            return flag;
        },
        OrgEdit: function () {
            $("#labelmsg1").text('');
            var tableContainer= $("#orgAssessAddForm");
            Metronic.blockUI({
                message: '处理中...',
                target: tableContainer,
                overlayColor: 'none',
                cenrerY: true,
                boxed: true
            });
            $.ajax({
                type: "POST",
                url: window.apppath + "/admin/api/orgAssess/orgUpdate",
                data: $("#orgAssessShowForm").serialize(),
                dataType: "json",
                success: function (res) {
                    Metronic.unblockUI(tableContainer);
                    if (res.success) {
                        alertSuccess("提交信息", "提交成功", function () {
                            window.location.href = window.apppath + '/admin/orgAssessDetail/' + $("#id").val() + '?method=edit&roleId=4';
                        });
                    } else {
                        alert(res.message);
                    }
                },
                error:function () {
                    Metronic.unblockUI(tableContainer);

                }
            });
        }
    };
}();