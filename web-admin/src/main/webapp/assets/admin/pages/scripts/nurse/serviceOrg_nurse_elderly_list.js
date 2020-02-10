/**
 * Created by Administrator on 2016/9/21.
 */
var ServiceOrgNurseElderlyList = function () {

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
            var tableContainer = $("#datatable_serviceOrg_nurse_elderly_List").parents(".table-container");
            _self.grid.init({
                src: $("#datatable_serviceOrg_nurse_elderly_List"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/nurse/elderly/list", {
                            length: params.length,
                            start: params.start,
                            areaName: $("#areaName").val(),
                            serviceOrgName: $("#serviceOrgName").val(),
                            idcardno: $("#idcardno").val(),
                            elderName: $("#elderName").val(),
                            deviceName: $("#deviceName").val(),
                            deviceNumber: $("#deviceNumber").val(),
                            orderField: "c.areaOrder",
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
                            "data": "areaName", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                var areaName = "";
                                if (data.split(",").length >= 2) {
                                    areaName = data.split(",")[1];
                                }
                                else
                                    areaName = data;
                                return areaName
                            } else {
                                return "";
                            }
                        }
                        },
                        {
                            "data": "serviceOrgName", render: function (data, type, row, meta) {
                            if (data != null && data != '') {
                                return '<div style="text-align: left">' + data + '</div>';
                            } else {
                                return "";
                            }

                        }
                        },
                        {
                            "data": "elderName"
                        },
                        {
                            "data": "elderAge"
                        },
                        {
                            "data": "elderSex", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return ["未知", "男", "女"][data];
                            } else {
                                return "";
                            }

                        }
                        },// 联系电话
                        {
                            "data": "deviceName"
                        },
                        {
                            "data": "bedInfo"
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            if ($("#nurseManagerSysNurse").val() == "1") {
                                columnHtml += '<a data="http://121.41.108.119:2080/xungeng/electronic/directAccess.htm?username=wl&pwd=123456" class="btn default btn-xs green-stripe setFence">围栏设置</a>';
                            }
                            return columnHtml;
                        }
                        }
                    ]
                }

            });
            $(".table-group-action-submit").click(function () {
                _self.grid.getDataTable().ajax.reload();
            });
            $(".table-group-action-reload").click(function () {
                $("#elder-form").find("input:text").val("");//找到form表单下的所有input标签并清空
                $("#elder-form").find("input:hidden").val("");//找到form表单下的所有input标签并清空
                $("#elder-form").find("select").val("");//找到form表单下的所有select标签并清空
                $("#elder-form").find("input:checkbox").parent().removeClass("checked");//找到form表单下的所有checkbox标签并清空
                $("#elder-form").find("input:checkbox").attr("checked", false);
            });
            _self.grid.getTable().on("click", "a.setFence", function () {
                var href = $(this).attr("data");
                window.parent.addTab("setFence", "老人围栏设置", href);
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

        },
        selectArea: function () {
            $('#myModal').modal({
                keyboard: true
            });
        },
        getAreaValue: function (areaName, areaId) {
            document.getElementById("areaName").value = areaName;
            document.getElementById("areaId").value = areaId;
            $('#myModal').modal('hide');
        },
    }
}();