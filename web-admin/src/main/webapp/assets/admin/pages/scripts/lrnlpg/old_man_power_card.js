/**
 * Created by sp on 2018/9/11
 */
var OldManCard = function () {

    var _self = "";
    var grid = "";
    var handleList = function (method) {
        grid = new Datatable();
        var tableContainer = $("#datatable_serviceOrg_List").parents(".table-container");
        grid.init({
            src: $("#datatable_serviceOrg_List"),
            onSuccess: function (grid, res) {
                // execute some code after table records loaded
            },
            onError: function (grid) {
                // execute some code on network or other general error
            },
            loadingMessage: '加载中...',
            dataTable: {
                "ajax": function (params, callback, obj) {
                    $.post(window.apppath + "/admin/api/power/oldmancard/serviceList",
                        {
                            length: params.length,
                            start: params.start,
                            name: $('input[name=name]').val(),
                            serviceOrgName: $('input[name=serviceOrgName]').val(),
                            cardId: $('input[name=cardId]').val(),
                            oldManName: $('input[name=oldManName]').val(),
                            startCreateDate: $('input[name=startCreateDate]').val(),
                            endCreateDate: $('input[name=endCreateDate]').val(),
                            startRemoveDate: $('input[name=startRemoveDate]').val(),
                            endRemoveDate: $('input[name=endRemoveDate]').val(),
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
                        "data": "cardId", render: function (data, type, row, meta) {
                            return '<div style="text-align: center">' + data + '</div>';
                        }
                    },
                    {
                        "data": "oldManName", render: function (data, type, row, meta) {
                            return '<div style="text-align: center">' + data + '</div>';
                        }
                    },
                    {
                        "data": "idNumber", render: function (data, type, row, meta) {
                            return '<div style="text-align: center">' + data + '</div>';
                        }
                    },{
                        "data": "serviceOrgName", render: function (data, type, row, meta) {
                            return '<div style="text-align: center">' + data + '</div>';
                        }
                    },

                    {
                        "data": "status", render: function (data, type, row, meta) {
                                if(data==0){
                                    return "正常";
                                }else if(data==1){
                                    return "已解绑";
                                }else {
                                    return data;
                                }
                        }
                    },
                    {
                        "data": "money", render: function (data, type, row, meta) {
                                return "￥"+data;
                        }
                    },
                    {
                        "data": "createDate"
                    },
                    {
                        "data": "removeDate"
                    },

                    {
                        "data": "id", render: function (data, type, row, meta) {
                            var html = "";
                            if(row.status==0){
                                // html += '<button data="' + window.apppath + '/admin/api/power/oldmancard/detail?id=' + data + '"  class="btn btn-xs red-stripe info" >详细</button>';
                                html += '<button data="' + window.apppath + '/admin/api/power/oldmancard/update?retile=fasle&id=' + data + '"  class="btn btn-xs red-stripe edit" >维护</button>';
                                html += '<button data="' + window.apppath + '/admin/api/power/oldmancard/update?retile=true&id=' + data + '"  class="btn btn-xs red-stripe retileCard" >补卡</button>';
                                html += '<button data-eventid="' + data + '" class="btn btn-xs red-stripe removeCard" >退卡</button>';
                            }else if(row.status==1){
                                // html += '<button data-eventid="' + data + '" class="btn btn-xs red-stripe enable" >启用</button>';
                            }
                            return html;
                        }
                    }
                ]
            }
        });

     

        $(".table-group-action-submit").click(function () {
            grid.getDataTable().ajax.reload();
        });

        //导出数据
        $(".excel").click(function () {
            window.location.href = window.apppath + "/admin/api/power/oldmancard/export?"
                + "cardId=" + encodeURI(encodeURI($("input[name=cardId]").val())) + "&"
                + "idNumber=" + encodeURI(encodeURI($("input[name=idNumber]").val())) + "&"
                + "oldManName=" + encodeURI(encodeURI($("input[name=oldManName]").val())) + "&"
                + "startRemoveDate=" + encodeURI(encodeURI($("input[name=startRemoveDate]").val())) + "&"
                + "endRemoveDate=" + encodeURI(encodeURI($("input[name=endRemoveDate]").val())) + "&"
                + "startCreateDate=" + encodeURI(encodeURI($("input[name=startCreateDate]").val())) + "&"
                + "endCreateDate=" + encodeURI(encodeURI($("input[name=endCreateDate]").val())) + "&"
                + "serviceOrgName=" + encodeURI(encodeURI($("input[name=serviceOrgName]").val()));

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
            window.parent.addTab("tab_oldmancard_add", "老人绑卡", href);
        });
        grid.getTable().on("click", "button.info", function () {
            var href = $(this).attr("data");
            window.parent.addTab("tab_oldmancard_detail", "绑卡详情信息", href);
        });
        grid.getTable().on("click", "button.edit", function () {
            var href = $(this).attr("data");
            window.parent.addTab("tab_oldmancard_edit", "绑卡维护", href);
        });
        grid.getTable().on("click", "button.retileCard", function () {
            var href = $(this).attr("data");
            window.parent.addTab("tab_oldmancard_retile", "补卡", href);
        });

        grid.getTable().on("click", "button.removeCard", function () {
            var curRow = $(this).closest('tr');
            var eventId = $(this).data("eventid");
            $(this).confirmation({
                'title': '确认退卡？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                'onConfirm': function () {
                    Metronic.blockUI({
                        message: '处理中...',
                        target: tableContainer,
                        overlayColor: 'none',
                        cenrerY: true,
                        boxed: true
                    });
                    $.post(window.apppath + "/admin/api/power/oldmancard/addorupdate", {id: eventId,status:1}, function (res) {
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
            $.post(window.apppath + "/admin/api/power/oldmancard/delete", {
                deleteIds: deleteIds
            }, function (res) {
                Metronic.unblockUI(tableContainer);
                Metronic.alert({type: 'success', message: res.message, closeInSeconds: 3, icon: 'check'});
                grid.getDataTable().draw(false);
            }, 'json');
        }
    };
    return {
        "grid": "",
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
        validateIdCard: function () {
            var idnum=$("input[name=idNumber]").val();
            if(idnum.trim()!=""){
                $.ajax({
                    url : window.apppath+'/admin/api/power/oldmancard/find',
                    data:{idNumber:idnum.trim()},
                    type:'post',
                    dataType:'json',
                    success : function(data) {
                        var result = data.success;
                        if (!result) {
                            $("#oldManId").val("");
                            $("#oldManName").val("");
                            alert(data.message);
                        } else {
                            alert(data.message);
                            $("#oldManId").val(data.data.id);
                            $("#oldManName").val(data.data.elderName);
                        }
                    }
                })

            }
        },
        addorupdate:function () {
            var $btn = $(this);
            var entry=$("#serviceOrg-form").serialize();
            if ($("input[name=serviceOrgId]").val().trim() == "") {
                $("#labelmsg").text('请填写服务机构！').addClass("label-danger");
            } else if ($("input[name=idNumber]").val().trim() == "" ) {
                $("#labelmsg").text('身份证不能为空！').addClass("label-danger");
            } else if ($("input[name=oldManName]").val().trim() == "" ) {
                $("#labelmsg").text('请先查询老人姓名！').addClass("label-danger");
            } else if ($("input[name=cardId]").val().trim() == "" ) {
                $("#labelmsg").text('卡号不能为空！').addClass("label-danger");
            } else {
                $.ajax({
                    url : window.apppath+'/admin/api/power/oldmancard/check',
                    data:entry,
                    type:'post',
                    dataType:'json',
                    success : function(data) {
                        var result = data.success;
                        if (!result) {
                            alert(data.message);
                        } else {
                            $("#labelmsg").text('');
                            $btn.button('loading');
                            $.ajax({
                                url : window.apppath+'/admin/api/power/oldmancard/addorupdate',
                                data:entry,
                                type:'post',
                                dataType:'json',
                                success : function(data) {
                                    var result = data.success;
                                    if (result) {
                                        alert(data.message);
                                        window.parent.updateTab("tab_pggl-oldmancard");
                                        window.parent.closeTab("tab_oldmancard_add");
                                        window.parent.closeTab("tab_oldmancard_edit");
                                    } else {
                                        alert(data.message);
                                    }
                                }
                            })
                        }
                    }
                })

        }
        }
    }
}();