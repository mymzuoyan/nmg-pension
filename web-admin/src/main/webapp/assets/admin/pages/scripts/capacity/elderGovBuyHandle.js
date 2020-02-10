/**
 * Created by Administrator on 2016/10/11.
 */
var ElderlyGovBuyList = function () {

    var _self = "";
    var tableContainer = $("#datatable_elderMsg_govbuy").parents(".table-container");

    $(".table-group-action-import").click(function () {
        $('#impModal').modal({
            keyboard: true
        });
    });

    return {
        grid: "",
        init: function () {
            _self = this;
            _self.tableInit();

            $("#btnAddGovBuy").click(function () {
                window.location.href = window.apppath + "/admin/elderly/govbuy/add";
            });

            $("#btnDeleteGovBuy").click(function () {
                var selectIds = "";
                $("input[name=govbuyId]:checked").each(function () {
                    selectIds += $(this).val() + ",";
                });
                if (selectIds == "") {
                    alert("请选择要删除的记录");
                }
                else {
                    $(this).confirmation({
                        'title': '确认删除？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                        'onConfirm': function () {
                            $.post(window.apppath + "/admin/api/elderly/govbuy/delete", {
                                selectIds: selectIds
                            }, function (res) {
                                if (res != null) {
                                    alert(res.message);
                                    _self.grid.getDataTable().ajax.reload();
                                }
                                else {
                                    alert(res.message);
                                }

                            }, "json");
                        }
                    }).confirmation('toggle');
                    /*if (confirm2("确定要删除这几条记录？")) {
                        $.post(window.apppath + "/admin/api/elderly/govbuy/delete", {
                            selectIds: selectIds
                        }, function (res) {
                            if (res != null) {
                                alert(res.message);
                                _self.grid.getDataTable().ajax.reload();
                            }
                            else {
                                alert(res.message);
                            }

                        }, "json");
                    }*/
                }
            });
        },
        tableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_elderly_govbuy"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/elderly/govbuy/listHandle", {
                            length: params.length,
                            start: params.start,
                            areaName: $("#areaName").val(),
                            elderName: $("input[name=elderName]").val(),
                            idcardno: $("input[name=idcardno]").val(),
                            elderTypeDictIds: $("#elderTypeDictIds").val(),
                            childrenDictId: $("#childrenDictId").val(),
                            residenceDictId: $("#residenceDictId").val(),
                            realAddress: $("input[name=realAddress]").val(),
                            callertype: $("#callertypeSelect").val(),
                            callerlabel: $("#callerLabelSelect").val(),
                            callerstatus: $("#callerStatusSelect").val(),
                            subsidy: $("input[name=srvsubsidy]").val(),
                            orderField:"c.areaOrder",
                            orderDir:"ASC"
                        }, function (res) {
                            if (res) {
                                $(".deleteDiv").css("display", "black");
                                $("#excel").css("display", "block");
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
                                return '<input type="checkbox" name="govbuyId" value="' + data + '">';
                            }
                        },
                        {
                            "data": "areaName", render: function (data, type, row, meta) {
                                if (data != null && data != "") {
                                    var strs = data.split(",");
                                    if (strs.length >= 2)
                                        return '<div title="' + strs[1] + '" style="text-align: center;vertical-align: middle;">' + strs[1] + '</div>';
                                    else
                                        return '<div title="' + strs[0] + '" style="text-align: center;vertical-align: middle;">' + strs[0] + '</div>';
                                }
                                return "";
                            }
                        },
                        {
                            "data": "areaName", render: function (data, type, row, meta) {
                                if (data != null && data != "") {
                                    var strs = data.split(",");
                                    if (strs.length >= 3)
                                        return '<div title="' + strs[2] + '" style="text-align: center;vertical-align: middle;">' + strs[2] + '</div>';
                                    else
                                        return '';
                                }
                                return "";
                            }
                        },
                        {
                            "data": "elderName", render: function (data, type, row, meta) {
                                if (data != "" && data != null) {
                                    return '<div title="' + data + '" style="text-align: center;vertical-align: middle;text-overflow: ellipsis;width: 40px;overflow: hidden;white-space: nowrap">' + data + '</div>';
                                } else {
                                    return "";
                                }
                            }
                        },
                        {"data": "age"},
                        {
                            "data": "sexDictId", render: function (data, type, row, meta) {
                                if (data != "" && data != null) {
                                    return ["保密", "男", "女"][data];
                                } else {
                                    return "";
                                }
                            }
                        },
                        {
                            "data": "realAddress", render: function (data, type, row, meta) {
                                if (data != "" && data != null) {
                                    return '<div title="' + data + '" style="text-align: left;vertical-align: middle;text-overflow: ellipsis;width: 40px;overflow: hidden;white-space: nowrap">' + data + '</div>';
                                } else {
                                    return "";
                                }
                            }
                        },
                        {
                            "data": "elderTypeDictIds", render: function (data, type, row, meta) {
                                arr = {
                                    "1": "城市特困/农村特困", "2": "低保/低保边缘", "3": "经济困难的失能/半失能老人", "4": "70周岁及以上的计生特扶老人",
                                    "5": "百岁老人", "9": "空巢", "10": "独居"
                                };
                                var scopes = '';
                                if (data != "" && data != null) {
                                    var scope = data.split(",");
                                    for (var i = 0; i < scope.length; i++) {
                                        if (arr[scope[i]] != "" && arr[scope[i]] != null) {
                                            scopes += arr[scope[i]] + ','
                                        }
                                    }
                                    scopes = scopes.substr(0, (scopes.length - 1));
                                }
                                return scopes;
                            }
                        },
                        /*{
                         "data": "realAddress", render: function (data, type, row, meta) {
                         if (data != "" && data != null) {
                         return '<div title="' + data + '" style="text-align: center;vertical-align: middle;text-overflow: ellipsis;width: 40px;overflow: hidden;white-space: nowrap">' + data + '</div>';
                         } else {
                         return "";
                         }
                         }
                         },*/
                        {
                            "data": "callerno", render: function (data, type, row, meta) {
                                if (data != "" && data != null) {
                                    return data;
                                } else {
                                    return "";
                                }
                            }
                        },
                        {
                            "data": "serviceOrgName", render: function (data, type, row, meta) {
                                if (data == null) {
                                    data = "";
                                }
                                return '<div title="' + data + '" style="text-align: left;vertical-align: middle;/*text-overflow: ellipsis;width: 60px;overflow: hidden;white-space: nowrap*/">' + data + '</div>';
                            }
                        },
                        /*{
                         "data": "callerstatus", render: function (data, type, row, meta) {
                         if (data != null && data != "") {
                         return ["", "√"][data];
                         }
                         return "";
                         }
                         },
                         {"data": "callerinitfee"},*/
                        {
                            "data": "callertype", render: function (data, type, row, meta) {
                                if (data != null && data != "") {
                                    return "<div style='white-space: nowrap'>" + ["", "固定", "移动","其他"][data] + "</div>";
                                }
                                return "";
                            }
                        },
                        /*{"data": "city"},
                         {"data": "area"},
                         {"data": "street"},
                         {"data": "village"},
                         {"data": "subsidy"},*/
                        {
                            "data": "status", render: function (data, type, row, meta) {
                                var statusName = ["<span style='color:red'>未审核</span>", '已审核'];
                                if (data != null)
                                    return statusName[data];
                                return "";
                            }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                                var html = "";
                                if($("#elderGoveInfoList").val()=="1"){
                                    html += '<div style="text-overflow: ellipsis;width: 140px;overflow: hidden;">' + '<a href="' + window.apppath + '/admin/elderly/govbuy/detail/' + data + '" class="btn default btn-xs blue-stripe">查看</a>';
                                }
                                if (row.status == 0 && $("#elderGoveInfoUpdate").val()=="1")
                                    html += '<button data="' + data + '"  class="btn default btn-xs red-stripe verify">审核</button>';
                                html += '</div>';
                                return html;
                            }
                        }
                    ]
                }

            });
            $(".table-group-action-submit").click(function () {
                _self.grid.getDataTable().ajax.reload();
            });

            $(".table-group-action-reload").click(function () {
                $("#gove-form").find("input:text").val("");//找到form表单下的所有input标签并清空
                $("#gove-form").find("select").val("");//找到form表单下的所有select标签并清空
                $("#gove-form").find("input:checkbox").parent().removeClass("checked");//找到form表单下的所有checkbox标签并清空
            });


            //导出数据
            $(".excel").click(function () {
                window.location.href = window.apppath + "/admin/api/elderly/govbuy/export?" + "areaName=" + $("#areaName").val() + "&"
                    + "elderName=" + $("input[name=elderName]").val() + "&"
                    + "idcardno=" + $("input[name=idcardno]").val() + "&"
                    + "elderTypeDictIds=" + $("#elderTypeDictIds").val() + "&"
                    + "childrenDictId=" + $("#elderTypeDictIds").val() + "&"
                    + "residenceDictId=" + $("#residenceDictId").val() + "&"
                    + "realAddress=" + $("input[name=realAddress]").val() + "&"
                    + "callertype=" + $("#callertypeSelect").val() + "&"
                    + "callerlabel=" + $("#callerLabelSelect").val() + "&"
                    + "callerstatus=" + $("#callerStatusSelect").val() + "&"
                    + "subsidy=" + $("input[name=srvsubsidy]").val();

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
            $.post(window.apppath + "/admin/api/elderly/govbuy/verify", {
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
        importFile: function (file) {
            var excelFile = $("#" + file).val().trim();
            if (excelFile != null && excelFile != "") {
                $.ajaxFileUpload({
                    url: window.apppath + "/admin/api/elderly/govbuy/import",
                    secureuri: false,
                    fileElementId: file,//file控件id
                    dataType: 'json',
                    success: function (data, status) {
                        $("#msg").text(data.message).addClass("label-danger");
                    },
                    error: function (data, status, e) {
                        console.log(e);
                    }
                });
            } else {
                $("#msg").text("请上传文件！").addClass("label-danger");
            }
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
        selectArea: function () {
            $('#myModal').modal({
                keyboard: true
            });
        },
        getAreaValue: function (areaName, areaId) {
            document.getElementById("areaName").value = areaName;
            document.getElementById("areaId").value = areaId;
            $('#myModal').modal('hide');
        },
        jqchk: function (name) { //jquery获取复选框值
            var chk_value = "";
            $('input[name="' + name + '"]').each(function () {
                var parentParent = $(this).parent();
                if (parentParent.hasClass("checked"))
                    chk_value += ($(this).val()) + ",";
            });
            return chk_value;
        }
    }
}();