/**
 * Created by gengqiang on 2018/4/25.
 */
var ServiceOrgWarehouse = function () {

    var _self = null;
    return {
        grid: "",
        init: function () {
            _self = this;
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
                        $.post(window.apppath + "/admin/api/serviceOrg/socialWork/list",
                            {
                                type: $('#type').val(),
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
                                return _self.getvalue(data.institutionName);
                            }
                        },
                        {
                            "data": "type", render: function (data, type, row, meta) {
                                if (data == 1) {
                                    return "入库";
                                } else if (data == 2) {
                                    return "出库";
                                }
                                return "";
                            }
                        },
                        {
                            "data": "name", render: function (data, type, row, meta) {
                                return _self.getvalue(data);
                            }
                        },
                        {
                            "data": "number", render: function (data, type, row, meta) {
                                return _self.getvalue(data);
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


            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            });


        },
        getvalue: function (data) {
            if (data != null || data != '') {
                return data
            } else {
                return "";
            }

        },
        save: function () {
            var $btn = $(this);
            $("#labelmsg").text('');
            var serviceOrgId = $("#serviceOrgId").val();
            var price = $("#addForm input[name=number]").val();
            var typeSelect = $("#typeSelect").val();
            if (serviceOrgId == null || serviceOrgId == "") {
                alert("请登录组织账号操作");
                return false;
            }
            if (typeSelect == null || typeSelect == "") {
                alert("请选择出入库");
                return false;
            }
            if (isNaN(price)) {
                alert("请输入数字");
                return false;
            }
            $btn.button('loading');
            $.ajax({
                type: "POST",
                url: window.apppath + "/admin/api/serviceOrg/wareHouse/save",
                data: $("#addForm").serialize(),
                dataType: "json",
                success: function (res) {
                    $btn.button('reset');
                    if (res.success) {
                        alertSuccess("提示", res.message, function () {
                            $('#addModal').modal("hide");
                            _self.grid.getDataTable().ajax.reload();
                        })
                    }
                    else {
                        alert2(res.message);
                    }
                }
            });
            ///admin/api/serviceOrg/wareHouse/
        },
        showAddModal: function (e) {
            $('#addModal').modal({
                keyboard: true
            });
        }
        ,
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