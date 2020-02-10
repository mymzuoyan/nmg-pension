var UserLinkElder = function () {
    var grid = "";
    var flag1 = false;
    return {
        init: function (method) {
            grid = new Datatable();
            var tableContainer = $("#datatable_user_link_elder_list").parents(".table-container");
            grid.init({
                src: $("#datatable_user_link_elder_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/userLinkElder/listData", {
                            length: params.length,
                            start: params.start,
                            elderSex: $('select[name=elderSex]').val(),
                            'task.receiverServiceOrg': $('input[name=receiverServiceOrg]').val(),
                            elderMobile: $('input[name=elderMobile]').val(),
                            elderName: $('input[name=elderName]').val(),
                            elderAddress: $('input[name=elderAddress]').val()
                        }, function (res) {
                            if (res) {
                                callback(res);
                                if (res.recordsFiltered > 0)
                                    $("#elderInfo-delete").css("display", "block");
                                $("#excel").css("display", "block");
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
                    "columns": [
                        {
                            "data": 'elderName',
                        }
                        ,
                        {
                            "data": 'elderSex', render: function (data, type, row, meta) {
                                if (data == 1) {
                                    return "男";
                                }
                                if (data == 2) {
                                    return "女";
                                }
                                return "";
                            }
                        },
                        {
                            "data": 'elderAge',
                        },
                        {
                            "data": 'elderAddress',
                        },
                        {
                            "data": 'elderCardNo', render: function (data, type, row, meta) {
                                if (data.length == 15) {
                                    return data.replace(data.substr(8, 6), "******");
                                } else {
                                    return data.replace(data.substr(10, 6), "******");
                                }
                            }
                        },
                        {
                            "data": 'elderMobile', render: function (data, type, row, meta) {
                                if (data != null && data != "") {
                                    return data.replace(data.substr(5, 4), "****");
                                } else {
                                    return "";
                                }
                            }
                        },
                        {
                            "data": 'task.receiverServiceOrg', render: function (data, type, row, meta) {
                                if (data != null && data != "") {
                                    return data;
                                } else {
                                    return "";
                                }
                            }
                        }
                    ]
                }
            });
            $(".table-group-action-submit").click(function () {
                grid.getDataTable().ajax.reload();
            });
        },

        showTbody1: function () {
            if (flag1) {
                $('#tbody1').css("display", "");
                flag1 = false;
            } else {
                $('#tbody1').css("display", "none");
                flag1 = true;
            }
        },

        goToPage: function () {
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

        },
        goToPageByPage: function (page) {
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
    };
}();