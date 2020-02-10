/**
 * Created by gengqiang on 2018/1/15.
 */
var NursingHomeServiceCheck = function () {
    var _self = "";
    return {
        grid: "",
        serviceOrgId: "",
        init: function (id) {
            _self = this;
            _self.serviceOrgId = id;
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
                        $.post(window.apppath + "/admin/api/CheckName/list", {
                            length: params.length,
                            start: params.start,
                            name:$("#name").val(),
                            "serviceOrg.id": _self.serviceOrgId
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
                            return '<input type="checkbox" name="fuwuId" value="' + row.id + '">';
                        }
                        },
                        {
                            "data": "name"
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                                var columnHtml = '';
                                columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs blue-stripe info">上传文件</button>';
                                columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs green-stripe update">编辑</button>';
                                return columnHtml;
                            }
                        },
                    ]
                }

            });
            /**
             * 更新
             */
            /*_self.grid.getTable().on("click", "button.update", function (e) {
                var id = $(this).data("id");
                window.parent.addTab("service_check_edit", "人员登记信息更新", window.apppath + "/admin/api/serviceCheck/edit/" + id);
            });*/

            _self.grid.getTable().on("click", "button.update", function (e) {
                var id = $(this).data("id");
                var fileUrl = $(this).data("fileUrl");
                $("#addForm input[name=id]").val(id);
                $("#addForm textarea[name=fileUrl]").val(fileUrl);
                $('#addModal').modal({
                    keyboard: true
                });
            });

            /**
             * 导入
             */
            _self.grid.getTable().on("click", "button.info", function (e) {
                var id = $(this).data("id");
                var fileUrl = $(this).data("fileUrl");
                $("#impModal input[name=id]").val(id);
                $("#impModal textarea[name=fileUrl]").val(fileUrl);
                $('#impModal').modal({
                    keyboard: true
                });
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

        },
        submitForm: function () {
            var id = $("#addForm input[name=id]").val();
            var fileUrl = $("#addForm textarea[name=fileUrl]").val();
            var url = '';
            if (id == null || id == '') {
                url = window.apppath + '/admin/api/serviceCheck/detail';
            }
            $.ajax({
                type: "POST",
                url: url,
                data: {id: id, fileUrl: fileUrl},
                dataType: "json",
                success: function (res) {
                    alert(res.message, function () {
                        window.location.reload();
                    });
                }
            });


        },
        submitForm1: function () {
            var id = $("#impModal input[name=id]").val();
            var fileUrl = $("#impModal textarea[name=fileUrl]").val();
            var url = '';
            if (id == null || id == '') {
                url = window.apppath + '/admin/api/serviceCheck/importFileUrl';
            }
            $.ajax({
                type: "POST",
                url: url,
                data: {id: id, fileUrl: fileUrl},
                dataType: "json",
                success: function (res) {
                    alert(res.message, function () {
                        window.location.reload();
                    });
                }
            });
        }
    }
}();