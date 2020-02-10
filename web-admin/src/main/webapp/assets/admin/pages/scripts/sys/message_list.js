/**
 * Created by Administrator on 2016/11/7.
 */
var MessageList = function () {

    var tableContainer = $("#datatable_message_list").parents(".table-container");
    var _self = "";
    return {
        init: function () {
            _self = this;
            _self.dataTableInit();

        }, dataTableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_message_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/message/list", {
                            length: params.length,
                            start: params.start,
                            orderField: 'id',
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
                    // deferLoading: 0,
                    "columns": [
                        {
                            "data": "id", render: function (data, type, row, meta) {
                                return '<input type="checkbox" value="' + row.id + '">';
                        }
                        },
                        {
                            "data": "title", render: function (data, type, row, meta) {
                            return data;
                        }
                        }
                        ,
                        {
                            "data": "creatorName"
                        },
                        {
                            "data": "createTime"
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            columnHtml += '<a data="' + window.apppath + '/admin/message/update/' + data + '" class="btn default btn-xs green-stripe detail">详细</a>';
                            columnHtml += '<button data-mesid="' + data + '" class="btn default btn-xs red-stripe del">删除</button>';
                            return columnHtml;
                        }
                        }
                    ]
                }

            });

            _self.grid.getTable().on("click", "a.detail", function (e) {
                var href = $(this).attr("data");
                window.parent.addTab("msgdetail", "公告详情", href);
            });
            /**
             * 删除
             */
            _self.grid.getTable().on("click", "button.del", function (e) {
                var curRow = $(this).closest('tr');
                var id = $(this).data("mesid");
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
                        $.post(window.apppath + "/admin/api/message/delete", {id: id}, function (res) {
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

        }

    }

}();