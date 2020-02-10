/**
 * Created by Administrator on 2016/9/13.
 */
var ElderMsgPoorHandleList = function () {
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
                        $.post(window.apppath + "/admin/api/elderly/poor/apply/handle/list", {
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
                            "data": "sex", render: function (data, type, row, meta) {
                            return sexValue[data];
                        }
                        },
                        {
                            "data": "status", render: function (data, type, row, meta) {
                            if(data==null)
                                data="";
                            return poorApplyStatusName[data];
                        }
                        },
                        {
                            "data": "id",render: function (data, type, row, meta) {
                                var html = '<div style="text-overflow: ellipsis;width: 140px;overflow: hidden;">' + '<a href="#" data="' + window.apppath + '/admin/elderly/poor/apply/info/' + data + '" class="btn default btn-xs blue-stripe applyInfo">查看</a>';
                                if (row.status == 0){
                                    html += '<button data="' + data + '"  class="btn default btn-xs red-stripe verify">审核</button>';
                                    }
                                html += '</div>';
                                return html;
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
                window.parent.addTab("poor-applyInfo", "特困人员供养申请详情", href);
            });
            _self.grid.getTable().on("click", "button.verify", function (e) {
                var id = $(this).attr("data");
                $(this).confirmation({
                    'title': '审核结果？', 'placement': 'left', 'btnOkLabel': '审核通过', 'btnCancelLabel': '取消',
                    'onConfirm': function () {
                        _self.verifyElderGovBuy(id);
                    }
                }).confirmation('toggle');
            });
        },
        verifyElderGovBuy: function (id) {
            Metronic.blockUI({
                message: '处理中...',
                target: tableContainer,
                overlayColor: 'none',
                cenrerY: true,
                boxed: true
            });
            $.post(window.apppath + "/admin/api/elderly/poor/verify", {
                id: id,
                status: 1
            }, function (res) {
                Metronic.unblockUI(tableContainer);
                if (res.success) {
                    Metronic.alert({type: 'success', message: res.message, closeInSeconds: 3, icon: 'check'});
                    _self.grid.getDataTable().draw(false);
                }
                else
                    Metronic.alert({type: 'danger', message: res.message, closeInSeconds: 3, icon: 'check'});
            }, 'json');
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