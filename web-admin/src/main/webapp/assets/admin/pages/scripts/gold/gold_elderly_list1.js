/**
 * Created by gengqiang on 2017/9/8.
 */
var ForGoldList = function () {

    var _self = "";
    var tableContainer = $("#table").parent();
    return {
        init: function () {
            _self = this;
            _self.dataTableInit();
            //导出数据
            $(".excel").click(function () {
                window.location.href = window.apppath + "/admin/api/gold/forGoldInfo/exportExcel?" +
                    "elderName=" + $("#elderName").val() +
                    "&idcardno=" + $("#idcardno").val() +
                    "&applyType=" + $("#applyType").val()
            })
        },
        dataTableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#table"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/gold/forGoldInfo/list", {
                            length: params.length,
                            start: params.start,
                            elderName: $("#elderName").val(),
                            idcardno: $("input[name=idcardno]").val(),
                            applyType: $("#applyType").val(),
                            orderField: 'id',
                            orderDir: "DESC"
                        }, function (res) {
                            console.log(res);
                            if (res) {
                                $("#excel").show();
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
                            "data": "elderlyMsg.elderName"
                        },
                        {
                            "data": "elderlyMsg.sexDictId", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return ["保密", "男", "女"][data];
                            } else {
                                return "";
                            }
                        }
                        },
                        {
                            "data": "applyType", render: function (data, type, row, meta) {
                            if (data != null) {
                                return ["80-89周岁", "90-94周岁", "95-99周岁","100周岁以上"][data];
                            } else {
                                return "";
                            }
                        }
                        },
                        {
                            "data": "elderlyMsg.areaName", render: function (data, type, row, meta) {
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
                            "data": "elderlyMsg.realAddress"
                        },
                        {
                            "data": "elderlyMsg.idcardno"
                        },
                        {
                            "data" :"registerTime"
                        },
                        {
                            "data" :"cancelTime"
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            if($("#elderInfoUpdate").val()=="1"){
                                columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs green-stripe update">修改</button>';
                            }
                            /*columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs blue-stripe info">详细</button>';*/

                            /*columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs red-stripe del">删除</button>';*/
                            return columnHtml;
                        }
                        },

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
                        $.post(window.apppath + "/admin/api/gold/forGoldInfo/delete", {id: Id}, function (res) {
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


            /**
             * 更新
             */
            _self.grid.getTable().on("click", "button.update", function (e) {
                var id = $(this).data("id");
                window.parent.addTab("gold_elderly_edit", "人员登记信息更新", window.apppath + "/admin/gold/forGold/edit/" + id);
            });

            /**
             * 详情
             */
            _self.grid.getTable().on("click", "button.info", function (e) {
                var id = $(this).data("id");
                window.parent.addTab("ps_money_type_info", "人员登记信息详情", window.apppath + "/admin/gold/forGold/info/" + id);
            });

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

        }
    }
}();