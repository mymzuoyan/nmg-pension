/**
 * Created by Administrator on 2016/11/7.
 */
var ModuleMesViewList = function () {

    var tableContainer = $("#datatable_moduleMes_list").parents(".table-container");
    var _self = "";
    return {
        module:"",
        init: function (type) {
            _self = this;
            _self.module=type;
            _self.dataTableInit();

        }, dataTableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_moduleMes_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/moduleMes/list", {
                            length: params.length,
                            start: params.start,
                            title: $("input[name=title]").val(),
                            moduleId:  _self.module,
                            creatorName: $("input[name=creatorName]").val(),
                            orderField: 'a.putTop DESC, a.id',
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
                            if (row.status == "0")
                                return '<input type="checkbox" name="verifyId" value="' + row.id + '">';
                            else
                                return "";
                        }
                        },
                        {
                            "data": "title", render: function (data, type, row, meta) {
                            var html = "<a href='" + window.apppath + "/moduleMes/" + row.id + "' target='_blank'>" + data + "</a>";
                            return html;
                        }
                        }
                        ,
                        {
                            "data": "module"
                        },
                        {
                            "data": "creatorName"
                        },
                        {
                            "data": "createTime"
                        },
                        {
                            "data": "status", render: function (data, type, row, meta) {
                            if (data != null) {
                                var strs = ["<sapn style='color:red'>未审核</sapn>", "已审核"]
                                return strs[data];
                            } else {
                                return "";
                            }
                        }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            columnHtml += '<a href="' + window.apppath + '/admin/moduleMes/info/' + data + '" class="btn default btn-xs green-stripe">详细</a>';
                            return columnHtml;
                        }
                        }
                    ]
                }

            });

            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            })

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
        },
        getDate: function (time) {
            return time.getFullYear() + "-" + _self.formatTwo(time.getMonth() + 1) + "-" + _self.formatTwo(time.getDate());

        },
        formatTwo: function (str) {
            str = str + "";
            if (str.length == 1) {
                str = "0" + str;
            }
            return str;
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

        }

    }

}();