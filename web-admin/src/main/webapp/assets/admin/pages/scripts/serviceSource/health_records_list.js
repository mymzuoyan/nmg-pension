var HealthRecordsList = function () {
    var grid = "";
    var type = 2;
    var handleList = function (method) {
        var sign;
        var signCheckbox;
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
                    $.post(window.apppath + "/admin/org/healthRecords/getHealthRecordsList",
                        {
                            length: params.length,
                            start: params.start,
                            name: $('input[name=name]').val(),
                            hepatitis: $('input[name=hepatitis]').val(),
                            dysentery: $('input[name=dysentery]').val(),
                            typhia: $('input[name=typhia]').val(),
                            tuberculosis: $('input[name=tuberculosis]').val(),
                            tetter: $('input[name=tetter]').val(),
                            heart: $('input[name=heart]').val(),
                            liver: $('input[name=liver]').val(),
                            spleen: $('input[name=spleen]').val(),
                            lung: $('input[name=lung]').val(),
                            rests: $('input[name=rests]').val(),
                          /*  sign: $('input[name=sign]').val(),*/
                            age: $('input[name=age]').val(),
                            gender: $('select[name=gender]').val(),
                            clock: $('input[name=clock]').val(),
                            startAge: $('input[name=startAge]').val(),
                            endAge: $('input[name=endAge]').val(),
                            signCheckbox: signCheckbox,

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
                // deferLoading: 0,
                "columns": [
                    {
                        "data": "id", render: function (data, type, row, meta) {
                            return '<input type="checkbox" name="deleteId" value="' + row.id + '">';
                        }
                    },
                    //姓名
                    {
                        "data": "name", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    }, //年龄
                    {
                        "data": "age", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },//性别
                    {
                        "data": "gender", render: function (data, type, row, meta) {
                            if (data == 1) {
                                return "男";
                            }
                            if (data == 2) {
                                return "女";
                            }
                            return "";
                        }

                    },//记录时间
                    {
                        "data": "clock", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data.substring(0,10);
                            } else {
                                return "";
                            }

                        }
                    },
                    // 肝炎患病时间
                    {
                        "data": "hepatitis", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data.substring(0,10);
                            } else {
                                return "无";
                            }

                        }
                    },// 痢疾患病时间
                    {
                        "data": "dysentery", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data.substring(0,10);
                            } else {
                                return "无";
                            }

                        }
                    },// 伤寒患病时间
                    {
                        "data": "typhia", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data.substring(0,10);
                            } else {
                                return "无";
                            }

                        }
                    },//肺结核患病时间
                    {
                        "data": "tuberculosis", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data.substring(0,10);
                            } else {
                                return "无";
                            }

                        }
                    },//皮肤病患病时间
                    {
                        "data": "tetter", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data.substring(0,10);
                            } else {
                                return "无";
                            }

                        }
                    },//心功能
                    {
                        "data": "heart", render: function (data, type, row, meta) {
                            if (data == 1) {
                                return "正常";
                            }
                            if (data == 2) {
                                return "非正常";
                            }
                            return "";

                        }
                    },//肝功能
                    {
                        "data": "liver", render: function (data, type, row, meta) {
                            if (data == 1) {
                                return "正常";
                            }
                            if (data == 2) {
                                return "非正常";
                            }
                            return "";

                        }
                    },//脾功能
                    {
                        "data": "spleen", render: function (data, type, row, meta) {
                            if (data == 1) {
                                return "正常";
                            }
                            if (data == 2) {
                                return "非正常";
                            }
                            return "";

                        }
                    },//肺功能
                    {
                        "data": "lung", render: function (data, type, row, meta) {
                            if (data == 1) {
                                return "正常";
                            }
                            if (data == 2) {
                                return "非正常";
                            }
                            return "";

                        }
                    },//体征
                    {
                        "data": "sign", render: function (data, type, row, meta) {
                            arr = {
                                "1": "皮肤","2": "手癣","3": "银屑（或鳞屑）病", "4": "渗出性皮肤病", "5": "化脓性皮肤病"
                            };
                            var scopes = '';
                            if (data != "" && data != null) {
                                var scope = data.split(",");
                                for (var i = 0; i < scope.length; i++) {
                                    if (arr[scope[i]] != "" && arr[scope[i]] != null) {
                                        scopes += arr[scope[i]] + ','
                                    }
                                }
                                scopes = scopes.substr(0, (scopes.length - 1));
                            }
                            return scopes;
                        }
                    },



                    //其他病史
                  /*  {
                        "data": "rests", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },*/
                    {
                        "data": "id", render: function (data, type, row, meta) {
                            var html = "";
                            if ($("#pimll")) {
                                html += '<a data="' + window.apppath + '/admin/org/healthRecords/healthRecordsDetail?id=' + data + '" class="btn default btn-xs green-stripe info" >查看</a>';
                                html += '<button data-topicid="' + data + '" class="btn btn-xs red-stripe del">删除</button>';
                            }

                            if ($("#invalid")&&row.status==0) {
                                html += '<button data-eventid="' + data + '" class="btn btn-xs red-stripe invalid" >作废</button>';
                            }
                            return html;
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
            signCheckbox = '';
            sign = document.getElementsByName('sign');
            for (var a = 0; a < sign.length; a++) {
                if (sign[a].checked) {
                    signCheckbox = signCheckbox + sign[a].value + ",";
                }
            }

            signCheckbox = signCheckbox.substr(0, (signCheckbox.length - 1));

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
            window.parent.addTab("tab_health_recordsAdd_add", "从业人员健康记录新增", href);
        });

        grid.getTable().on("click", "a.info", function () {
            var href = $(this).attr("data");
            window.parent.addTab("tab_health_recordsAdd_detail", "从业人员健康记录详情", href);
        });


        /**
         * 作废
         */
        grid.getTable().on("click", "button.invalid", function () {
            var curRow = $(this).closest('tr');
            var eventId = $(this).data("eventid");
            $(this).confirmation({
                'title': '确认作废？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                'onConfirm': function () {
                    Metronic.blockUI({
                        message: '处理中...',
                        target: tableContainer,
                        overlayColor: 'none',
                        cenrerY: true,
                        boxed: true
                    });
                    $.post(window.apppath + "/admin/api/power/bill/invalid", {id: eventId,status:1}, function (res) {
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

        /**
         * 删除从业人员健康记录信息
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
                    $.post(window.apppath + "/admin/org/healthRecords/deleteHealthRecords", {id: topicId}, function (res) {
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
        //批量删除从业人员健康记录信息
        function updateArticles(deleteIds) {
            Metronic.blockUI({
                message: '处理中...',
                target: tableContainer,
                overlayColor: 'none',
                cenrerY: true,
                boxed: true
            });
            $.post(window.apppath + "/admin/org/healthRecords/deleteSome", {
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