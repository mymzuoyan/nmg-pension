var InstitutionList = function () {
    var grid = "";
    var type = 2;
    var handleList = function (method) {
        grid = new Datatable();
        var tableContainer = $("#datatable_power_List").parents(".table-container");
        grid.init({
            src: $("#datatable_power_List"),
            onSuccess: function (grid, res) {
                // execute some code after table records loaded
            },
            onError: function (grid) {
                // execute some code on network or other general error
            },
            loadingMessage: '加载中...',
            dataTable: {
                "ajax": function (params, callback, obj) {
                    $.post(window.apppath + "/admin/api/power/wcdfzsz/elderCapacityList",
                        {
                            length: params.length,
                            start: params.start,
                            type: type,
                            oldmanName: $('input[name=oldmanName]').val(),
                            phone2:$('input[name=phone2]').val(),
                            isFlag: $('select[name=isFlag]').val(),
                            householdType: $('select[name=householdType]').val(),
                            emergencyContact: $('input[name=emergencyContact]').val(),
                            capacity: $('select[name=capacity]').val(),
                            disability: $('select[name=disability]').val(),
                            idCard:$('input[name=idCard]').val(),
                            orderField: 'photoFlag DESC, infoIntegrity',
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
                    // 老人姓名
                    {
                        "data": "oldmanName", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },
                    //联系方式
                    {
                        "data": "phone2",render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }
                        }
                    },
                    // 所属区域
                    {
                        "data": "domicileAddress", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },
                    //年龄
                    {
                        "data": "age"
                    },
                    //居住地址
                    {
                        "data": "nowAddress", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },
                    // 能力评估分值
                    {
                        "data": "bilityCount", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },
                    //能力等级
                    {
                        "data": "bilityCount", render: function (data, type, row, meta) {
                            if(data <= 5){
                                return "<button class='label-default label label-danger'>自理</button>";
                            }else if(data>=6&&data<=20){
                                return "<button class='label label-info'>半失能</button>";
                            }else if(data > 20){
                                return "<button class='label-success label label-default'>失能</button>";
                            }

                        }
                    },
                    //凭证照片
                    {
                        "data": "oldmanPhoto", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                if(row.photoFlag == 2){
                                    return '<img src= '+window.apppath+''+data+'>';
                                }else if(row.photoFlag == 1){
                                    var curWwwPath = window.document.location.href;
                                    curWwwPath = curWwwPath.substr(0,curWwwPath.lastIndexOf(":")) + ":8088";
                                    return '<img src= '+curWwwPath+''+data+' style = "width: 60px;height: 50px;" >';
                                }
                            } else {
                                return "";
                            }

                        }
                    },
                    //完成度（分）
                    {
                        "data": "infoIntegrity", render: function (data, type, row, meta) {

                            if (data != null && data != "") {
                                return  data;
                            } else {
                                return "";
                            }
                        }
                    },
                    {
                        "data": "id", render: function (data, type, row, meta) {
                            var html = "";
                            if ($("#pimll").val() == "1") {
                                html += '<a data="' + window.apppath + '/admin/api/power/wcdfzsz/catacityDetail/' + data + '" class="btn default btn-xs green-stripe info" >查看</a>';
                            }

                            if ($("#pgud").val() == "1") {
                                html += '<a data="' + window.apppath + '/admin/api/power/wcdfzsz/catacityEdit/' + data + '" class="btn default btn-xs green-stripe edit" >修改</a>';
                            }
                            if ($("#cancel").val() == "1") {
                                html += '<button data-eventid="' + data + '" class="btn btn-xs red-stripe cancel" >注销</button>';
                            }
                            if ($("#serviceOrg-deleteInput").val() == "1") {
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
            window.parent.addTab("tab_capacity_add", "能力信息增加", href);
        });

        grid.getTable().on("click", "a.info", function () {
            var href = $(this).attr("data");
            window.parent.addTab("tab_capacity_info", "能力信息详情", href);
        });

        grid.getTable().on("click", "a.edit", function () {
            var href = $(this).attr("data");
            window.parent.addTab("tab_capacity_edit", "能力信息修改", href);
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
                    $.post(window.apppath + "/admin/api/power/wcdfzsz/deleteOneMsg", {id: eventId}, function (res) {
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
         * 注销
         */
        grid.getTable().on("click", "button.cancel", function () {
            var curRow = $(this).closest('tr');
            var eventId = $(this).data("eventid");
            $(this).confirmation({
                'title': '确认注销？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                'onConfirm': function () {
                    Metronic.blockUI({
                        message: '处理中...',
                        target: tableContainer,
                        overlayColor: 'none',
                        cenrerY: true,
                        boxed: true
                    });
                    $.post(window.apppath + "/admin/api/power/wcdfzsz/cancel", {id: eventId,isFlag:0}, function (res) {
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
                    updateArticles(jqchk("deleteId"));
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
            $.post(window.apppath + "/admin/api/power/wcdfzsz/deleteSomeMsg", {
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