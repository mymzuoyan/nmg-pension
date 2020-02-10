/**
 * Created by Administrator on 2016/9/13.
 */
var CustomerList = function () {
    var _self = "";
    var count = 0;
    return {
        grid: "",
        init: function () {
            _self = this;
            _self.dataTableInit();
            _self.groupInit();
            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            })


        },
        groupInit: function () {
            $.post(window.apppath + "/admin/call/api/customer/group/list", {}, function (res) {
                if (res.data != null) {
                    var data = res.data;
                    var optionHtml = "";
                    optionHtml += '<option value="">--请选择--</option>';
                    for (var i in data) {
                        optionHtml += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
                    }
                    $("#groupId").html(optionHtml);
                }
            }, "json");
        },
        dataTableInit: function () {
            _self.grid = new Datatable();
            var tableContainer = $("#datatable_customer_list").parents(".table-container");
            _self.grid.init({
                src: $("#datatable_customer_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/call/api/customer/list", {
                            length: params.length,
                            start: params.start,
                            callNum: $("input[name=callNum]").val(),
                            name: $("input[name=name]").val(),
                            gender: $("input[name=gender]:checked").val(),
                            cardId: $("input[name=cardId]").val(),
                            customerGroupId: $("#groupId").val(),
                            startAge: $("input[name=startAge]").val(),
                            endAge: $("input[name=endAge]").val(),
                            beeperAddress: EographicArea.getPosition2()
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
                        {"data": "elderName"},
                        {
                            "data": "sexDictId", render: function (data, type, row, meta) {
                            if (data != "" && data != null)
                                return ["保密", "男", "女"][data];
                            else
                                return data;
                        }
                        },
                        {
                            "data": "beeperName"
                        },
                        /*{
                            "data": "beeperNum", render: function (data, type, row, meta) {
                            if (data != null && data != "" && window.parent.getExtension() != "") {
                                return '<a class="callBackA icon-call-out" data="' + data + '"> ' + data + '</a> ';
                            }
                            return data;
                        }
                        },*/
                        {
                            "data": "beeperStatus", render: function (data, type, row, meta) {
                            if (data == null || data == "")
                                data = 0;
                            var strs = ["未安装", "已安装"];
                            return strs[data];
                        }
                        },
                        {
                            "data": "beeperAddress", render: function (data, type, row, meta) {
                            return data;
                        }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            columnHtml += '<a href= "' + window.apppath + '/admin/call/customer/update/' + data + '"  class="btn default btn-xs green-stripe info">详细</a>';
                            // columnHtml += '<button data-customerid="' + data + '" class="btn default btn-xs red-stripe del" style="">删除</button>';
                            return columnHtml;
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

            /**
             * 删除
             */
            _self.grid.getTable().on("click", "button.del", function (e) {
                var curRow = $(this).closest('tr');
                var customerId = $(this).data("customerid");
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
                        $.post(window.apppath + "/admin/call/api/customer/delete", {customerId: customerId}, function (res) {
                            Metronic.unblockUI(tableContainer);
                            if (res.success) {
                                grid.getDataTable().row(curRow).remove().draw(false);
                            } else {
                                _self.showMetroMessage(res.message);
                            }
                        }, "json");
                    }, onCancel: function () {

                    }
                }).confirmation('toggle');
            });


            _self.grid.getTableWrapper().on('click', '.callBackA', function (e) {
                var data = $(this).attr("data");
                var extension = window.parent.getExtension();
                var agentId = window.parent.getAgentId();
                if (confirm("确定回拨?")) {
                    //回拨
                    $.post(window.apppath + "/admin/call/api/callInfo/callBack", {
                        callerId: data,
                        agentId: agentId,
                        extension: extension,
                    }, function (res) {
                        console.log(JSON.stringify(res));

                    }, "json");
                }
            });

            _self.grid.getTableWrapper().on('click', '.table-group-action-submit', function (e) {
                e.preventDefault();
                grid.getDataTable().ajax.reload();
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
        }
    }

}();