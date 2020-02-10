/**
 * Created by Administrator on 2016/9/13.
 */
var MonitorGroupList = function () {
    var _self = "";
    var count = 0;
    return {
        init: function () {
            _self = this;
            _self.dataTableInit();
            $("#btnPublish").click(function () {
                _self.addMonitorGroup();
            })
        },
        dataTableInit: function () {
            var grid = new Datatable();
            var tableContainer = $("#datatable_monitor_group").parents(".table-container");
            grid.init({
                src: $("#datatable_monitor_group"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/call/api/monitor/groupList", {
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
                            return ++count;
                        }
                        },
                        {"data": "name"},
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            columnHtml += '<a class="btn default btn-xs blue-stripe info" data-groupid="' + data + '"  data-name="'+row.name+'">详细</a>';
                            columnHtml += '<a href= "'+window.apppath+'/admin/call/monitor/groupMonitors/'+data+'"  class="btn default btn-xs green-stripe " data-groupid="' + data + '"  data-name="'+row.name+'">坐席人员</a>';
                            columnHtml += '<button data-groupid="' + data + '" class="btn default btn-xs red-stripe del" style="">删除</button>';
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
                var groupId = $(this).data("groupid");
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
                        $.post(window.apppath + "/admin/call/api/monitor/group/delete", {groupId: groupId}, function (res) {
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
                var groupId = $(this).data("groupid");
                var groupName = $(this).data("name");
                $("#updateModal input[name=groupId]").val(groupId);
                $("#updateModal input[name=name]").val(groupName);
                $("#updateModal").modal("show");
            });

            $("#updateModal .btnUpdate").click(function () {
                if($("#updateModal input[name=name]").val()==null||$("#updateModal input[name=name]").val()=="")
                {
                    alert("请输入坐席组名称");
                    return false;
                }
                    $.post(window.apppath + "/admin/call/api/monitor/group/add", {
                        id: $("#updateModal input[name=groupId]").val(),
                        name:$("#updateModal input[name=name]").val()
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
        addMonitorGroup: function () {
            var name = $("#tab_add input[name=name]").val();
            if (name == null || name == "") {
                $("#labelmsg").text('请输入坐席组名称').addClass("label-danger");
                return false;
            }
            else {
                $.post(window.apppath + "/admin/call/api/monitor/group/add", {
                  name:name
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