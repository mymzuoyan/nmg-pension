/**
 * Created by Administrator on 2016/11/7.
 */
var UserFuwu = function () {

    var tableContainer = $("#datatable_userfuwu_list").parents(".table-container");
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
                src: $("#datatable_userfuwu_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/user/fuwu/list", {
                            length: params.length,
                            start: params.start,
                            name: $("input[name=name]").val(),
                            serviceOrgType: _self.serviceOrgType,
                            serviceOrgName: $("input[name=serviceOrgName]").val(),
                            idcardno: $("input[name=idcardno]").val(),
                            serviceOrgId: $("input[name=serviceOrgId]").val(),
                            areaName: $("input[name=areaName]").val(),
                            adminFlag: _self.adminFlag
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
                            "data": "id", render: function (data, type, row, meta) {
                            return '<input type="checkbox" name="fuwuId" value="' + row.id + '">';
                        }
                        },
                        {
                            "data": "name"
                        },
                        {
                            "data": "serviceOrgName", render: function (data, type, row, meta) {
                            return '<div style="text-align: left">' + data + '</div>';
                        }
                        },
                        {
                            "data": "gender", render: function (data, type, row, meta) {
                            if (data != null && data != "")
                                return data;
                            else
                                return "";
                        }
                        },
                        {"data": "age"},
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
                            "data": "userType", render: function (data, type, row, meta) {
                            if (data != null && data != "")
                                return userFuFuType[data]
                            else
                                return "";
                        }
                        },
                        {
                            "data": "workType", render: function (data, type, row, meta) {
                            var type = "不是志愿者";
                            if (data == 1) {
                                type = "专职";
                            } else if (data == 2) {
                                type = "兼职";
                            } else if (data == 3) {
                                type = "时间银行志愿者";
                            } else {
                                type = "其他志愿者";
                            }
                            return type;
                        }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            if ($("#serviceUser_list").val()=="1") {
                                columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs blue-stripe info">详细</button>';
                            }
                            if($("#serviceUser_del").val()=="1") {
                                columnHtml += '<button data-fuwuid="' + data + '" class="btn default btn-xs red-stripe del">删除</button>';
                            }
                            return columnHtml;
                        }
                        }
                    ]
                }

            });

            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            });

            $(".btn-add").click(function () {
                var href = $(this).attr("data");
                window.parent.addTab("tab_user_fuwu_add", "服务人员增加", href);
            })

            /**
             * 详细
             */
            _self.grid.getTable().on("click", "button.info", function (e) {
                var id = $(this).data("id");
                window.parent.addTab("user-fuwu-detail", "服务人员详情", window.apppath + "/admin/user/fuwu/info/" + id);
            });

            /**
             * 删除
             */
            _self.grid.getTable().on("click", "button.del", function (e) {
                var curRow = $(this).closest('tr');
                var fuwuId = $(this).data("fuwuid");
                $(this).confirmation({
                    'title': '确认删除？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                    'onConfirm': function () {
                        Metronic.blockUI({
                            message: '处理中...',
                            target: tableContainer,
                            overlayColor: 'none',
                            cenrerY: true,
                            boxed: true
                        });
                        $.post(window.apppath + "/admin/api/user/fuwu/delete", {id: fuwuId}, function (res) {
                            Metronic.unblockUI(tableContainer);
                            if (res.success) {
                                _self.grid.getDataTable().row(curRow).remove().draw(false);
                            } else {
                                _self.showMetroMessage(res.message);
                            }
                        }, "json");
                    }, onCancel: function () {

                    }
                }).confirmation('toggle');
            });

            $("#btnDeleteServiceUser").on("click", function (e) {
                var deleteIds = _self.jqchk("fuwuId");
                if (deleteIds == "") {
                    _self.showMetroMessage("未选中");
                    return false;
                }
                $(this).confirmation({
                    'title': '确认删除？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                    'onConfirm': function () {
                        updateArticles(deleteIds);
                    }
                }).confirmation('toggle');
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

        },
        jqchk: function (name) { //jquery获取复选框值
            var chk_value = "";
            $('input[name="' + name + '"]').each(function () {
                var parentParent = $(this).parent();
                if (parentParent.hasClass("checked"))
                    chk_value += ($(this).val()) + ",";
            });
            return chk_value;
        },
        updateArticles: function (deleteIds) {
            Metronic.blockUI({
                message: '处理中...',
                target: tableContainer,
                overlayColor: 'none',
                cenrerY: true,
                boxed: true
            });
            $.post(window.apppath + "/admin/api/user/fuwu/deleteSomeUser", {
                deleteIds: deleteIds
            }, function (res) {
                Metronic.unblockUI(tableContainer);
                if (res.success) {
                    Metronic.alert({type: 'success', message: res.message, closeInSeconds: 3, icon: 'check'});
                    _self.grid.getDataTable().draw(false);
                }
                else {
                    Metronic.alert({type: 'danger', message: res.message, closeInSeconds: 3, icon: 'check'});
                }
            }, 'json');
        },
        addTab: function (e) {
            var href = $(e).attr("data");
            window.parent.addTab("user-fuwu-detail", "服务人员详情", href);
        }
    }

}();