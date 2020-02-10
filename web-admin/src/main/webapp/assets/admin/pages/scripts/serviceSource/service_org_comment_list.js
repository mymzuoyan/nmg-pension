/**
 * Created by gengqiang on 2018/4/25.
 */
var ServiceOrgComment = function () {

    var _self = null;
    return {
        grid: "",
        type: "",
        init: function (type) {
            _self = this;
            _self.type = type;
            _self.dataTableInit();
        },
        dataTableInit: function () {
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
                        $.post(window.apppath + "/admin/api/serviceOrg/comment/list",
                            {
                                type: _self.type,
                                "serviceOrg.institutionName": $("#name").val(),
                                length: params.length,
                                start: params.start,
                                orderField: 'a.create_time',
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
                            "data": "serviceOrg", render: function (data, type, row, meta) {
                                if (data == null) {
                                    return "";
                                }
                                if (_self.type == 1) {
                                    var html = "<a onclick='ServiceOrgComment.addTab(\"serviceOrgInfo\",\"组织详情信息\",\"" + window.apppath + "/admin/serviceOrgDetail/" + data.id + "\")'>" + data.institutionName + "</a>"
                                    return html;
                                }
                                return _self.getvalue(data.institutionName);
                            }
                        },
                        {
                            "data": "score", render: function (data, type, row, meta) {
                                if (data == 1) {
                                    return "不满意";
                                } else if (data == 3) {
                                    return "一般";
                                } else if (data == 5) {
                                    return "满意";
                                }
                                return "一般";
                            }
                        },
                        {
                            "data": "comment", render: function (data, type, row, meta) {
                                if (data != null && data != '') {
                                    if (data.length > 30) {
                                        return data.substr(0, 30) + "......"
                                    } else {
                                        return data;
                                    }
                                }
                                return "";
                            }
                        },
                        {
                            "data": "createTime", render: function (data, type, row, meta) {
                                return _self.getvalue(data);
                            }
                        }
                    ]
                }

            });

            $("#refresh").click(function () {
                _self.grid.getDataTable().ajax.reload();
            });

            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            });

            $(".table-group-action-reload").click(function () {
                $("#searchDiv").find("input:text").val("");//找到form表单下的所有input标签并清空
                $("#searchDiv").find("input:hidden").val("");//找到form表单下的所有input标签并清空
                $("#searchDiv").find("select").val("");//找到form表单下的所有select标签并清空
                $("#searchDiv").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
            });


        },
        getvalue: function (data) {
            if (data != null || data != '') {
                return data
            } else {
                return "";
            }

        },
        addTab: function (id, title, url) {
            window.parent.addTab(id, title, url);
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

        },
    }

}();