/**
 * Created by gengqiang on 2017/9/8.
 */
var ServiceProjectApproval = function () {

    var _self = "";
    var tableContainer = $("#datatable_service_project").parent();
    return {
        init: function () {
            _self = this;
            _self.dataTableInit();
        },
        dataTableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_service_project"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/dictionary/serviceProject/list", {
                            length: params.length,
                            start: params.start,
                            status: "0",
                            orderField: 'a.id',
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
                            "data": "id"
                        },
                        {
                            "data": "serviceTypeName"
                        },
                        {
                            "data": "serviceName",
                        },
                        {
                            "data": "serviceUnit",
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                                var columnHtml = '';
                                columnHtml += '<button data-projectid="' + data + '" data-name="' + row.serviceName + '" data-typeid="' + row.serviceType + '" data-unit="' + row.serviceUnit + '" class="btn default btn-xs blue-stripe update">审批</button>';
                                columnHtml += '<button data-projectid="' + data + '"  class="btn default btn-xs red-stripe del">删除</button>';
                                return columnHtml;
                            }
                        }
                    ]
                }
            });


            /**
             * 更新
             */
            _self.grid.getTable().on("click", "button.update", function (e) {
                var projectId = $(this).data("projectid");
                var status = 0;
                window.parent.confirm3("是否通过服务项目申请", "通过", "不通过", function () {
                    status = 1;
                    _self.update(projectId,status);
                }, function () {
                    status = 2;
                    _self.update(projectId,status);
                });
            });


            /**
             * 删除
             */
            _self.grid.getTable().on("click", "button.del", function (e) {
                var curRow = $(this).closest('tr');
                var id = $(this).data("projectid");
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
                        $.post(window.apppath + "/admin/api/dictionary/serviceProject/delete", {id: id}, function (res) {
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
        update: function (id,status) {
            $.post(window.apppath + "/admin/api/dictionary/serviceProject/update", {
                id: id,
                status: status,
            }, function (res) {
                if (res.success) {
                    alertSuccess("提示信息", "  审核成功", function () {
                        window.location.reload();
                    });
                }
                else {
                    alert("审核失败");
                }

            }, "json");
        }
    }
}();