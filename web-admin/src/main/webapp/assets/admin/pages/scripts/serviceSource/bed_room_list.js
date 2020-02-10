var BedRoomList = function () {
    var grid = "";
    var type = 2;
    var handleList = function (method) {

        grid = new Datatable();
        var tableContainer = $("#datatable_bill_List").parents(".table-container");

        grid.init({
            src: $("#datatable_bill_List"),
            onSuccess: function (grid, res) {
                // execute some code after table records loaded
            },
            onError: function (grid) {
                // execute some code on network or other general error
            },
            loadingMessage: '加载中...',
            dataTable: {
                "ajax": function (params, callback, obj) {
                    $.post(window.apppath + "/admin/serviceOrg/BedRoomManager/getTowerCourtyardList",
                        {
                            length: params.length,
                            start: params.start,
                            towerCourtyardNum: $('input[name=towerCourtyardNum]').val(),
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
                            return '<input type="radio" name="deleteId1" value="' + row.id + '">';
                        }
                    },
                    //楼院编号
                    {
                        "data": "towerCourtyardNum", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    }, //楼层数
                    {
                        "data": "kickafk", render: function (data, type, row, meta) {
                           /* if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }*/
                           return data;
                        }
                    },//房间数
                    {
                        "data": "rooms", render: function (data, type, row, meta) {
                         /*   if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }*/
                            return data;
                        }
                    },//床位数
                    {
                        "data": "bedNum", render: function (data, type, row, meta) {
                          /*  if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }*/
                                return data;
                        }
                    },//备注
                    {
                        "data": "remark", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },
                    {
                        "data": "id", render: function (data, type, row, meta) {
                            var html = "";

                               /* html += '<a data="' + window.apppath + '/admin/org/healthRecords/healthRecordsDetail?id=' + data + '" class="btn default btn-xs green-stripe info" >查看</a>';*/
                                html += '<button data-topicid="' + data + '" class="btn btn-xs red-stripe del">删除</button>';


                            return html;
                        }
                    }//操作
                ]
            }
        });

        $(".table-group-action-import").click(function () {
            $('#impModal').modal({
                keyboard: true
            });
        });

        $(".table-group-action-submit").click(function () {
            signCheckbox = '';
            sign = document.getElementsByName('sign');
            for (var a = 0; a < sign.length; a++) {
                if (sign[a].checked) {
                    signCheckbox = signCheckbox + sign[a].value + ",";
                }
            }

            signCheckbox = signCheckbox.substr(0, (signCheckbox.length - 1));

            grid.getDataTable().ajax.reload();
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
            window.parent.addTab("tab_towercourtyards_add", "楼院记录新增", href);
        });

        grid.getTable().on("click", "a.info", function () {
            var href = $(this).attr("data");
            window.parent.addTab("tab_health_recordsAdd_detail", "从业人员健康记录详情", href);
        });


        /**
         * 作废
         */
        grid.getTable().on("click", "button.invalid", function () {
            var curRow = $(this).closest('tr');
            var eventId = $(this).data("eventid");
            $(this).confirmation({
                'title': '确认作废？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                'onConfirm': function () {
                    Metronic.blockUI({
                        message: '处理中...',
                        target: tableContainer,
                        overlayColor: 'none',
                        cenrerY: true,
                        boxed: true
                    });
                    $.post(window.apppath + "/admin/api/power/bill/invalid", {id: eventId,status:1}, function (res) {
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

        /**
         * 删除楼院信息
         */
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
                    $.post(window.apppath + "/admin/serviceOrg/BedRoomManager/deleteTowerCourtyard", {id: topicId}, function (res) {
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
            var deleteIds = jqchk("deleteId1");
            if (deleteIds == "") {
                showMetroMessage("未选中");
                return false;
            }
            $(this).confirmation({
                'title': '确认？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
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
    };

    return {

        //main function to initiate the module
        init: function (method) {
            handleList(method);
        },
        save: function () {
            var $btn = $(this);
            $("#labelmsg1").text('');
            var towerCourtyardNum = $("#addForm1 input[name=towerCourtyardNum]").val();
            if (towerCourtyardNum == null || towerCourtyardNum == "") {
                alert("请填写楼院编号,楼院编号不能为空，且只能为数字和字母");
                return false;
            }
            if(towerCourtyardNum!=null || towerCourtyardNum != ""){
                if(/[^0-9a-zA-Z]/gi.test(towerCourtyardNum)){
                    alert("楼院编号只能为数字或字母");
                    return false;
                }
            }
            $btn.button('loading');
           /* var towerCourtyardId = $('input:radio[name="deleteId"]:checked').val();*/
            $.ajax({

                type: "POST",
                url: window.apppath + "/admin/serviceOrg/BedRoomManager/TowerCourtyardAdd",
                data: $("#addForm1").serialize(),
                dataType: "json",
                success: function (res) {
                    $btn.button('reset');
                    if (res.success) {
                        alertSuccess("提示", res.message, function () {
                            $('#addModal1').modal("hide");
                            grid.getDataTable().ajax.reload();
                            $("#addForm1 input[name=towerCourtyardNum]").val();
                        })
                    }
                    else {
                        alert2(res.message);

                    }
                }
            });
            ///admin/api/serviceOrg/wareHouse/
        },
        showAddModal: function (e) {
            $('#addModal1').modal({
                keyboard: true
            });
            $("#addPriceTable1 input").val("");
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
        }
    };
}();
var FloorList = function () {
    var grid = "";
    var type = 2;
    var handleList = function (method) {

        $("#datatable_bill_List2").dataTable().fnDestroy();

        var towerCourtyardId = $('input:radio[name="deleteId1"]:checked').val();
        grid = new Datatable();
        var tableContainer = $("#datatable_bill_List2").parents(".table-container");

        grid.init({
            src: $("#datatable_bill_List2"),
            onSuccess: function (grid, res) {
                // execute some code after table records loaded
            },
            onError: function (grid) {
                // execute some code on network or other general error
            },
            loadingMessage: '加载中...',
            dataTable: {
                "ajax": function (params, callback, obj) {

                    /*alert(towerCourtyardId);*/

                    $.post(window.apppath + "/admin/serviceOrg/BedRoomManager/getFloorList?towerCourtyardId="+towerCourtyardId,
                        {
                            length: params.length,
                            start: params.start,
                            floorNumber: $('input[name=floorNumber]').val(),
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
                            return '<input type="radio" name="deleteId2" value="' + row.id + '">';
                        }
                    },
                    //楼层编号
                    {
                        "data": "floorNumber", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    }, //房间数
                    {
                        "data": "rooms", render: function (data, type, row, meta) {
                            /*   if (data != "" && data != null) {
                                   return data;
                               } else {
                                   return "";
                               }*/
                            return data;
                        }
                    },//床位数
                    {
                        "data": "bedNum", render: function (data, type, row, meta) {
                            /*  if (data != "" && data != null) {
                                  return data;
                              } else {
                                  return "";
                              }*/
                            return data;
                        }
                    },//备注
                    {
                        "data": "remark", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },
                    {
                        "data": "id", render: function (data, type, row, meta) {
                            var html = "";

                            /* html += '<a data="' + window.apppath + '/admin/org/healthRecords/healthRecordsDetail?id=' + data + '" class="btn default btn-xs green-stripe info" >查看</a>';*/
                            html += '<button data-topicid="' + data + '" class="btn btn-xs red-stripe del">删除</button>';


                            return html;
                        }
                    }//操作
                ]
            }
        });

        $(".table-group-action-import").click(function () {
            $('#impModal').modal({
                keyboard: true
            });
        });
        $(".table-group-action-submit").click(function () {
            signCheckbox = '';
            sign = document.getElementsByName('sign');
            for (var a = 0; a < sign.length; a++) {
                if (sign[a].checked) {
                    signCheckbox = signCheckbox + sign[a].value + ",";
                }
            }

            signCheckbox = signCheckbox.substr(0, (signCheckbox.length - 1));

            grid.getDataTable().ajax.reload();
        });


        //关闭并刷新页面
        $(".btn-close").click(function () {
            window.location.reload();
        });

        $(".table-group-action-reload").click(function () {
            $("#serviceOrg-form2").find("input:text").val("");//找到form表单下的所有input标签并清空
            $("#serviceOrg-form2").find("input:hidden").val("");//找到form表单下的所有input标签并清空
            $("#serviceOrg-form2").find("select").val("");//找到form表单下的所有select标签并清空
            $("#serviceOrg-form2").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
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
            window.parent.addTab("tab_towercourtyards_add", "楼院记录新增", href);
        });

        grid.getTable().on("click", "a.info", function () {
            var href = $(this).attr("data");
            window.parent.addTab("tab_health_recordsAdd_detail", "从业人员健康记录详情", href);
        });


        /**
         * 作废
         */
        grid.getTable().on("click", "button.invalid", function () {
            var curRow = $(this).closest('tr');
            var eventId = $(this).data("eventid");
            $(this).confirmation({
                'title': '确认作废？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                'onConfirm': function () {
                    Metronic.blockUI({
                        message: '处理中...',
                        target: tableContainer,
                        overlayColor: 'none',
                        cenrerY: true,
                        boxed: true
                    });
                    $.post(window.apppath + "/admin/api/power/bill/invalid", {id: eventId,status:1}, function (res) {
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

        /**
         * 删除楼层信息
         */
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
                    $.post(window.apppath + "/admin/serviceOrg/BedRoomManager/deleteFloor", {id: topicId}, function (res) {
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
            var deleteIds = jqchk("deleteId2");
            if (deleteIds == "") {
                showMetroMessage("未选中");
                return false;
            }
            $(this).confirmation({
                'title': '确认？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
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
    };

    return {

        //main function to initiate the module
        init: function (method) {
            handleList(method);
        },
        save: function () {
            var $btn = $(this);
            $("#labelmsg3").text('');
            var floorNumber = $("#addForm2 input[name=floorNumber]").val();
            if (floorNumber == null || floorNumber == "") {
                alert("请填写楼层编号,楼层编号不能为空，且只能为数字和字母");
                return false;
            }
            if(floorNumber!=null || floorNumber != ""){
                if(/[^0-9a-zA-Z]/gi.test(floorNumber)){
                    alert("楼层编号只能为数字或字母");
                    return false;
                }
            }
            $btn.button('loading');
            var towerCourtyardId = $('input:radio[name="deleteId1"]:checked').val();
            $.ajax({

                type: "POST",
                url: window.apppath + "/admin/serviceOrg/BedRoomManager/floorAdd?towerCourtyardId="+towerCourtyardId,
                data: $("#addForm2").serialize(),
                dataType: "json",
                success: function (res) {
                    $btn.button('reset');
                    if (res.success) {
                        alertSuccess("提示", res.message, function () {
                            $('#addModal2').modal("hide");
                            grid.getDataTable().ajax.reload();
                            $("#addForm2 input[name=floorNumber]").val();
                        })
                    }
                    else {
                        alert2(res.message);

                    }
                }
            });
            ///admin/api/serviceOrg/wareHouse/
        },
        showAddModal: function (e) {
            $('#addModal2').modal({
                keyboard: true
            });
            $("#addPriceTable2 input").val("");
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
        }
    };
}();
var RoomList = function () {
//function RoomList() {
    var grid = "";
    var type = 2;
    var handleList = function (method) {
        var sign;
        var signCheckbox;
        var towerCourtyardId = $('input:radio[name="deleteId1"]:checked').val();
        var floorId = $('input:radio[name="deleteId2"]:checked').val();
        $.ajax({
            type:'POST',
            url:"/admin/serviceOrg/BedRoomManager/findTowerCourtyardId?floorId = " + floorId,
            data:{
                id: towerCourtyardId,
                floorId: floorId
            },
            success:function (data) {
                $("#show").html(data);
            },
            dataType:'json',
        });
        grid = new Datatable();
        $("#datatable_bill_List3").dataTable().fnDestroy();
        var tableContainer = $("#datatable_bill_List3").parents(".table-container");

        grid.init({
            src: $("#datatable_bill_List3"),
            onSuccess: function (grid, res) {
                // execute some code after table records loaded
            },
            onError: function (grid) {
                // execute some code on network or other general error
            },
            loadingMessage: '加载中...',
            dataTable: {
                "ajax": function (params, callback, obj) {

                    /*alert(towerCourtyardId);*/
                    $.post(window.apppath + "/admin/serviceOrg/BedRoomManager/getRoomList?floorId="+floorId,
                        {
                            length: params.length,
                            start: params.start,
                            roomNum: $('input[name=roomNum]').val(),
                            orientation: $('select[name=orientation]').val(),
                            roomType: $('select[name=roomType]').val(),
                            roomStatus: $('select[name=roomStatus]').val(),
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
                            return '<input type="radio" name="deleteId3" value="' + row.id + '">';
                        }
                    },
                    //房间号
                    {
                        "data": "roomNum", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },//朝向
                    {
                        "data": "orientation", render: function (data, type, row, meta) {
                            if (data == 1) {
                                return "朝东";
                            }
                            if (data == 2) {
                                return "朝南";
                            }
                            if (data == 3) {
                                return "朝西";
                            }
                            if (data == 4) {
                                return "朝北";
                            }
                            return "";
                        }

                    },//房间类型
                    {
                        "data": "roomType", render: function (data, type, row, meta) {
                            if (data == 1) {
                                return "自理老人房间";
                            }
                            if (data == 2) {
                                return "半自理完全不能自理老人房间";
                            }
                            return "";
                        }

                    },//房间状态
                    {
                        "data": "roomStatus", render: function (data, type, row, meta) {
                            if (data == 1) {
                                return "已使用";
                            }
                            if (data == 2) {
                                return "空闲";
                            }
                            if (data == 3) {
                                return "包房";
                            }
                            return "";
                        }

                    },

                 //床位数
                    {
                        "data": "bedNum", render: function (data, type, row, meta) {
                            /*  if (data != "" && data != null) {
                                  return data;
                              } else {
                                  return "";
                              }*/
                            return data;
                        }
                    },//备注
                    {
                        "data": "roomArea", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },
                    {
                        "data": "id", render: function (data, type, row, meta) {
                            var html = "";

                             html += '<a data="' + window.apppath + '/admin/serviceOrg/BedRoomManager/roomDetailAndUpdate?id=' + data + '" class="btn default btn-xs green-stripe info" >查看</a>';
                            html += '<button data-topicid="' + data + '" class="btn btn-xs red-stripe del">删除</button>';


                            return html;
                        }
                    }//操作
                ]
            }
        });

        $(".table-group-action-import").click(function () {
            $('#impModal').modal({
                keyboard: true
            });
        });

        $(".table-group-action-submit").click(function () {
            signCheckbox = '';
            sign = document.getElementsByName('sign');
            for (var a = 0; a < sign.length; a++) {
                if (sign[a].checked) {
                    signCheckbox = signCheckbox + sign[a].value + ",";
                }
            }

            signCheckbox = signCheckbox.substr(0, (signCheckbox.length - 1));

            grid.getDataTable().ajax.reload();
        });



        //关闭并刷新页面
        $(".btn-close").click(function () {
            window.location.reload();
        });

        $(".table-group-action-reload").click(function () {
            $("#serviceOrg-form3").find("input:text").val("");//找到form表单下的所有input标签并清空
            $("#serviceOrg-form3").find("input:hidden").val("");//找到form表单下的所有input标签并清空
            $("#serviceOrg-form3").find("select").val("");//找到form表单下的所有select标签并清空
            $("#serviceOrg-form3").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
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
            window.parent.addTab("tab_towercourtyards_add", "楼院记录新增", href);
        });

        grid.getTable().on("click", "a.info", function () {
            var href = $(this).attr("data");
            window.parent.addTab("tab_health_recordsAdd_detail", "房间信息登记详情", href);
        });


        /**
         * 作废
         */
        grid.getTable().on("click", "button.invalid", function () {
            var curRow = $(this).closest('tr');
            var eventId = $(this).data("eventid");
            $(this).confirmation({
                'title': '确认作废？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                'onConfirm': function () {
                    Metronic.blockUI({
                        message: '处理中...',
                        target: tableContainer,
                        overlayColor: 'none',
                        cenrerY: true,
                        boxed: true
                    });
                    $.post(window.apppath + "/admin/api/power/bill/invalid", {id: eventId,status:1}, function (res) {
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

        /**
         * 删除房间信息
         */
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
                    $.post(window.apppath + "/admin/serviceOrg/BedRoomManager/deleteRoom", {id: topicId}, function (res) {
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
            var deleteIds = jqchk("deleteId3");
            if (deleteIds == "") {
                showMetroMessage("未选中");
                return false;
            }
            $(this).confirmation({
                'title': '确认？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
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
    };

    return {

        //main function to initiate the module
        init: function (method) {
            handleList(method);
        },
        save: function () {
            var $btn = $(this);
            $("#labelmsg2").text('');
            var roomNum = $("#addForm3 input[name=roomNum]").val();
            var roomArea = $("#addForm3 input[name=roomArea]").val();
            var roomType = $("#roomType").val();
            var orientation = $("#orientation").val();
            if (roomNum == null || roomNum == "") {
                alert("请填写房间号,房间号不能为空，且只能为数字和字母");
                return false;
            }
            if(roomNum!=null || roomNum != ""){
                if(/[^0-9a-zA-Z]/gi.test(roomNum)){
                    alert("房间号只能为数字或字母");
                    return false;
                }
            }
            if (roomType == null || roomType == "") {
                alert("请选择房间类型");
                return false;
            }
            if (roomArea == null || roomArea == "") {
                alert("请填写房屋面积");
                return false;
            }

            if (orientation == null || orientation == "") {
                alert("请选择朝向");
                return false;
            }



            var auxiliaryFacilities = "";
            var id1 = document.getElementsByName('auxiliaryFacilities');

            for(var i = 0; i < id1.length; i++){
                if(id1[i].checked)
                    auxiliaryFacilities+=id1[i].value+",";
            }
            if(auxiliaryFacilities.length>0){
                auxiliaryFacilities=auxiliaryFacilities.substring(0,auxiliaryFacilities.length-1);
            }
            console.log(auxiliaryFacilities)


            var roomEquipment = "";
            var id2 = document.getElementsByName('roomEquipment');
            for(var i = 0; i < id2.length; i++){
                if(id2[i].checked)
                    roomEquipment+=id2[i].value+",";
            }
            if(roomEquipment.length>0){
                roomEquipment=roomEquipment.substring(0,roomEquipment.length-1);
            }
            console.log(roomEquipment)



            $btn.button('loading');
            var floorId = $('input:radio[name="deleteId2"]:checked').val();
            $.ajax({

                type: "POST",
                url: window.apppath + "/admin/serviceOrg/BedRoomManager/RoomAdd?floorId="+floorId,
                data: $("#addForm3").serialize(),
                dataType: "json",
                success: function (res) {
                    $btn.button('reset');
                    if (res.success) {
                        alertSuccess("提示", res.message, function () {
                            $('#addModal3').modal("hide");
                            grid.getDataTable().ajax.reload();
                           /* $("#addForm3 input[name=floorNumber]").val();*/
                        })
                        $("#addPriceTable3 input").val("");
                    }
                    else {
                        alert2(res.message);

                    }
                }
            });
            ///admin/api/serviceOrg/wareHouse/
        },
        showAddModal: function (e) {
            $('#addModal3').modal({
                keyboard: true
            });
           /* $("#addPriceTable3 input").val("");*/
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
        }
    };
}();
var BedsList = function () {
    var grid = "";
    var type = 2;
    var handleList = function (method) {

        var roomId = $('input:radio[name="deleteId3"]:checked').val();
        /*alert(roomId)*/

        $.ajax({
            type:'POST',
            url:"/admin/serviceOrg/BedRoomManager/findRoomNum?roomId = " + roomId,
            data:{

                roomId: roomId
            },
            success:function (data) {
                $("#show2").html(data);
            },
            dataType:'json',
        });




        grid = new Datatable();
        $("#datatable_bill_List4").dataTable().fnDestroy();
        var tableContainer = $("#datatable_bill_List4").parents(".table-container");

        grid.init({
            src: $("#datatable_bill_List4"),
            onSuccess: function (grid, res) {
                // execute some code after table records loaded
            },
            onError: function (grid) {
                // execute some code on network or other general error
            },
            loadingMessage: '加载中...',
            dataTable: {
                "ajax": function (params, callback, obj) {

                    /*alert(towerCourtyardId);*/

                    $.post(window.apppath + "/admin/serviceOrg/BedRoomManager/getBedsList?roomId="+roomId,
                        {
                            length: params.length,
                            start: params.start,
                            bedNumber: $('input[name=bedNumber]').val(),
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
                            return '<input type="radio" name="deleteId4" value="' + row.id + '">';
                        }
                    },
                    //床位编号
                    {
                        "data": "bedNumber", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    }, //床位状态
                    {
                        "data": "bedsState", render: function (data, type, row, meta) {
                            if (data == 1) {
                                return "未使用";
                            }
                            if (data == 2) {
                                return "已使用";
                            }
                            return "";
                        }

                    },
                    //备注
                    {
                        "data": "remark", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },
                    {
                        "data": "id", render: function (data, type, row, meta) {
                            var html = "";

                            /* html += '<a data="' + window.apppath + '/admin/org/healthRecords/healthRecordsDetail?id=' + data + '" class="btn default btn-xs green-stripe info" >查看</a>';*/
                            html += '<button data-topicid="' + data + '" class="btn btn-xs red-stripe del">删除</button>';


                            return html;
                        }
                    }//操作
                ]
            }
        });

        $(".table-group-action-import").click(function () {
            $('#impModal').modal({
                keyboard: true
            });
        });
        $(".table-group-action-submit").click(function () {
            signCheckbox = '';
            sign = document.getElementsByName('sign');
            for (var a = 0; a < sign.length; a++) {
                if (sign[a].checked) {
                    signCheckbox = signCheckbox + sign[a].value + ",";
                }
            }

            signCheckbox = signCheckbox.substr(0, (signCheckbox.length - 1));

            grid.getDataTable().ajax.reload();
        });


        //关闭并刷新页面
        $(".btn-close").click(function () {
            window.location.reload();
        });

        $(".table-group-action-reload").click(function () {
            $("#serviceOrg-form4").find("input:text").val("");//找到form表单下的所有input标签并清空
            $("#serviceOrg-form4").find("input:hidden").val("");//找到form表单下的所有input标签并清空
            $("#serviceOrg-form4").find("select").val("");//找到form表单下的所有select标签并清空
            $("#serviceOrg-form4").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
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
            window.parent.addTab("tab_towercourtyards_add", "楼院记录新增", href);
        });

        grid.getTable().on("click", "a.info", function () {
            var href = $(this).attr("data");
            window.parent.addTab("tab_health_recordsAdd_detail", "从业人员健康记录详情", href);
        });


        /**
         * 作废
         */
        grid.getTable().on("click", "button.invalid", function () {
            var curRow = $(this).closest('tr');
            var eventId = $(this).data("eventid");
            $(this).confirmation({
                'title': '确认作废？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                'onConfirm': function () {
                    Metronic.blockUI({
                        message: '处理中...',
                        target: tableContainer,
                        overlayColor: 'none',
                        cenrerY: true,
                        boxed: true
                    });
                    $.post(window.apppath + "/admin/api/power/bill/invalid", {id: eventId,status:1}, function (res) {
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

        /**
         * 删除床位信息
         */
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
                    $.post(window.apppath + "/admin/serviceOrg/BedRoomManager/deleteBeds", {id: topicId}, function (res) {
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
            var deleteIds = jqchk("deleteId4");
            if (deleteIds == "") {
                showMetroMessage("未选中");
                return false;
            }
            $(this).confirmation({
                'title': '确认？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
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
    };

    return {

        //main function to initiate the module
        init: function (method) {
            handleList(method);
        },
        save: function () {
            var $btn = $(this);
            $("#labelmsg4").text('');
            var bedNumber = $("#addForm4 input[name=bedNumber]").val();
            if (bedNumber == null || bedNumber == "") {
                alert("请填写房间编号,房间编号不能为空，且只能为数字和字母");
                return false;
            }
            if(bedNumber!=null || bedNumber != ""){
                if(/[^0-9a-zA-Z]/gi.test(bedNumber)){
                    alert("房间编号只能为数字或字母");
                    return false;
                }
            }
            $btn.button('loading');
            var roomId = $('input:radio[name="deleteId3"]:checked').val();
            /*alert(roomId)*/
            $.ajax({

                type: "POST",
                url: window.apppath + "/admin/serviceOrg/BedRoomManager/bedsAdd?roomId="+roomId,
                data: $("#addForm4").serialize(),
                dataType: "json",
                success: function (res) {
                    $btn.button('reset');
                    if (res.success) {
                        alertSuccess("提示", res.message, function () {
                            $('#addModal4').modal("hide");
                            grid.getDataTable().ajax.reload();
                            $("#addForm4 input[name=floorNumber]").val();
                        })
                    }
                    else {
                        alert2(res.message);

                    }
                }
            });
            ///admin/api/serviceOrg/wareHouse/
        },
        showAddModal: function (e) {
            $('#addModal4').modal({
                keyboard: true
            });
            $("#addPriceTable4 input").val("");
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
        }
    };
}();