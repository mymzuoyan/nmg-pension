/**
 * Created by CoderQiang on 2017/2/8.
 */
/**
 * Created by CoderQiang on 2017/1/9.
 */
var HomeInit = function () {

    var _self = "";
    var statusArr = ['离线','空闲','振铃','通话','保持','后处理','被占用','忙碌','离开','仅呼出'];
    return {
        init: function () {
            _self = this;
            _self.getData();
            _self.monitorStatusInit();
            setInterval(_self.monitorStatusInit, 1200000);
            _self.eChartInit();

        },
        showMonitorInfo: function (e) {
            var self = e;
            var name = $(self).data("name");
            var number = $(self).data("phone");
            var pstnnumber = $(self).data("pstnnumber");
            var isLeader = ($(self).data("isLeader")==null?'否':'是');
            var account = $(self).data("account");
            var groupName = $(self).data("groupname");
            var queueName = $(self).data("queuename");
            $('#zxmc').html(name);
            $('#zxzmc').html(groupName);
            $('#wxhm').html(pstnnumber);
            $('#sfzc').html(isLeader);
            $('#dl').html(queueName);
            $('#xtyh').html(account);
            $('#ldhm').html(number);
            $('#ldhmtr').show();
            if(number==null||number==''){
                $('#ldhmtr').hide();
            }
            $("#monitor_status_modal").modal("show");
            //监听
            $("#monitor_status_modal .monitor-call").click(function () {
                var extension = $(this).data("extension");
                alert(extension);
            })

            //插入
            $("#monitor_status_modal .insert-call").click(function () {
                var extension = $(this).data("extension");
                alert(extension);
            })
        },
        getData: function () {
            $.post(window.apppath + "/admin/api/user/getCallLinkData",
                {}, function (data) {
                    if (data != "") {
                        var ids = ["callInfoCount", "todayCount", "doneCount", "undoCount","pdCount"];
                        var flag = 0;
                        for (var i in data) {
                            $("#" + ids[flag]).html(data[i] + $("#" + ids[flag]).html());
                            flag++;
                        }
                    }
                }, "json");
        },
        eChartInit: function () {
    //        _self.monitorStatisticsInit();//坐席工作量统计
            _self.callInfoStatisticsInit();//工单统计
            _self.serviceTypeInit();//服务类型统计（模拟数据）
            _self.callTypeInit();//呼叫类型统计（模拟数据）
            _self.evaluateStatisticsInit();//满意度统计
            _self.returnVisitStatisticsInit();//回访数量统计（模拟数据）
        },
        monitorStatusInit: function () {
            Metronic.blockUI({
                target: $("#bar1").parent().parent().parent(),
                boxed: true,
                message: '请等待。。'
            });
            $.post(window.apppath + "/admin/call/api/monitor/selectMonitorStatus", {
                isShow: 1
            }, function (res) {
                var ststusData = {};
                if (res) {
                    var html = "";
                    for (var i in res) {
                        if(ststusData[statusArr[res[i].queueId+1]] == null){
                            ststusData[statusArr[res[i].queueId+1]] = 1;
                        }else{
                            ststusData[statusArr[res[i].queueId+1]] += 1;
                        }
                        var url = window.apppath + "/assets/admin/pages/img/call/callstatus";
                        var img = "";
                        var flag = false;
                        img = '<a href="#" data-name="' + res[i].name + '" data-extension="' + res[i].extension + '" data-phone="' + res[i].phone + '" data-groupname="'+res[i].groupName+'" data-account="'+res[i].account+'" data-isLeader="'+res[i].isLeader+'" data-pstnnumber="'+res[i].pstnnumber+'" data-queuename="'+res[i].queueName+'" onclick="HomeInit.showMonitorInfo(this);"><img class="active" title="'+statusArr[res[i].queueId+1]+'" src="' + url + res[i].queueId + '.png"></a>';

                        html += [' <li>',
                            '                                        <div class="monitor">',
                            '                                            <div class="imgDiv">',
                            img,
                            '                                            </div>',
                            '                                            <p class="name">' + res[i].extension + '</p>',
                            '                                        </div>',
                            '                                    </li>'].join("");
                    }
                    $("#monitor_status_ul").html(html);
                    if (res.recordsTotal < 10) {
                        var width = 90 / res.recordsTotal;
                        $("#monitor_status_ul li").css("width", width + "%");
                    }
                    Metronic.unblockUI($("#bar1").parent().parent().parent());
                    var option = {
                        legend: {
                            data:statusArr
                        },
                        tooltip : {
                            trigger: 'axis'
                        },
                        calculable : true,
                        xAxis : [
                            {
                                type : 'category',
                                data : statusArr
                            }
                        ],
                        yAxis: {
                            type: 'value',
                            axisLabel: {
                                formatter: '{value} '
                            },
                            name: "当前坐席状态统计"
                        },
                        series : [
                            {
                                name:'数量',
                                type:'bar',
                                data:[
                                    ststusData[statusArr[0]]==null?0:ststusData[statusArr[0]],
                                    ststusData[statusArr[1]]==null?0:ststusData[statusArr[1]],
                                    ststusData[statusArr[2]]==null?0:ststusData[statusArr[2]],
                                    ststusData[statusArr[3]]==null?0:ststusData[statusArr[3]],
                                    ststusData[statusArr[4]]==null?0:ststusData[statusArr[4]],
                                    ststusData[statusArr[5]]==null?0:ststusData[statusArr[5]],
                                    ststusData[statusArr[6]]==null?0:ststusData[statusArr[6]],
                                    ststusData[statusArr[7]]==null?0:ststusData[statusArr[7]],
                                    ststusData[statusArr[8]]==null?0:ststusData[statusArr[8]],
                                    ststusData[statusArr[9]]==null?0:ststusData[statusArr[9]]
                                    ]
                            }
                        ]
                    };
                    var bar = document.getElementById('bar1');
                    if (bar != null)
                        echarts.init(bar).setOption(option);
                }
            }, 'json');
        },
        monitorStatisticsInit: function () {
            Metronic.blockUI({
                target: $("#bar1").parent().parent().parent(),
                boxed: true,
                message: '请等待。。'
            });
            $.post(window.apppath + "/admin/call/api/callInfo/getMonitorStatisticsByMonth",
                {}, function (res) {
                    Metronic.unblockUI($("#bar1").parent().parent().parent());
                    if (res != "") {
                        var data = res.data;
                        var xAxisData = [];
                        var seriesData = [];
                        var inData = [];
                        var visitData = [];
                        for (var i in data) {
                            xAxisData.push(data[i].account);
                            inData.push(data[i].in);
                            visitData.push(data[i].visit);
                        }
                        seriesData.push({
                            name: "接入工单",
                            type: 'bar',
                            stack: '工单',
                            data: inData,
                            barWidth: 30
                        });
                        seriesData.push({
                            name: "回访工单",
                            type: 'bar',
                            stack: '工单',
                            data: visitData,
                            barWidth: 30
                        });
                        console.log(seriesData)
                        var option = {
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                                }
                            },
                            legend: {
                                data: ['接入工单', '回访工单']
                            },
                            grid: {
                                left: '3%',
                                right: '4%',
                                bottom: '3%',
                                containLabel: true
                            },
                            xAxis: [
                                {
                                    type: 'category',
                                    data: xAxisData
                                }
                            ],
                            yAxis: [
                                {
                                    type: 'value'
                                }
                            ],
                            series: seriesData

                        };
                        var bar = document.getElementById('bar1');
                        if (bar != null)
                            echarts.init(bar).setOption(option);
                    }
                }, 'json');

        },
        callInfoStatisticsInit: function () {
            Metronic.blockUI({
                target: $("#line2").parent().parent().parent(),
                boxed: true,
                message: '请等待。。'
            });
            $.post(window.apppath + "/admin/api/task/getDataByDate",
                {}, function (data) {
                    Metronic.unblockUI($("#line2").parent().parent().parent());
                    if (data != "") {
                        var xAxisData = [];
                        var seriesData = [];
                        for (var i in data) {
                            var str = i.substr(i.indexOf("-") + 1, i.length);
                            xAxisData.push(str);
                            seriesData.push(data[i]);
                        }
                        var option = {
                            tooltip: {
                                trigger: 'axis'
                            },
                            toolbox: {
                                show: true,
                                feature: {
                                    saveAsImage: {}
                                }
                            },
                            xAxis: {
                                type: 'category',
                                boundaryGap: false,
                                data: xAxisData
                            },
                            yAxis: {
                                type: 'value',
                                axisLabel: {
                                    formatter: '{value} '
                                },
                                name: "近30日工单统计",
                            },
                            series: [
                                {
                                    name: '近30日工单统计',
                                    type: 'line',
                                    smooth: true,
                                    data: seriesData
                                }
                            ]
                        };
                        var line = document.getElementById('line2');
                        if (line != null)
                            echarts.init(line).setOption(option);
                    }

                }, 'json');
        },
        serviceTypeInit: function () {
            var option = {
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: ['助餐', '助浴', '助洁', '助医', '助急']
                },
                series: [
                    {
                        name: '服务类型',
                        type: 'pie',
                        radius: '55%',
                        center: ['50%', '60%'],
                        data: [
                            {value: 335, name: '助餐'},
                            {value: 310, name: '助浴'},
                            {value: 234, name: '助洁'},
                            {value: 135, name: '助医'},
                            {value: 1548, name: '助急'}
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };
            var pie = document.getElementById('pie1');
            if (pie != null)
                echarts.init(pie).setOption(option);
        },
        callTypeInit: function () {
            var option = {
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: ['12349', '红键', '绿键']
                },
                series: [
                    {
                        name: '服务类型',
                        type: 'pie',
                        radius: '55%',
                        center: ['50%', '60%'],
                        data: [
                            {value: 335, name: '12349'},
                            {value: 310, name: '红键'},
                            {value: 234, name: '绿键'},
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };
            var pie = document.getElementById('pie2');
            if (pie != null)
                echarts.init(pie).setOption(option);
        },
        evaluateStatisticsInit: function () {
            Metronic.blockUI({
                target: $("#pie3").parent().parent().parent(),
                boxed: true,
                message: '请等待。。'
            });
            $.post(window.apppath + "/admin/call/api/callInfo/getEvaluateStatisticsByMonth",
                {}, function (data) {
                    Metronic.unblockUI($("#pie3").parent().parent().parent());
                    if (data != "") {
                        var xAxisData = [];
                        var seriesData = [];
                        for (var i in data) {
                            xAxisData.push(_self.strToEvaluateStr(i));
                            seriesData.push({value: data[i], name: _self.strToEvaluateStr(i)});
                        }
                        var option = {
                            tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b}: {c} ({d}%)"
                            },
                            legend: {
                                orient: 'vertical',
                                x: 'left',
                                data: xAxisData
                            },
                            series: [
                                {
                                    name: '满意度统计',
                                    type: 'pie',
                                    radius: ['50%', '70%'],
                                    avoidLabelOverlap: false,
                                    label: {
                                        normal: {
                                            show: false,
                                            position: 'center'
                                        },
                                        emphasis: {
                                            show: true,
                                            textStyle: {
                                                fontSize: '30',
                                                fontWeight: 'bold'
                                            }
                                        }
                                    },
                                    labelLine: {
                                        normal: {
                                            show: false
                                        }
                                    },
                                    data: seriesData
                                }
                            ]
                        };
                        var pie = document.getElementById('pie3');
                        if (pie != null)
                            echarts.init(pie).setOption(option);
                    }

                }, 'json');
        },
        returnVisitStatisticsInit: function () {
            // getReturnVisitStatistics
            Metronic.blockUI({
                target: $("#pie4").parent().parent().parent(),
                boxed: true,
                message: '请等待。。'
            });
            $.post(window.apppath + "/admin/call/api/visit/getReturnVisitStatistics",
                {}, function (data) {
                    Metronic.unblockUI($("#pie4").parent().parent().parent());
                    if (data != "") {
                        var color = ['FF4040', '3956ff', '56ff3b'];
                        var divId = ['pie4', 'pie5', 'pie6']
                        var options = [];
                        var flag = 0;
                        for (var i in data) {
                            var option = {
                                title: {
                                    text: i,
                                    left: 'center',
                                    top: "20%",
                                },
                                series: [
                                    {
                                        name: i,
                                        type: 'pie',
                                        avoidLabelOverlap: false,
                                        radius: ['50%', '70%'],
                                        label: {
                                            normal: {
                                                show: false,
                                                position: 'center'
                                            },
                                            emphasis: {
                                                show: true,
                                                textStyle: {
                                                    fontSize: '10',
                                                    fontWeight: 'bold'
                                                }
                                            }
                                        },
                                        labelLine: {
                                            normal: {
                                                show: false
                                            }
                                        },
                                        data: [
                                            {
                                                value: data[i][1],
                                                name: '未回访' + data[i][1],
                                                itemStyle: {normal: {color: "#BEBEBE"}}
                                            },
                                            {
                                                value: data[i][0],
                                                name: '已回访' + data[i][0],
                                                itemStyle: {normal: {color: '#' + color[flag]}}
                                            },
                                        ]
                                    }
                                ]
                            };
                            options.push(option);
                        }
                        for (var i in options) {
                            var pie = document.getElementById(divId[i]);
                            if (pie != null)
                                echarts.init(pie).setOption(options[i]);
                        }
                    }
                }, 'json');
        },
        strToEvaluateStr: function (str) {
            str += "";
            if (str == "-1")
                return "未评价";
            else if (str == "0")
                return "评价";
            else if (str == "1")
                return "非常满意";
            else if (str == "2")
                return "满意";
            else if (str == "3")
                return "一般";
            else if (str == "4")
                return "不满意";
        }
    }
}();