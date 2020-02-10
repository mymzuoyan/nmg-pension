/**
 * Created by Administrator on 2016/11/7.
 */
var MessageReceiveList = function () {

    var tableContainer = $("#datatable_message_receive_list").parents(".table-container");
    var _self = "";
    return {
        init: function () {
            _self = this;
            _self.dataTableInit();

        }, dataTableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_message_receive_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/message/receive/list", {
                            length: params.length,
                            start: params.start,
                            orderField: 'b.read ASC, a.id',
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
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            return '<input type="checkbox" value="' + row.id + '">';
                        }
                        },
                        {
                            "data": "title", render: function (data, type, row, meta) {
                            return data;
                        }
                        }
                        ,
                        {
                            "data": "creatorName", render: function (data, type, row, meta) {
                            if (data == null || data == "") {
                                data = "系统发布"
                            }
                            return data;
                        }
                        },
                        {
                            "data": "createTime"
                        },
                        {
                            "data": "read", render: function (data, type, row, meta) {
                            if (data == null || data == "")
                                data = 0;
                            var strs = ["<sapn style='color:red'>未读</sapn>", "已读"];
                            return strs[data];
                        }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            if (row.title == "组织平台注册") {
                                columnHtml += '<button class="btn default btn-xs green-stripe" type="button" onclick="MessageReceiveList.showTab(1,' + data + ');">详细</button>';
                            } else if (row.title == "组织等级考评") {
                                columnHtml += '<button class="btn default btn-xs green-stripe" type="button" onclick="MessageReceiveList.showTab(2,' + data + ');">详细</button>';
                            } else if (row.title == "刷卡设备申请" || row.title == "助老卡申请" || row.title == "服务组织名称更改申请" || row.title == "设备保修（维护）申请" || row.title == "刷卡系统用户名申请") {
                                columnHtml += '<button class="btn default btn-xs green-stripe" type="button" onclick="MessageReceiveList.showTab(3,' + data + ');">详细</button>';
                            } else {
                                columnHtml += '<a href="' + window.apppath + '/admin/message/update/' + data + '" class="btn default btn-xs green-stripe">详细</a>';
                            }
                            return columnHtml;
                        }
                        }
                    ]
                }

            });

        },
        showTab: function (str, data) {
            if (str == 1) {
                $.post(window.apppath + "/admin/api/message/receive/update", {
                    messageId: data
                }, function (res) {
                    window.location.reload();
                    window.parent.hasAMsg("","2");
                    window.parent.addTab("side-serviceOrg-list", "养老服务组织", window.apppath + '/admin/serviceOrgShow');
                }, "json");

            } else if (str == 2) {
                $.post(window.apppath + "/admin/api/message/receive/update", {
                    messageId: data
                }, function (res) {
                    window.location.reload();
                    window.parent.hasAMsg("","2");
                    window.parent.addTab("side-orgAssessShow", "养老组织评估系统", window.apppath + '/admin/orgAssessShow');
                }, "json");
            } else if (str == 3) {
                $.post(window.apppath + "/admin/api/message/receive/update", {
                    messageId: data
                }, function (res) {
                    window.location.reload();
                    window.parent.hasAMsg("","2");
                    window.parent.addTab("showCardSystem", "申请列表", window.apppath + '/admin/cardSystem/showCardSystem');

                }, "json");
             }

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