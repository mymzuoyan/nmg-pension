/**
 * Created by Administrator on 2016/9/13.
 */
var TaskList = function () {
    var _self = "";
    var dt="";
    return {
        init: function () {
            _self = this;
            _self.dataTableInit();

        },
        dataTableInit: function () {
           dt= $("#datatable_task_list").DataTable({
               "lengthChange": false,
                "pageLength": 10, // default records per page
                "ajax": {
                    "url": window.apppath + "/admin/api/task/getTaskList",
                    "type": "POST",
                    "data": {
                    }
                },
                "columns": [
                    {
                        "data": "name",
                        "orderable": false,
                    }
                    ,
                    {
                        "data": "roleName",
                        "orderable": false,
                    },
                    {
                        "searchable": false,
                        "data": null, render: function (data, type, row, meta) {

                        return row.sendCount + row.receiveCount;
                    }
                    },
                    {
                        "searchable": false,
                        "data": "sendCount"
                    },
                    {
                        "searchable": false,
                        "data": "receiveCount"
                    },
                ],
                "language": { // language settings
                    // metronic spesific
                    "metronicGroupActions": "_TOTAL_ 条记录被选中",
                    "metronicAjaxRequestGeneralError": "请求服务器失败，请检查网络连接",
                    "sProcessing": "正在加载数据...",
                    // data tables spesific
                    "lengthMenu": "<span class='seperator'>|</span>每页显示 _MENU_ 条记录",
                    "info": "共 _TOTAL_ 条记录",
                    "infoEmpty": "暂无数据",
                    "infoFiltered": "",
                    "emptyTable": "没有数据",
                    "zeroRecords": "",
                    "paginate": {
                        "previous": "上一页",
                        "next": "下一页",
                        "last": "末页",
                        "first": "首页",
                    },

                },
                "searching": true,
                "processing": true,

            });
            $("input[type=search]").parent().parent().parent().parent().remove();


            $("#search").click(function () {
                var name=$("input[name=name]").val();
                var role=$("#role :selected").val();
                dt.columns("0").search(name).columns("1").search(role).draw();
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
        goToPage:function () {
            var page=$("#page").val();
            var len=dt.page.info().pages;
            if(page!=""&&page!="0")
            {
                page=parseInt(page)-1;
                if(page<len)
                    dt.page(page).draw( false );
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