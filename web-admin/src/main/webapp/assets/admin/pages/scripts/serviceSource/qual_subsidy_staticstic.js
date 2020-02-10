var StatisticsList = function () {
    var grid = "";
    var handleList = function (method) {
        grid = new Datatable();
        var tableContainer = $("#qualification_subsidy_statistics").parents(".table-container");
        grid.init({
            src: $("#qualification_subsidy_statistics"),
            onSuccess: function (grid, res) {
                // execute some code after table records loaded
            },
            onError: function (grid) {
                // execute some code on network or other general error
            },
            loadingMessage: '加载中...',
            dataTable: {
                "ajax": function (params, callback, obj) {
                    $.post(window.apppath + "/admin/api/qualification/statistics",
                        {
                            areaId:$("#areaById").val()
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
                        "data":"number"
                    },
                    {
                        "data": "areaName",render:function (data, type, row, meta) {
                            if(data == "合计"){
                                return "合计";
                            }
                            var areaName = data;
                            return "<a href='"+window.apppath + "/admin/qualSubsidy/showData/" +row.areaId+"' >"+areaName+"</a>";
                        }

                    },
                    {
                        "data": "waitVerity",render:function (data, type, row, meta) {
                            if(data == null){
                                return 0;
                            }
                            return data;
                        }
                    },
                    {
                        "data": "passVerity",render:function (data, type, row, meta) {
                            if(data == null){
                                return 0;
                            }
                            return data;
                        }
                    },
                    {
                        "data": "notPassVerity" ,render:function (data, type, row, meta) {
                            if(data == null){
                                return 0;
                            }
                            return data;
                        }
                         
                    },
                    {
                        "data": "veritySum"

                    }
                ]
            }
        });
        //刷新页面
        $("#refresh").click(function () {
            window.location.reload();
        });
        $("#showList").click(function () {
            var href = window.apppath + '/admin/qualSubsidy/list';
            window.parent.addTab("home-pro-qualifications-applyList", "资格补贴审核", href);
        });
    };

    return {
        init: function (method) {
            handleList(method);
        },
    };
}();