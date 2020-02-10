var ServiceOrgElderList = function () {
    var flag1 = false;
    var flag2 = true;
    var grid = "";
    var handleList = function () {
        var arr;
        var elderTypeDictIds;
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
                    $.post(window.apppath + "/admin/api/serviceOrg/elder/list", {
                        length: params.length,
                        start: params.start,
                        orderField: "b.areaOrder",
                        orderDir: "asc",
                        areaName: $('input[name=areaName]').val(),
                        mobile: $('input[name=mobile]').val(),
                        startAge: $('input[name=startAge]').val(),
                        endAge: $('input[name=endAge]').val(),
                        realAddress: $('input[name=realAddress]').val(),
                        sexDictId: $('select[name=sexDictId]').val(),
                        elderName: $('input[name=elderName]').val(),
                        idcardno: $('input[name=idcardno]').val()
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
                        "data": "elderName", render: function (data, type, row, meta) {
                        return data;
                    }
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
                    {"data": "age"},
                    {
                        "data": "sexDictId", render: function (data, type, row, meta) {
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
                        "data": "elderTypeDictIds", render: function (data, type, row, meta) {
                        arr = {
                            "1": "城市三无/农村五保", "2": "低保/低保边缘", "3": "经济困难的失能/半失能老人", "4": "70周岁及以上的计生特扶老人",
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
                    {
                        "data": "realAddress", render: function (data, type, row, meta) {
                        if (data != null && data != "") {
                            return "<div style='text-align: left'>" + data.replace(/[0-9]+/g, "*") + "</div>";
                        } else {
                            return "";
                        }
                    }
                    },
                    {
                        "data": "mobile", render: function (data, type, row, meta) {
                        if (data != null && data != "") {
                            return data.replace(data.substr(5, 4), "****");
                        } else {
                            return "";
                        }
                    }
                    },
                    {
                        "data": "elderId", render: function (data, type, row, meta) {
                        return '<a  href="#" data="' + window.apppath + '/admin/elderMsg/update/' + data + '?method=edit" class="btn default btn-xs green-stripe elderInfo">查看</a>';

                    }
                    }
                ]
            }
        });

        $(".table-group-action-submit").click(function () {
            grid.getDataTable().ajax.reload();
        });

        $(".table-group-action-add").click(function () {
            window.location.href = window.apppath + "/admin/serviceOrg/elder/add";
        });

        $(".table-group-action-reload").click(function () {
            $("#elder-form").find("input:text").val("");//找到form表单下的所有input标签并清空
            $("#elder-form").find("input:hidden").val("");//找到form表单下的所有input标签并清空
            $("#elder-form").find("select").val("");//找到form表单下的所有select标签并清空
            $("#elder-form").find("input:checkbox").parent().removeClass("checked");//找到form表单下的所有checkbox标签并清空
            $("#elder-form").find("input:checkbox").attr("checked", false);
        });

        grid.getTable().on("click", "a.elderInfo", function () {
            var href=$(this).attr("data");
            window.parent.addTab("elderInfo", "老人详情信息", href);
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
                    $.post(window.apppath + "/admin/api/elderMsg/delete", {id: topicId}, function (res) {
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
                    url: window.apppath + "/admin/api/elderMsg/import",
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
        }
    };
}();