var InstitutionList = function () {
    var grid = "";
    var handleList = function (method) {
        grid = new Datatable();
        var tableContainer = $("#datatable_moneyFlow_List").parents(".table-container");
        grid.init({
            src: $("#datatable_moneyFlow_List"),
            onSuccess: function (grid, res) {
                // execute some code after table records loaded
            },
            onError: function (grid) {
                // execute some code on network or other general error
            },
            loadingMessage: '加载中...',
            dataTable: {
                "ajax": function (params, callback, obj) {
                    $.post(window.apppath + "/admin/api/power/wcdfzsz/moneyflowList",
                        {
                            length: params.length,
                            start: params.start,
                            cardId: $('input[name=cardId]').val(),
                            elderName: $('input[name=elderName]').val(),
                            serverNum: $('input[name=serverNum]').val(),
                            startCreateDate: $('input[name=startCreateDate]').val(),
                            endCreateDate: $('input[name=endCreateDate]').val(),
                            orderField: "id",
                            orderDir: "DESC"
                        }, function (res) {
                            if (res) {
                                if (res.recordsFiltered != 0)
                                    $("#excel").css("display", "block")
                                else {
                                    $("#excel").css("display", "none")
                                }
                                callback(res);
                            } else {
                                callback({
                                    data: null,
                                    recordFiltered: 0
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
                        "data": "elderName", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },// 老人id
                    {
                        "data": "cardId", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },// 卡号
                    {
                        "data": "serverNum", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },// 服务流水号
                    {
                        "data": "serviceOrgName", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },// 发生地
                    {
                        "data": "amount", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                if(data>=0){
                                    return "<span style='color: forestgreen'>"+data+"</span>";
                                }else if (data<0){
                                    return "<span style='color: orangered'>"+data+"</span>";
                                }
                            } else {
                                return "";
                            }

                        }
                    },// 资金金额
                    {
                        "data": "uptime", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                    return data ;
                            } else {
                                return "";
                            }

                        }
                    }
                    // ,
                    // {
                    //     "data": "id", render: function (data, type, row, meta) {
                    //         var html = "";
                    //         if ($("#pimll").val() == "1") {
                    //             html += '<a data="' + window.apppath + '/admin/api/power/wcdfzsz/catacityDetail/' + data + '" class="btn default btn-xs green-stripe info" >查看</a>';
                    //         }
                    //
                    //         if ($("#serviceOrg-delete").is(":visible") && $("#serviceOrg-deleteInput").val() == "1") {
                    //             html += '<button data-eventid="' + data + '" class="btn btn-xs red-stripe del" >删除</button>';
                    //         }
                    //         return html;
                    //     }
                    // }//操作
                ]
            }
        });

        $(".table-group-action-import").click(function () {
            $('#impModal').modal({
                keyboard: true
            });
        });

        $(".table-group-action-submit").click(function () {
            grid.getDataTable().ajax.reload();
        });

        //导出数据
        $(".excel").click(function () {
            window.location.href = window.apppath + "/admin/api/power/oldmancard/exportMoneyFlow?"
                + "elderName=" + $("input[name=elderName]").val() + "&"
                + "cardId=" + $("input[name=cardId]").val() + "&"
                + "serverNum=" + $("input[name=serverNum]").val() + "&"
                + "amount=" + $('input[name=amount]').val() + "&"
                + "uptime=" + $('input[name=uptime]').val();

        });

        //导出账号
        $(".btn-account").click(function () {
            window.location.href = window.apppath + "/admin/api/serviceOrgList/exportAccount";
        });

        //关闭并刷新页面
        $(".btn-close").click(function () {
            window.location.reload();
        });

        $(".table-group-action-reload").click(function () {
            $("#serviceOrg-form").find("input:text").val("");//找到form表单下的所有input标签并清空
            $("#serviceOrg-form").find("input:hidden").val("");//找到form表单下的所有input标签并清空
            $("#serviceOrg-form").find("select").val("");//找到form表单下的所有select标签并清空
            $("#serviceOrg-form").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
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


        $(".table-group-action-add").click(function () {
            var href = $(this).attr("data");
            window.parent.addTab("tab_oldManCard_topup", "充值", href);
        });

        grid.getTable().on("click", "a.info", function () {
            var href = $(this).attr("data");
            window.parent.addTab("tab_institution_info", "能力信息详情", href);
        });


        /**
         * 删除
         */
        grid.getTable().on("click", "button.del", function () {
            var curRow = $(this).closest('tr');
            var eventId = $(this).data("eventid");
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
                    $.post(window.apppath + "/admin/api/power/wcdfzsz/deleteOneMsg", {id: eventId}, function (res) {
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

        $("#btnDeleteServiceOrg").on("click", function (e) {
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
            $.post(window.apppath + "/admin/api/power/wcdfzsz/deleteSomeMsg", {
                deleteIds: deleteIds
            }, function (res) {
                Metronic.unblockUI(tableContainer);
                Metronic.alert({type: 'success', message: res.message, closeInSeconds: 3, icon: 'check'});
                grid.getDataTable().draw(false);
            }, 'json');
        }
    };

    return {

        //main function to initiate the module
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
        importFile: function (file) {
            $("#msg").text("导入中...").addClass("label-danger");
            var excelFile = $("#" + file).val().trim();
            if (excelFile != null && excelFile != "") {
                $.ajaxFileUpload({
                    url: window.apppath + "/admin/api/power/wcdfzsz/import",
                    data: {type: 2},
                    secureuri: false,
                    fileElementId: file,//file控件id
                    dataType: 'json',
                    success: function (data, status) {
                        $("#msg").text(data.message).addClass("label-danger");
                        if (data.data != null && data.data != "") {
                            alert(data.data);
                        } else {
                            $(".btn-account").show();
                        }
                    },
                    error: function (data, status, e) {
                        console.log(e);
                    }
                });
            } else {
                $("#msg").text("请上传文件！").addClass("label-danger");
            }
        },
        validateIdCard: function () {
            var cardId=$("input[name=cardId]").val();
            if(cardId.trim()!=""){
                $.ajax({
                    url : window.apppath+'/admin/api/power/oldmancard/findBycardId',
                    data:{cardId:cardId.trim()},
                    type:'post',
                    dataType:'json',
                    success : function(data) {
                        var result = data.success;
                        if (!result) {
                            alert(data.message);
                            $("#oldmanId").val("");
                            $("#elderName").val("");
                            $("#money").val("￥:  0  元");
                            $("#statusVal").val("");
                            $("#status").html("<span style='color: orangered;font-size: 15px'>查询无此卡号</span>");
                        } else {
                            $("#oldmanId").val(data.data.oldManId);
                            $("#elderName").val(data.data.oldManName);
                            $("#money").val("￥:  "+data.data.money+"  元");
                            $("#statusVal").val(data.data.status);
                            if(data.data.status==0){
                                $("#status").html("<span style='color: #229b30;font-size: 15px'>正常</span>");
                            }else{
                                $("#status").html("<span style='color: orangered;font-size: 15px'>已解绑</span>");
                            }

                        }
                    }
                })

            }
        },
        addorupdate:function () {
           var $btn = $(this);
           var m1=$("#serviceMoney").val().trim();
           var m2=$("input[name=amount]").val().trim();
            var entry=$("#moneyflow-form").serialize();
            var re =  /^\d+(?=\.{0,1}\d+$|$)/;//判断字符串是否为数字//判断正整数/[1−9]+[0−9]∗]∗/
            if ($("input[name=cardId]").val().trim() == "" ) {
                $("#labelmsg").text('卡号不能为空！').addClass("label-danger");
            }else if ($("#elderName").val().trim() == "" ) {
                $("#labelmsg").text('请先查询老人姓名！').addClass("label-danger");
            }else if ($("input[name=serverNum]").val().trim() == "") {
                $("#labelmsg").text('请填写充值流水号！').addClass("label-danger");
            }  else if ($("input[name=serviceOrgId]").val().trim() == "") {
                $("#labelmsg").text('请选择服务机构！').addClass("label-danger");
            } else if ($("input[name=amount]").val().trim() == "" ) {
                $("#labelmsg").text('充值金额不能为空！').addClass("label-danger");
            } else if (!re.test($("input[name=amount]").val().trim())) {
                $("#labelmsg").text('请输入正确充值金额！').addClass("label-danger");
            } else if ( $("#statusVal").val().trim()!=0) {
                $("#labelmsg").text('助老卡已解绑，无法充值！').addClass("label-danger");
            }
            else if ( parseFloat(m1 )<parseFloat(m2)) {
                $("#labelmsg").text('充值金额大于组织余额，无法充值！').addClass("label-danger");
            }
            else {
                $("#labelmsg").text('');
                $btn.button('loading');
                var cardId=$("input[name=cardId]").val();
                var amount=$("input[name=amount]").val();

                $.ajax({
                    url : window.apppath+'/admin/api/power/oldmancard/insertMoneyFlow',
                    data:entry,
                    type:'post',
                    dataType:'json',
                    success : function(data) {
                        var result = data.success;
                        if (!result) {
                            alert(data.message);
                        } else {
                            $.ajax({
                                url : window.apppath+'/admin/api/power/oldmancard/topupMoney',
                                data:{cardId:cardId.trim(),money:amount.trim()},
                                type:'post',
                                dataType:'json',
                                success : function(data) {
                                    var result = data.success;
                                    if (!result) {
                                        alert(data.message);
                                    } else {
                                        alert("充值成功");
                                        window.parent.updateTab("tab_moneyflow_list");
                                        window.parent.closeTab("tab_oldManCard_topup");
                                    }
                                }
                            })
                        }
                    }
                })





            }
        }
    };
}();