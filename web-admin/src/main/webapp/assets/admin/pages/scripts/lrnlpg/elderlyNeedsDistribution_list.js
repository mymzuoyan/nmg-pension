var ElderlyNeedsDistributionList = function () {
    var grid = "";
    var type = 2;
    var handleList = function (method) {
        grid = new Datatable();
        var tableContainer = $("#datatable_bill_List").parents(".table-container");
        grid.init({
            src: $("#datatable_bill_List"),
            onSuccess: function (grid, res) {
                // execute some code after table records loaded
            },
            onError: function (grid) {
                // execute some code on network or other general error
            },
            loadingMessage: '加载中...',
            dataTable: {
                "ajax": function (params, callback, obj) {
                    $.post(window.apppath + "/admin/api/org/sojournManage/getElderlyNeedsDistributionList",
                        {
                            length: params.length,
                            start: params.start,
                            title: $('input[name=title]').val(),
                            context: $('input[name=context]').val(),
                            publisher: $('input[name=publisher]').val(),
                            releaseTime:$('input[name=releaseTime]').val(),
                            status:$('select[name=status]').val(),
                            serviceOrgName:$('input[name=serviceOrgName]').val(),
                            orderField: "id",
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
                "columns": [
                    {
                        "data": "id", render: function (data, type, row, meta) {
                            return '<input type="checkbox" name="deleteId" value="' + row.id + '">';
                        }
                    },

                    {
                        "data": "title", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },
                    {
                        "data": "context", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },
                    {
                        "data": "serviceOrgName", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },
                    {
                        "data": "publisher", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },
                    {
                        "data": "releaseTime", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },
                    {
                        "data": "status", render: function (data, type, row, meta) {
                            if(data == "" || data == 0){
                                return "<span style='color:blue'>未审核</span>";
                            }else if(data == 1){
                                return "<span style='color:green'>审核通过</span>";
                            }else if(data == 2){
                                return "<span style='color:red'>审核不通过</span>";
                            }else{
                                return "";
                            }

                        }
                    },
                    {
                        "data": "id", render: function (data, type, row, meta) {
                            return getPermission(data, type, row, meta);
                        }
                    }//操作
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
            window.parent.addTab("tab_community_service_add", "新增旅居老人需求发放信息", href);
        });

        grid.getTable().on("click", "a.info", function () {
            var href = $(this).attr("data");
            window.parent.addTab("tab_bill_info", "旅居老人需求发放详情", href);
        });


        /**
         * 审核
         */
        grid.getTable().on("click", "button.invalid", function () {
            var eventId = $(this).data("eventid");
            var status = 0;
            window.parent.confirm3("是否通过审核", "通过", "不通过", function () {
                status = 1;
                update(eventId,status);
            }, function () {
                status = 2;
                update(eventId,status);
            });
        });

        /**
         * 删除
         */
        grid.getTable().on("click", "button.del", function () {
            var curRow = $(this).closest('tr');
            var topicId = $(this).data("topicid");
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
                    $.post(window.apppath + "/admin/api/org/sojournManage/deleteElderlyNeedsDistribution", {id: topicId}, function (res) {
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
                'title': '确认？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
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

        function update(id,status) {
            $.post(window.apppath + "/admin/api/org/sojournManage/examine", {
                id: id,
                status: status,
            }, function (res) {
                if (res.success) {
                    alertSuccess("提示信息", "审核成功", function () {
                        window.location.reload();
                    });
                }
                else {
                    alert("审核失败");
                }

            }, "json");
        }

        function updateArticles(deleteIds) {
            Metronic.blockUI({
                message: '处理中...',
                target: tableContainer,
                overlayColor: 'none',
                cenrerY: true,
                boxed: true
            });
            $.post(window.apppath + "/admin/api/org/sojournManage/deleteSomeNeedsDistribution", {
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
                    url: window.apppath + "/admin/api/power/wcdfzsz/import",
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