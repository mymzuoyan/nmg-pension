/**
 * Created by CoderQiang on 2017/1/9.
 */
var HomeOrgInit = function () {

    var _self = "";
    return {
        grid: "",
        init: function () {
            _self = this;
            _self.tableInit();
            _self.getData();
        },
        getData: function () {
            $.post(window.apppath + "/admin/api/user/getOrgStatisticsData",
                {}, function (data) {
                    if (data != "") {
                        var ids = ["elderlyCount", "bedCount", "emptyBedCount", "fuwuCount", "volunteersCount"];
                        var flag = 0;
                        for (var i in data) {
                            $("#" + ids[flag]).html(data[i] + $("#" + ids[flag]).html());
                            flag++;
                        }
                    }
                }, "json");
        },
        tableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_nurse_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/nurse/alarm/list", {
                            length: params.length,
                            start: params.start,
                            alarmType: _self.alarmType,
                            orderField: "a.id",
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
                    "columns": [
                        {
                            "data": "number"
                        },
                        {
                            "data": "elderName"
                        },
                        {
                            "data": "alarmType"
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                                if (row.alarmType == "SOS告警") {
                                    return row.building;
                                } else if (row.alarmType == "围栏告警") {
                                    return row.fenceName;
                                } else if (row.alarmType == "体征告警") {
                                    if (row.signType != null && row.signType != ""&&row.signType!="99")
                                        return signTypeName[row.signType];
                                    else {
                                        return "";
                                    }
                                }
                                return "";
                            }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                                if (row.alarmType == "SOS告警") {
                                    return row.floor;
                                } else if (row.alarmType == "围栏告警") {
                                    return row.fenceType;
                                }
                                else if (row.alarmType == "体征告警") {
                                    if (row.signResult != null && row.signResult != "") {
                                        return row.signResult;
                                    } else {
                                        return "";
                                    }
                                }
                                return "";
                            }
                        },
                        {
                            "data": "alarmTime"
                        }
                    ]
                }

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