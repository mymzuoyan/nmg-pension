/**
 * Created by Administrator on 2018/4/14.
 */
var BraceletViewList = function () {

    var _self = "";
    return {
        grid: "",
        alarmType: "手环警告信息",
        init: function () {
            _self = this;
            _self.tableInit();
        },
        tableInit: function () {
            _self.grid = new Datatable();
            var tableContainer = $("#datatable_nurse_alarm_list").parents(".table-container");
            _self.grid.init({
                src: $("#datatable_nurse_alarm_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {

                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/nurse/alarm/getBraceletDataList", {
                            length: params.length,
                            start: params.start,
                            orderField: "id",
                            orderDir: "desc",
                            number: $('input[name=number]').val(),
                            elderName: $('input[name=elderName]').val(),
                            jhrXm: $('input[name=jhrXm]').val(),
                            jhrPhone: $('input[name=jhrPhone]').val(),
                            floor: $('input[name=floor]').val(),
                            building: $('input[name=building]').val(),
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
                            "data": "number", render: function (data, type, row, meta) {
                                if (data != "" && data != null) {
                                    return data;
                                }
                                return "";
                            }
                        },
                        {
                            "data": "elderName", render: function (data, type, row, meta) {
                                if (data != "" && data != null) {
                                    return data;
                                }
                                return "";
                            }
                        },
                        {
                            "data": "floor", render: function (data, type, row, meta) {
                                if (data != "" && data != null) {
                                    return data;
                                }
                                return "";
                            }
                        },
                        {
                            "data": "jhrXm", render: function (data, type, row, meta) {
                                if (data != "" && data != null) {
                                    return data;
                                }
                                return "";
                            }
                        },
                        {
                            "data": "jhrPhone", render: function (data, type, row, meta) {
                                if (data != "" && data != null) {
                                    return data;
                                }
                                return "";
                            }
                        },
                        {
                            "data": "gx", render: function (data, type, row, meta) {
                                if (data != "" && data != null) {
                                    return data;
                                }
                                return "";
                            }
                        },
                        {
                            "data": "signResult", render: function (data, type, row, meta) {
                                if (data != "" && data != null) {
                                    return data+" 次/分钟";
                                }
                                return "";
                            }
                        },
                        {
                            "data": "building", render: function (data, type, row, meta) {
                                if (data != "" && data != null) {
                                    return data;
                                }
                                return "";
                            }
                        },
                        {
                            "data": "number", render: function (data, type, row, meta) {
                                var columnHtml = '';
                                columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs green-stripe listHistory">查看历史</button>';
                                return columnHtml;
                            }
                        }
                    ]
                }
            });
            /**
             * 查看历史
             */
            _self.grid.getTable().on("click", "button.listHistory", function (e) {
                var braceletNumber = $(this).data("id");
                window.parent.addTab("list-history-by-number", "查看历史", window.apppath + "/admin/loveBracelet/listHistorByNumber?braceletNumber=" + braceletNumber);
            });

            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            });
            $(".reload").click(function () {
                $("#braceletWarningInfo").find("input:text").val("");//找到form表单下的所有input标签并清空
                $("#braceletWarningInfo").find("input:hidden").val("");//找到form表单下的所有input标签并清空
                $("#braceletWarningInfo").find("select").val("");//找到form表单下的所有select标签并清空
                $("#braceletWarningInfo").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
            });
        },
        getAreaName: function () {
            $("#areaId").val(AreaTree.getSelectArea());
            $("#areaName").val(AreaTree.getAllAreaName(AreaTree.getSelectArea()));
            $("#areaModal").modal('hide');
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