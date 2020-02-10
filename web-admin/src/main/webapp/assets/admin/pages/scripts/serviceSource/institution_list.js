var InstitutionList = function () {
    var grid = "";
    var type = 2;
    var handleList = function (method) {
        grid = new Datatable();
        var tableContainer = $("#datatable_serviceOrg_List").parents(".table-container");
        grid.init({
            src: $("#datatable_serviceOrg_List"),
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
                            type: type,
                            areaName: $('input[name=areaName]').val(),
                            serviceProject: $('input[name=serviceProject]').val(),
                            institutionName: $('input[name=institutionName]').val(),
                            applyName:$('input[name=applyName]').val(),
                            serviceArea: $('select[name=serviceArea]').val(),
                            gradeDictId: $('select[name=gradeDictId]').val(),
                            levelDictId: $('select[name=levelDictId]').val(),
                            regTypeDictId: $('select[name=regTypeDictId]').val(),
                            isPensionPermit: $('select[name=isPensionPermit]').val(),
                            isFoodSafePermit: $('select[name=isFoodSafePermit]').val(),
                            orderField: "a.areaOrder",
                            orderDir: "DESC"
                        }, function (res) {
                            if (res) {
                                if (res.recordsFiltered != 0)
                                    $("#excel").css("display", "block")
                                else {
                                    $("#excel").css("display", "none")
                                }
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
                        "data": "id", render: function (data, type, row, meta) {
                        return '<input type="checkbox" name="deleteId" value="' + row.id + '">';
                    }
                    },
                    {
                        "data": "areaName", render: function (data, type, row, meta) {
                        if (data != "" && data != null) {
                            var areaName = "";
                            if (data.split(",").length >= 2) {
                                areaName = data.split(",")[1];
                            }
                            else
                                areaName = data;
                            return areaName
                        } else {
                            return "";
                        }
                    }
                    },// 所属区域
                    {
                        "data": "institutionName", render: function (data, type, row, meta) {
                        return '<div style="text-align: left">' + data + '</div>';
                    }
                    },// 单位名称
                    {
                        "data": "institutionsCategory", render: function (data, type, row, meta) {
                        if (data != null && data != '') {
                            var categorys=["公办养老机构","民办养老机构","公建民营机构","农村敬老院","农村中心敬老院","城市福利院","公建国营","公建民营","民办非营利性","民办营利性"];
                            return categorys[data-1];
                        } else {
                            return "";
                        }

                    }
                    },
                    {
                        "data": "applyName"
                    },
                    {
                        "data": "mobile", render: function (data, type, row, meta) {
                        if (data != "" && data != null) {
                            // return data.replace(data.substr(3, 4), "****");
                            return data;
                        } else {
                            return "";
                        }

                    }
                    },// 联系电话
                    {
                        "data": "regTypeDictId", render: function (data, type, row, meta) {
                        if (data == 1) {
                            return "民非";
                        } else if (data == 2) {
                            return "工商";
                        } else if (data == 3) {
                            return "事业单位";
                        } else {
                            return "";
                        }

                    }
                    },
                    {
                        "data": "gradeDictId", render: function (data, type, row, meta) {
                        if (data == 1) {
                            return "1星";
                        } else if (data == 2) {
                            return "2星";
                        } else if (data == 3) {
                            return "3星";
                        } else if (data == 4) {
                            return "4星";
                        } else if (data == 5) {
                            return "5星";
                        } else {
                            return "";
                        }
                    }
                    },//等级
                    {
                        "data": "designBedCount"
                    },
                    {
                        "data": "status", render: function (data, type, row, meta) {
                        if (data == null) {
                            return "";
                        }
                        var strs = ["<span style='color: red'>未审核</span>", "审核通过", "平台导入"];
                        return strs[data];
                    }
                    },
                    {
                        "data": "isPensionPermit", render: function (data, type, row, meta) {
                        var isOrnot = ['否', '是'];
                        if (data != null) {
                            return isOrnot[data];
                        } else {
                            return "";
                        }
                    }
                    },
                    {
                        "data": "isFoodSafePermit", render: function (data, type, row, meta) {
                        var isOrnot = ['否', '是'];
                        if (data != null) {
                            return isOrnot[data];
                        } else {
                            return "";
                        }
                    }
                    },
                    {
                        "data": "id", render: function (data, type, row, meta) {
                        var html = "";
                        if ($("#pimll").val() == "1") {
                            html += '<a data="' + window.apppath + '/admin/institution/detail/' + data + '" class="btn default btn-xs green-stripe info" >查看</a>';
                        }

                        if ($("#serviceOrg-delete").is(":visible") && $("#serviceOrg-deleteInput").val() == "1") {
                            html += '<button data-eventid="' + data + '" class="btn btn-xs red-stripe del" >删除</button>';
                        }
                        return html;
                    }
                    }
                ]
            }
        });

        $(".table-group-action-import").click(function () {
            $('#impModal').modal({
                keyboard: true
            });
        });

        $(".table-group-action-submit").click(function () {
            grid.getDataTable().ajax.reload();
        });

        //导出数据
        $(".excel").click(function () {
            window.location.href = window.apppath + "/admin/api/serviceOrgList/export?"
                + "areaName=" + $("input[name=areaName]").val() + "&"
                + "institutionName=" + $("input[name=institutionName]").val() + "&"
                + "type=2&"
                + "regTypeDictId=" + $('select[name=regTypeDictId]').val() + "&"
                + "gradeDictId=" + $('select[name=gradeDictId]').val();

        });

        //导出账号
        $(".btn-account").click(function () {
            window.location.href = window.apppath + "/admin/api/serviceOrgList/exportAccount";
        });

        //关闭并刷新页面
        $(".btn-close").click(function () {
            window.location.reload();
        });

        $(".table-group-action-reload").click(function () {
            $("#serviceOrg-form").find("input:text").val("");//找到form表单下的所有input标签并清空
            $("#serviceOrg-form").find("input:hidden").val("");//找到form表单下的所有input标签并清空
            $("#serviceOrg-form").find("select").val("");//找到form表单下的所有select标签并清空
            $("#serviceOrg-form").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
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


        $(".table-group-action-add").click(function () {
            var href = $(this).attr("data");
            window.parent.addTab("tab_institution_add", "养老机构增加", href);
        });

        grid.getTable().on("click", "a.info", function () {
            var href = $(this).attr("data");
            window.parent.addTab("tab_institution_info", "养老机构详情信息", href);
        });


        /**
         * 删除
         */
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
        importFile: function (file) {
            $("#msg").text("导入中...").addClass("label-danger");
            var excelFile = $("#" + file).val().trim();
            if (excelFile != null && excelFile != "") {
                $.ajaxFileUpload({
                    url: window.apppath + "/admin/api/institution/import",
                    // url: window.apppath + "/admin/api/institution/importMoreInfo",
                    data: {type: 2},
                    secureuri: false,
                    fileElementId: file,//file控件id
                    dataType: 'json',
                    success: function (data, status) {
                        $("#msg").text(data.message).addClass("label-danger");
                        if (data.data != null && data.data != "") {
                            alert(data.data);
                        } else {
                            $(".btn-account").show();
                        }
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