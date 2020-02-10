/**
 * Created by Administrator on 2016/10/1w1.
 */
var ElderlyHealthSelect = function () {
    var _self = "";
    var tableContainer = $("#datatable_elderly_govbuyfw").parents(".table-container");

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
                window.location.href = window.apppath + "/admin/elderly/govbuyfw/add";
            });


        },
        tableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_elderly_govbuyfw"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/elderly/govbuyfw/healthList", {
                            length: params.length,
                            start: params.start,
                            memberID: $("input[name=memberID]").val(),
                            name: $("input[name=name]").val(),
                            idCardNo: $("input[name=idCardNo]").val(),
                            genderCode: $("#genderCode").val(),
                            phone: $("input[name=phone]").val(),
                            testType: $("#testType").val(),
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
                            "data": "memberID", render: function (data, type, row, meta) {
                                if (data == null) {
                                    data = "";
                                }
                                return '<div title="' + data + '" style="text-align: left;vertical-align: middle;/*text-overflow: ellipsis;width: 60px;overflow: hidden;white-space: nowrap*/">' + data + '</div>';
                            }
                        },
                        {
                            "data": "name", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return '<div title="' + data + '" style="text-align: center;vertical-align: middle;text-overflow: ellipsis;width: 40px;overflow: hidden;white-space: nowrap">' + data + '</div>';
                            } else {
                                return "";
                            }
                        }
                        },
                        {
                            "data": "genderCode", render: function (data, type, row, meta) {
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
                            "data": "idCardNo", render: function (data, type, row, meta) {
                                if (data.length == 15) {
                                    return data.replace(data.substr(8, 6), "******");
                                } else {
                                    return data.replace(data.substr(10, 6), "******");
                                }
                            }
                        },
                        {
                            "data": "testType", render: function (data, type, row, meta) {
                                if (data == 1) {
                                    return "血压";
                                }
                                if (data == 2) {
                                    return "血糖";
                                }
                                if (data == 3) {
                                    return "体重";
                                }
                                if (data == 4) {
                                    return "运动";
                                }
                                if (data == 5) {
                                    return "睡眠";
                                }
                                if (data == 6) {
                                    return "身体指数";
                                }
                                if (data == 7) {
                                    return "血脂";
                                }
                                if (data == 8) {
                                    return "血尿酸";
                                }
                                if (data == 9) {
                                    return "血氧";
                                }
                                if (data == 10) {
                                    return "心电";
                                }
                                if (data == 11) {
                                    return "呼吸率";
                                }
                                if (data == 12) {
                                    return "精神指数";
                                }
                                if (data == 13) {
                                    return "皮肤指数";
                                }
                                if (data == 14) {
                                    return "体温";
                                }
                                return "";
                            }
                        },
                        {"data": "phone"},
                        {"data": "recordDateTime"},
                        {"data": "remark"},
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var html = "";
                            if($("#elderGoveInfoList").val()=="1"){
                                html += '<div style="text-overflow: ellipsis;width: 140px;overflow: hidden;">' + '<a href="' + window.apppath + '/admin/elderly/govbuyfw/healthDetail/' + data + '" class="btn default btn-xs blue-stripe">查看</a>';
                            }

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


            _self.grid.getTable().on("click", "button.del", function (e) {
                var id = $(this).attr("data");
                $(this).confirmation({
                    'title': '是否删除？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                    'onConfirm': function () {
                        _self.delElderGovBuy(id);
                    }
                }).confirmation('toggle');
            });


        },
        delElderGovBuy: function (id) {
            Metronic.blockUI({
                message: '处理中...',
                target: tableContainer,
                overlayColor: 'none',
                cenrerY: true,
                boxed: true
            });
            $.post(window.apppath + "/admin/api/elderly/govbuyfw/delete", {
                id: id
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
                    url: window.apppath + "/admin/api/elderly/govbuyfw/import",
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