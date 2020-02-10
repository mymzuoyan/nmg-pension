/**
 * Created by gengqiang on 2018/1/22.
 */
var ServiceOrgSubsidyApplyList = function () {
    var _self = "";
    return {
        grid: "",
        init: function () {
            _self = this;
            _self.tableInit();
        },
        tableInit: function () {
            var tableContainer = $("#datatable_list").parents(".table-container");
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
                        $.post(window.apppath + "/admin/api/serviceOrg/subsidy/list", {
                            length: params.length,
                            start: params.start,
                            "serviceOrg.areaName": $("input[name=areaName]").val(),
                            "serviceOrg.institutionName": $("input[name=institutionName]").val(),
                            "serviceOrg.id": $("#serviceOrgId").val(),
                            "subsidyType": $("#subsidyType option:selected").val(),
                            "status": $("#status option:selected").val(),
                            "subsidyObject": $("#subsidyObject").val(),
                            "startDateString": $("input[name=startDateString]").val(),
                            "endDateString": $("input[name=endDateString]").val(),
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
                    "columns": [
                        {
                            "data": "serviceOrg.areaName", render: function (data, type, row, meta) {
                            var areaName = "";
                            if (data != "" && data != null) {
                                var areaName = "";
                                if (data.split(",").length >= 2) {
                                    areaName = data.split(",")[1];
                                }
                                else
                                    areaName = data;
                            }
                            return areaName;
                        }
                        },
                        {
                            "data": "serviceOrg.institutionName", render: function (data, type, row, meta) {
                            if (data != null && data != "") {
                                return '<div style="text-align: left">' + data + '</div>';
                            } else {
                                return "";
                            }
                        }
                        },
                        {
                            "data": "subsidyType", render: function (data, type, row, meta) {
                            if (data != null && data != "")
                                return ["", "建设补贴", "运营补贴"][data];
                            else
                                return "";
                        }
                        },
                        {"data": "createTime"},
                        {
                            "data": "status", render: function (data, type, row, meta) {
                            if (data == 1) {
                                return '<span class="label label-success radius">审核通过</span>';
                            } else if (data == 0) {
                                return '<span class="label label-danger radius">未审核</span>';
                            } else if (data == 2) {
                                return '<span class="label label-default radius">审核未通过</span>';
                            } else {
                                return "";
                            }
                        }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var columnHtml = '';
                         /*   if($("#serviceOrgSubAppList").val()=="1"){*/
                                columnHtml += '<button data="' + data + '"   class="btn default btn-xs blue-stripe info">详细</button>';
                          /*  }*/
                            /*if($("#serviceOrgSubAppDel").val()=="1"){*/
                                columnHtml += '<button data-id="' + data + '" class="btn default btn-xs red-stripe del">删除</button>';
                          /*  }*/
                            return columnHtml;
                        }
                        }
                    ]
                }

            });

            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            });


            _self.grid.getTable().on("click", ".info", function () {
                var data = $(this).attr("data");
                window.parent.addTab("tab-serviceOrg-subsidy-apply-info", "补贴申请详情", window.apppath + "/admin/serviceOrg/subsidy/info/" + data);
            });

            $(".reload").click(function () {
                $.ajax({
                    type:'POST',
                    url:"/admin/api/serviceOrg/subsidy/showServiceOrgId2",
                    dataType:'json',
                    success:function (data) {
                        if(data !== null){
                            $("#areaName,.sqtime").val("");
                        }else {
                            $("#serviceOrgAssessForm").find("input:text").val("");//找到form表单下的所有input标签并清空
                        }
                    },
                });


                $("#serviceOrgAssessForm").find("input:hidden").val("");//找到form表单下的所有input标签并清空
                $("#serviceOrgAssessForm").find("select").val("");//找到form表单下的所有select标签并清空
                $("#serviceOrgAssessForm").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
            });

            /**
             * 删除
             */
            _self.grid.getTable().on("click", "button.del", function () {
                var curRow = $(this).closest('tr');
                var id = $(this).data("id");
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
                        $.post(window.apppath + "/admin/api/serviceOrg/subsidy/delete", {id: id}, function (res) {
                            Metronic.unblockUI(tableContainer);
                            if (res.success) {
                                _self.grid.getDataTable().row(curRow).remove().draw(false);
                            } else {
                                showMetroMessage(res.message);
                            }
                        }, "json");
                    }
                }).confirmation('toggle');
            });


        },
        getAreaName: function () {
            $("#areaId").val(AreaTree.getSelectArea());
            $("#areaName").val(AreaTree.getAllAreaName(AreaTree.getSelectArea()));
            $("#areaModal").modal('hide');
        },
    }

}();