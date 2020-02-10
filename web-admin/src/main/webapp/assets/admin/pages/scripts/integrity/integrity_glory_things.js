/**
 * Created by Administrator on 2016/9/21.
 */
var IntegrityGloryThings = function () {

    var _self = "";
    return {
        grid: "",
        init: function () {
            _self = this;
            _self.tableInit();
        },
        tableInit: function () {
            _self.grid = new Datatable();
            var tableContainer = $("#datatable_exposure_List").parents(".table-container");
            _self.grid.init({
                src: $("#datatable_exposure_List"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/Integrity/selectAll", {
                            length: params.length,
                            start: params.start,
                            institutionName: $('input[name=institutionName]').val(),
                            title: $('input[name=title]').val(),
                            startScore: $('input[name=startScore]').val(),
                            endScore: $('input[name=endScore]').val(),
                            flag:0,
                            orderField: "id",
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
                            "data": "institutionName", render: function (data, type, row, meta) {
                                return '<div style="text-align: left">' + data + '</div>';
                            }
                        },// 单位名称
                        {
                            "data": "title", render: function (data, type, row, meta) {
                                    return data;
                            }
                        },
                        {
                            "data": "createName", render: function (data, type, row, meta) {
                                return data;
                            }
                        },
                        {
                            "data": "createTime", render: function (data, type, row, meta) {
                                return data;
                            }
                        },
                        {
                            "data": "score", render: function (data, type, row, meta) {
                                    return data;
                            }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                                var html = "";
                                html += '<a data="' + window.apppath + '/admin/api/Integrity/integrityInfo/' + data + '" class="btn default btn-xs green-stripe info" >查看</a>';
                                if($("#gloryDelete").val()=="1"){
                                    html +='<button data-id="' + data + '" class="btn btn-xs red-stripe del" >删除</button>';
                                }
                                return html;
                            }
                        }
                    ]
                }

            });
            _self.grid.getTable().on("click", "a.info", function () {
                var href=$(this).attr("data");
                window.parent.addTab("integrityInfo", "事件详情", href);
            });
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
                        $.post(window.apppath + "/admin/api/Integrity/delete", {id: id}, function (res) {
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
            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            });
            $(".table-group-action-reload").click(function () {
                $("#exposureSystemForm").find("input:text").val("");//找到form表单下的所有input标签并清空
                $("#exposureSystemForm").find("input:hidden").val("");//找到form表单下的所有input标签并清空
                $("#exposureSystemForm").find("select").val("");//找到form表单下的所有select标签并清空
                $("#exposureSystemForm").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
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

        }
    }
}();