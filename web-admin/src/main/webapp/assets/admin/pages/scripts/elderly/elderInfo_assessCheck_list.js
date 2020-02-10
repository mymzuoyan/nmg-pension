/**
 * Created by Administrator on 2016/10/10.
 */
var ElderInfoAssessCheckList = function () {

    var _self = "";
    return {
        elderId: "",
        area: "",
        dataTable:"",
        init: function (id, areaName) {
            _self = this;
            _self.elderId = id;
            _self.area = areaName;
            if(_self.dataTable=="")
            {
                _self.tableInit();
            }
            else {
                var param={
                    elderId: _self.elderId
                }
                _self.dataTable.settings()[0].ajax.data = param;
                _self.dataTable.ajax.reload();
            }
            
            $("#checkModal .addCheck").click(function () {
                window.location.href=window.apppath+"/admin/elderly/assessCheck/add?id="+_self.elderId
            })
        },
        tableInit: function () {
            _self.dataTable=$("#datatable_assesCheck_list").DataTable({
                "lengthChange": false,
                "pageLength": 10, // default records per page
                "ajax": {
                    "url": window.apppath + "/admin/api/elderly/assessCheck/List",
                    "type": "POST",
                    "data": {
                        elderId: _self.elderId
                    }
                },
                "columns": [
                    {
                        "data": null, render: function (data, type, row, meta) {
                        return _self.area;
                    },
                    }
                    ,
                    {
                        "data": "checkContent",
                    },
                    {
                        "data": "checkResult"
                    },
                    {
                        "data": "checkTime"
                    },
                    {
                        "data": "id", render: function (data, type, row, meta) {
                        var columnHtml = '';
                        columnHtml += '<a href="'+window.apppath +'/admin/elderly/assessCheck/update/'+data+'" class="btn default btn-xs green-stripe">详细</a>';
                        return columnHtml;
                    }
                    }
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
                    "search": "搜索:",
                    "searchPlaceholder": "输入搜素的姓名/角色",
                    "paginate": {
                        "previous": "上一页",
                        "next": "下一页",
                        "last": "末页",
                        "first": "首页",
                        "page": "Page",
                        "pageOf": "of"
                    },

                },
                "searching": false,
                "ordering":false,
                "processing": false,

            });

        }
    }
}();