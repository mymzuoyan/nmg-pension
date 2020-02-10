/**
 * Created by Administrator on 2016/11/7.
 */
var FeedbackList = function () {

    var tableContainer = $("#datatable_userfuwu_record_list").parents(".table-container");
    var _self = "";
    return {
        adminFlag: "2",
        serviceOrgType: "",
        init: function (type) {
            _self = this;
            _self.serviceOrgType = type;
            _self.dataTableInit();
            $(".nav-tabs a").click(function () {
                _self.adminFlag = $(this).attr("data");
                $(".nav-tabs a").parent().removeClass("active");
                $(this).parent().addClass("active");
                _self.grid.getDataTable().ajax.reload();
            })

        }, dataTableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_userfuwu_record_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/user/fuwu/feedback/listData", {
                            length: params.length,
                            start: params.start,
                            name: $("input[name=name]").val(),
                            serviceOrgName: $("input[name=serviceOrgName]").val(),
                            idcardno: $("input[name=idcardno]").val(),
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
                    "columns": [
                        {
                            "data": "name"
                        },
                        {
                            "data": "serviceOrgName", render: function (data, type, row, meta) {
                                return '<div>' + data + '</div>';
                            }
                        },
                        {
                            "data": "idcardno", render: function (data, type, row, meta) {
                                if (data != null && data != "") {
                                    if (data.length == 15) {
                                        return data.replace(data.substr(8, 6), "******");
                                    } else {
                                        return data.replace(data.substr(10, 6), "******");
                                    }
                                }
                                else {
                                    return "";
                                }

                            }
                        },
                        {
                            "data": "mobile", render: function (data, type, row, meta) {
                                if (data != null && data != "")
                                    return data.replace(data.substr(5, 4), "****");
                                else
                                    return "";
                            }
                        },
                        {
                            "data": "favorableRate", render: function (data, type, row, meta) {
                                return data != null ? data*100 + "%" : "" ;
                            }
                        },
                        {
                            "data": "userId", render: function (data, type, row, meta) {
                                return '<button data-id="' + data + '"  class="btn default btn-xs blue-stripe fwRecordList">服务记录</button>';
                            }
                        }
                    ]
                }

            });

            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            });

            /**
             * 服务记录
             */
            _self.grid.getTable().on("click", "button.fwRecordList", function (e) {
                var id = $(this).data("id");
                window.parent.addTab("user-fuwu-detail", "服务记录", window.apppath + "/admin/task/sc_record_list?receiverId=" + id);
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