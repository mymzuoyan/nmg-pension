var ServiceOrgAssess = function () {
    var grid = "";
    var handleList = function (method) {
        grid = new Datatable();
        var tableContainer = $("#datatable_serviceOrgAssess_List").parents(".table-container");
        var roleId = $("#roleId").val();
        var qustandard = "";
        // if (roleId == 3) {
        //     qustandard = $('#serviceOrgAssessForm input[name=qustandard]:checked').val()
        // } else {
        //     qustandard = $('#serviceOrgAssessForm input[name=qustandard]').val();
        // }
        grid.init({
            src: $("#datatable_serviceOrgAssess_List"),
            onSuccess: function (grid, res) {
                // execute some code after table records loaded
            },
            onError: function (grid) {
                // execute some code on network or other general error
            },
            loadingMessage: '加载中...',
            dataTable: {
                "ajax": function (params, callback, obj) {
                    $.post(window.apppath + "/admin/api/orgAssess/getAssessList",
                        {
                            length: params.length,
                            start: params.start,
                            serviceOrgId: $('input[name=serviceOrgId]').val(),
                            areaName: $('#serviceOrgAssessForm input[name=areaName]').val(),
                            institutionName: $('input[name=institutionName]').val(),
                            gradeDictId: $('#serviceOrgAssessForm select[name=gradeDictId]').val(),
                            standard: $('#serviceOrgAssessForm input[name=standard]:checked').val(),
                            qustandard: qustandard,
                            startDateString: $('#serviceOrgAssessForm input[name=startDateString]').val(),
                            endDateString: $('#serviceOrgAssessForm input[name=endDateString]').val()
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
                // deferLoading: 0,
                "columns": [
                    {
                        "data": "areaName", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data.split(",")[1];
                            } else {
                                return "";
                            }
                        }
                    },// 所属区域
                    {
                        "data": "institutionName", render: function (data, type, row, meta) {
                            var html = "";
                            html += '<a data="' + window.apppath + '/admin/serviceOrgDetail/' + row.serviceOrgId + '" class="info" >' + data + '</a>';
                            return html;
                        }
                    },// 单位名称
                    {
                        "data": "gradeDictId", render: function (data, type, row, meta) {
                            if (data == 0) {
                                return "A";
                            } else if (data == 1) {
                                return "AA";
                            } else if (data == 2) {
                                return "AAA";
                            } else if (data == 3) {
                                return "AAAA";
                            } else if (data == 4) {
                                return "AAAAA";
                            } else {
                                return "";
                            }//等级  1-AA级 2-AAA级 3-AAAA级 4-AAAAA级
                        }
                    },//等级
                    {
                        "data": "createTime"
                    },
                    {
                        "data": "updateTime"
                    },
                    {
                        "data": "standard", render: function (data, type, row, meta) {

                            var str = "";
                            var roleId = $("#roleId").val();
                            if (roleId == 3) {
                                var statusName = ["区审核不通过", "区审核通过", "区未审核"];
                                if (row.qustandard == 2) {
                                    str = '<label class="label" style="background-color:#cda815">' + statusName[2] + '</label>';
                                } else if (row.qustandard == 1) {
                                    str = '<label class="label " style="background-color:green">' + statusName[1] + '</label>';
                                } else if (row.qustandard == 0) {
                                    str = '<label class="label " style="background-color:red">' + statusName[0] + '</label>';
                                }
                            } else {
                                if (row.gradeDictId >= 2) {
                                    var statusName = ["区初审不通过", "区初审通过", "区未初审", "市终审不通过", "市终审通过", "区初审通过,未终审"];
                                    if (row.qustandard == 1) {
                                        if (data == 2) {
                                            str = '<label class="label " style="background-color:#cda815">' + statusName[5] + '</label>';
                                        } else if (data == 1) {
                                            str = '<label class="label " style="background-color:green">' + statusName[4] + '</label>';
                                        } else if (data == 0) {
                                            str = '<label class="label " style="background-color:red">' + statusName[3] + '</label>';
                                        }
                                    } else if (row.qustandard == 2) {
                                        str = '<label class="label" style="background-color:#cda815">' + statusName[2] + '</label>';
                                    } else if (row.qustandard == 1) {
                                        str = '<label class="label " style="background-color:green">' + statusName[1] + '</label>';
                                    } else if (row.qustandard == 0) {
                                        str = '<label class="label " style="background-color:red">' + statusName[0] + '</label>';
                                    } else {
                                        str = "";
                                    }

                                } else {
                                    var statusName = ["区审核不通过", "区审核通过", "区未审核"];
                                    if (row.qustandard == 2) {
                                        str = '<label class="label" style="background-color:#cda815">' + statusName[2] + '</label>';
                                    } else if (row.qustandard == 1) {
                                        str = '<label class="label " style="background-color:green">' + statusName[1] + '</label>';
                                    } else if (row.qustandard == 0) {
                                        str = '<label class="label " style="background-color:red">' + statusName[0] + '</label>';
                                    }
                                }
                            }

                            return str;
                        }
                    }
                    ,//等级
                    {
                        "data": "id", render: function (data, type, row, meta) {
                            var roleId = $("#roleId").val();
                            console.log(roleId);
                            // if (row.qustandard == 2 && roleId == 3) {
                            //     return '' + '<a href="' + window.apppath + '/admin/orgAssessDetail/' + data + '?method=edit&roleId=' + roleId + '' + '" class="btn default btn-xs yellow-stripe" >查看</a>';
                            // } else if (row.qustandard == 2 && roleId != 3) {
                            //     return '' + '<a href="' + window.apppath + '/admin/orgAssessDetail/' + data + '?method=edit&roleId=' + roleId + '' + '" class="btn default btn-xs blue-stripe" >查看</a>';
                            // } else if (row.standard == 2 && (roleId == 1 || roleId == 2)) {
                            //     return '' + '<a href="' + window.apppath + '/admin/orgAssessDetail/' + data + '?method=edit&roleId=' + roleId + '' + '" class="btn default btn-xs yellow-stripe" >查看</a>';
                            // } else {
                            //     return '' + '<a href="' + window.apppath + '/admin/orgAssessDetail/' + data + '?method=edit&roleId=' + roleId + '' + '" class="btn default btn-xs blue-stripe" >查看</a>';
                            // }
                            if ($("#serviceOrgSupOrgAssOrgAssList").val() == "1") {
                                return '' + '<a data="' + window.apppath + '/admin/orgAssessDetail/' + data + '?method=edit&roleId=' + roleId + '' + '" class="btn default btn-xs blue-stripe info" >查看</a>';
                            } else {
                                return "";
                            }


                        }
                    }
                ]
            }
        });

        grid.getTable().on("click", "a.info", function () {
            var href = $(this).attr("data");
            window.parent.addTab("serviceOrgAssessInfo", "组织申请评估详情", href);
        });


        $(".table-group-action-submit").click(function () {
            grid.getDataTable().ajax.reload();
        });

        $(".table-group-action-reload").click(function () {
            if ($("#roleId").val() == 3) {
                $("#serviceOrgAssessForm").find("input[name=institutionName]").val("");//找到form表单下的所有input标签并清空
                $("#serviceOrgAssessForm").find("input[name=startDateString]").val("");//找到form表单下的所有input标签并清空
                $("#serviceOrgAssessForm").find("input[name=endDateString]").val("");//找到form表单下的所有input标签并清空
            } else {
                $("#serviceOrgAssessForm").find("input:text").val("");//找到form表单下的所有input标签并清空
                $("#serviceOrgAssessForm").find("input:hidden").val("");//找到form表单下的所有input标签并清空
            }
            $("#serviceOrgAssessForm").find("select").val("");//找到form表单下的所有select标签并清空
            $("#serviceOrgAssessForm").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
            $("#serviceOrgAssessForm").find("input:radio").attr("checked", false);//找到form表单下的所有radio标签并清空
            grid.getDataTable().ajax.reload();

        });

        function showMetroMessage(messageContent) {
            Metronic.alert({
                type: 'danger',
                icon: 'warning',
                message: messageContent,
                container: tableContainer,
                place: 'prepend'
            });
        }

        grid.getTable().on("click", "button.del", function () {
            var curRow = $(this).closest('tr');
            var eventId = $(this).data("eventid");
            $(this).confirmation({
                'title': '确认删除？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                'onConfirm': function () {
                    Metronic.blockUI({
                        message: '处理中...',
                        target: tableContainer,
                        overlayColor: 'none',
                        cenrerY: true,
                        boxed: true
                    });
                    $.post(window.apppath + "/admin/api/serviceOrgDelete", {eventId: eventId}, function (res) {
                        Metronic.unblockUI(tableContainer);
                        if (res.success) {
                            grid.getDataTable().row(curRow).remove().draw(false);
                        } else {
                            showMetroMessage(res.message);
                        }
                    }, "json");
                }
            }).confirmation('toggle');
        });

        $("#btnDeleteServiceOrg").on("click", function (e) {
            var deleteIds = jqchk("deleteId");
            if (deleteIds == "") {
                showMetroMessage("未选中");
                return false;
            }
            $(this).confirmation({
                'title': '确认删除？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                'onConfirm': function () {
                    updateArticles(deleteIds);
                }
            }).confirmation('toggle');
        });

        function jqchk(name) { //jquery获取复选框值
            var chk_value = "";
            $('input[name="' + name + '"]').each(function () {
                var parentParent = $(this).parent();
                if (parentParent.hasClass("checked"))
                    chk_value += ($(this).val()) + ",";
            });
            return chk_value;
        }

        function updateArticles(deleteIds) {
            Metronic.blockUI({
                message: '处理中...',
                target: tableContainer,
                overlayColor: 'none',
                cenrerY: true,
                boxed: true
            });
            $.post(window.apppath + "/admin/api/serviceOrg/deleteSomeMsg", {
                deleteIds: deleteIds
            }, function (res) {
                Metronic.unblockUI(tableContainer);
                Metronic.alert({type: 'success', message: res.message, closeInSeconds: 3, icon: 'check'});
                grid.getDataTable().draw(false);
            }, 'json');
        }
    };

    return {

        //main function to initiate the module
        init: function (method) {
            handleList(method);
        },
        goToPage: function () {
            var page = $("#page").val();
            var len = grid.getDataTable().page.info().pages;
            if (page != "" && page != "0") {
                page = parseInt(page) - 1;
                if (page < len)
                    grid.getDataTable().page(page).draw(false);
                else {
                    alert("您输入的页数大于总页数");
                    $("#page").val("");
                }
            }
            else {
                alert("请输入不为0的数字");
                $("#page").val("");
            }

        },
        getAreaName: function () {
            $("#areaId").val(AreaTree.getSelectArea());
            $("#areaName").val(AreaTree.getAllAreaName(AreaTree.getSelectArea()));
            $("#areaModal").modal('hide');
        },
        import: function (file) {
            var excelFile = $("#" + file).val().trim();
            if (excelFile != null && excelFile != "") {
                $.ajaxFileUpload({
                    url: window.apppath + "/admin/api/serviceOrg/import",
                    secureuri: false,
                    fileElementId: file,//file控件id
                    dataType: 'json',
                    success: function (data, status) {
                        $("#msg").text(data.message).addClass("label-danger");
                    },
                    error: function (data, status, e) {
                        console.log(e);
                    }
                });
            } else {
                $("#msg").text("请上传文件！").addClass("label-danger");
            }
        }
    };
}();