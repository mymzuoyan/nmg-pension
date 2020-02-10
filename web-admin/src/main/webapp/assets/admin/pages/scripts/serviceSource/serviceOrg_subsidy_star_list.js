/**
 * Created by gengqiang on 2018/1/22.
 */
var ServiceOrgSubsidyStarList = function () {
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
                        $.post(window.apppath + "/admin/api/serviceOrg/subsidy/starList", {
                            length: params.length,
                            start: params.start,
                            "areaName": $("input[name=areaName]").val(),
                            "institutionName": $("input[name=institutionName]").val(),
                            "serviceOrg.id": $("#serviceOrgId").val(),
                            "starClass": $("#starClass option:selected").val(),
                            "totalScore": $("input[name=totalScore]").val(),
                            "subsidyObject": $("#subsidyObject").val(),
                            "startDateString": $("input[name=startDateString]").val(),
                            "endDateString": $("input[name=endDateString]").val(),
                            type:$("#type").val(),
                            listDetail: 1,
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
                            "data": "id", render: function (data, type, row, meta) {
                                return '<input type="checkbox" name="deleteId" value="' + row.id + '">';
                            }
                        },
                        {
                            "data": "areaName", render: function (data, type, row, meta) {
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
                            "data": "institutionName", render: function (data, type, row, meta) {
                            if (data != null && data != "") {
                                return '<div style="text-align: left">' + data + '</div>';
                            } else {
                                return "";
                            }
                        }
                        },
                        {
                            "data": "starClass", render: function (data, type, row, meta) {
                            if (data=="1") {
                                return "一星级";
                            } else if (data=="2") {
                                return "二星级";
                            } else if (data=="3") {
                                return "三星级";
                            } else if (data=="4") {
                                return "四星级";
                            } else if (data=="5") {
                                return "五星级";
                            } else {
                                return "";
                            }
                        }
                        },
                        {"data": "assessmentTime"},

                        {"data": "totalScore"},
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            // var columnHtml = '';
                            //
                            //     columnHtml += '<shiro:hasPermission name="person-institution-manager-subsidyList-detail">' +
                            //         '<button data="' + data + '"   class="btn default btn-xs blue-stripe info">详情</button>' +
                            //         '</shiro:hasPermission>';
                            //
                            //     columnHtml += '<button data-id="' + data + '" class="btn default btn-xs red-stripe del">删除</button>';
                            //
                            //     columnHtml += '<shiro:hasPermission name="person-institution-manager-subsidyList-assess">' +
                            //         '<button data="' + data + '"   class="btn default btn-xs yellow-stripe assess">评估</button>' +
                            //         '</shiro:hasPermission>';

                            return getPermission(data, type, row, meta);
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
                if($("#type").val()==1){
                    window.parent.addTab("tab-serviceOrg-subsidy-apply-info", "机构星级评定详情", window.apppath + "/admin/serviceOrg/subsidy/infoStarRate1/" + data);
                } else if ($("#type").val()==2) {
                    window.parent.addTab("tab-serviceOrg-subsidy-apply-info", "机构星级评定详情", window.apppath + "/admin/serviceOrg/subsidy/infoStarRate2/" + data);
                } else {
                    window.parent.addTab("tab-serviceOrg-subsidy-apply-info", "机构星级评定详情", window.apppath + "/admin/serviceOrg/subsidy/infoStarRate/" + data);
                }
            });

            _self.grid.getTable().on("click", ".assess", function () {
                var userId = $("#userId").val();
                var data = $(this).attr("data");
                window.parent.addTab("tab-serviceOrg-subsidy-apply-info", "机构星级评估详情", window.apppath + "/admin/serviceOrg/subsidy/infoStarRateAssess/" + data + "/" + userId);
            });

            $(".reload").click(function () {
                $("#serviceOrgAssessForm").find("input:text").val("");//找到form表单下的所有input标签并清空
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
                        $.post(window.apppath + "/admin/api/serviceOrg/subsidy/deleteStarRate", {id: id}, function (res) {
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