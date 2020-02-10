/**
 * Created by Administrator on 2016/11/7.
 */
var GoodsList = function () {

    var tableContainer = $("#datatable_goods_list").parents(".table-container");
    var _self = "";
    return {
        init: function () {
            _self = this;
            _self.dataTableInit();

        }, dataTableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_goods_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/goods/list", {
                            length: params.length,
                            start: params.start,
                            name: $("input[name=name]").val(),
                            typeId: $("#typeId").val(),
                            orderField: 'a.putTop DESC, a.id',
                            orderDir: "DESC"
                        }, function (res) {
                            if (res) {
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
                    "columns": [
                        {
                            "data": "name", render: function (data, type, row, meta) {
                            var html = "<a href='" + window.apppath + "/goods/" + row.id + "' target='_blank'>" + data + "</a>";
                            return html;
                        }
                        }
                        ,
                        {
                            "data": "typeName"
                        },
                        {
                            "data": "amount"
                        },
                        {
                            "data": "updateTime"
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                                var columnHtml = '';
                                if (row.status == "0"){
                                    columnHtml += '<a data-closed="1" data-goodsid="' + data + '"  class="btn default btn-xs green-stripe closed">上架</a>';
                                }
                                else{
                                    columnHtml += '<a data-closed="0" data-goodsid="' + data + '"  class="btn default btn-xs red-stripe closed">下架</a>';
                                }
                                if (row.putTop == "1"){
                                    columnHtml += '<a data-puttop="0" data-goodsid="' + data + '"  class="btn default btn-xs blue-soft-stripe putTop">取消置顶</a>';
                                }
                                else{
                                    columnHtml += '<a data-puttop="1" data-goodsid="' + data + '"  class="btn default btn-xs blue-soft-stripe putTop">置顶</a>';
                                }
                                columnHtml += '<a href="' + window.apppath + '/admin/goods/update/' + data + '" class="btn default btn-xs green-stripe">详细</a>';
                                columnHtml += '<button data-goodsid="' + data + '" class="btn default btn-xs red-stripe del">删除</button>';
                            return columnHtml;
                        }
                        }
                    ]
                }

            });
            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            });

            /**
             * 上下架
             */
            _self.grid.getTable().on("click", "a.closed", function (e) {
                var id = $(this).data("goodsid");
                var closed = $(this).data("closed");
                var title = "";
                if (closed == 0) {
                    title = "确认上架该商品吗";
                }
                else {
                    title = "确认下架该商品吗";
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
                        $.post(window.apppath + "/admin/api/goods/closed",
                            {
                                id: id,
                                status: closed
                            }, function (res) {
                                Metronic.unblockUI(tableContainer);
                                if (res.success) {
                                    _self.grid.getDataTable().ajax.reload();
                                }
                                else {
                                    alert('操作失败');
                                }
                            }, "json");
                    }
                }).confirmation('toggle');
            });

            /**
             * 置顶
             */
            _self.grid.getTable().on("click", "a.putTop", function (e) {
                var id = $(this).data("goodsid");
                var putTop = $(this).data("puttop");
                var title = "";
                if (putTop == 0) {
                    title = "确认取消置顶该商品吗";
                }
                else {
                    title = " 确认置该顶商品吗";
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
                        $.post(window.apppath + "/admin/api/goods/update",
                            {id:id, putTop:putTop}, function (res) {
                                Metronic.unblockUI(tableContainer);
                                if (res.success) {
                                    _self.grid.getDataTable().ajax.reload();
                                }
                                else{
                                    alert('操作失败');
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
                var goodsId = $(this).data("goodsid");
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
                        $.post(window.apppath + "/admin/api/goods/delete", {id: goodsId}, function (res) {
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