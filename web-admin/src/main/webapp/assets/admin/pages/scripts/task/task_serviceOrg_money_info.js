/**
 * Created by Administrator on 2016/9/21.
 */
var TaskServiceOrgMoneyInfoList = function () {

    var _self = "";
    return {
        userId: "",
        grid: "",
        init: function (id) {
            _self = this;
            _self.userId = id;
            _self.tableInit();
        },
        tableInit: function () {
            _self.grid = new Datatable();
            var tableContainer = $("#dataTable_task_serviceOrg_money_info").parents(".table-container");
            _self.grid.init({
                src: $("#dataTable_task_serviceOrg_money_info"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/task/getServiceOrgTaskMoneyInfoList", {
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
                            "data": "areaName", render: function (data, type, row, meta) {
                            if (data.split(",").length >= 2)
                                return data.split(",")[1];
                            else
                                return data.split(",")[0];
                        }
                        },
                        {"data": "serviceOrgName"}
                        ,
                        {
                            "data": "cash", render: function (data, type, row, meta) {
                            if (data > 0) {
                                return "提现"
                            }
                            else if (data < 0) {
                                return "收入"
                            }
                        }
                        },
                        {
                            "data": "cash", render: function (data, type, row, meta) {
                                return Math.abs(data);
                        }
                        },
                        {
                            "data": "type", render: function (data, type, row, meta) {
                            return payTypeValue[data];
                        }
                        }

                    ]
                }

            });
        },
        goToPage: function () {
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