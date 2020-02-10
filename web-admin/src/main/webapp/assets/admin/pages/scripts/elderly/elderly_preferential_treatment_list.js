/**
 * Created by gengqiang on 2017/9/8.
 */
var ElderlyPreferentialTreatmentList = function () {

    var _self = "";
    var tableContainer = $("#datatable_subsidy").parent();
    return {
        init: function () {
            _self = this;
            _self.dataTableInit();
        },
        dataTableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_subsidy"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/elderly/preferentialTreatment/list", {
                            length: params.length,
                            start: params.start,
                            areaName:$("#areaName").val(),
                            name: $("#name").val(),
                            linkman: $("#linkman").val(),
                            mobile: $("#mobile").val(),
                            address: $("#address").val(),
                            orderField: 'id',
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
                            "data": "id"
                        },
                        {
                            "data": "number"
                        },
                        {
                            "data": "areaName"
                        },
                        {
                            "data": "name",
                        },
                        {
                            "data": "idcardno",
                        },
                        {
                            "data": "sex",
                        },
                        {
                            "data": "status", render: function (data, type, row, meta) {
                            return ["<label class='label label-info'>已申请</label>", "<label class='label label-success'>申请通过</label>",
                                "<label class='label label-success'>申请未通过</label>", "<label class='label label-success'>已制卡</label>"][data];
                        }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            var str = "查看";
                            if (row.status == 0) {
                                str = "审核";
                            }
                            if($("#elderCardList").val()=="1"){
                                columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs blue-stripe update">' + str + '</button>';
                            }
                            if($("#elderCardDel").val()=="1"){
                                columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs red-stripe del">删除</button>';
                            }
                            // if(row.status==1)
                            // {
                            //     columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs green-stripe del">制卡</button>';
                            //
                            // }
                            return columnHtml;
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
                        $.post(window.apppath + "/admin/api/elderly/preferentialTreatment/delete", {id: Id}, function (res) {
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
                window.parent.addTab("elderly-preferential-treatment-update", "优待证详情", window.apppath + "/admin/elderly/preferentialTreatment/info/" + id);
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
                $("#searchDiv").find("input:text").val("");//找到form表单下的所有input标签并清空
                $("#searchDiv").find("select").val("");//找到form表单下的所有select标签并清空
                $("#searchDiv").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
                _self.grid.getDataTable().ajax.reload();

            });

        },
        showMetroMessage: function (messageContent) {
            Metronic.alert({
                type: 'danger',
                icon: 'warning',
                message: messageContent,
                container: tableContainer,
                place: 'prepend',
                closeInSeconds: 2
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
        selectArea: function () {
            $('#myModal').modal({
                keyboard: true
            });
        },
        getAreaValue: function (areaName, areaId) {
            document.getElementById("areaName").value = areaName;
            document.getElementById("areaId").value = areaId;
            $('#myModal').modal('hide');
        }
    }
}();