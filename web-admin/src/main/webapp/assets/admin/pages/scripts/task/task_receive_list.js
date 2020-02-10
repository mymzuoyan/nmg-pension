/**
 * Created by Administrator on 2016/9/21.
 */
var TaskReceiveList=function () {

    var _self="";
    return {
        userId:"",
        grid:"",
        init:function (id) {
            _self=this;
            _self.userId=id;
            _self.tableInit();
        },
        tableInit:function () {
            _self.grid = new Datatable();
            var tableContainer = $("#datatable_task_receive").parents(".table-container");
            _self.grid.init({
                src: $("#datatable_task_receive"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/task/receiveList", {
                            length: params.length,
                            start: params.start,
                            orderField:"id",
                            orderDir:"DESC",
                            receiverId:_self.userId,
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
                            "data": "sendTime",render: function (data, type, row, meta) {
                            return data;
                        }
                        },
                        {"data": "sendName"}
                        ,
                        {
                            "data": "taskTitle"
                        },
                        {
                            "data": "status",render: function (data, type, row, meta) {
                                if(data==null||data=="")
                                    data=0;
                            return  ["已拒绝", "待响应", "组织已响应", "组织已派遣", "组织已拒绝", "服务人员已接单", "服务人员已上门", "服务人员已拒绝","待付款", "已完成","已评价","已调度"][data];
                        }
                        },
                        {
                            "data": "updateTime",render: function (data, type, row, meta) {
                            return data;
                        }
                        },
                        {
                            "data": "taskId", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            if($("#taskDispatchGetList").val()=="1"){
                                columnHtml += '<a href="' + window.apppath + '/admin/task/update/' + data + '" class="btn default btn-xs green-stripe">查看</a>';
                            }
                            if($("#taskDispatchGetPatch").val()=="1" && row.status==2){
                                columnHtml += '<button data-id="' +data + '" class="btn default btn-xs red-stripe update">派发</button>';
                            }
                            return columnHtml;
                        }
                        }
                    ]
                }

            });
            /**
             * 派发
             */
            _self.grid.getTable().on("click", "button.update", function (e) {
                var curRow = $(this).closest('tr');
                var id = $(this).data("id");
                window.parent.addTab("task_send","发送工单",window.apppath+"/admin/task/send?id="+id);
            });
        },
        goToPage:function () {
            var page=$("#page").val();
            var len=_self.grid.getDataTable().page.info().pages;
            if(page!=""&&page!="0")
            {
                page=parseInt(page)-1;
                if(page<len)
                    _self.grid.getDataTable().page(page).draw( false );
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