/**
 * Created by gengqiang on 2017/9/8.
 */
var ServiceProjectList = function () {

    var _self = "";
    var tableContainer = $("#datatable_service_project").parent();
    return {
        init: function () {
            _self = this;
            _self.dataTableInit();
            _self.typeInit();
            $("#btnPublish").click(function () {
                _self.addPeoject();
            })
        },
        typeInit: function () {
            $.post(window.apppath + "/admin/api/dictionary/serviceType/list", {}, function (res) {
                if (res) {
                    var data = res.data;
                    var html = "<option value=''>--- 请选择 ---</option>";
                    for (var i in data) {
                        html += "<option value='" + data[i].id + "'>" + data[i].name + "</option>"
                    }
                    $("#tab_add select[name=serviceType]").html(html);
                    $("#updateProject select[name=serviceType]").html(html);

                }
            }, 'json');
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
                            status: "1",
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
                            columnHtml += '<button data-projectid="' + data + '" data-name="' + row.serviceName + '" data-typeid="' + row.serviceType + '" data-unit="' + row.serviceUnit + '" class="btn default btn-xs blue-stripe update">更新</button>';
                            columnHtml += '<button data-projectid="' + data + '"  class="btn default btn-xs red-stripe del">删除</button>';
                            return columnHtml;
                        }
                        }
                    ]
                }
            });


            /**
             * 删除
             */
            _self.grid.getTable().on("click", "button.del", function (e) {
                var curRow = $(this).closest('tr');
                var typeId = $(this).data("projectid");
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
                        $.post(window.apppath + "/admin/api/dictionary/serviceProject/delete", {id: typeId}, function (res) {
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
                var projectId = $(this).data("projectid");
                var serviceType = $(this).data("typeid");
                var serviceUnit = $(this).data("unit");
                var name = $(this).data("name");
                $("#updateProject input[name=projectId]").val(projectId);
                $("#updateProject select[name=serviceType] option[value='" + serviceType + "']").attr("selected", "selected");
                $("#updateProject select[name=serviceUnit] option[value='" + serviceUnit + "']").attr("selected", "selected");
                $("#updateProject input[name=serviceName]").val(name);
                $("#updateProject").modal("show");
            });


            $("#updateProject .btnUpdate").click(function () {
                var serviceType = $("#updateProject select[name=serviceType] option:selected").val();
                if (serviceType == null || serviceType == "") {
                    $("#labelmsg").text('请选择服务类型名称').addClass("label-danger");
                    return false;
                }
                var serviceName = $("#updateProject input[name=serviceName]").val();
                if (serviceName == null || serviceName == "") {
                    $("#labelmsg").text('请输入服务项目名称').addClass("label-danger");
                    return false;
                }
                var serviceUnit = $("#updateProject select[name=serviceUnit] option:selected").val();
                if (serviceUnit == null || serviceUnit == "") {
                    $("#labelmsg").text('请选择服务项目结算类型').addClass("label-danger");
                    return false;
                }
                $.post(window.apppath + "/admin/api/dictionary/serviceProject/update", {
                    id: $("#updateProject input[name=projectId]").val(),
                    serviceType: serviceType,
                    serviceName: serviceName,
                    serviceUnit: serviceUnit
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
        addPeoject: function () {
            var serviceType = $("#tab_add select[name=serviceType] option:selected").val();
            if (serviceType == null || serviceType == "") {
                $("#labelmsg").text('请选择服务类型名称').addClass("label-danger");
                return false;
            }
            var serviceName = $("#tab_add input[name=serviceName]").val();
            if (serviceName == null || serviceName == "") {
                $("#labelmsg").text('请输入服务项目名称').addClass("label-danger");
                return false;
            }
            var serviceUnit = $("#tab_add select[name=serviceUnit] option:selected").val();
            if (serviceUnit == null || serviceUnit == "") {
                $("#labelmsg").text('请选择服务项目结算类型').addClass("label-danger");
                return false;
            }
            else {
                $.post(window.apppath + "/admin/api/dictionary/serviceProject/add", {
                    serviceType: serviceType,
                    serviceName: serviceName,
                    serviceUnit: serviceUnit
                }, function (res) {
                    $("#btnPublish").button('reset');
                    if (res.success) {
                        alertSuccess("提示信息", "添加成功", function () {
                            window.location.reload();
                        });
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