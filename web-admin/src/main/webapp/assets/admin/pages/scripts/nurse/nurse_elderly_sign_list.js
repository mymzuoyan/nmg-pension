/**
 * Created by Administrator on 2016/9/21.
 */
var NurseElderlySignList = function () {

    var _self = "";
    return {
        userId: "",
        grid: "",
        init: function (id) {
            _self = this;
            _self.userId = id;
            _self.tableInit();
        },
        tableInit: function () {
            _self.grid = new Datatable();
            var tableContainer = $("#datatable_nurse_elderly_sign_list").parents(".table-container");
            _self.grid.init({
                src: $("#datatable_nurse_elderly_sign_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/nurse/elderly/sign/list", {
                            length: params.length,
                            start: params.start,
                            elderName:$("input[name=elderName]").val(),
                            sourceNumber:$("input[name=sourceNumber]").val(),
                            orderField: "a.id",
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
                            return '<input type="checkbox" name="deleteId" value="' + row.id + '">';
                        }
                        },
                        {
                            "data": "elderName"
                        },
                        {
                            "data": "elderSex", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return ["未知", "男", "女"][data];
                            } else {
                                return "";
                            }

                        }
                        },// 联系电话
                        {
                            "data": "source"
                        },
                        {
                            "data": "sourceNumber"
                        },
                        {
                            "data": "signType", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return signTypeName[data];
                            } else {
                                return "";
                            }
                        }
                        },
                        {
                            "data": "signResult", render: function (data, type, row, meta) {
                            if (signTypeName[row.signType] == "心率") {
                                if (data.indexOf("次/分钟") < 0)
                                    return data + "次/分钟";
                                return data;
                            } else {
                                return data;
                            }
                        }
                        },
                        {
                            "data": "status", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                if (signTypeName[row.signType] == "心率") {
                                    var a = row.signResult.match(/\d+/);
                                    var flag=1;
                                    if(parseInt(a)>110||parseInt(a)<50)
                                    {
                                        flag=2;
                                    }
                                    return ["未知", '<span class="label label-info">正常</span>', '<span class="label label-danger">异常</span>'][flag];
                                }
                                else
                                {
                                    return ["未知", '<span class="label label-info">正常</span>', '<span class="label label-danger">异常</span>'][data];

                                }

                            } else {
                                return "";
                            }
                        }
                        },
                        {
                            "data": "createTime"
                        }
                    ]
                }

            });
            /**
             * 查询
             */
            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            });

            /**
             * 重置
             */
            $("#reload").click(function () {
                $("#serviceOrg-form").find("input:text").val("");//找到form表单下的所有input标签并清空
                $("#serviceOrg-form").find("select").val("");//找到form表单下的所有select标签并清空
                $("#serviceOrg-form").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
                _self.grid.getDataTable().ajax.reload();

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