/**
 * Created by Administrator on 2016/9/21.
 */
var ServiceOrgNurseList = function () {

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
            var tableContainer = $("#datatable_serviceOrg_nurse_List").parents(".table-container");
            _self.grid.init({
                src: $("#datatable_serviceOrg_nurse_List"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/nurse/serviceOrg/list", {
                            length: params.length,
                            start: params.start,
                            areaName: $('input[name=areaName]').val(),
                            serviceOrgName: $('input[name=institutionName]').val(),
                            institutionTypeDictId: $('select[name=institutionTypeDictId]').val(),
                            type: $("#type").val(),
                            institutionName:$("#institutionName").val(),
                           /* serviceArea: $('select[name=serviceArea]').val(),*/
                            gradeDictId: $('select[name=gradeDictId]').val(),
                            /*levelDictId: $('select[name=levelDictId]').val(),*/
                            regTypeDictId: $('select[name=regTypeDictId]').val(),
                            applyName: $('input[name=applyName]').val(),
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
                        },// 所属区域
                        {
                            "data": "serviceOrgName", render: function (data, type, row, meta) {
                            if (data == null && data ==""){
                                return "" ;
                            }else {
                                return data;
                            }
                        }
                        },
                        {
                            "data": "applyName"
                        },
                        {
                            "data": "mobile", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                // return data.replace(data.substr(3, 4), "****");
                                return data;
                            } else {
                                return "";
                            }

                        }
                        },// 联系电话
                        {
                            "data": "regTypeDictId", render: function (data, type, row, meta) {
                            if (data == 1) {
                                return "民非";
                            } else if (data == 2) {
                                return "工商";
                            } else if (data == 3) {
                                return "事业单位";
                            } else {
                                return "";
                            }

                        }
                        },
                        {
                            "data": "gradeDictId", render: function (data, type, row, meta) {
                            if (data == 0) {
                                return "A";
                            } else if (data == 1) {
                                return "AA";
                            } else if (data == 2) {
                                return "AAA";
                            } else if (data == 3) {
                                return "AAAA";
                            } else if (data == 4) {
                                return "AAAAA";
                            } else {
                                return "";
                            }//等级  1-AA级 2-AAA级 3-AAAA级 4-AAAAA级
                        }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            if ($("#nurseManagerSysInfo").val() == "1") {
                                columnHtml += '<a data="http://121.41.108.119:2080/xungeng/monitor/directAccress.htm?username=wl&pwd=123456" class="btn default btn-xs green-stripe scanInfo">查看实时监控</a>';
                            }
                            return columnHtml;
                        }
                        }
                    ]
                }

            });
            _self.grid.getTable().on("click", "a.scanInfo", function () {
                var href = $(this).attr("data");
                window.parent.addTab("directAccress", "楼层实时监控", href);
            });

            /**
             * 查询
             */
            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            });

            /**
             * 重置
             */
            $("#reload").click(function () {
                $("#serviceOrg-form").find("input:text").val("");//找到form表单下的所有input标签并清空
                $("#serviceOrg-form").find("select").val("");//找到form表单下的所有select标签并清空
                $("#serviceOrg-form").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
                _self.grid.getDataTable().ajax.reload();

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