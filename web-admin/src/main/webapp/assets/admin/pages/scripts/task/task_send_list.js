/**
 * Created by Administrator on 2016/9/21.
 */
var TaskSendList = function () {

    var _self = "";
    var tableContainer = $("#datatable_task_send_list").parents(".table-container");
    return {
        grid: "",
        init: function () {
            _self = this;
            _self.tableInit();
        },
        tableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_task_send_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/task/sendList", {
                            length: params.length,
                            start: params.start,
                            orderField: "id",
                            orderDir: "DESC",
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
                            "data": "sendTime", render: function (data, type, row, meta) {
                            return data;
                        }
                        },
                        {"data": "receiverName"}
                        ,
                        {
                            "data": "taskTitle"
                        },
                        {
                            "data": "status", render: function (data, type, row, meta) {
                            var strs = ["已拒绝", "待响应", "组织已响应", "组织已派遣", "组织已拒绝", "服务人员已接单", "服务人员已上门", "服务人员已拒绝","待付款", "已完成","已评价","已调度"];
                            if (data != null && data != "") {
                                return strs[data];
                            }
                            return "";
                        }
                        },
                        {
                            "data": "updateTime", render: function (data, type, row, meta) {
                            if (parseInt(row.status) > 0)
                                return data;
                            else
                                return "";
                        }
                        },
                        {
                            "data": "taskId", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            if($("#taskCallDispatchList").val()=="1"){
                                columnHtml += '<a href="' + window.apppath + '/admin/task/update/' + data + '" class="btn default btn-xs green-stripe">查看</a>';
                            }

                            if (parseInt(row.status) == 0 && $("#taskCallDispatchDel").val()=="1"){
                                columnHtml += '<a data="' + data + '"  data-taskreceive="'+row.id+'" class="btn default btn-xs red-stripe delete">撤销</a>';
                            }
                            return columnHtml;
                        }
                        }
                    ]
                }

            });


            /**
             * 撤销
             */
            _self.grid.getTable().on("click", "a.delete", function (e) {
                var curRow = $(this).closest('tr');
                var taskId = $(this).attr("data");
                var taskReceiveId = $(this).data("taskreceive");
                $(this).confirmation({
                    'title': '确认撤销？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                    'onConfirm': function () {
                        Metronic.blockUI({
                            message: '处理中...',
                            target: tableContainer,
                            overlayColor: 'none',
                            cenrerY: true,
                            boxed: true
                        });
                        $.post(window.apppath + "/admin/api/task/cancel", {taskId: taskId,taskReceiveId:taskReceiveId}, function (res) {
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
        goToPage: function () {
            var page = $("#page").val();
            var len =  _self.grid.getDataTable().page.info().pages;
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