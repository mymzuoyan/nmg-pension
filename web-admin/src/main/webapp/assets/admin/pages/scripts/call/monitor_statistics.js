/**
 * Created by Administrator on 2016/11/29.
 */
var MonitorStatistics = function () {

    var _self = "";
    return {
        init: function () {
            _self = this;
            _self.dataTableInit();
        },
        dataTableInit:function () {
            var dt= $("#datatable_monitor_statistics").DataTable({
                "lengthChange": false,
                "pageLength": 10, // default records per page
                "ajax": {
                    "url": window.apppath + "/admin/call/api/callInfo/getMonitorStatistics",
                    "type": "POST",
                    "data": {
                    }
                },
                "columns": [
                    {
                        "data": "account",
                        "orderable": false,
                    }
                    ,
                    {
                        "data": "name",
                        "orderable": false,
                    },
                    {
                        "searchable": false,
                        "data": "all"
                    },
                    {
                        "searchable": false,
                        "data": "in"
                    },
                    {
                        "searchable": false,
                        "data": "out"
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
        }
        
    }
}();
