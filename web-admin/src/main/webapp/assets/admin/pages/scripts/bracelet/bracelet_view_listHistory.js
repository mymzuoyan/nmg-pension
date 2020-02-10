/**
 * Created by Administrator on 2018/3/19.
 */
var BraceletListHistory = function () {

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
                        $.post(window.apppath + "/admin/api/nurse/alarm/listHistoryByNumber", {
                            braceletNumber:$("#braceletNumber").val(),
                            length: params.length,
                            start: params.start,
                            orderField: "id",
                            orderDir: "desc",
                            // fenceName: $('input[name=fenceName]').val(),
                            // jhrXm: $('input[name=jhrXm]').val(),
                            // jhrPhone: $('input[name=jhrPhone]').val(),
                            startTimeString: $('input[name=startTimeString]').val(),
                            endTimeString: $('input[name=endTimeString]').val(),
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
                            "data": "number"
                        },
                        {
                            "data": "signResult", render: function (data, type, row, meta) {
                                if (data != "" && data != null) {
                                    var result = data+" 次/分钟";
                                    return result;
                                }else{
                                    return "";
                                }
                            }
                        },
                        {
                            "data": "fenceName", render: function (data, type, row, meta) {
                                if (data != "" && data != null) {
                                    var result = data+" %";
                                    return result;
                                }else{
                                    return "";
                                }
                            }
                        },
                        {
                            "data": "alarmTime"
                        }
                    ]
                }
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