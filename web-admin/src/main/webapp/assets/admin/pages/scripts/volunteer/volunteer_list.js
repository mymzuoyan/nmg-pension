var VolunteerList = function () {
    var grid = "";
    var handleList = function (method) {
        grid = new Datatable();
        var tableContainer = $("#datatable_volunteer_List").parents(".table-container");
        grid.init({
            src: $("#datatable_volunteer_List"),
            onSuccess: function (grid, res) {
                // execute some code after table records loaded
            },
            onError: function (grid) {
                // execute some code on network or other general error
            },
            loadingMessage: '加载中...',
            dataTable: {
                "ajax": function (params, callback, obj) {
                    $.post(window.apppath + "/admin/api/volunteer/list",
                        {
                            length: params.length,
                            start: params.start,
                            areaName: $('select[name=areaName]').val(),
                            volunteerName: $('input[name=volunteerName]').val(),
                            idcardno: $('input[name=idcardno]').val()
                        }, function (res) {
                            if (res) {
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
                        "data": "areaName", render: function (data, type, row, meta) {
                        if (data != null && data != '') {
                            return data.split(",")[1];
                        }
                        return "";
                    }
                    },
                    {"data": "volunteerName"},// 姓名
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
                    },//性别
                    {"data": "idcardno"},//身份证号
                    {"data": "mobile"},// 手机
                    {"data": "score"},//积分
                    {
                        "data": "createTime", render: function (data, type, row, meta) {
                                            if (data != null && data != "")
                                                 return data.substring(0,10);
                                       else
                                               return "";
           	                            }
                                },
                    {
                        "data": "id", render: function (data, type, row, meta) {
                        var html = "";
                        if ($("#timeBankList").val() == "1") {
                            html += '' + '<a data="' + window.apppath + '/admin/volunteer/detail/' + data + '" data-title="志愿者详情" data-id="tab-volunteer-info" class="btn default btn-xs green-stripe">查看</a>';
                        }
                        if ($("#timeBankUpdate").val() == "1") {
                            html += '<a data="' + window.apppath + '/admin/volStoreOrDrawShow/' + data + '?storeOrDraw=store' + '"  data-title="志愿者存入" data-id="tab-volunteer-store"  class="btn default btn-xs blue-stripe">存入</a>' +
                                '<a data="' + window.apppath + '/admin/volStoreOrDrawShow/' + data + '?storeOrDraw=draw' + '"  data-title="志愿者支取" data-id="tab-volunteer-draw"  class="btn default btn-xs yellow-stripe">支取</a>';
                        }
                        if ($("#timeBankDel").val() == "1") {
                            html += '<button data-eventid="' + data + '" class="btn btn-xs red-stripe del">删除</button>';
                        }
                        return html;
                    }
                    }
                ]
            }
        });
        grid.getTable().on("click", "a", function () {
            var href = $(this).attr("data");
            var id = $(this).attr("data-id");
            var title = $(this).attr("data-title");
            window.parent.addTab(id, title, href);
        });

        $(".table-group-action-submit").click(function () {
            grid.getDataTable().ajax.reload();
        });

        $(".table-group-action-add").click(function () {
            window.parent.addTab("side-volunteer-add", "新增志愿者", window.apppath + "/admin/volunteer/add");
        });

        $(".table-group-action-reload").click(function () {
            $("#volunteer-form").find("input:text").val("");//找到form表单下的所有input标签并清空
            $("#volunteer-form").find("select").val("");//找到form表单下的所有select标签并清空
            $("#volunteer-form").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
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
                    $.post(window.apppath + "/admin/api/volunteer/delete", {eventId: eventId}, function (res) {
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

        $("#btnDeleteVolunteer").on("click", function (e) {
            var deleteIds = jqchk("deleteId");
            if (deleteIds == "") {
                showMetroMessage("未选中");
                return false;
            }
            $(this).confirmation({
                'title': '确认删除？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                'onConfirm': function () {
                    update(deleteIds);
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

        function update(deleteIds) {
            Metronic.blockUI({
                message: '处理中...',
                target: tableContainer,
                overlayColor: 'none',
                cenrerY: true,
                boxed: true
            });
            $.post(window.apppath + "/admin/api/volunteer/deleteSomeMsg", {
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
        }, goToPage: function () {
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
        getAreaName: function () {
            $("#areaName").val(AreaTree.getAllAreaName(AreaTree.getSelectArea()));
            $("#areaModal").modal('hide');
        }
    };
}();