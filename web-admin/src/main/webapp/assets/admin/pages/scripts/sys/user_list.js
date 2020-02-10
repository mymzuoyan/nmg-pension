/**
 * Created by Administrator on 2016/9/13.
 */
var UserList = function () {
    var _self = "";

    return {
        grid: "",
        roleId: "",
        init: function () {
            _self = this;
            if ($("#roleUl").children("li").length > 0) {

                var roleId = $("#roleUl").children("li").eq(0).find("a").attr("data");
                _self.roleId = roleId;

                $("#roleUl").children("li").eq(0).addClass("active");
                _self.dataTableInit();


                $(".nav-tabs a").click(function () {
                    _self.roleId = $(this).attr("data");
                    $(".nav-tabs a").parent().removeClass("active");
                    $(this).parent().addClass("active");
                    _self.grid.getDataTable().ajax.reload();
                })
            }
        },
        dataTableInit: function () {
            _self.grid = new Datatable();
            var tableContainer = $("#datatable_user_list").parents(".table-container");
            _self.grid.init({
                src: $("#datatable_user_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/user/getList", {
                            length: params.length,
                            start: params.start,
                            orderField: "uid",
                            orderDir: "DESC",
                            login_name: $("#searchDiv input[name=login_name]").val(),
                            nick_name: $("#searchDiv input[name=nick_name]").val(),
                            roleId: _self.roleId,
                        }, function (res) {
                            if (res) {
                                res = eval("(" + res + ")");
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
                        {"data": "name"}
                        ,
                        {"data": "nickName"}
                        ,
                        {
                            "data": "roleName"
                        },
                        {
                            "data": "areaName", render: function (data, type, row, meta) {
                            if (row.serviceOrgName != null && row.serviceOrgName != "") {
                                return row.serviceOrgName;
                            }
                            if (data == null || data == "")
                                return "";
                            return data;
                        }
                        },
                        {
                            "data": "status", render: function (data, type, row, meta) {
                            if (data == "1") {
                                return '<span class="label label-success radius">审核通过</span>';
                            } else if (data == 0) {
                                return '<span class="label label-danger radius">未审核</span>';
                            } else if (data == 3) {
                                return '<span class="label label-default radius">审核未通过</span>';
                            } else {
                                return "管理员";
                            }
                        }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            if (row.roleName == "坐席人员") {
                                columnHtml += '<a href="' + window.apppath + '/admin/call/monitor/update/' + data + '" class="btn default btn-xs green-stripe">详细</a>';

                            }
                            else {
                                columnHtml += '<a data="' + window.apppath + '/admin/user/update/' + data + '" class="btn default btn-xs green-stripe detail">详细</a>';

                            }
                            columnHtml += '<button data-userid="' + data + '" class="btn default btn-xs red-stripe del">删除</button>';
                            return columnHtml;
                        }
                        }
                    ]
                }

            });

            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            })


            _self.grid.getTable().on("click", "a.detail", function (e) {
                var href = $(this).attr("data");
                window.parent.addTab("sysUserInfo", "用户基本信息", href);
            });
            /**
             * 删除
             */
            _self.grid.getTable().on("click", "button.del", function (e) {
                var curRow = $(this).closest('tr');
                var userId = $(this).data("userid");
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
                        $.post(window.apppath + "/admin/api/user/delete", {userId: userId}, function (res) {
                            Metronic.unblockUI(tableContainer);
                            if (res.success) {
                                _self.grid.getDataTable().row(curRow).remove().draw(false);
                            } else {
                                showMetroMessage(res.message);
                            }
                        }, "json");
                    }, onCancel: function () {

                    }
                }).confirmation('toggle');
            });

            function showMetroMessage(messageContent) {
                Metronic.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: messageContent,
                    container: tableContainer,
                    place: 'prepend',
                    closeInSeconds: 2
                });
            }

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
            var len = $(".pagination li").length - 4;
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