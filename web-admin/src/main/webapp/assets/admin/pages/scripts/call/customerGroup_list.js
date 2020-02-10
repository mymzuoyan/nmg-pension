/**
 * Created by Administrator on 2016/9/13.
 */
var CustomerGroupList = function () {
    var _self = "";
    var count = 0;
    return {
        init: function () {
            _self = this;
            _self.dataTableInit();

        },
        dataTableInit: function () {
            var grid = new Datatable();
            var tableContainer = $("#datatable_customergroup_list.js").parents(".table-container");
            grid.init({
                src: $("#datatable_customergroup_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/call/api/customer/group/list", {
                            length: params.length,
                            start: params.start,
                            groupId: $('.table-group-actions select[name=groupId]').val()
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
                        {"data": "name"},
                        {"data": "contactName", render: function (data, type, row, meta) {
                            if(data==null&&data=="")
                                data="";
                            return data;
                        }},
                        {"data": "contactPhone", render: function (data, type, row, meta) {
                            if(data==null&&data=="")
                                data="";
                            if(data!=null&&data!=""&&window.parent.getExtension()!="")
                            {
                                return  '<a class="callBackA icon-call-out" data="'+data+'"> '+ data+'</a> ';
                            }
                            return data;
                        }},
                        {
                            "data": "customerCount"
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            columnHtml += '<a href="' + window.apppath + '/admin/call/customer/group/update/' + data + '" class="btn default btn-xs green-stripe">详细</a>';
                            columnHtml += '<button data-groupid="' + data + '" class="btn default btn-xs red-stripe del">删除</button>';
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
                var groupId = $(this).data("groupid");
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
                        $.post(window.apppath + "/admin/call/api/customer/group/delete", {groupId: groupId}, function (res) {
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

            grid.getTableWrapper().on('click', '.callBackA', function (e) {
                var data=$(this).attr("data");
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