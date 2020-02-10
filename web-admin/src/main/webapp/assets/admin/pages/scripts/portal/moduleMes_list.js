/**
 * Created by Administrator on 2016/11/7.
 */
var ModuleMesList = function () {

    var tableContainer = $("#datatable_moduleMes_list").parents(".table-container");
    var _self = "";
    return {
        init: function () {
            _self = this;
            _self.dataTableInit();

        }, dataTableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_moduleMes_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/moduleMes/list", {
                            length: params.length,
                            start: params.start,
                            title: $("input[name=title]").val(),
                            moduleId: $("#moduleId").val(),
                            creatorName: $("input[name=creatorName]").val(),
                            orderField: 'a.putTop DESC, a.id',
                            orderDir: "DESC"
                        }, function (res) {
                            if (res) {
                                $("#verifyDiv").show();
                                callback(res);
                            } else {
                                callback({
                                    data: null,
                                    recordsFiltered: 0
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
                            if (row.status == "0")
                                return '<input type="checkbox" name="verifyId" value="' + row.id + '">';
                            else
                                return "";
                        }
                        },
                        {
                            "data": "title", render: function (data, type, row, meta) {
                            var html = "<a href='" + window.apppath + "/moduleMes/" + row.id + "' target='_blank'>" + data + "</a>";
                            return html;
                        }
                        }
                        ,
                        {
                            "data": "module"
                        },
                        {
                            "data": "creatorName"
                        },
                        {
                            "data": "createTime"
                        },
                        {
                            "data": "status", render: function (data, type, row, meta) {
                            if (data != null) {
                                var strs = ["<sapn style='color:red'>未审核</sapn>", "已审核"]
                                return strs[data];
                            } else {
                                return "";
                            }
                        }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            var putTop = $("input[name=putTop]").val();
                            if (putTop == 1) {
                                if (row.putTop == "1")
                                    columnHtml += '<a data-puttop="0" data-mesid="' + data + '"  class="btn default btn-xs blue-soft-stripe putTop">取消置顶</a>';
                                else
                                    columnHtml += '<a data-puttop="1" data-mesid="' + data + '"  class="btn default btn-xs blue-soft-stripe putTop">置顶</a>';
                            }
                            if($("#elderServiceNewsList").val()=="1"){
                                columnHtml += '<a href="' + window.apppath + '/admin/moduleMes/update/' + data + '" class="btn default btn-xs green-stripe">详细</a>';
                            }
                            var pre = $("input[name=delete]").val();
                            if (pre == 1)
                                columnHtml += '<button data-mesid="' + data + '" class="btn default btn-xs red-stripe del">删除</button>';
                            return columnHtml;
                        }
                        }
                    ]
                }

            });

            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            })

            /**
             * 置顶
             */

            _self.grid.getTable().on("click", "a.putTop", function (e) {
                var id = $(this).data("mesid");
                var putTop = $(this).data("puttop");
                var title = "";
                if (putTop == 0) {
                    title = "确认置顶该篇文章吗";
                }
                else {
                    title = " 确认取消置顶该篇文章吗";
                }
                $(this).confirmation({
                    'title': title, 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                    'onConfirm': function () {
                        Metronic.blockUI({
                            message: '处理中...',
                            target: tableContainer,
                            overlayColor: 'none',
                            cenrerY: true,
                            boxed: true
                        });
                        $.post(window.apppath + "/admin/api/moduleMes/update",
                            {id: id, putTop: putTop}, function (res) {
                                Metronic.unblockUI(tableContainer);
                                if (res.success) {
                                    _self.grid.getDataTable().ajax.reload();
                                } else {
                                }
                            }, "json");
                    }
                }).confirmation('toggle');
            });


            /**
             * 删除
             */
            _self.grid.getTable().on("click", "button.del", function (e) {
                var curRow = $(this).closest('tr');
                var moduleMesId = $(this).data("mesid");
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
                        $.post(window.apppath + "/admin/api/moduleMes/delete", {id: moduleMesId}, function (res) {
                            Metronic.unblockUI(tableContainer);
                            if (res.success) {
                                _self.grid.getDataTable().row(curRow).remove().draw(false);
                            } else {
                                _self.showMetroMessage(res.message);
                            }
                        }, "json");
                    }, onCancel: function () {

                    }
                }).confirmation('toggle');
            });


            /**
             * 审核
             */
            $("#verify").click(function () {
                var selectIds = _self.jqchk("verifyId");
                if (selectIds == "") {
                    _self.showMetroMessage("未选中");
                    return false;
                }
                $(this).confirmation({
                    'title': '审核结果？', 'placement': 'left', 'btnOkLabel': '审核通过', 'btnCancelLabel': '取消',
                    'onConfirm': function () {
                        _self.verifyModuleMes(selectIds);
                    }
                }).confirmation('toggle');
            });

        },
        verifyModuleMes: function (selectIds) {
            Metronic.blockUI({
                message: '处理中...',
                target: tableContainer,
                overlayColor: 'none',
                cenrerY: true,
                boxed: true
            });
            $.post(window.apppath + "/admin/api/moduleMes/verify", {
                selectIds: selectIds
            }, function (res) {
                Metronic.unblockUI(tableContainer);
                if (res.success) {
                    Metronic.alert({type: 'success', message: res.message, closeInSeconds: 3, icon: 'check'});
                    _self.grid.getDataTable().draw(false);
                }
                else
                    Metronic.alert({type: 'danger', message: res.message, closeInSeconds: 3, icon: 'check'});
            }, 'json');

        },
        showMetroMessage: function (messageContent) {
            Metronic.alert({
                type: 'danger',
                icon: 'warning',
                message: messageContent,
                container: tableContainer,
                place: 'prepend',
                closeInSeconds: 2
            });
        },
        getDate: function (time) {
            return time.getFullYear() + "-" + _self.formatTwo(time.getMonth() + 1) + "-" + _self.formatTwo(time.getDate());

        },
        formatTwo: function (str) {
            str = str + "";
            if (str.length == 1) {
                str = "0" + str;
            }
            return str;
        }, goToPage: function () {
            var page = $("#page").val();
            var len = _self.grid.getDataTable().page.info().pages;
            if (page != "" && page != "0") {
                page = parseInt(page) - 1;
                if (page < len)
                    _self.grid.getDataTable().page(page).draw(false);
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
        jqchk: function (name) { //jquery获取复选框值
            var chk_value = "";
            $('input[name="' + name + '"]').each(function () {
                var parentParent = $(this).parent();
                if (parentParent.hasClass("checked"))
                    chk_value += ($(this).val()) + ",";
            });
            return chk_value;
        }

    }

}();