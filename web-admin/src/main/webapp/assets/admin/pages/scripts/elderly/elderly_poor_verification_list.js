/**
 * Created by Administrator on 2016/9/13.
 */
var ElderMsgPoorVerificationList = function () {
    var _self = "";
    var tableContainer = $("#datatable_verification_list").parents(".table-container");
    return {
        grid: "",
        init: function () {
            _self = this;
            _self.dataTableInit();
        },
        dataTableInit: function () {
            _self.grid = new Datatable();
            var year = new Date().getFullYear();
            _self.grid.init({
                src: $("#datatable_verification_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/elderly/poor/verification/list", {
                            length: params.length,
                            start: params.start,
                            year: year,
                            result: 0,
                            expire: 0,
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
                            "data": "id", render: function (data, type, row, meta) {
                                return "需年审"
                        }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var html = '<a  href="#" data="' + window.apppath + '/admin/elderly/poor/verification/'+data+'/' + row.applyId + '" class="btn default btn-xs green-stripe applyInfo">审核</a>';
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
                var href = $(this).attr("data");
                window.parent.addTab("poor-verificationInfo", "特困人员供养年审", href);
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