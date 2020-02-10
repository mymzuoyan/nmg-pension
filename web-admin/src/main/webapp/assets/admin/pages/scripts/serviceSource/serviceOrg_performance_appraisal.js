/**
 * Created by gengqiang on 2018/1/18.
 */
var PerformanceAppraisal = function () {
    var _self = "";
    var type = 1;
    return {
        grid: "",
        init: function () {
            _self = this;
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
                        $.post(window.apppath + "/admin/api/serviceOrgList",
                            {
                                length: params.length,
                                start: params.start,
                                type: type,
                                areaName: $('input[name=areaName]').val(),
                                institutionName: $('input[name=institutionName]').val(),
                                applyName: $('input[name=applyName]').val(),
                                orderField: "a.id",
                                orderDir: "DESC"
                            }, function (res) {
                                if (res) {
                                    callback(res);
                                } else {
                                    callback({
                                        data: null,
                                        recordFiltered: 0
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
                            "data": "institutionName", render: function (data, type, row, meta) {
                            return '<div style="text-align: left">' + data + '</div>';
                        }
                        },
                        {
                            "data": "applyName"
                        },
                        {
                            "data": "mobile", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                        },
                        {
                            "data": "feedbackRate", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return parseFloat(data) * 100 + "%";
                            } else {
                                return "0";
                            }
                        }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var html = "";
                            if($("#serviceOrgSupPerformanceAppList").val()=="1"){
                                html += '<a data="' + window.apppath + '/admin/serviceOrg/' + data + '/task/list" class="btn default btn-xs green-stripe info" >查看工单列表</a>';
                            }
                            return html;
                        }
                        }
                    ]
                }

            });
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
                $("#serviceOrg-form").find("input:text").val("");//找到form表单下的所有input标签并清空
                $("#serviceOrg-form").find("select").val("");//找到form表单下的所有select标签并清空
                $("#serviceOrg-form").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
                _self.grid.getDataTable().ajax.reload();

            });

            _self.grid.getTable().on("click", "a.info", function () {
                var href = $(this).attr("data");
                window.parent.addTab("tab-service-org-task-list", "组织工单记录", href);
            });

        }, goToPage: function () {
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
        getAreaName: function () {
            $("#areaId").val(AreaTree.getSelectArea());
            $("#areaName").val(AreaTree.getAllAreaName(AreaTree.getSelectArea()));
            $("#areaModal").modal('hide');
        }
    }

}();