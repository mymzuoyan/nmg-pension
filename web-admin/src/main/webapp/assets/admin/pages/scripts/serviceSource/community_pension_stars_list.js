/**
 * Created by guxiangyang on 2019/8/21.
 */
var CommunityPensionStarsList = function () {
    var _self = "";
    var tableContainer = $("#table").parent();
    return {
        grid: "",
        serviceOrgId: "",
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
                        $.post(window.apppath + "/admin/api/institution/communityPensionStars/list", {
                            length: params.length,
                            start: params.start,
                            "serviceOrg.id": _self.serviceOrgId,
                            "area":$("#area").val(),
                            "organizationNames":$("#organizationNames").val(),
                            "starRating":$("#starRating").val(),
                            "applicationTime":$("#applicationTime").val(),
                            "totalScore":$("#totalScore").val()
                        }, function (res) {
                            console.log(res);
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
                            "data": "area"　, render: function (data, type, row, meta) {
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
                            "data": "organizationNames", render: function (data, type, row, meta) {
                                if (data != null && data != "") {
                                    return '<div style="text-align: left">' + data + '</div>';
                                } else {
                                    return "";
                                }
                            }
                        },
                        {
                            "data": "starRating", render: function (data, type, row, meta) {
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
                        {
                            "data": "applicationTime", render: function (data, type, row, meta) {
                                if (data != null && data != "") {
                                    return '<div style="text-align: left">' + data + '</div>';
                                } else {
                                    return "";
                                }
                            }
                        },
                        {
                            "data": "totalScore", render: function (data, type, row, meta) {
                                if (data != null && data != "") {
                                    return '<div style="text-align: left">' + data + '</div>';
                                } else {
                                    return "";
                                }
                            }
                        },


                        {
                            "data": "id", render: function (data, type, row, meta) {
                                /*var columnHtml = '';*/
                                /*columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs blue-stripe info">详细</button>';*/
                               /* columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs green-stripe update">修改</button>';*/
                     /*           columnHtml +='<shiro:hasPermission name="person-institution-manager-communityPensionStars-detail">' + '<button data="' + data + '"   class="btn default btn-xs blue-stripe info">详情</button>'+
                                    '</shiro:hasPermission>';
                                columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs red-stripe del">删除</button>';
                                columnHtml +='<button data="' + data + '"   class="btn default btn-xs blue-stripe assess">评估</button>';*/

                                return getPermission(data, type, row, meta);

                            }
                        }
                    ]

                }

            });
            /**
             * 删除
             */
            _self.grid.getTable().on("click", "button.del", function (e) {
                var curRow = $(this).closest('tr');
                var Id = $(this).data("id");
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
                        $.post(window.apppath + "/admin/api/institution/org/communityPensionStars/delete", {id: Id}, function (res) {
                            Metronic.unblockUI(tableContainer);
                            if (res.success) {
                                _self.grid.getDataTable().row(curRow).remove().draw(false);
                            } else {
                                _self.showMetroMessage(res.message);
                            }
                        }, "json");
                    }, onCancel: function () {

                    }
                }).confirmation('toggle');
            });

            /*社区养老服务站星级评定标准详细*/
            _self.grid.getTable().on("click", ".info", function () {
                var data = $(this).attr("data");
                window.parent.addTab("tab-serviceOrg-subsidy-apply-info", "社区养老服务站星级评定标准", window.apppath + "/admin/institution/infoCommunityPensionStars/" + data);
            });

            /*社区养老服务站星级评定标准评估*/
            _self.grid.getTable().on("click", ".assess", function () {
                var data = $(this).attr("data");
                window.parent.addTab("tab-serviceOrg-subsidy-apply-info", "社区养老服务站星级评定标准", window.apppath + "/admin/institution/assessCommunityPensionStars/" + data);
            });


            /**
             * 更新
             */
          /*  _self.grid.getTable().on("click", "button.update", function (e) {
                var id = $(this).data("id");
                window.parent.addTab("institution_elderly_update", "入住老人更新", window.apppath + "/admin/institution/org/communityPensionStars/update/" + id);
            });
*/
            /*/!**
             * 详情
             *!/
            _self.grid.getTable().on("click", "button.info", function (e) {
                var id = $(this).data("id");
                window.parent.addTab("gold_send_standard_info", "高龄补贴发放标准详情", window.apppath + "/admin/gold/sendStandard/info/" + id);
            });*/

            /**
             * 刷新
             */
            $("#refresh").click(function () {
                _self.grid.getDataTable().ajax.reload();
            })

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
                $("#searchDiv").find("input:text").val("");//找到form表单下的所有input标签并清空
                $("#searchDiv").find("select").val("");//找到form表单下的所有select标签并清空
                $("#searchDiv").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
                _self.grid.getDataTable().ajax.reload();

            });
        },
        goToPage: function () {
            var page = $("#page").val();
            var len = grid.getDataTable().page.info().pages;
            if (page != "" && page != "0") {
                page = parseInt(page) - 1;
                if (page < len)
                    grid.getDataTable().page(page).draw(false);
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
            $("#area").val(AreaTree.getAllAreaName(AreaTree.getSelectArea()));
            $("#areaModal").modal('hide');
        },
    }
}();