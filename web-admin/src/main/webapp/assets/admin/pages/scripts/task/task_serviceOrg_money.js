/**
 * Created by Administrator on 2016/9/21.
 */
var TaskServiceOrgMoneyList = function () {

    var _self = "";
    return {
        userId: "",
        grid: "",
        init: function (id) {
            _self = this;
            _self.userId = id;
            _self.tableInit();
        },
        tableInit: function () {
            _self.grid = new Datatable();
            var tableContainer = $("#datatable_task_serviceOrg_money").parents(".table-container");
            _self.grid.init({
                src: $("#datatable_task_serviceOrg_money"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/task/getServiceOrgTaskMoneyList", {
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
                            "data": "areaName", render: function (data, type, row, meta) {
                            if (data.split(",").length >= 2)
                                return data.split(",")[1];
                            else
                                return data.split(",")[0];
                        }
                        },
                        {"data": "serviceOrgName"}
                        ,
                        {
                            "data": "taskMoneyVos", render: function (data, type, row, meta) {
                            var count = 0;
                            var col=0;
                            var html = "";
                            var moneyHtml="";
                            var flag=false;
                            html += "<tr>";
                            for(var j in payTypeValue)
                            {
                                flag=false;
                                col++;
                                html += "<td>"+payTypeValue[j]+"</td>";
                                for (var i in data) {
                                    if(j==data[i].type)
                                    {
                                        flag=true;
                                        count += data[i].money;
                                        moneyHtml += "<td>"+ data[i].money+"元</td>";
                                    }
                                }
                                if(!flag)
                                {
                                    moneyHtml += "<td>"+ 0+"元</td>";

                                }
                            }
                            html += "</tr>";
                            html += "<tr>";
                            count=count.toFixed(2);
                            html+=moneyHtml;
                            html += "</tr>";
                            html="<table style='margin: -8px;padding: 0px;width: 100%;border: 0px' class='table table-bordered'>"+"<tr ><td colspan='"+col+"'>"+count+"元</td></tr>"+html;
                            html += "</table>";
                            console.log(html)
                            return html;
                        }
                        }

                    ]
                }

            });
        },
        goToPage: function () {
            var page = $("#page").val();
            var len = _self.grid.getDataTable().page.info().pages;
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