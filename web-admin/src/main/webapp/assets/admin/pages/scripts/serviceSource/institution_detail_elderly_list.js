/**
 * Created by gengqiang on 2018/1/15.
 */
var InstitutionDetailElderlyList = function () {
    var _self = "";
    var tableContainer = $("#table").parent();

    return {
        grid: "",
        serviceOrgId: "",
        init: function (id) {
            _self = this;
            _self.serviceOrgId = id;
            _self.tableInit();
        },
        tableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/institution/elderly/list", {
                            length: params.length,
                            start: params.start,
                            "serviceOrg.id": _self.serviceOrgId,
                            "elderlyMsg.elderName":$("input[name =elderName]").val(),
                            "serviceOrg.institutionName":$("input[name=institutionName]").val()
                        }, function (res) {
                            console.log(res);
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
                            return '<input type="checkbox" name="deleteId" value="' + row.id + '">';
                        }
                        },
                        {
                            "data": "number"
                        },
                        {
                            "data": "elderlyMsg.elderName"
                        },
                        {
                            "data": "elderlyMsg.gender", render: function (data, type, row, meta) {
                            if (data != null && data != "")
                                return data;
                            else
                                return "";
                        }
                        },
                        {"data": "elderlyMsg.age"},

                        {
                            "data": "checkInTime"
                        },
                        {
                            "data": "checkOutTime"
                        },
                        {
                            "data": "bedInfo"
                        },
                        {
                            "data": "bedStatus", render: function (data, type, row, meta) {
                            if (data != null) {
                                return institutionElderlyStatus[data];
                            } else {
                                return "";
                            }
                        }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            /*columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs blue-stripe info">详细</button>';*/
                            columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs green-stripe update">修改</button>';
                            columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs red-stripe del">删除</button>';
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
                var Id = $(this).data("id");
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
                        $.post(window.apppath + "/admin/api/institution/elderly/delete", {id: Id}, function (res) {
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
                var id = $(this).data("id");
                window.parent.addTab("institution_elderly_update", "入住老人更新", window.apppath + "/admin/institution/elderly/update/" + id);
            });

            /**
             * 刷新
             */
            $("#refresh").click(function () {
                _self.grid.getDataTable().ajax.reload();
            })

            /**
             * 查询
             */
            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            })

            /**
             * 重置
             */
            $("#reload").click(function () {
                $("#searchDiv").find("input:text").val("");//找到form表单下的所有input标签并清空
                $("#searchDiv").find("select").val("");//找到form表单下的所有select标签并清空
                $("#searchDiv").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
                _self.grid.getDataTable().ajax.reload();

            });
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

        }
    }
}();