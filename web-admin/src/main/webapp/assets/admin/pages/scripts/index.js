/**
 * Created by Administrator on 2016/10/13.
 */
var Index = function () {

    var _self = "";
    var getUserStatusTime = "";
    // 政务平台调用链接
    var zwptUrl = "http://demo.njsmzj.gov.cn/inteface/return.do";
    return {
        roleId: "",
        roleName: "",
        extension: "",
        queueName: "",
        agentId: "",
        userId: "",
        areaName: "",
        monitorStatus: "",
        is_volume_off: 0,
        init: function (id, roleid, rolename) {
            _self = this;
            _self.roleId = roleid;
            _self.roleName = rolename;
            _self.userId = id;

            _self.unReadTaskInit();
            _self.unReadMsgInit();
            _self.unReadSysMsgInit();


            //菜单点击
            $(".page-sidebar-menu li a").click(function () {
                var url = $(this).attr("data");
                if (url != null) {
                    initMenu();
                    $(this).css("background-color", "#0188d6  ");
                }
                //显示bug修正
                $(".page-sidebar-menu .sub-menu").css("height", "auto");
            });
            $(".page-sidebar-menu li a").hover(function () {
                $(this).css("background-color", "#0188d6 ");
            }, function () {
                $(this).css("background-color", "#38A9EC ");
            })

            $(".chaneStatus li").click(function () {
                var status = $(this).attr("data");
                if (_self.monitorStatus + "" == status)
                    return false;
                $.post(window.apppath + "/admin/call/api/monitor/changeStatus", {
                    status: status
                }, function (res) {
                    if (res != -1) {
                        _self.setStatusName(res)
                    }
                }, "json");
            });


        },
        setAreaName: function (str) {
            _self.areaName = str;
        },
        setExtension: function (num) {
            _self.extension = num;
        },
        setQueueName: function (num) {
            _self.queueName = num;
        },
        setAgentId: function (num) {
            _self.agentId = num;
        },
        showLaiDian: function () {
            if (_self.extension != "") {
                //定时获取来电
                setInterval(getCall, 1000);
            }
            function getCall() {
                DwrService.getCallerInfo(_self.extension, _self.agentId)
            }
        },

        showAbandoned: function () {
            setInterval(getAbandoned, 2000);
            function getAbandoned() {
                DwrService.getAbandonedCall(_self.queueName, "false", _self.extension, _self.areaName);
            }
        },
        unReadTaskInit: function () {
            $.post(window.apppath + "/admin/api/task/receiveList", {
                status: "1",
                receiverId: _self.userId
            }, function (res) {
                if (res != "") {
                    var data = res.data;
                    for (var i in data) {
                        var res = data[i];
                        addATaskTag(res.taskId, res.taskTitle, res.createTime, res.sendName);
                    }
                    $("#newTaskUl").on("click", "a", function () {
                        /**
                         * 管理员查看一条记录，减少标记
                         */
                        var id = $(this).attr("data");
                        Addtabs.add({
                            id: "task_info",
                            title: "工单详情",
                            url: window.apppath + '/admin/task/update/' + id,
                            refresh: true
                        })
                        $(this).closest("li").remove();
                        _self.subATask();
                    });


                }
            }, "json");
        },
        unReadSysMsgInit: function () {//未读公告
            $.post(window.apppath + "/admin/api/message/getUnReadMessage", {}, function (res) {
                if (res != null) {
                    if (res.length > 0) {
                        $("#sysMesCount").html(res.length);
                        $("#unDoThingCount").html(res.length);
                    } else {
                        $("#sysMesCount").html(0);
                        $("#unDoThingCount").html(0);
                    }
                }
            }, "json");
        },
        unReadMsgInit: function () {
            if (_self.roleName.indexOf("组织管理员") >= 0) {
                $.post(window.apppath + "/admin/api/user/hasAMsgOrNot", {}, function (res) {
                    if (res.success != "") {
                        alert(res.message);
                    }
                }, "json");
            }
        },
        subATask: function () {
            var num = $("#newTaskUl li").length;
            $(".taskNum").html(num);
        },
        removeAllTask: function () {
            $(".infoNum").html(0);
            $("#newInfoUl li").remove();
            Addtabs.add({
                id: "task_receive",
                title: "接收工单",
                url: window.apppath + '/admin/task/receive_list',
            })
        },
        doSoundPlay: function (url) {
            if (_self.is_volume_off == 1) {
                $("#oCallSound").html("");
                return;
            }

            if ($.trim(url).length == 0) {
                $("#oCallSound").html("");
            } else {
                if (/webkit|firefox|opera/.test(navigator.userAgent.toLowerCase())) {
                    $("#oCallSound").html("<audio autoplay=\"autoplay\"><source src=\"" + url + "\" type=\"audio/wav\"/></audio>");
                } else {
                    $("#oCallSound").html("<bgsound loop=\"1\" src=\"" + url + "\" />");
                }
            }
        },
        getMonitorStatus: function () {
            $.post(window.apppath + "/admin/call/api/monitor/getMonitorStatus", {}, function (res) {
                _self.monitorStatus = res;
                _self.setStatusName(res)
            }, "json");
        },
        setStatusName: function (res) {
            var names = [
                '就绪',
                '通话中',
                '振铃',
                '整理',
                '私事暂休',
                '示忙',
                '外拨工作',
                '代接电话',
                '振铃超时',
                '暂休超时']
            $(".monitorStatus").html(names[res])
        },
        // 南京市民政局统一资源管理平台 用户单点登录接入
        // 4.1.3 根据票据获取令牌信息
        ticketValidate: function () {
            $.ajax({
                type: "GET",
                url: zwptUrl + "auth/ticketValidate.do",
                data: {
                    app_id: "",
                    timestamp: _self.getTimestamp(new Date()),
                    app_sign: hex_md5("" +""+_self.getTimestamp(new Date())),
                    ticket: ""
                },
                dataType: "json",
                async: true,
                success: function (res) {

                }
            });
        },
        getTimestamp: function (time) {
            return time.getFullYear() +""+ (time.getMonth() + 1) +""+ (time.getDate()> 9 ? time.getDate() : '0'+time.getDate()) +""+ (time.getHours() > 9 ? '' : '0') +""+ time.getHours() +""+ (time.getMinutes() > 9 ? '' : '0') + time.getMinutes() +""+ (time.getSeconds() > 9 ? '' : '0') +""+ time.getSeconds();
        }


    }
}();