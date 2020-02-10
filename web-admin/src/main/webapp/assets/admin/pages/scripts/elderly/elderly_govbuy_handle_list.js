/**
 * Created by Administrator on 2016/9/13.
 */
var ElderMsgGovBuyHandleList = function () {
    var _self = "";
    var tableContainer = $("#datatable_handle_list").parents(".table-container");
    return {
        grid: "",
        init: function () {
            _self = this;
            _self.dataTableInit();

        },
        dataTableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_handle_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/elderly/govbuy/apply/handle/list", {
                            length: params.length,
                            start: params.start,
                            orderField: 'id',
                            orderDir: "DESC"
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
                        {"data": "id"}
                        ,
                        {"data": "region1"}
                        ,
                        {"data": "number"}
                        ,
                        {
                            "data": "name"
                        },
                        {
                            "data": "idcardno", render: function (data, type, row, meta) {
                            if (data.length == 15) {
                                return data.replace(data.substr(8, 6), "******");
                            } else {
                                return data.replace(data.substr(10, 6), "******");
                            }
                        }
                        },
                        {
                            "data": "mobile"
                        },
                        {
                            "data": "createTime"
                        },
                        {
                            "data": "status", render: function (data, type, row, meta) {
                                if(data==null)
                                    data=0;
                                return applyStatusName[data];
                        }
                        },
                        {
                            "data": "id",render: function (data, type, row, meta) {
                            return '<a  href="#" data="' + window.apppath + '/admin/elderly/govbuy/apply/info/' + data + '" class="btn default btn-xs green-stripe applyInfo">查看</a>';
                        }
                        }
                    ]
                }
            });
            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            })

            _self.grid.getTable().on("click", "a.applyInfo", function () {
                var href=$(this).attr("data");
                window.parent.addTab("govbuy-applyInfo", "政府买居家养老服务申请详情", href);
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
        getDate: function (time) {
            return time.getFullYear() + "-" + _self.formatTwo(time.getMonth() + 1) + "-" + _self.formatTwo(time.getDate());
        },
        formatTwo: function (str) {
            str = str + "";
            if (str.length == 1) {
                str = "0" + str;
            }
            return str;
        }, goToPage: function () {
            var page = $("#page").val();
            var len = grid.getDataTable().page.info().pages;
            if (page != "" && page != "0") {
                page = parseInt(page) - 1;
                if (page < len)
                    grid.getDataTable().page(page).draw(false);
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