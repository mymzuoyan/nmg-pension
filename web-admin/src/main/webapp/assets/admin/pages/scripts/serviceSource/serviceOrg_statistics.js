/**
 * Created by Administrator on 2016/10/31.
 */
var ServicrOrgStatistics = function () {

    var _self = "";
    return {
        levelData: "",
        typeData: "",
        init: function () {
            _self = this;
            _self.chartInit();
            $("#showPie1").click(function () {
                var count = [0, 0, 0, 0, 0, 0];
                var arr = [];
                var obj=document.getElementById('area1');
                var options = obj.options;
                while(obj.selectedIndex != -1){
                    arr.push(options[obj.selectedIndex].text);
                    options[obj.selectedIndex].selected =false;
                }
                for (var s in arr) {
                    for (var i in _self.levelData) {
                        if (arr[s] == i) {
                            for (var j = 0; j <= 4; j++) {
                                count[j] += _self.levelData[i][j + 1];
                            }
                        }
                    }
                }
                var pieOption = {
                    title: {
                        text: '各等级等级所占比',
                        x: 'center'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    series: [
                        {
                            name: '组织等级',
                            type: 'pie',
                            radius: '55%',
                            center: ['50%', '60%'],
                            data: [
                                {value: count[0], name: 'AAAAA'},
                                {value: count[1], name: 'AAAA'},
                                {value: count[2], name: 'AAA'},
                                {value: count[3], name: 'AA'},
                                {value: count[4], name: 'A'},
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

                var pie = (document.getElementById('pie1'));
                if (pie != null)
                    echarts.init(pie).setOption(pieOption);
            });

            $("#showPie2").click(function () {
                var count = [0, 0, 0, 0, 0, 0];
                var arr = [];
                var obj=document.getElementById('area2');
                var options = obj.options;
                while(obj.selectedIndex != -1){
                    arr.push(options[obj.selectedIndex].text);
                    options[obj.selectedIndex].selected =false;
                }
                for (var s in arr) {
                    for (var i in _self.levelData) {
                        if (arr[s] == i) {
                            for (var j = 0; j < 6; j++) {
                                count[j] += _self.typeData[i][j + 1];
                            }
                        }
                    }
                }
                var pieOption = {
                    title: {
                        text: '不同单位性质所占比',
                        x: 'center'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    series: [
                        {
                            name: '单位性质',
                            type: 'pie',
                            radius: '55%',
                            center: ['50%', '60%'],
                            data: [
                                {value: count[0], name: '公办'},
                                {value: count[1], name: '民办'},
                                {value: count[2], name: '公建民营'}
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
                var pie = (document.getElementById('pie2'));
                if (pie != null)
                    echarts.init(pie).setOption(pieOption);
            });
        }, chartInit: function () {
            Metronic.blockUI({
                boxed: true,
                message: '请等待。。'
            });
            $.post(window.apppath + "/admin/api/serviceOrg/getServiceOrgStatistics",
                {}, function (data) {
                    Metronic.unblockUI();
                    if (data != "") {
                        var flag = 3;
                        for (var i in data) {
                            flag++;
                            var legendData = [];
                            var xAxisData = [];
                            var seriesData = [];
                            if (i == "各区各等级统计情况") {
                                _self.levelData = data[i];
                                legendData = ["总量", "AAAAA", "AAAA", "AAA", "AA", "A"];
                            }
                            else if (i == "各区各单位性质统计情况") {
                                _self.typeData = data[i];
                                legendData = ["总量", "公办", "民办", "公建民营"];
                            }
                            for (var j in data[i]) {
                                xAxisData.push(j);
                            }
                            for (var k in legendData) {
                                var data0 = [];
                                for (var j in data[i]) {
                                    data0.push(data[i][j][k]);
                                }
                                seriesData.push({
                                    name: legendData[k],
                                    type: 'bar',
                                    data: data0
                                })
                            }
                            var barOption = {
                                // title: {
                                //     text: i ,
                                //     subtext: '树状图'
                                // },
                                tooltip: {
                                    trigger: 'axis',
                                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                                    }
                                },
                                legend: {
                                    data: legendData
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
                                        data: xAxisData,
                                        axisLabel: {
                                            interval: 0,
                                            formatter:function(value)
                                            {
                                                debugger
                                                var ret = "";//拼接加\n返回的类目项
                                                var maxLength = 2;//每项显示文字个数
                                                var valLength = value.length;//X轴类目项的文字个数
                                                var rowN = Math.ceil(valLength / maxLength); //类目项需要换行的行数
                                                if (rowN > 1)//如果类目项的文字大于3,
                                                {
                                                    for (var i = 0; i < rowN; i++) {
                                                        var temp = "";//每次截取的字符串
                                                        var start = i * maxLength;//开始截取的位置
                                                        var end = start + maxLength;//结束截取的位置
                                                        //这里也可以加一个是否是最后一行的判断，但是不加也没有影响，那就不加吧
                                                        temp = value.substring(start, end) + "\n";
                                                        ret += temp; //凭借最终的字符串
                                                    }
                                                    return ret;
                                                }
                                                else {
                                                    return value;
                                                }
                                            }
                                        }
                                    }
                                ],
                                yAxis: [
                                    {
                                        type: 'value'
                                    }
                                ],
                                series: seriesData
                            };
                            var bar = document.getElementById('bar' + flag);
                            if (bar != null)
                                echarts.init(bar).setOption(barOption);
                        }
                    }
                }, "json"
            );
        }

    }
}();