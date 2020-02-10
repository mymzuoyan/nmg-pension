/**
 * Created by Administrator on 2016/11/7.
 */
var ModuleList=function () {

    var _self="";
    return {
        init: function () {
            _self = this;
            _self.dataTableInit();
            $("#btnPublish").click(function () {
                _self.addModule();
            })
        },
        dataTableInit: function () {
            var grid = new Datatable();
            var tableContainer = $("#datatable_module").parents(".table-container");
            grid.init({
                src: $("#datatable_module"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/module/list", {
                            length: params.length,
                            start: params.start
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
                            return data;
                        }
                        },
                        {"data": "module"},
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            if($("#elderServiceTypeUpdate").val()=="1"){
                                columnHtml += '<a class="btn default btn-xs blue-stripe info" data-moduleid="' + data + '"  data-name="' + row.module + '">更新</a>';
                            }
                            if($("#elderServiceTypeDel").val()=="1"){
                                columnHtml += '<button data-moduleid="' + data + '" class="btn default btn-xs red-stripe del" style="">删除</button>';
                            }
                            return columnHtml;
                        }
                        }
                    ]
                }

            });

            /**
             * 删除
             */
            grid.getTable().on("click", "button.del", function (e) {
                var curRow = $(this).closest('tr');
                var moduleId = $(this).data("moduleid");
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
                        $.post(window.apppath + "/admin/api/module/delete", {moduleId: moduleId}, function (res) {
                            Metronic.unblockUI(tableContainer);
                            if (res.success) {
                                grid.getDataTable().row(curRow).remove().draw(false);
                            } else {
                                _self.showMetroMessage(res.message);
                            }
                        }, "json");
                    }
                }).confirmation('toggle');
            });

            grid.getTable().on("click", "a.info", function (e) {
                var moduleId = $(this).data("moduleid");
                console.log("moduleId="+moduleId)
                var module = $(this).data("name");
                $("#updateModal input[name=moduleId]").val(moduleId);
                $("#updateModal input[name=module]").val(module);
                $("#updateModal").modal("show");
            });

            $("#updateModal .btnUpdate").click(function () {
                if($("#updateModal input[name=module]").val()==null||$("#updateModal input[name=module]").val()==""){
                    alert("请输入新闻类型名称");
                    return false;
                }
                console.log("id="+$("#updateModal input[name=moduleId]").val());
                console.log("module="+$("#updateModal input[name=module]").val());
                $.post(window.apppath + "/admin/api/module/update", {
                    id: $("#updateModal input[name=moduleId]").val(),
                    module:$("#updateModal input[name=module]").val()
                }, function (res) {
                    if (res.success) {
                        alert("更新成功");
                        window.location.reload();
                    }
                    else {
                        alert("更新失败");
                    }

                },"json");
            })

        },
        showMetroMessage: function (messageContent) {
            var tableContainer = $("#datatable_module").parents(".table-container");
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
        },
        addModule: function () {
            var module = $("#tab_add input[name=module]").val();
            if (module == null || module == "") {
                $("#labelmsg").text('请输入新闻类型名称').addClass("label-danger");
                return false;
            }
            else {
                $.post(window.apppath + "/admin/api/module/add", {
                    module:module
                }, function (res) {
                    $("#btnPublish").button('reset');
                    if (res.success) {
                        $("#labelmsg").text(res.message).addClass("label-success");
                        setTimeout(function () {
                            window.location.reload();
                        },1000);
                    } else {
                        $("#labelmsg").text(res.message).addClass("label-danger");
                    }
                }, "json");
            }
        }
    }


}();