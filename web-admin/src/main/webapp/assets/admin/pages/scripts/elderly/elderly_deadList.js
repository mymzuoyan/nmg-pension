var ElderlyDeadInfo = function () {
    var flag1 = false;
    var flag2 = true;
    var gird = "";
    var selectElderId = "";
    var handleList = function () {
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
                    $.post(window.apppath + "/admin/api/elderly/getElderlyInfo", {
                            length: params.length,
                            start: params.start,
                            orderField: "areaOrder",
                            orderDir: "asc",
                            elderName: $('input[name=elderName]').val(),
                            idcardno: $('input[name=idcardno]').val(),
                            deathTimeString: $('input[name=deathTimeString]').val(),
                            isDeath: 0,
                            cremationTimeString: $('input[name=cremationTimeString]').val()
                        },
                        function (res) {
                            if (res) {
                                callback(res);
                            } else {
                                callback({
                                    data: null,
                                    recordsFiltered: 0
                                });
                            }
                        }

                        ,
                        'json'
                    )
                    ;
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
                        "data": "region1", render: function (data, type, row, meta) {
                        if (data == null || data == "") {
                            return row.areaName;
                        }
                        else
                            return data;
                    }
                    },
                    {"data": "elderName"},
                    {
                        "data": "idcardno", render: function (data, type, row, meta) {
                        return data.replace(data.substr(10, 6), "******");
                    }
                    },
                    {
                        "data": "sexDictId", render: function (data, type, row, meta) {
                        if (data == 1) {
                            return "男";
                        } else if (data == 2) {
                            return "女";
                        } else {
                            return "未知";
                        }
                    }
                    },
                    {"data": "age"},
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
                        "data": "cremationUnit", render: function (data, type, row, meta) {
                        if (data != null && data != "") {
                            return "<div style='text-align: left'>" + data + "</div>";
                        } else {
                            return "";
                        }
                    }
                    },
                    {
                        "data": "cremationTime", render: function (data, type, row, meta) {
                        if (data != "" && data != null) {
                            return data.substr(0, 10);
                        } else {
                            return "";
                        }

                    }
                    },
                    {
                        "data": "id", render: function (data, type, row, meta) {
                            var html="";
                            if($("#elderDeadInfoList").val()=="1"){
                               html+= '<a href="#" data="' + window.apppath + '/admin/elderly/update/' + data + '?method=show" class="btn default btn-xs green-stripe elderInfo">详细</a>'
                            }

                        /* html += '<button data-elderid="' + data + '" class="btn btn-xs red-stripe Dead">操作</button>';*/
                        return html;
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

        $(".table-group-action-reload").click(function () {
            $("#dead-form").find("input:text").val("");//找到form表单下的所有input标签并清空
            $("#dead-form").find("input:hidden").val("");//找到form表单下的所有input标签并清空
            $("#dead-form").find("select").val("");//找到form表单下的所有input标签并清空
            $("#dead-form").find("input:checkbox").parent().removeClass("checked");//找到form表单下的所有checkbox标签并清空
        });
        grid.getTable().on("click", "a.elderInfo", function () {
            var href = $(this).attr("data");
            window.parent.addTab("elderInfo", "老人详情信息", href);
        });
        // 迁出
        grid.getTable().on("click", "button.Dead", function () {
            var selectElderId = $(this).data("elderid");

            //重置modal
            $(".qianchuDiv").css("display", "none");
            $("#caozuoForm")[0].reset();

            $('#myModal').modal({
                keyboard: true
            });
            $("#reason").change(function () {
                var id = $(this).val();
                if (id == "1") {
                    //迁出
                    $(".qianchuDiv").css("display", "block");
                    EographicArea.changeProvince();
                }
            });

            $("#myModal .submit").click(function () {
                var selectId = $("#reason").val();
                if (selectId == null || selectId == "") {
                    alert("请选择要操作的行为！");
                    return false;
                }
                else {
                    if (selectId == "1") {
                        //迁出
                        $(confirm("确认迁出？"))
                        {
                            $.post(window.apppath + "/admin/api/elderly/update",
                                {
                                    id: selectElderId,
                                    areaId: EographicArea.getSelectId(),
                                    areaName: EographicArea.getPosition2()
                                }, function (res) {
                                    if (res.success) {
                                        alert("迁出成功");
                                        $('#myModal').modal("hide");
                                        grid.getDataTable().ajax.reload();
                                    } else {
                                        alert("操作失败");
                                    }
                                }, 'json');
                        }
                    }
                    else if (selectId == "2") {
                        //确认死亡
                        $(confirm("确认死亡？"))
                        {
                            $.post(window.apppath + "/admin/api/elderly/isDead", {id: topicId}, function (res) {
                                Metronic.unblockUI(tableContainer);
                                if (res.success) {
                                    alert("操作成功");
                                    $('#myModal').modal("hide");
                                    grid.getDataTable().ajax.reload();
                                } else {
                                    alert("操作失败");
                                }
                            }, "json");
                        }
                    }
                }
            })

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

        $("#deleteAll").on("click", function (e) {
            var deleteIds = jqchk("deleteId");
            if (deleteIds == "") {
                showMetroMessage("未选中");
                return false;
            }
            $(this).confirmation({
                'title': '确认去世？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
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
            $.post(window.apppath + "/admin/api/elderly/updateIsDeath", {
                deleteIds: deleteIds
            }, function (res) {
                Metronic.unblockUI(tableContainer);
                grid.getDataTable().draw(false);
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
        importFile: function (file) {
            $("#msg").text("导入中...").addClass("label-danger");
            var excelFile = $("#" + file).val().trim();
            if (excelFile != null && excelFile != "") {
                $.ajaxFileUpload({
                    url: window.apppath + "/admin/api/elderly/importDeath2",
                    secureuri: false,
                    fileElementId: file,//file控件id
                    dataType: 'json',
                    success: function (data, status) {
                        $("#msg").text(data.message).addClass("label-danger");
                        if (data.data != null && data.data != "") {
                            alert(data.data);
                        }
                    },
                    error: function (data, status, e) {
                        console.log(e);
                        console.log(data);
                        console.log(status);
                    }
                });
            } else {
                $("#msg").text("请上传文件！").addClass("label-danger");
            }
        }
    };
}();