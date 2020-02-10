/**
 * Created by Administrator on 2016/10/8.
 */
/**
 * Created by Administrator on 2016/10/8.
 */
var ElderMsgStatistics = function () {
    var _self = "";
    return {
        init: function () {
            _self = this;
            $("ul.nav li").eq(0).addClass("active");
            $(".tab-pane").eq(0).addClass("active");
            _self.getStatisticsData();
            $("#analyze").click(function () {
                _self.getStatisticsByMonth();
            });

            //初始化本年一月到现在
            var year = new Date().getFullYear();
            var month = (new Date().getMonth() + 1) + "";
            if (month.length = 1) {
                month = "0" + month;
            }
            $("#startTime").val(year + "-01");
            $("#endTime").val(year + "-" + month);
            $("#analyze").click();
        },
        getStatisticsByMonth: function () {
            var startTime = $("#startTime").val();
            var endTime = $("#endTime").val();
            if (startTime == null || startTime == "") {
                alert("请选择开始时间");
                return false;
            }
            if (endTime == null || endTime == "") {
                alert("请选择结束时间");
                return false;
            }
            $.post(window.apppath + "/admin/api/elderly/statisticsByMonth",
                {
                    startTime: startTime,
                    endTime: endTime
                }, function (info) {
                    var dataName = [];
                    var barData = [];
                    var pieData = [];
                    for (var j in info) {
                        dataName.push(j);
                        barData.push(info[j]);
                        pieData.push({value: info[j], name: j});
                    }
                    var barOption = {
                        title: {
                            text: "服务人数统计",
                            subtext: '树状图'
                        },
                        color: ['#3398DB'],
                        tooltip: {
                            trigger: 'axis',
                            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                            }
                        },
                        grid: {
                            left: '1%',
                            right: '1%',
                            bottom: '15%',
                            containLabel: true
                        },
                        xAxis: [
                            {
                                type: 'category',
                                data: dataName,
                                axisTick: {
                                    alignWithLabel: true
                                }
                            }
                        ],
                        yAxis: [
                            {
                                type: 'value'
                            }
                        ],
                        series: [
                            {
                                name: "服务人数统计",
                                type: 'line',
                                barWidth: '30',
                                data: barData,
                                label: {
                                    normal: {
                                        show: false,
                                        position: 'inside'
                                    }
                                }
                            }
                        ]
                    };
                    var pieOption = {
                        title: {
                            text: "服务人数比例",
                            x: 'center',
                            subtext: '饼图'
                        },
                        legend: {
                            orient: 'vertical',
                            left: 'left',
                            data: dataName
                        },
                        series: [
                            {
                                name: "服务人数比例",
                                type: 'pie',
                                radius: '55%',
                                center: ['50%', '60%'],
                                data: pieData,
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

                    var bar = (document.getElementById('bar4'));
                    var pie = (document.getElementById('pie4'));
                    if (bar != null)
                        echarts.init(bar).setOption(barOption);
                    if (pie != null)
                        echarts.init(pie).setOption(pieOption);
                }, "json");

        },
        getStatisticsData: function () {
            $.post(window.apppath + "/admin/api/elderly/statistics",
                {
                    // depId: _self.depId, minAge: _self.minAge, maxAge: _self.maxAge
                }, function (data) {
                    // Metronic.unblockUI();
                    var flag = 0;
                    for (var i in data) {
                        var dataName = [];
                        var barData = [];
                        var pieData = [];
                        var info = data[i];
                        flag++;
                        for (var j in info) {
                            dataName.push(j);
                            barData.push(info[j]);
                            if (j == "高淳区") {
                                pieData.push({value: info[j], name: j,itemStyle:{
                                    normal:{
                                        color:'#003dcc'
                                    },emphasis:{
                                        color: '#003dcc'
                                    }
                                }
                                });

                            } else {
                                pieData.push({value: info[j], name: j});
                            }
                        }
                        var barOption = {
                            title: {
                                text: i + "分布人数",
                                subtext: '全市60周岁以上老人（单位：人）'
                            },
                            color: ['#3398DB'],
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                                }
                            },
                            grid: {
                                left: '1%',
                                right: '1%',
                                bottom: '15%',
                                containLabel: true
                            },
                            xAxis: [
                                {
                                    type: 'category',
                                    data: dataName,
                                    axisTick: {
                                        alignWithLabel: true
                                    }
                                }
                            ],
                            yAxis: [
                                {
                                    type: 'value'
                                }
                            ],
                            series: [
                                {
                                    name: i + "分布人数",
                                    type: 'bar',
                                    barWidth: '30',
                                    data: barData,
                                    label: {
                                        normal: {
                                            show: true,
                                            position: "top"
                                        }
                                    }
                                }
                            ]
                        };
                        var pieOption = {
                            title: {
                                text: i + "比例",
                                x: 'center',
                                subtext: '全市60周岁以上老人'
                            },
                            tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c} ({d}%)"
                            },
                            legend: {
                                orient: 'vertical',
                                left: 'left',
                                data: dataName
                            },
                            series: [
                                {
                                    name: i + "比例",
                                    type: 'pie',
                                    radius: '55%',
                                    center: ['50%', '60%'],
                                    data: pieData,
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

                        var bar = (document.getElementById('bar' + flag));
                        var pie = (document.getElementById('pie' + flag));
                        if (bar != null)
                            echarts.init(bar).setOption(barOption);
                        if (pie != null)
                            echarts.init(pie).setOption(pieOption);
                    }
                }, "json");
        }
    }
}();