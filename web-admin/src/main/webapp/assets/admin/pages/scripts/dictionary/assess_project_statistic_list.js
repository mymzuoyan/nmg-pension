/**
 * Created by gengqiang on 2017/9/8.
 */
var AssessProjectStatisticList = function () {

    var _self = "";
    var tableContainer = $("#datatable_assess_project").parent();
    return {
        init: function () {
            _self = this;
            _self.dataTableInit();
            $("#btnPublish").click(function () {
                _self.addProject();
            })
        },
        dataTableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_assess_project"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/assessProject/list", {
                            length: params.length,
                            start: params.start,
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
                            "data": "name"
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            columnHtml += '<button data-id="' + data + '" data-name="' + row.name + '" data-manage="' + row.isMoneyManage + '" data-tasktype="' + row.taskType + '"  data-tabid="' + row.tabId + '"  data-tabtitle="' + row.tabTitle + '" data-taburl="' + row.tabUrl + '"class="btn default btn-xs blue-stripe update">更新</button>';
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
                        $.post(window.apppath + "/admin/api/assessProject/delete", {id: id}, function (res) {
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
                $("#updateProject input[name=id]").val($(this).data("id"));
                var name = $(this).data("name");
                var isMoneyManage = $(this).data("manage");
                var taskType = $(this).data("tasktype");
                var tabId = $(this).data("tabid");
                var tabTitle = $(this).data("tabtitle");
                var tabUrl = $(this).data("taburl");
                $("#updateProject input[name=name]").val(name);
                $("#updateProject input[name=tabId]").val(tabId);
                $("#updateProject input[name=tabTitle]").val(tabTitle);
                $("#updateProject input[name=tabUrl]").val(tabUrl);
                $("#updateProject input[name=isMoneyManage][value=" + isMoneyManage + "]").attr("checked", true);
                _self.setCheckbocCheck(taskType + "", $("#updateProject input[name=taskType]"));
                $("#updateProject").modal("show");
            });


            $("#updateProject .btnUpdate").click(function () {
                var name = $("#updateProject input[name=name]").val();
                if (name == null || name == "") {
                    $("#labelmsg").text('请输入名称').addClass("label-danger");
                    return false;
                }
                var tabId = $("#updateProject input[name=tabId]").val();
                if (tabId == null || tabId == "") {
                    $("#labelmsg").text('请输入tabId').addClass("label-danger");
                    return false;
                }
                var tabTitle = $("#updateProject input[name=tabTitle]").val();
                if (tabTitle == null || tabTitle == "") {
                    $("#labelmsg").text('请输入Tab标题').addClass("label-danger");
                    return false;
                }
                var tabUrl = $("#updateProject input[name=tabUrl]").val();
                if (tabUrl == null || tabUrl == "") {
                    $("#labelmsg").text('请输入Tab链接地址').addClass("label-danger");
                    return false;
                }
                var isMoneyManage = $("#updateProject input[name='isMoneyManage'][checked]").val();
                var taskType = "";
                var obj1 = $("#updateProject input[name=taskType]");
                for (var i = 0; i < obj1.length; i++) {
                    if (obj1[i].checked) {
                        taskType += obj1[i].value + ',';
                    }
                }
                if (taskType != "") {
                    taskType = taskType.substr(0, taskType.length - 1);
                }

                $.post(window.apppath + "/admin/api/assessProject/update", {
                    id: $("#updateProject input[name=id]").val(),
                    name: name,
                    isMoneyManage: isMoneyManage,
                    taskType: taskType,
                    tabId: tabId,
                    tabTitle: tabTitle,
                    tabUrl: tabUrl
                }, function (res) {
                    if (res.success) {
                        alertSuccess("提示信息", "更新成功", function () {
                            window.location.reload();

                        });
                    }
                    else {
                        alert("更新失败");
                    }

                }, "json");
            })

        },
        addProject: function () {
            var name = $("#tab_add input[name=name]").val();
            if (name == null || name == "") {
                $("#labelmsg").text('请输入名称').addClass("label-danger");
                return false;
            }
            var tabId = $("#tab_add input[name=tabId]").val();
            if (tabId == null || tabId == "") {
                $("#labelmsg").text('请输入tabId').addClass("label-danger");
                return false;
            }
            var tabTitle = $("#tab_add input[name=tabTitle]").val();
            if (tabTitle == null || tabTitle == "") {
                $("#labelmsg").text('请输入Tab标题').addClass("label-danger");
                return false;
            }
            var tabUrl = $("#tab_add input[name=tabUrl]").val();
            if (tabUrl == null || tabUrl == "") {
                $("#labelmsg").text('请输入Tab链接地址').addClass("label-danger");
                return false;
            }
            var isMoneyManage = $("#tab_add input[name='isMoneyManage'][checked]").val();
            var taskType = "";
            var obj1 = $("#tab_add input[name=taskType]");
            for (var i = 0; i < obj1.length; i++) {
                if (obj1[i].checked) {
                    taskType += obj1[i].value + ',';
                }
            }
            if (taskType != "") {
                taskType = taskType.substr(0, taskType.length - 1);
            }
            $.post(window.apppath + "/admin/api/assessProject/add", {
                name: name,
                isMoneyManage: isMoneyManage,
                taskType: taskType,
                tabId: tabId,
                tabTitle: tabTitle,
                tabUrl: tabUrl
            }, function (res) {
                $("#btnPublish").button('reset');
                if (res.success) {
                    alertSuccess("提示信息", "添加成功", function () {
                        window.location.reload();
                    });
                } else {
                    $("#labelmsg").text(res.message).addClass("label-danger");
                }
            }, "json");
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
        setCheckbocCheck: function (scopes, obj2) {
            var scope = scopes.split(",");
            if (scopes.length > 0) {
                for (var i = 0; i < obj2.length; i++) {
                    for (var j = 0; j < scopes.length; j++) {
                        if (obj2[i].value == scope[j]) {
                            obj2[i].checked = true;
                        }
                    }
                }
            }
        }
    }
}();