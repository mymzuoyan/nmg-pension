var LetterList = function () {
    var grid = "";
    var handleList = function (method) {
        grid = new Datatable();
        var tableContainer = $("#datatable_letter_list").parents(".table-container");
        grid.init({
            src: $("#datatable_letter_list"),
            onSuccess: function (grid, res) {
                // execute some code after table records loaded
            },
            onError: function (grid) {
                // execute some code on network or other general error
            },
            loadingMessage: '加载中...',
            dataTable: {
                "ajax": function (params, callback, obj) {
                    $.post(window.apppath + "/admin/api/letter/list",
                        {
                            length: params.length,
                            start: params.start,
                            letterType: $('select[name=letterType]').val(),
                            letterTitle: $('input[name=letterTitle]').val()
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
                    /*{
                     "data": "id", render: function (data, type, row, meta) {
                     return '<input type="checkbox" name="deleteId" value="' + row.id + '">';
                     }
                     },*/
                    {
                        "data": "letterType", render: function (data, type, row, meta) {
                        if (data == 1) {
                            return "意见";
                        } else if (data == 2) {
                            return "咨询";
                        } else if (data == 3) {
                            return "投诉";
                        } else if (data == 4) {
                            return "其他";
                        } else {
                            return "";
                        }
                    }
                    },// 信件类型
                    {"data": "letterTitle"},// 信件标题
                    {
                        "data": "letterContent", render: function (data, type, row, meta) {
                        if (data != "" && data != null) {
                            return '<div title="' + data + '" style="text-overflow: ellipsis;width: 250px;overflow: hidden;white-space: nowrap">' + data + '</div>';
                        } else {
                            return "";
                        }
                    }
                    },//信件内容
                    {"data": "createTime"},//发布时间
                    {
                        "data": "id", render: function (data, type, row, meta) {

                        if($("#elderServiceLetterList").val()=="1"){
                            return '' + '<a href="' + window.apppath + '/admin/letter/info/' + data + '" class="btn default btn-xs blue-stripe">详细</a>'
                        }else{
                            return "";
                        }

                        /*'<button data-eventid="' + data + '" class="btn btn-xs red-stripe del">删除</button>';*/

                    }
                    }
                ]
            }
        });

        $(".table-group-action-submit").click(function () {
            grid.getDataTable().ajax.reload();
        })


        $(".table-group-action-reload").click(function () {
            $('select[name=letterType]').val('');
            $('input[name=letterTitle]').val('');
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
                    $.post(window.apppath + "/admin/api/serviceprovidersDelete", {eventId: eventId}, function (res) {
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

        $("#btnDeleteServiceProviders").on("click", function (e) {
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
            $.post(window.apppath + "/admin/api/serviceOrgProviders/deleteSomeMsg", {
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
            var len =grid.getDataTable().page.info().pages;
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

        }
    };
}();