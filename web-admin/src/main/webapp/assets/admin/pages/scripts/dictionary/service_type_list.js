/**
 * Created by gengqiang on 2017/9/8.
 */
var ServiceTypeList = function () {

    var _self = "";
    var tableContainer = $("#datatable_service_type").parent();
    return {
        init: function () {
            _self = this;
            _self.dataTableInit();
            $("#btnPublish").click(function () {
                _self.addType();
            })
        },
        dataTableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_service_type"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/dictionary/serviceType/list", {
                            length: params.length,
                            start: params.start,
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
                            "data": "name"
                        },
                        {
                            "data": "status", render: function (data, type, row, meta) {
                            if (data == 1) {
                                return '<span class="label label-info">正常</span>'
                            }
                            else {
                                return '<span class="label label-danger">禁用</span>'
                            }
                        }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            if (row.status == 1) {
                                columnHtml += '<button data-adid="' + data + '" data-status="0" class="btn default btn-xs green-stripe updateStatus">禁用</button>';
                            }
                            else {
                                columnHtml += '<button data-adid="' + data + '"  data-status="1" class="btn default btn-xs green-stripe updateStatus">解禁</button>';

                            }
                            columnHtml += '<button data-typeid="' + data + '" data-name="' + row.name + '" class="btn default btn-xs blue-stripe update">更新</button>';
                            columnHtml += '<button data-typeid="' + data + '"  class="btn default btn-xs red-stripe del">删除</button>';
                            return columnHtml;
                        }
                        }
                    ]
                }
            });


            /**
             * 禁用/解禁
             */
            _self.grid.getTable().on("click", "button.updateStatus", function (e) {
                var curRow = $(this).closest('tr');
                var typeId = $(this).attr("data-adid");
                var status = $(this).attr("data-status");
                var title = "确认禁用？";
                if (status == 1) {
                    title = "确认解禁？"
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
                        $.post(window.apppath + "/admin/api/dictionary/serviceType/update", {
                            id: typeId,
                            status: status
                        }, function (res) {
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
             * 删除
             */
            _self.grid.getTable().on("click", "button.del", function (e) {
                var curRow = $(this).closest('tr');
                var typeId = $(this).data("typeid");
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
                        $.post(window.apppath + "/admin/api/dictionary/serviceType/delete", {id: typeId}, function (res) {
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
             * 更新
             */
            _self.grid.getTable().on("click", "button.update", function (e) {
                var typeId = $(this).data("typeid");
                var name = $(this).data("name");
                $("#updateType input[name=typeId]").val(typeId);
                $("#updateType input[name=name]").val(name);
                $("#updateType").modal("show");
            });


            $("#updateType .btnUpdate").click(function () {
                if ($("#updateType input[name=name]").val() == null || $("#updateType input[name=name]").val() == "") {
                    alert("请输入服务类型名称");
                    return false;
                }
                $.post(window.apppath + "/admin/api/dictionary/serviceType/update", {
                    id: $("#updateType input[name=typeId]").val(),
                    name: $("#updateType input[name=name]").val()
                }, function (res) {
                    if (res.success) {
                        alertSuccess("提示信息", "更新成功", function () {
                            window.location.reload();

                        });
                    }
                    else {
                        alert("更新失败");
                    }

                }, "json");
            })

        },
        addType:function () {
            var name = $("#tab_add input[name=name]").val();
            if (name == null || name == "") {
                $("#labelmsg").text('请输入类型名称').addClass("label-danger");
                return false;
            }
            else {
                $.post(window.apppath + "/admin/api/dictionary/serviceType/add", {
                    name:name
                }, function (res) {
                    $("#btnPublish").button('reset');
                    if (res.success) {
                        $("#labelmsg").text(res.message).addClass("label-success");
                        setTimeout(function () {
                            window.location.reload();
                        },1000);
                    } else {
                        $("#labelmsg").text(res.message).addClass("label-danger");
                    }
                }, "json");
            }
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
    }
}();