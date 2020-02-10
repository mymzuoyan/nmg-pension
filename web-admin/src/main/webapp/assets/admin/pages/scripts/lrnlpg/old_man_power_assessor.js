/**
 * Created by sp on 2018/9/11
 */
var powerAssessor = function () {

    var _self = "";
    var grid = "";
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
                    $.post(window.apppath + "/admin/api/power/assessor/serviceAssessorList",
                        {
                            length: params.length,
                            start: params.start,
                            name: $('input[name=name]').val(),
                            area: $('input[name=area]').val(),
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
                    {
                        "data": "loginName", render: function (data, type, row, meta) {
                            return '<div style="text-align: center">' + data + '</div>';
                        }
                    },
                    {
                        "data": "name", render: function (data, type, row, meta) {
                            return '<div style="text-align: center">' + data + '</div>';
                        }
                    },
                    {
                        "data": "loginName", render: function (data, type, row, meta) {
                            return '';
                        }
                    },{
                        "data": "loginName", render: function (data, type, row, meta) {
                            return '<div style="text-align: center">评估员</div>';
                        }
                    },

                    {
                        "data": "area", render: function (data, type, row, meta) {
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
                        "data": "useStatus", render: function (data, type, row, meta) {
                                if(data==0){
                                    return "启用";
                                }else if(data==1){
                                    return "停用";
                                }else {
                                    return data;
                                }
                        }
                    },
                    {
                        "data": "serverStatus", render: function (data, type, row, meta) {
                                if(data==0){
                                    return "正常服务";
                                }else if(data==1){
                                    return "停止服务";
                                }else {
                                    return data;
                                }

                        }
                    },
                    {
                        "data": "createDate"
                    },
                    {
                        "data": "express", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                // return data.replace(data.substr(3, 4), "****");
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },
                    {
                        "data": "id", render: function (data, type, row, meta) {
                            var html = "";
                            // if ($("#pimll").val() == "1") {
                            //     html += '<a data="' + window.apppath + '/admin/institution/detail/' + data + '" class="btn default btn-xs green-stripe info" >查看</a>';
                            // }
                            //
                            // if ($("#serviceOrg-delete").is(":visible") && $("#serviceOrg-deleteInput").val() == "1") {
                            //     html += '<button data-eventid="' + data + '" class="btn btn-xs red-stripe del" >删除</button>';
                            // }
                            html += '<button data="' + window.apppath + '/admin/api/power/assessor/assessorDetail?id=' + data + '"  class="btn btn-xs red-stripe info" >详细</button>';
                            html += '<button data="' + window.apppath + '/admin/api/power/assessor/assessorUpdate?id=' + data + '"  class="btn btn-xs red-stripe edit" >编辑</button>';
                            if(row.useStatus=='启用'){
                                html += '<button data-eventid="' + data + '" class="btn btn-xs red-stripe disable" >停用</button>';
                            }else if(row.useStatus=='停用'){
                                html += '<button data-eventid="' + data + '" class="btn btn-xs red-stripe enable" >启用</button>';
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
            window.location.href = window.apppath + "/admin/api/power/assessor/export?"
                + "name=" + encodeURI(encodeURI($("input[name=name]").val())) + "&"
                + "area=" + encodeURI(encodeURI($("input[name=area]").val()));

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
            window.parent.addTab("tab_assessor_add", "评估人增加", href);
        });

        grid.getTable().on("click", "button.info", function () {
            var href = $(this).attr("data");
            window.parent.addTab("tab_assessor_detail", "评估人详情信息", href);
        });
        grid.getTable().on("click", "button.edit", function () {
            var href = $(this).attr("data");
            window.parent.addTab("tab_assessor_edit", "评估人修改", href);
        });
        grid.getTable().on("click", "button.disable", function () {
            var useStatus="停用";
            var curRow = $(this).closest('tr');
            var eventId = $(this).data("eventid");
            $(this).confirmation({
                'title': '确认停用？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                'onConfirm': function () {
                    Metronic.blockUI({
                        message: '处理中...',
                        target: tableContainer,
                        overlayColor: 'none',
                        cenrerY: true,
                        boxed: true
                    });
                    $.post(window.apppath + "/admin/api/power/assessor/addorupdate", {id: eventId,useStatus:useStatus}, function (res) {
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
        grid.getTable().on("click", "button.enable", function () {
            var useStatus="启用";
            var curRow = $(this).closest('tr');
            var eventId = $(this).data("eventid");
            $(this).confirmation({
                'title': '确认启用？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                'onConfirm': function () {
                    Metronic.blockUI({
                        message: '处理中...',
                        target: tableContainer,
                        overlayColor: 'none',
                        cenrerY: true,
                        boxed: true
                    });
                    $.post(window.apppath + "/admin/api/power/assessor/addorupdate", {id: eventId,useStatus:useStatus}, function (res) {
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
            $.post(window.apppath + "/admin/api/power/assessor/deleteAssessor", {
                deleteIds: deleteIds
            }, function (res) {
                Metronic.unblockUI(tableContainer);
                Metronic.alert({type: 'success', message: res.message, closeInSeconds: 3, icon: 'check'});
                grid.getDataTable().draw(false);
            }, 'json');
        }
    };
    return {
        "grid": "",
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
                    url: window.apppath + "/admin/api/power/assessor/import",
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
        },
        addorupdate:function () {
                var data=$("#serviceOrg-form").serialize();
            $.ajax({
                url : window.apppath+'/admin/api/power/assessor/addorupdate',
                data:data,
                type:'post',
                dataType:'json',
                success : function(data) {
                    var result = data.success;
                    if (result != 'true') {
                        alert(data.message);
                        window.parent.updateTab("tab_pggl-assessor");
                        window.parent.closeTab("tab_assessor_add");
                        window.parent.closeTab("tab_assessor_edit");
                    } else {
                        alert(data.message);
                    }
                }
            })
        }

    }
}();