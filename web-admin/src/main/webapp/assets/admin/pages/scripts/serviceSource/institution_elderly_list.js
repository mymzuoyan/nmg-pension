/**
 * Created by gengqiang on 2018/1/15.
 */
var InstitutionElderlyList = function () {
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
                        $.post(window.apppath + "/admin/api/institution/elderly/list", {
                            length: params.length,
                            start: params.start,
                            "serviceOrg.id": _self.serviceOrgId,
                            "serviceOrg.institutionName":$("#institutionName").val(),
                            "elderlyMsg.elderName":$("#elderName").val(),
                            "status":$("#status").val(),
                            "number":$("#number").val(),
                            "startCheckInTimeStr":$("#startCheckInTimeStr").val(),
                            "endCheckInTimeStr":$("#endCheckInTimeStr").val(),
                            "startCheckOutTimeStr":$("#startCheckOutTimeStr").val(),
                            "organizationName":$("#organizationName").val(),

                            "endCheckOutTimeStr":$("#endCheckOutTimeStr").val()
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
                            "data": "number"
                        },
                        {
                            "data": "elderlyMsg.elderName"
                        },
                        {
                            "data": "elderlyMsg.sexDictId", render: function (data, type, row, meta) {
                            if (data != null && data != ""){
                                if (data ==1){
                                    return '男';
                                }else if(data ==2){
                                    return '女';
                                }else{
                                    return "";
                                }
                            }
                            else{
                                return "";
                            }
                        }
                        },
                        {
                            "data": "elderlyMsg.age"
                        },
                    /*    {
                            "data": "serviceOrg.institutionName", render: function (data, type, row, meta) {
                            if (data != null && data != "")
                                return data;
                            else
                                return "";
                        }
                        },*/
                        {
                            "data": "checkInTime", render: function (data, type, row, meta) {
                                if (data != "" && data != null) {
                                    return data.substring(0,10);
                                } else {
                                    return "无";
                                }

                            }
                        },
                        {
                            "data": "checkOutTime", render: function (data, type, row, meta) {
                                if (data != "" && data != null) {
                                    return data.substring(0,10);
                                } else {
                                    return "无";
                                }

                            }
                        },
                        {
                            "data": "bedInfo"
                        },
                        {
                            "data": "status", render: function (data, type, row, meta) {
                            if (data == "" || data==null) {
                                return "";
                            } else {
                                return institutionElderlyStatus[data];
                            }
                        }
                        },
                        {
                            "data": "organizationName"
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                                var columnHtml = '';
                                /*columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs blue-stripe info">详细</button>';*/
                                columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs green-stripe update">修改</button>';
                                columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs red-stripe del">删除</button>';
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
                console.log(Id);
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
                        $.post(window.apppath + "/admin/api/institution/elderly/delete", {id: Id}, function (res) {
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
                window.parent.addTab("institution_elderly_update", "入住老人更新", window.apppath + "/admin/institution/elderly/update/" + id);
            });

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
                $("#searchDiv").find("input[name = elderName]").val("");//找到form表单下的所有input标签并清空
                $("#searchDiv").find("input[name = number]").val("");
                $("#searchDiv").find("input[name = startCheckOutTimeStr]").val("");
                $("#searchDiv").find("input[name = endCheckOutTimeStr]").val("");
                $("#searchDiv").find("input[name = startCheckInTimeStr]").val("");
                $("#searchDiv").find("input[name = endCheckInTimeStr]").val("");
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