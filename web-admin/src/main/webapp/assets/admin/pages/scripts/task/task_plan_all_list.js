/**
 * Created by zhnn on 2016/9/21.
 */
var TaskPLanAllList = function () {
    var _self = "";
    var tableContainer = $("#datatable_task_list").parents(".table-container");
    return {
        grid: "",
        init: function () {
            _self = this;
            _self.tableInit();
            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            })
        },
        tableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_task_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        var serviceAreaName = $("#serviceAreaName").val();
                        if (EographicArea.getPosition2() != "") {
                            serviceAreaName = EographicArea.getPosition2();
                        }
                        var params = {
                            length: params.length,
                            start: params.start,
                            number: $("input[name=number]").val(),
                            creatorName: $("input[name=creatorName]").val(),
                            elderName: $("input[name=elderName]").val(),
                            receiverServiceOrg: $("input[name=receiverServiceOrg]").val(),
                            receiverName: $("input[name=receiverName]").val(),
                            serviceType: $("select[name=serviceType] option:selected").val(),
                            status: $("select[name=status] option:selected").val(),
                            level: $("select[name=level] option:selected").val(),
                            serviceAddress: $("input[name=serviceAddress]").val(),
                            idCardNo: $("input[name=idCardNo]").val(),
                            elderId: $("input[name=elderId]").val(),
                            serviceAreaName: serviceAreaName,
                            source: $("select[name=source]").val(),
                            type: $("select[name=type]").val(),
                            startTime: startTime,
                            endTime: endTime,
                            orderField: "id",
                            orderDir: "DESC"
                        };
                        var startTime = $("input[name='startTime']").val();
                        var endTime = $("input[name='endTime']").val();
                        if (startTime != '' && startTime != undefined) {
                            params["startTime"] = _self.stringToDate(startTime);
                        }
                        if (endTime != '' && endTime != undefined) {
                            params["endTime"] = _self.stringToDate(endTime);
                        }
                        $.post(window.apppath + "/admin/api/task/getAllPlanList", params,
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
                            "data": "number", render: function (data, type, row, meta) {
                            return data;
                        }
                        },
                        {"data": "elderName"}
                        ,
                        {"data": "serviceType"}
                        ,
                        {"data": "serviceTime"}
                        ,
                        {"data": "receiverName"}
                        ,
                        {"data": "receiverServiceOrg"},

                        {"data": "serviceAddress"},


                        {
                            "data": "source", render: function (data, type, row, meta) {
                            return data;
                        }
                        },
                        {
                            "data": "status", render: function (data, type, row, meta) {
                            var strs = ["未完成", "已完成"];
                            if (data == 0) {
                                return '<span style="color:red">' + strs[data] + '</span>';
                            } else if (data == 1) {
                                return '<span style="color:green">' + strs[data] + '</span>';
                            }
                            return "";
                        }
                        }

                    ]
                }

            });

            /**
             * 派遣
             */
            _self.grid.getTable().on("click", "a.dispath", function (e) {
                var id = $(this).attr("data");
                window.parent.open(window.apppath + "/admin/dispatch/dispatchADemand/" + id);

            });

            /**
             * 查看
             */
            _self.grid.getTable().on("click", "a.scan", function (e) {
                var taskId = $(this).attr("data");
                //获取工单详情
                $.post(window.apppath + "/admin/api/task/getTaskHandle", {
                    taskId: taskId
                }, function (res) {
                    if (res != null && res != "") {
                        $("#taskInfo .modal-body").html("");
                        var content = _self.createTaskInfo(res);
                        $("#myModalLabel").html("工单信息");
                        $("#taskInfo .modal-body").html(content);
                        $("#taskInfo").modal("show");
                    }
                }, 'json');
            });
            /**
             * 撤销
             */
            _self.grid.getTable().on("click", "a.delete", function (e) {
                var curRow = $(this).closest('tr');
                var taskId = $(this).attr("data");
                var taskReceiveId = $(this).data("taskreceive");
                $(this).confirmation({
                    'title': '确认撤销？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                    'onConfirm': function () {
                        Metronic.blockUI({
                            message: '处理中...',
                            target: tableContainer,
                            overlayColor: 'none',
                            cenrerY: true,
                            boxed: true
                        });
                        $.post(window.apppath + "/admin/api/task/cancel", {
                            taskId: taskId,
                            taskReceiveId: taskReceiveId
                        }, function (res) {
                            Metronic.unblockUI(tableContainer);
                            if (res.success) {
                                _self.grid.getDataTable().row(curRow).remove().draw(false);
                            } else {
                                _self.showMetroMessage(res.message);
                            }
                        }, "json");
                    }, onCancel: function () {

                    }
                }).confirmation('toggle');
            });
        },
        createTaskInfo: function (res) {
            var data = res.task;
            var html = "";
            var strs = ["", "待响应", "组织已响应", "组织已派遣", "组织已拒绝", "服务人员已接单", "服务人员已上门", "服务人员已拒绝", "待付款", "已完成", "已评价", "已调度"];
            html += ['<div class="alert_main MapLocation" style="position:static">',
                '    <div class="alert_wrap_con" style="width: 100%">',
                '        <div class="MapLocation_con">',
                '        <div class="MapLocation_con">',
                '            <div class="MapLocation_con_list" style="display: inline-block;width: 30%;padding:4px 1%">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                '                <p ><strong>工单编号: </strong>' + data.number + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="display: inline-block;width: 30%;padding:4px 1%">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                '                <p ><strong>需求发布人: </strong>' + data.creatorName + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list"style="display: inline-block;width: 33%;padding:4px 1%">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_1.jpg" alt=""/>',
                '                <p><strong>服务时间: </strong>' + data.serviceTime + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="display: inline-block;width: 30%;padding: 4px 1%">',
                '                <img style=" vertical-align: top;width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                '                <p ><strong>服务对象: </strong>' + data.elderName + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="display: inline-block;width: 30%;padding:4px 1%">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/layout/img/demand_age.png" alt=""/>',
                '                <p ><strong>性别: </strong>' + (data.elderSex == 1 ? '男' : "女") + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="display: inline-block;width: 33%;padding:4px 1%">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/layout/img/demand_age.png" alt=""/>',
                '                <p ><strong>年龄: </strong>' + data.elderAge + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="padding: 4px 1%">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_14.png" alt=""/>',
                '                <p><strong>服务地址: </strong>' + data.serviceAddress + '</p>',
                '            </div>',
                '            <div class="MapLocation_con_list" style="padding: 4px 1%">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_23.png" alt=""/>',
                '                <p><strong>服务项目: </strong>' + data.serviceType + '，' + data.serviceName + '，' + data.content + '</p>',
                '            </div>',
            ].join("");
            if (data.receiverServiceOrg != null && data.receiverServiceOrg != "") {
                _self.canDispatch = false;
                html += ['            <div class="MapLocation_con_list" style="display: inline-block;width: 30%;padding:4px 1%">',
                    '                <img style="width: 14px;height:16px;"  src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                    '                <p><strong style="    display: inline-block; margin-right: 3px;">服务组织: </strong><span style="    display: inline-block;vertical-align: text-top; width:155px;overflow: hidden">' + data.receiverServiceOrg + '</span></p>',
                    '            </div>'].join("");
            }
            if (data.receiverName != null && data.receiverName != "") {
                _self.canDispatch = false;
                html += ['            <div class="MapLocation_con_list" style="display: inline-block;width: 30%;padding:4px 1%">',
                    '                <img style="width: 14px;height:16px;"  src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_18.png" alt=""/>',
                    '                <p><strong style="    display: inline-block; margin-right: 3px;">服务人员: </strong><span style="    display: inline-block;vertical-align: text-top; width:155px;overflow: hidden">' + data.receiverName + '</span></p>',
                    '            </div>'].join("");
            }
            html += ['            <div class="MapLocation_con_list" style="display: inline-block;width: 33%;padding: 4px 1%">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_21.png" alt=""/>',
                '                <p ><strong>联系电话: </strong>' + data.elderMobile + '</p>',
                '            </div>'].join("");
            html += ['            <div class="MapLocation_con_list" style="display: inline-block;width: 30%;padding:4px 1%">',
                '                <img style="width: 14px;height:16px;" src=' + window.apppath + '"/assets/admin/pages/img/map_location_ico_1.jpg" alt=""/>',
                '                 <p><strong>状态: </strong>' + strs[data.status] + '</p>',
                '            </div>',].join("");
            if (data.status == 9 || data.status == 10) {
                if (data.money != null) {
                    html += ['            <div class="MapLocation_con_list"style="display: inline-block;width: 30%;padding:4px 1%">',
                        '                <img style="width: 14px;height:16px;"  src=' + window.apppath + '"/assets/admin/layout/img/demand_content.png" alt=""/>',
                        '                 <p ><strong>消费金额: </strong>' + data.money + '元</p>',
                        '            </div>'].join("");
                }
                if (data.payType != null) {
                    var typeName = ["现金支付", "刷卡支付", "支付宝支付", "微信支付", "线上支付"]
                    html += ['            <div class="MapLocation_con_list" style="display: inline-block;width: 30%;padding:4px 1%">',
                        '                <img style="width: 14px;height:16px;"  src=' + window.apppath + '"/assets/admin/layout/img/demand_content.png" alt=""/>',
                        '                 <p ><strong>支付方式: </strong>' + typeName[data.payType] + '</p>',
                        '            </div>'].join("");
                }
            }
            else {
                if (data.priceInfo != null) {
                    html += ['            <div class="MapLocation_con_list"style="display: inline-block;width: 30%;padding:4px 1%">',
                        '                <img style="width: 14px;height:16px;"  src=' + window.apppath + '"/assets/admin/layout/img/demand_content.png" alt=""/>',
                        '                 <p ><strong>工单定价: </strong>' + data.priceInfo + '</p>',
                        '            </div>'].join("");
                }
            }

            var level = "待评价";
            var comment = "";
            if (data.level != null && data.level != "") {
                level = data.level + '星';
            }
            if (data.comment != null && data.comment != "") {
                comment = ',' + data.comment;
            }
            html += ['            <div class="MapLocation_con_list" style="display: inline-block;width: 45%;padding:4px 1%">',
                '                <img style="width: 14px;height:16px;"  src=' + window.apppath + '"/assets/admin/layout/img/demand_star.png" alt=""/>',
                '                 <p><strong>评价星级: </strong>' + level + comment + '</p>',
                '            </div>'].join("");
            html += ['        </div>',
                '    </div>',
                '</div>'
            ].join("");

            html += ' <div class="about4_main">' +
                ' <h4>工单流程</h4>' +
                ' <ul>';
            var handles = res.handle;
            var ObjectStrs = ["", "服务对象", "服务组织", "服务组织", "服务组织", "服务人员", "服务人员", "服务人员", "服务人员", "服务人员", "服务对象", "资源调度平台"];
            var statusStrs = ["已删除", "发布工单", "响应工单", "派遣工单", "拒绝工单", "接受工单", "已上门", "已拒绝", "请求支付", "已完成", "已评价", "已调度"];
            for (var i in handles) {
                html += '<li>' +
                    handles[i].handleTime + '     ：' + ObjectStrs[handles[i].handleStatus] + handles[i].handleName + statusStrs[handles[i].handleStatus]
                '</li>';
            }
            html += ' </ul>' +
                '</div>';
            return html;
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
        stringToDate: function (fDate) {
            var fullDate = fDate.split("-");
            return new Date(fullDate[0], fullDate[1] - 1, fullDate[2], 0, 0, 0);
        }
    }


}();