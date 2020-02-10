var ServiceOrg = function () {
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
                    $.post(window.apppath + "/admin/monitor/api/serviceOrgList",
                        {
                            length: params.length,
                            start: params.start,
                            areaName: $('input[name=areaName]').val(),
                            serviceProject: $('input[name=serviceProject]').val(),
                            institutionName: $('input[name=institutionName]').val(),
                            institutionTypeDictId: $('select[name=institutionTypeDictId]').val(),
                            serviceArea: $('select[name=serviceArea]').val(),
                            gradeDictId: $('select[name=gradeDictId]').val(),
                            levelDictId: $('select[name=levelDictId]').val(),
                            regTypeDictId: $('select[name=regTypeDictId]').val(),
                            startInfoity: $('input[name=startInfoity]').val(),
                            endInfoity: $('input[name=endInfoity]').val(),
                            applyName: $('input[name=applyName]').val(),
                            videoStatus: $('select[name=videoStatus]').val(),
                            orderField: "a.id",
                            orderDir: "DESC"
                        }, function (res) {
                            if (res) {
                                if (res.recordsFiltered != 0) {
                                    $("#excel").css("display", "block")
                                    $("#serviceOrg-delete").css("display", "inline-block")
                                    $("#serviceOrg-sendsMessages").css("display", "inline-block")
                                }
                                else {
                                    $("#excel").css("display", "none");
                                    $("#serviceOrg-delete").css("display", "none");
                                    $("#serviceOrg-sendsMessages").hide()
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
                        "data": "areaName", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                var areaName = "";
                                if (data.split(",").length >= 2) {
                                    areaName = data.split(",")[1];
                                }
                                else
                                    areaName = data;
                                return areaName
                            } else {
                                return "";
                            }
                        }
                    },// 所属区域
                    {
                        "data": "institutionName", render: function (data, type, row, meta) {
                            return '<div style="text-align: left">' + data + '</div>';
                        }
                    },// 单位名称
                    {
                        "data": "instProp", render: function (data, type, row, meta) {
                            var instProps = ['', '民办民营', '公办民营I', '公办民营II', '公助民营', '公办民营', '共建民营'];
                            if (data != null && data != '') {
                                return instProps[data];
                            } else {
                                return "";
                            }

                        }
                    },//4-公助民营 5-公办民营 1-民办民营 6-共建民营 2-公办民营I 3-公办民营II
                    {
                        "data": "applyName"
                    },
                    {
                        "data": "mobile", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                // return data.replace(data.substr(3, 4), "****");
                                return data;
                            } else {
                                return "";
                            }

                        }
                    },// 联系电话
                    {
                        "data": "regTypeDictId", render: function (data, type, row, meta) {
                            if (data == 1) {
                                return "民非";
                            } else if (data == 2) {
                                return "企业";
                            } else if (data == 3) {
                                return "事业单位";
                            } else {
                                return "";
                            }

                        }
                    },// 注册类型 1-民非 2-工商 3-事业单位
                    /*{
                     "data": "privateOrgName", render: function (data, type, row, meta) {
                     return data;
                     }
                     },*/
                    {
                        "data": "gradeDictId", render: function (data, type, row, meta) {
                            if (data == 0) {
                                return "A";
                            } else if (data == 1) {
                                return "AA";
                            } else if (data == 2) {
                                return "AAA";
                            } else if (data == 3) {
                                return "AAAA";
                            } else if (data == 4) {
                                return "AAAAA";
                            } else {
                                return "";
                            }//等级  1-AA级 2-AAA级 3-AAAA级 4-AAAAA级
                        }
                    },//等级
                    {
                        "data": "status", render: function (data, type, row, meta) {
                            if (data == null) {
                                return "";
                            }
                            var strs = ["<span style='color: #ff2119'>未审核</span>", "审核通过", "平台导入"];
                            return strs[data];
                        }
                    },
                    {
                        "data": "videoMonitors", render: function (data, type, row, meta) {
                            if (data == 0||data==null) {
                                return "未接入";
                            }
                            return "已接入";
                        }
                    },
                    {
                        "data": "id", render: function (data, type, row, meta) {
                            var html = "";
                            html += '<a data="' + window.apppath + '/admin/serviceOrgDetail/' + data + '" class="btn default btn-xs green-stripe info" >查看</a>';
                            if (row.videoMonitors > 0) {
                                html += '<a data="' + window.apppath + '/admin/monitor/video/source/' + data + '?serviceOrgName='+row.institutionName+'" class="btn default btn-xs green-stripe green" >视频源</a>';
                            }
                            html += '<a data="' + window.apppath + '/admin/monitor/video/list?orgId=' + data + '&orgName=' + row.institutionName + '" class="btn default btn-xs blue-stripe add" >添加视频源</a>';
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

        $("#refresh").click(function () {
            grid.getDataTable().ajax.reload();
        });

        $("#search").click(function () {
            grid.getDataTable().ajax.reload();
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

        grid.getTable().on("click", "a.info", function () {
            var href = $(this).attr("data");
            window.parent.addTab("serviceOrgInfo", "组织详情信息", href);
        });

        grid.getTable().on("click", "a.green", function () {
            var href = $(this).attr("data");
            window.parent.addTab("orgVideoSource", "视频源", href);
        });

        grid.getTable().on("click", "a.add", function () {
            var href = $(this).attr("data");
            window.parent.addTab("videoList", "视频源列表", href);
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
                    $.post(window.apppath + "/admin/api/serviceOrgDelete", {eventId: eventId}, function (res) {
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
         * 发送信息
         */
        var mobile;
        var mobiles = "";
        grid.getTable().on("click", "button.mess", function () {
            mobile = $(this).data("mobile");
            console.log(mobile);
            $(this).confirmation({
                'title': '确认发送信息？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                'onConfirm': function () {
                    Metronic.blockUI({
                        message: '处理中...',
                        target: tableContainer,
                        overlayColor: 'none',
                        cenrerY: true,
                        boxed: true
                    });
                    $.post(window.apppath + "/admin/api/sms/template/lists", function (res) {
                        Metronic.unblockUI(tableContainer);
                        if (res.success) {
                            console.log(res.data.data);
                            $('#messModal').modal('toggle');
                            $("#messageModel tbody").empty();
                            // DataTable.Clear();
                            $(res.data.data).each(function () {
                                $("#messageModel tbody").append(" <tr><td><input name='mess' type='radio' value='" + this.content + "' class='sss'/></td><td>" + this.content + " </td></tr>");
                            });
                            $('#messageModel').dataTable({
                                "bLengthChange": false,
                                "bFilter": false, //是否启动过滤、搜索功能
                                "destroy": true,
                                "searching": false,
                                "bSort": false,
                                "lengthChange": false,
                                dom: 'lrtp',
                            });
                        } else {
                            showMetroMessage(res.message);
                        }
                    }, "json");
                }
            }).confirmation('toggle');
        });
        $("#btnDeleteServiceOrg").on("click", function (e) {
            var deleteIds = jqchkk("deleteId");
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

        function jqchkk(name) { //jquery获取复选框值
            var chk_value = "";
            $('input[name="' + name + '"]').each(function () {
                var parentParent = $(this).parent();
                if (parentParent.hasClass("checked"))
                    chk_value += ($(this).parent().parent().parent().next().next().next().next().next().html()) + ",";
            });
            return chk_value;
        }
    };
    return {
        //main function to initiate the module
        init: function (method) {
            handleList(method);
            $(".excel").click(function () {
                var params = "areaName="+ $('input[name=areaName]').val()+
                    "&serviceProject="+$('input[name=serviceProject]').val()+
                    "&institutionName="+$('input[name=institutionName]').val()+
                    "&videoStatus="+$('select[name=videoStatus]').val()+
                    "&institutionTypeDictId="+$('select[name=institutionTypeDictId]').val()+
                    "&exportType=1"+
                    "&serviceArea="+$('select[name=serviceArea]').val()+
                    "&gradeDictId="+$('select[name=gradeDictId]').val()+
                    "&levelDictId="+$('select[name=levelDictId]').val()+
                    "&regTypeDictId="+ $('select[name=regTypeDictId]').val()+
                    "&startInfoity="+ $('input[name=startInfoity]').val()+
                    "&endInfoity="+ $('input[name=endInfoity]').val()+
                    "&applyName="+ $('input[name=applyName]').val()+
                    "&videoStatus="+ $('select[name=videoStatus]').val();
                window.location.href = window.apppath + "/admin/api/serviceOrgList/export?" +params.replace(/undefined/g,'');
            });
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
        extSave: function () {
            var channelId = $("#channelId").val();
            if (channelId == null || channelId == "" || channelId == undefined) {
                $("#labelmsg").text('请输入通道ID').addClass("label-danger");
                return false;
            }
            var orgId = $("#orgId").val();
            if (orgId == null || orgId == "" || orgId == undefined) {
                $("#labelmsg").text('组织ID为空，请检查原因！').addClass("label-danger");
                return false;
            }
            $.post(window.apppath + "/admin/api/video/extSave", {
                orgId: orgId,
                channelId: channelId
            }, function (res) {
                if (res.success) {
                    $("#labelmsg").text("").addClass("label-success");
                    $("#channelId").val("");
                    $("#addVideoModal").modal("hide");
                } else {
                    $("#labelmsg").text(res.message).addClass("label-danger");
                }
            }, "json");
        }
    };
}();