var QualificationList = function () {
    var grid = "";
    var type = 2;
    var handleList = function (method) {
        grid = new Datatable();
        var tableContainer = $("#entrySubsidytable").parents(".table-container");
        grid.init({
            src: $("#entrySubsidytable"),
            onSuccess: function (grid, res) {
                // execute some code after table records loaded
            },
            onError: function (grid) {
                // execute some code on network or other general error
            },
            loadingMessage: '加载中...',
            dataTable: {
                "ajax": function (params, callback, obj) {
                    $.post(window.apppath + "/admin/api/qualification/list",
                        {
                            length: params.length,
                            start: params.start,
                            verityStatus:$("#verityStatus").val(),
                            areaId:$("#areaName").val(),
                            orderDir: "DESC"
                        }, function (res) {
                            if (res) {
                                // if (res.recordsFiltered != 0)
                                //     $("#excel").css("display", "block")
                                // else {
                                //     $("#excel").css("display", "none")
                                // }
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
                        "data": "areaName"
                    },
                    {
                        "data": "institutionName"
                    },
                    {
                        "data": "applyTime"
                    },
                    {
                        "data": "verityStatus", render: function (data, type, row, meta) {
                        if(data == 0){
                            return "待审核";
                        }else if(data == 1){
                            return "审核通过";
                        }else if(data == 2){
                            return "审核未通过";
                        }
                      }
                    },
                    {
                        "data": "id", render: function (data, type, row, meta) {
                        var html = "";
                        if($("#verity").val() == 0){
                            html += '<a data="' + window.apppath + '/admin/qualSubsidy/verity/' + data + '" class="btn default btn-xs green-stripe info" >审核</a>';
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
        //重置
        $("#reload").click(function () {
             $("#verityStatus").val("");
             $("#areaName").val("");
        });
        //搜索按钮
        $("#search").click(function () {
            grid.getDataTable().ajax.reload();
        });

        //刷新页面
        $("#refresh").click(function () {
            window.location.reload();
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
            var href = $(this).attr("data");
            window.parent.addTab("tab_qual_subsidy", "资格补贴审核", href);
        });
        //批量删除
        $("#deleteSomeMsg").on("click", function (e) {
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
            $.post(window.apppath + "/admin/api/qualification/deleteSomeMsg", {
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
    };
}();