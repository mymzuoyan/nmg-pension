/**
 * Created by CoderQiang on 2017/2/9.
 */
var ReturnVisitList = function () {
    var _self = "";
    return {
        grid_serviceOrg: "",
        grid_customer: "",
        grid_elderGovBuy: "",
        init: function () {
            _self = this;
            _self.getServiceOrgList(2);
            _self.getServiceOrgList(3);
            _self.getServiceOrgList(4);
            _self.getServiceOrgList(5);
            $(".nav li a").click(function () {
                if ($(this).attr("href") == "#tab_5") {
                    if (_self.grid_elderGovBuy == "") {
                        _self.getElderGovList();
                    }
                }
                if ($(this).attr("href") == "#tab_6") {
                    if (_self.grid_customer == "") {
                        _self.getCustomer();
                    }
                }
            })
            $("#confirm .callback").click(function () {
                var extension = window.parent.getExtension();
                var agentId = window.parent.getAgentId();
                $.post(window.apppath + "/admin/call/api/callInfo/returnVisit", {
                    callerId: $("#confirm input[name=phone]").val(),
                    agentId: agentId,
                    extension: extension,
                    visitorId: $("#confirm input[name=visitor]").val(),
                    visitorType: $("#confirm input[name=type]").val(),
                }, function (res) {
                    if (res != null) {
                        console.log(JSON.stringify(res));
                    }
                }, "json");
            })
        },
        getServiceOrgList: function (gradeDictId) {
            _self.grid_serviceOrg = new Datatable();
            _self.grid_serviceOrg.init({
                src: $("#datatable_serviceOrg_" + gradeDictId + "a_List"),
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/call/api/visit/getServiceOrgVisitList", {
                            length: params.length,
                            start: params.start,
                            institutionName: $("input[name=institutionName]").val(),
                            gradeDictId: (gradeDictId - 1)
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
                            return '<input type="checkbox" name="deleteId" value="' + row.id + '">';
                        }
                        },
                        {
                            "data": "areaName", render: function (data, type, row, meta) {
                            var areaName = "";
                            if (data != "" && data != null) {
                                var areaName = "";
                                if (data.split(",").length >= 2) {
                                    areaName = data.split(",")[1];
                                }
                                else
                                    areaName = data;
                            }
                            return areaName;
                        }
                        }
                        ,
                        {"data": "institutionName"}
                        ,
                        {
                            "data": "gradeDictId", render: function (data, type, row, meta) {
                            if (data == 0) {
                                return "A级";
                            } else if (data == 1) {
                                return "AA级";
                            } else if (data == 2) {
                                return "AAA级";
                            } else if (data == 3) {
                                return "AAAA级";
                            } else if (data == 4) {
                                return "AAAAA级";
                            } else {
                                return "";
                            }//等级  1-AA级 2-AAA级 3-AAAA级 4-AAAAA级
                        }
                        },
                        {
                            "data": "linkMan"
                        },
                        {
                            "data": "phone", render: function (data, type, row, meta) {
                            var extension = window.parent.getExtension();
                            var columnHtml = "";
                            if (extension != "" && row.phone != "" && row.phone != null) {
                                var visitorType = gradeDictId;
                                columnHtml = '<a style="text-decoration: none" onclick="ReturnVisitList.returnVisitCall(this)" class=" icon-call-out" data-type="' + visitorType + '" data-phone="' + row.phone + '" data-visitor="' + row.id + '" class="btn default btn-xs red-stripe visit"> ' + data + '</a>';
                            }
                            return columnHtml;
                        }
                        },
                        {
                            "data": "status", render: function (data, type, row, meta) {
                            if (data == "1")
                                return "已回访"
                            else
                                return "未回访";
                        }
                        },
                        {
                            "data": "visitResult", render: function (data, type, row, meta) {
                            if (row.status == "1")
                                if (data == 1)
                                    return "已回访"
                                else
                                    return "未接听"
                            else
                                return "未回访";
                        }
                        }
                    ]
                }

            });
            $("#search").unbind().click(function () {
                _self.grid_serviceOrg.getDataTable().ajax.reload();
            })
        },
        getElderGovList: function () {
            _self.grid_elderGovBuy = new Datatable();
            _self.grid_elderGovBuy.init({
                src: $("#datatable_elder_List"),
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/call/api/visit/getElderGovBuyVisitList", {
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
                            "data": "id", render: function (data, type, row, meta) {
                            return '<input type="checkbox" name="deleteId" value="' + row.id + '">';
                        }
                        },
                        {
                            "data": "areaName", render: function (data, type, row, meta) {
                            var areaName = "";
                            if (data != "" && data != null) {
                                var areaName = "";
                                if (data.split(",").length >= 2) {
                                    areaName = data.split(",")[1];
                                }
                                else
                                    areaName = data;
                            }
                            return areaName;
                        }
                        }
                        ,
                        {"data": "elderName"}
                        ,
                        {
                            "data": "age"
                        },
                        {
                            "data": "sexDictId", render: function (data, type, row, meta) {
                            var strs = ["保密", "男", "女"];
                            if (data == null || data == "")
                                data = 0;
                            return strs[data];
                        }
                        },
                        {
                            "data": "mobile", render: function (data, type, row, meta) {
                            var extension = window.parent.getExtension();
                            var columnHtml = "";
                            if (extension != "" && row.mobile != "" && row.mobile != null) {
                                columnHtml = '<a onclick="ReturnVisitList.returnVisitCall(this)" class=" icon-call-out" data-type="1" data-phone="' + row.mobile + '" data-visitor="' + row.id + '" class="btn default btn-xs red-stripe visit "> ' + data + '</a>';
                            }
                            return columnHtml;
                        }
                        },
                        {
                            "data": "status", render: function (data, type, row, meta) {
                            if (data == "1")
                                return "已回访"
                            else
                                return "未回访";
                        }
                        },
                        {
                            "data": "visitResult", render: function (data, type, row, meta) {
                            if (row.status == "1")
                                if (data == 1)
                                    return "已回访"
                                else
                                    return "未接听"
                            else
                                return "未回访";
                        }
                        }
                    ]
                }

            });
            $("#search").unbind().click(function () {
                _self.grid_elderGovBuy.getDataTable().ajax.reload();
            })
        },
        getCustomer: function () {
            _self.grid_customer = new Datatable();
            _self.grid_customer.init({
                src: $("#datatable_customer_List"),
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/call/api/visit/getCustomerVisitList", {
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
                            "data": "id", render: function (data, type, row, meta) {
                            return '<input type="checkbox" name="deleteId" value="' + row.id + '">';
                        }
                        },
                        {
                            "data": "beeperAddress", render: function (data, type, row, meta) {
                            var areaName = "";
                            if (data != "" && data != null) {
                                var areaName = "";
                                if (data.split(",").length >= 2) {
                                    areaName = data.split(",")[1];
                                }
                                else
                                    areaName = data;
                            }
                            return areaName;
                        }
                        }
                        ,
                        {
                            "data": "beeperNum", render: function (data, type, row, meta) {
                            var extension = window.parent.getExtension();
                            var columnHtml = "";
                            if (extension != "" && row.beeperNum != "" && row.beeperNum != null) {
                                columnHtml = '<a onclick="ReturnVisitList.returnVisitCall(this)" class=" icon-call-out" data-type="6" data-phone="' + data + '" data-visitor="' + row.id + '" class="btn default btn-xs red-stripe visit "> ' + data + '</a>';
                            }
                            return columnHtml;
                        }
                        },
                        {"data": "elderName"}
                        ,
                        {
                            "data": "age"
                        },
                        {
                            "data": "sexDictId", render: function (data, type, row, meta) {
                            var strs = ["保密", "男", "女"];
                            if (data == null || data == "")
                                data = 0;
                            return strs[data];
                        }
                        },
                        {
                            "data": "status", render: function (data, type, row, meta) {
                            if (data == "1")
                                return "已回访"
                            else
                                return "未回访";
                        }
                        },
                        {
                            "data": "visitResult", render: function (data, type, row, meta) {
                            if (row.status == "1")
                                if (data == 1)
                                    return "已回访"
                                else
                                    return "未接听"
                            else
                                return "未回访";
                        }
                        }
                    ]
                }

            });
            $("#search").unbind().click(function () {
                _self.grid_customer.getDataTable().ajax.reload();
            })
        },
        returnVisitCall: function (dom) {
            var self = dom;
            var phone = $(self).data("phone");
            var visitor = $(self).data("visitor");
            var type = $(self).data("type");
            $("#confirm input[name=phone]").val(phone);
            $("#confirm input[name=visitor]").val(visitor);
            $("#confirm input[name=type]").val(type);
            $("#confirm .callNum").html(phone)
            $("#confirm").modal("show");
        }

    }
}();