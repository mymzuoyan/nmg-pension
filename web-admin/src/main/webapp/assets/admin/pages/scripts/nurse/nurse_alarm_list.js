/**
 * Created by Administrator on 2016/9/21.
 */
var NurseAlarmList = function () {

    var _self = "";
    return {
        grid: "",
        alarmType: "围栏告警",
        init: function () {
            _self = this;
            _self.tableInit();
            $(".nav-tabs a").click(function () {
                _self.alarmType = $(this).attr("data");
                $(".nav-tabs a").parent().removeClass("active");
                $(this).parent().addClass("active");
                if (_self.alarmType == "围栏告警") {
                    $("#param1").html("围栏名称");
                    $("#param2").html("围栏类型");

                }
                if (_self.alarmType == "SOS告警") {
                    $("#param1").html("经度");
                    $("#param2").html("纬度");

                }
                if (_self.alarmType == "体征告警") {
                    $("#param1").html("体征类型");
                    $("#param2").html("体征值");

                }
                if (_self.alarmType == "异常告警") {
                    $("#param1").html("异常类型");
                    $("#param2").html("状态");
                }
                _self.grid.getDataTable().ajax.reload();
            })
        },
        tableInit: function () {
            _self.grid = new Datatable();
            var tableContainer = $("#datatable_nurse_alarm_list").parents(".table-container");
            _self.grid.init({
                src: $("#datatable_nurse_alarm_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
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