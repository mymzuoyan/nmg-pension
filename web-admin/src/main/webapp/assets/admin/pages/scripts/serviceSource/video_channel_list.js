var VideoChannelList = function () {
    var grid = "";
    var handleList = function (serviceOrgId) {
        grid = new Datatable();
        var tableContainer = $("#datatable_List").parents(".table-container");
        grid.init({
            src: $("#datatable_List"),
            onSuccess: function (grid, res) {
                // execute some code after table records loaded
            },
            onError: function (grid) {
                // execute some code on network or other general error
            },
            loadingMessage: '加载中...',
            dataTable: {
                "ajax": function (params, callback, obj) {
                    $.post(window.apppath + "/admin/monitor/api/video/getChannelId",
                        {
                            length: params.length,
                            start: params.start,
                            channelId: $('input[name=channelId]').val(),
                            orgId: serviceOrgId,
                            orderField: "id",
                            orderDir: "asc"
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
                        "data": "id", render: function (data, type, row, meta) {
                            return '<input type="checkbox" name="deleteId" value="' + row.id + '">';
                        }
                    },
                    {
                        "data": "channelId"
                    },
                    {
                        "data": "id", render: function (data, type, row, meta) {
                            var html = "";
                            html += '<a data="' + data + '" data-channelid="' + row.channelId + '" class="btn default btn-xs blue-stripe info" >更新</a>';
                            html += '<button data-id="' + data + '"  class="btn default btn-xs red-stripe del">删除</button>';
                            return html;
                        }
                    }
                ]
            }
        });

        $(".table-group-action-submit").click(function () {
            grid.getDataTable().ajax.reload();
        });

        $(".table-group-action-reload").click(function () {
            $("#searchDiv").find("input:text").val("");//找到form表单下的所有input标签并清空
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


        grid.getTable().on("click", "a.info", function () {
            var orgId = serviceOrgId;
            $("#updateVideoModal input[name=id]").val($(this).attr("data"));
            $("#updateVideoModal input[name=orgId]").val(orgId);
            $("#updateVideoModal input[name=channelId]").val(($(this).data("channelid")));
            $("#updateVideoModal").modal("show");
        });

        $(".btn-add").click(function () {
            var orgId = serviceOrgId;
            $("#addVideoModal input[name=orgId]").val(orgId);
            $("#addVideoModal").modal("show");
        });

        /**
         * 删除
         */
        grid.getTable().on("click", "button.del", function (e) {
            var curRow = $(this).closest('tr');
            var typeId = $(this).data("id");
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
                    $.post(window.apppath + "/admin/monitor/api/video/delete", {id: typeId}, function (res) {
                        Metronic.unblockUI(tableContainer);
                        if (res.success) {
                            grid.getDataTable().row(curRow).remove().draw(false);
                        } else {
                            showMetroMessage(res.message);
                        }
                    }, "json");
                }, onCancel: function () {

                }
            }).confirmation('toggle');
        });

    };
    return {
        //main function to initiate the module
        init: function (serviceOrgId) {
            handleList(serviceOrgId);
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
                    url: window.apppath + "/admin/api/serviceOrg/import",
                    secureuri: false,
                    fileElementId: file,//file控件id
                    dataType: 'json',
                    success: function (data, status) {
                        $("#msg").text(data.message).addClass("label-danger");
                        if (data.data != null && data.data != "") {
                            alert(data.data);
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
        extSave: function () {
            var channelId = $("#addVideoModal input[name=channelId]").val();
            if (channelId == null || channelId == "" || channelId == undefined) {
                $("#labelmsg").text('请输入通道ID').addClass("label-danger");
                return false;
            }
            var orgId = $("#addVideoModal input[name=orgId]").val();
            if (orgId == null || orgId == "" || orgId == undefined) {
                $("#labelmsg").text('组织ID为空，请检查原因！').addClass("label-danger");
                return false;
            }
            $.post(window.apppath + "/admin/monitor/api/video/extSave", {
                orgId: orgId,
                channelId: channelId
            }, function (res) {
                if (res.success) {
                    $("#labelmsg").text("").addClass("label-success");
                    $("#addVideoModal input[name=channelId]").val("");
                    $("#addVideoModal").modal("hide");
                    grid.getDataTable().ajax.reload();
                } else {
                    $("#labelmsg").text(res.message).addClass("label-danger");
                }
            }, "json");
        },
        update: function () {
            var channelId = $("#updateVideoModal input[name=channelId]").val();
            if (channelId == null || channelId == "" || channelId == undefined) {
                $("#labelmsg").text('请输入通道ID').addClass("label-danger");
                return false;
            }
            var orgId = $("#updateVideoModal input[name=orgId]").val();
            if (orgId == null || orgId == "" || orgId == undefined) {
                $("#labelmsg").text('组织ID为空，请检查原因！').addClass("label-danger");
                return false;
            }
            $.post(window.apppath + "/admin/monitor/api/video/update", {
                id: $("#id").val(),
                orgId: orgId,
                channelId: channelId
            }, function (res) {
                if (res.success) {
                    $("#labelmsg").text("").addClass("label-success");
                    $("#updateVideoModal input[name=channelId]").val("");
                    $("#updateVideoModal").modal("hide");
                    grid.getDataTable().ajax.reload();
                } else {
                    $("#labelmsg").text(res.message).addClass("label-danger");
                }
            }, "json");
        },
    };
}();