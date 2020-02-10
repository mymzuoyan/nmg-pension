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
                    $.post(window.apppath + "/admin/api/power/cashPool/serviceList",
                        {
                            length: params.length,
                            start: params.start,
                            areaName: $('input[name=areaName]').val(),
                            serviceOrgName: $('input[name=serviceOrgName]').val(),
                            startmoney:$('input[name=startmoney]').val(),
                            endmoney:$('input[name=endmoney]').val(),
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
                        "data": "serviceOrgName", render: function (data, type, row, meta) {
                            return '<div style="text-align: center;width:200px;">' + data + '</div>';
                        }
                    },
                  {
                        "data": "areaName", render: function (data, type, row, meta) {
                            return '<div style="text-align: center">' + data + '</div>';
                        }
                    },


                    {
                        "data": "money", render: function (data, type, row, meta) {
                                return '<div style="text-align: center;width:150px;">' + data+ '元</div>';
                        }
                    },
                    {
                        "data": "createDate", render: function (data, type, row, meta) {
                            return '<div style="text-align: center;width:200px;">' + data + '</div>';
                        }
                    },
                    {
                        "data": "createUser"
                    },
                    {
                        "data": "id", render: function (data, type, row, meta) {
                            var html = "";

                                // html += '<button data="' + window.apppath + '/admin/api/power/oldmancard/detail?id=' + data + '"  class="btn btn-xs red-stripe info" >详细</button>';
                                html += '<button data="' + window.apppath + '/admin/api/power/cashPool/detail?id=' + data + '"  class="btn btn-xs red-stripe edit" >查看</button>';
                                // html += '<button data="' + window.apppath + '/admin/api/power/cashPool/update?retile=true&id=' + data + '"  class="btn btn-xs red-stripe retileCard" >补卡</button>';
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
            window.location.href = window.apppath + "/admin/api/power/cashPool/export?"
                + "areaName=" + encodeURI(encodeURI($("input[name=areaName]").val())) + "&"
                + "serviceOrgName=" + encodeURI(encodeURI($("input[name=serviceOrgName]").val())) + "&"
                + "startmoney=" + encodeURI(encodeURI($("input[name=startmoney]").val())) + "&"
                + "endmoney=" + encodeURI(encodeURI($("input[name=endmoney]").val())) + "&"
                + "startCreateDate=" + encodeURI(encodeURI($("input[name=startCreateDate]").val())) + "&"
                + "endCreateDate=" + encodeURI(encodeURI($("input[name=endCreateDate]").val())) ;

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
            window.parent.addTab("tab_cashPool_add", "组织机构资金池充值", href);
        });
        grid.getTable().on("click", "button.info", function () {
            var href = $(this).attr("data");
            window.parent.addTab("tab_cashPool_detail", "组织机构资金池充值详情", href);
        });
        grid.getTable().on("click", "button.edit", function () {
            var href = $(this).attr("data");
            window.parent.addTab("tab_cashPool_edit", "组织机构资金池充值详情", href);
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
                    $.post(window.apppath + "/admin/api/power/cashPool/addorupdate", {id: eventId,status:1}, function (res) {
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
            $.post(window.apppath + "/admin/api/power/cashPool/delete", {
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
        addorupdate:function () {
            var $btn = $(this);
            var entry=$("#serviceOrg-form").serialize();

           var reg=/^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
            if($("input[name=serviceOrgId]").val().trim()==""){
                $("#labelmsg").text('请选择充值机构！').addClass("label-danger");
            }
            else  if ($("input[name=money]").val().trim() == "") {
                $("#labelmsg").text('请填写充值金额！').addClass("label-danger");

            }else  if(!reg.test($("input[name=money]").val().trim())){
                $("#labelmsg").text('充值金额为正数！').addClass("label-danger");
            }


            else {
                // return;
            //     $.ajax({
            //         url : window.apppath+'/admin/api/power/cashPool/check',
            //         data:entry,
            //         type:'post',
            //         dataType:'json',
            //         success : function(data) {
                        // var result = data.success;
                        // if (!result) {
                        //     alert(data.message);
                        // } else {
                            $("#labelmsg").text('');
                            $btn.button('loading');
                            $.ajax({
                                url : window.apppath+'/admin/api/power/cashPool/addorupdate',
                                data:entry,
                                type:'post',
                                dataType:'json',
                                success : function(data) {
                                    var result = data.success;
                                    if (result) {
                                        alert(data.message);
                                        window.parent.updateTab("tab_cashPool_list");
                                        window.parent.closeTab("tab_cashPool_add");
                                        window.parent.closeTab("tab_cashPool_edit");
                                    } else {
                                        alert(data.message);
                                    }
                                }
                            })
                        }
                //     }
                // })

        // }
        }
    }
}();