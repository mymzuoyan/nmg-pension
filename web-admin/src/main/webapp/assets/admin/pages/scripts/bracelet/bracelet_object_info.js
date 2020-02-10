/**
 * Created by Administrator on 2016/9/21.
 */
var BraceletObjectInfo = function () {

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
            var tableContainer = $("#datatable_serviceOrg_nurse_elderly_List").parents(".table-container");
            _self.grid.init({
                src: $("#datatable_serviceOrg_nurse_elderly_List"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/nurse/elderly/list", {
                            length: params.length,
                            start: params.start,
                            deviceName:"爱心手环",
                            orderField: "c.areaOrder",
                            orderDir: "DESC",
                            sexDictId: $("#sexDictId option:selected").val(),
                            deviceMobile: $("#deviceMobile").val(),
                            deviceNumber: $("#deviceNumber").val(),
                            startAge: $("input[name=startAge]").val(),
                            endAge: $("input[name=endAge]").val(),
                            elderName: $("input[name=elderName]").val(),
                            areaName:$("input[name=areaName]").val(),
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
                            "data": "areaName", render: function (data, type, row, meta) {
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
                            "data": "elderName"
                        },
                        {
                            "data": "elderAge"
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
                            "data": "deviceNumber"
                        },
                        {
                            "data": "deviceMobile"
                        },
                    ]
                }

            });
            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            });

            $(".reload").click(function () {
                $("#braceletObjectInfo").find("input:text").val("");//找到form表单下的所有input标签并清空
                $("#braceletObjectInfo").find("input:hidden").val("");//找到form表单下的所有input标签并清空
                $("#braceletObjectInfo").find("select").val("");//找到form表单下的所有select标签并清空
                $("#braceletObjectInfo").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
            });

            _self.grid.getTable().on("click", "a.setFence", function () {
                var href = $(this).attr("data");
                window.parent.addTab("setFence", "老人围栏设置", href);
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

        },
        importFile: function (file) {
            $("#msg").text("导入中...").addClass("label-danger");
            var excelFile = $("#" + file).val().trim();
            if (excelFile != null && excelFile != "") {
                $.ajaxFileUpload({
                    url: window.apppath + "/admin/api/loveBracelet/import",
                    data:{type:1},
                    secureuri: false,
                    fileElementId: file,//file控件id
                    dataType: 'json',
                    success: function (data, status) {
                        $("#msg").text(data.message).addClass("label-danger");
                        if (data.data != null && data.data != "") {
                            alert(data.data);
                        }else{
                            $(".btn-account").show();
                        }
                    },
                    error: function (data, status, e) {
                        console.log(e);
                    }
                });
            } else {
                $("#msg").text("请上传文件！").addClass("label-danger");
            }
        },
        getAreaName: function () {
            if (_method == "edit") {
                $("#areaId1").val(AreaTree.getSelectArea());
                $("#areaName1").val(AreaTree.getAllAreaName(AreaTree.getSelectArea()));
                $("#areaModal").modal('hide');
            } else if (_method == "add") {
                $("#areaId").val(AreaTree.getSelectArea());
                $("#areaName").val(AreaTree.getAllAreaName(AreaTree.getSelectArea()));
                $("#areaModal").modal('hide');
            } else if (_method == "update") {
                $("#inServiceRangeId").val(AreaTree.getSelectRange());
                $("#inServiceRangeName").val(AreaTree.getAllRangeName(AreaTree.getSelectRange()));
                $("#rangeModal").modal('hide');
            }
        },
        selectMethod: function (method) {
            _method = method;
        }
    }

}();