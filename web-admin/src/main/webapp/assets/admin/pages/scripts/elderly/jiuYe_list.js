var ElderInfo = function () {
    var flag1 = false;
    var flag2 = true;
    var grid = "";
    var handleList = function () {
        var arr;
        var elderTypeDictIds;
        var serviceNeed;
        var elderTypeDictIdsCheckbox;
        var serviceNeedCheckbox;
        grid = new Datatable();
        var tableContainer = $("#datatable_event_list").parents(".table-container");
        grid.init({
            src: $("#datatable_event_list"),
            onSuccess: function (grid, res) {
            },
            onError: function (grid) {
                // execute some code on network or other general error
            },
            loadingMessage: '加载中...',
            dataTable: {
                "ajax": function (params, callback, obj) {
                    $.post(window.apppath + "/admin/api/elderly/getJiuYeInfo", {
                        length: params.length,
                        start: params.start,
                        orderField: "areaOrder",
                        orderDir: "asc",
                        name: $('input[name=name]').val(),
                        areaName: $('input[name=areaName]').val(),
                        serviceOrgName: $('input[name=serviceOrgName]').val(),
                        cardNo: $('input[name=cardNo]').val(),
                        mobile: $('input[name=mobile]').val(),
                        buTieMoney: $('input[name=buTieMoney]').val(),
                        overTime: $('input[name=overTime]').val(),
                        remarks: $('input[name=remarks]').val(),
                        elderTypeDictIdsCheckbox: elderTypeDictIdsCheckbox,
                        serviceNeedCheckbox: serviceNeedCheckbox
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
                        "data": "id", render: function (data, type, row, meta) {
                        return '<input type="checkbox" name="deleteId" value="' + row.id + '">';
                    }
                    },
                    {
                        "data": "region1", render: function (data, type, row, meta) {
                        if (data == null || data == "") {
                            return row.areaName;
                        }
                        else
                            return data;
                    }
                    },
                    {
                        "data": "name", render: function (data, type, row, meta) {
                        return data;
                    }
                    },
                    {
                        "data": "cardNo", render: function (data, type, row, meta) {
                        if (data.length == 15) {
                            return data.replace(data.substr(8, 6), "******");
                        } else {
                            return data.replace(data.substr(10, 6), "******");
                        }
                    }
                    },
                    {
                        "data": "serviceOrgName", render: function (data, type, row, meta) {
                            return data;
                        }
                    },
                    {
                        "data": "mobile", render: function (data, type, row, meta) {
                            return data;
                        }
                    },
                    {
                        "data": "buTieMoney", render: function (data, type, row, meta) {
                            return data;
                        }
                    },
                    {
                        "data": "overTime", render: function (data, type, row, meta) {
                            return data;
                        }
                    },
                    {
                        "data": "remarks", render: function (data, type, row, meta) {
                            return data;
                        }
                    },
                    {
                        "data": "id", render: function (data, type, row, meta) {
                            var resultHtml="";
                        if ($("#elderInfo-delete").val() == "1") {

                            resultHtml+=  '<button data-topicid="' + data + '" class="btn btn-xs red-stripe del">删除</button>';
                        }
                        if($("#elderInfo-list").val()=="1"){
                            resultHtml+= '<a   href="#" data="' + window.apppath + '/admin/elderly/updateJiuYe/' + data + '?method=edit" class="btn default btn-xs green-stripe elderInfo">查看</a>';
                        }
                        return resultHtml;
                    }
                    }
                ]
            }
        });

        $(".table-group-action-import").click(function () {
            $('#impModal').modal({
                keyboard: true
            });
        });
        $("#ggimport").click(function () {
            $('#ggimpModal').modal({
                keyboard: true
            });
        });

        //导出数据
        $(".excel").click(function () {
            elderTypeDictIdsCheckbox = '';
            serviceNeedCheckbox = '';
            elderTypeDictIds = document.getElementsByName('elderTypeDictIds');
            for (var a = 0; a < elderTypeDictIds.length; a++) {
                if (elderTypeDictIds[a].checked) {
                    elderTypeDictIdsCheckbox = elderTypeDictIdsCheckbox + elderTypeDictIds[a].value + ",";
                }
            }

            serviceNeed = document.getElementsByName('serviceNeed');
            for (var j = 0; j < serviceNeed.length; j++) {
                if (serviceNeed[j].checked) {
                    serviceNeedCheckbox = serviceNeedCheckbox + serviceNeed[j].value + ",";
                }
            }
            elderTypeDictIdsCheckbox = elderTypeDictIdsCheckbox.substr(0, (elderTypeDictIdsCheckbox.length - 1));
            serviceNeedCheckbox = serviceNeedCheckbox.substr(0, (serviceNeedCheckbox.length - 1));
            window.location.href = window.apppath + "/admin/api/elderly/export?" +
                "areaName=" + $('input[name=areaName]').val() + "&"
                /*+ "serialNumber=" + $('input[name=serialNumber]').val() + "&"*/
                + "homeTel=" + $('input[name=homeTel]').val() + "&"
                + "startAge=" + $('input[name=startAge]').val() + "&"
                + "endAge=" + $('input[name=endAge]').val() + "&"
                /*+ "isDeath=" + $('select[name=isDeath]').val() + "&"*/
                + "regPlace=" + $('input[name=regPlace]').val() + "&"
                + "realAddress=" + $('input[name=realAddress]').val() + "&"
                + "sexDictId= " + $('select[name=sexDictId]').val() + "&"
                + "elderTypeDictIdsCheckbox=" + elderTypeDictIdsCheckbox + "&"
                + "residenceDictId=" + $('select[name=residenceDictId]').val() + "&"
                + "serviceNeedCheckbox=" + serviceNeedCheckbox + "&"
                + "elderName=" + $('input[name=elderName]').val() + "&"
                + "idcardno=" + $('input[name=idcardno]').val();
        })

        $(".table-group-action-submit").click(function () {
            elderTypeDictIdsCheckbox = '';
            serviceNeedCheckbox = '';
            elderTypeDictIds = document.getElementsByName('elderTypeDictIds');
            for (var a = 0; a < elderTypeDictIds.length; a++) {
                if (elderTypeDictIds[a].checked) {
                    elderTypeDictIdsCheckbox = elderTypeDictIdsCheckbox + elderTypeDictIds[a].value + ",";
                }
            }

            serviceNeed = document.getElementsByName('serviceNeed');
            for (var j = 0; j < serviceNeed.length; j++) {
                if (serviceNeed[j].checked) {
                    serviceNeedCheckbox = serviceNeedCheckbox + serviceNeed[j].value + ",";
                }
            }
            elderTypeDictIdsCheckbox = elderTypeDictIdsCheckbox.substr(0, (elderTypeDictIdsCheckbox.length - 1));
            serviceNeedCheckbox = serviceNeedCheckbox.substr(0, (serviceNeedCheckbox.length - 1));
            grid.getDataTable().ajax.reload();
        });

        $(".table-group-action-add").click(function () {
            window.parent.addTab("tab-elderly-add", "新增就业人员", window.apppath + "/admin/elderly/addJiuYe?method=add");
        });

        $(".table-group-action-reload").click(function () {
            $("#elder-form").find("input:text").val("");//找到form表单下的所有input标签并清空
            $("#elder-form").find("input:hidden").val("");//找到form表单下的所有input标签并清空
            $("#elder-form").find("select").val("");//找到form表单下的所有select标签并清空
            $("#elder-form").find("input:checkbox").parent().removeClass("checked");//找到form表单下的所有checkbox标签并清空
            $("#elder-form").find("input:checkbox").attr("checked", false);
        });

        grid.getTable().on("click", "a.elderInfo", function () {
            var href = $(this).attr("data");
            window.parent.addTab("elderInfo", "从业人员补贴信息", href);
        });

        grid.getTable().on("click", "button.del", function () {
            var curRow = $(this).closest('tr');
            var topicId = $(this).data("topicid");
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
                    $.post(window.apppath + "/admin/api/elderly/deleteJiuYe", {id: topicId}, function (res) {
                        Metronic.unblockUI(tableContainer);
                        if (res.success) {
                            grid.getDataTable().row(curRow).remove().draw(false);
                        } else {
                            showMetroMessage(res.message);
                        }
                    }, "json");
                }
            }).confirmation('toggle');
        });


        function showMetroMessage(messageContent) {
            Metronic.alert({
                type: 'danger',
                icon: 'warning',
                message: messageContent,
                container: tableContainer,
                place: 'prepend'
            });
        }

        $("#btnDeleteElderMsg").on("click", function (e) {
            var deleteIds = jqchk("deleteId");
            if (deleteIds == "") {
                showMetroMessage("未选中");
                return false;
            }
            $(this).confirmation({
                'title': '确认删除？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                'onConfirm': function () {
                    updateArticles(deleteIds);
                }
            }).confirmation('toggle');
        });

        function jqchk(name) { //jquery获取复选框值
            var chk_value = "";
            $('input[name="' + name + '"]').each(function () {
                var parentParent = $(this).parent();
                if (parentParent.hasClass("checked"))
                    chk_value += ($(this).val()) + ",";
            });
            return chk_value;
        }

        function updateArticles(deleteIds) {
            Metronic.blockUI({
                message: '处理中...',
                target: tableContainer,
                overlayColor: 'none',
                cenrerY: true,
                boxed: true
            });
            $.post(window.apppath + "/admin/api/elderly/deleteSomeJiuYe", {
                deleteIds: deleteIds
            }, function (res) {
                Metronic.unblockUI(tableContainer);
                if (res.success) {
                    Metronic.alert({type: 'success', message: res.message, closeInSeconds: 3, icon: 'check'});
                    grid.getDataTable().draw(false);
                }
                else {
                    Metronic.alert({type: 'danger', message: res.message, closeInSeconds: 3, icon: 'check'});
                }
            }, 'json');
        }

    }

    return {
        init: function (method) {
            handleList(method);
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
        showTbody1: function () {
            if (flag1) {
                $('#tbody1').css("display", "");
                flag1 = false;
            } else {
                $('#tbody1').css("display", "none");
                flag1 = true;
            }
        },
        showTbody2: function () {
            if (flag2) {
                $('#tbody2').css("display", "");
                flag2 = false;
            } else {
                $('#tbody2').css("display", "none");
                flag2 = true;
            }
        },
        importFile: function (file) {
            $("#msg").text("导入中...").addClass("label-danger");
            var excelFile = $("#" + file).val().trim();
            if (excelFile != null && excelFile != "") {
                $.ajaxFileUpload({
                    url: window.apppath + "/admin/api/elderly/importJiuYe",
                    secureuri: false,
                    fileElementId: file,//file控件id
                    dataType: 'json',
                    success: function (data, status) {
                        $("#msg").text(data.message).addClass("label-danger");
                        if (data.data != null && data.data != "") {
                            alert(data.data);
                        }
                    }
                });
            } else {
                $("#msg").text("请上传文件！").addClass("label-danger");
            }
        },
        ggimportFile: function (file) {
            $("#ggmsg").text("导入中...").addClass("label-danger");
            var excelFile = $("#" + file).val().trim();
            if (excelFile != null && excelFile != "") {
                $.ajaxFileUpload({
                    url: window.apppath + "/admin/api/elderly/ggimport",
                    secureuri: false,
                    fileElementId: 'ggfile',//file控件id
                    dataType: 'json',
                    success: function (data, status) {
                        $("#ggmsg").text(data.message).addClass("label-danger");
                        if (data.data != null && data.data != "") {
                            alert(data.data);
                        }
                    }
                });
            } else {
                $("#ggmsg").text("请上传文件！").addClass("label-danger");
            }
        }
    };
}();