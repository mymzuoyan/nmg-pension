/**
 * Created by gengqiang on 2017/9/29.
 */
var ServiceOrgAssessStatistic = function () {
    var grid = "";
    var handleList = function (method) {
        grid = new Datatable();
        grid.init({
            src: $("#AssessTable"),
            onSuccess: function (grid, res) {
                // execute some code after table records loaded
            },
            onError: function (grid) {
                // execute some code on network or other general error
            },
            loadingMessage: '加载中...',
            dataTable: {
                "ajax": function (params, callback, obj) {
                    $.post(window.apppath + "/admin/api/orgAssess/getStatistic",
                        {
                            areaId:$("#areaId").val()
                        }, function (res) {
                            if (res) {
                                callback(res);
                            } else {
                                callback({
                                    data: null,
                                    recordFiltered: 0
                                });
                            }
                        }, 'json');
                },
                "searching": false,
                "ordering": false,
                "columns": [
                    {
                        "data": "serialNumber"
                    },
                    {

                        "data": "areaName",render:function (data, type, row, meta) {
                            if(data == "合计"){
                                return "合计";
                            }
                            var areaName = data;
                            return "<a href='"+window.apppath + "/admin/orgAssess/showData/" +row.areaId+"' >"+areaName+"</a>";
                        }
                    },
                    {
                        "data": "peopleCount",render:function (data, type, row, meta) {
                            if(data == null){
                                return 0;
                            }
                            return data;
                        }
                    },
                    {
                        "data": "moneyCount",render:function (data, type, row, meta) {
                            if(data == null){
                                return 0;
                            }
                            return data;
                        }
                    }
                ]
            }
        });
    };
    return {
        init: function (method) {
            handleList(method);
        }
    };
}();