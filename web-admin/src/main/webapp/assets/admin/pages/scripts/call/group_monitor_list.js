/**
 * Created by Administrator on 2016/9/13.
 */
var GroupMonitorList = function () {
    var _self = "";
    return {
        groupId:"",
        init: function (id) {
            _self = this;
            if(id!=null&&id!=""&&id!=0)
            {
                _self.groupId=id;
            }
            _self.dataTableInit();

        },
        dataTableInit: function () {
            var grid = new Datatable();
            var tableContainer = $("#datatable_monitor_list").parents(".table-container");
            grid.init({
                src: $("#datatable_monitor_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/call/api/monitor/list", {
                            length: params.length,
                            start: params.start,
                            groupId:_self.groupId,
                            orderField:"isLeader",
                            orderDir:"DESC"
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
                            return data;
                        }
                        },
                        {
                            "data": "account", render: function (data, type, row, meta) {
                                if(row.isLeader)
                                    return data + '<span class="pull-right" style="color: red"><i class="fa fa-tags "></i> 班长</span> ';
                                else
                                    return data
                        }
                        },
                        {"data": "name"},
                        {
                            "data": "groupName"
                        },
                        {
                            "data": "userId", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            columnHtml += '<a href="' + window.apppath + '/admin/call/monitor/update/' + data + '" class="btn default btn-xs green-stripe">详细</a>';
                            columnHtml += '<button data-monitorid="' + data + '" class="btn default btn-xs red-stripe del">删除</button>';
                            return columnHtml;
                        }
                        }
                    ]
                }
            });
            /**
             * 删除
             */
            grid.getTable().on("click", "button.del", function (e) {
                var curRow = $(this).closest('tr');
                var monitorId = $(this).data("monitorid");
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
                        $.post(window.apppath + "/admin/call/api/monitor/delete", {uid: monitorId}, function (res) {
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
            grid.getTableWrapper().on('click', '.table-group-action-submit', function (e) {
                e.preventDefault();
                grid.getDataTable().ajax.reload();
            });
        },
        showMetroMessage: function (messageContent) {
            var content=$("#datatable_monitor_list").parents(".table-container");
            Metronic.alert({
                type: 'danger',
                icon: 'warning',
                message: messageContent,
                container: content,
                place: 'prepend',
                closeInSeconds: 2
            });
        },
        getDate: function (time) {
            return time.getFullYear() + "-" +_self. formatTwo(time.getMonth() + 1) + "-" + _self.formatTwo(time.getDate());
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