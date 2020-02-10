/**
 * Created by Administrator on 2016/10/31.
 */
var InstitutionStatistics = function () {

    var _self = "";
    return {
        levelData:"",
        typeData:"",
        init:function () {
            _self = this;
            _self.chartInit();
            $("#showPie1").click(function () {
                var count=[0,0,0,0];
                // console.log($("#area2 option:selected").html());
                $("#area1 option:selected").each(function () {
                    var name=$(this).text();
                    for(var i in _self.levelData)
                    {
                        if(name==i)
                        {
                            for(var j=0;j<4;j++)
                            {
                                count[j]+=_self.levelData[i][j+1];
                            }
                        }
                    }
                });
                var pieOption = {
                    title : {
                        text: '各等级等级所占比',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    series : [
                        {
                            name: '组织等级',
                            type: 'pie',
                            radius : '55%',
                            center: ['50%', '60%'],
                            data:[
                                {value:count[0], name:'AAAAA'},
                                {value:count[1], name:'AAAA'},
                                {value:count[2], name:'AAA'},
                                {value:count[3], name:'AA'},
                                {value:count[4], name:'A'},
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
                if(pie!=null)
                echarts.init(pie).setOption(pieOption);
            });

            $("#showPie2").click(function () {
                var count=[0,0,0,0,0,0];
                $("#area2 option:selected").each(function () {
                    var name=$(this).text();
                    for(var i in _self.levelData)
                    {
                        if(name==i)
                        {
                            for(var j=0;j<6;j++)
                            {
                                count[j]+=_self.typeData[i][j+1];
                            }
                        }
                    }
                });
                var pieOption = {
                    title : {
                        text: '不同单位性质所占比',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    series : [
                        {
                            name: '单位性质',
                            type: 'pie',
                            radius : '55%',
                            center: ['50%', '60%'],
                            data:[
                                {value:count[0], name:'公助民营'},
                                {value:count[1], name:'公办民营'},
                                {value:count[2], name:'民办民营'},
                                {value:count[3], name:'共建民营'},
                                {value:count[4], name:'公办公营I'},
                                {value:count[5], name:'公办公营II'},
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
                if(pie!=null)
                    echarts.init(pie).setOption(pieOption);
            });
        }, chartInit: function () {
            Metronic.blockUI({
                boxed: true,
                message: '请等待。。'
            });
            $.post(window.apppath + "/admin/api/institution/getStatistics",
                {
                }, function (data) {
                    Metronic.unblockUI();
                    if(data!="")
                    {
                        var flag=3;
                        for(var i in data)
                        {
                            flag++;
                            var legendData=[];
                            var xAxisData=[];
                            var seriesData=[];
                            if(i=="各区各等级统计情况")
                            {
                                _self.levelData=data[i];
                                legendData=["总量","AAAAA","AAAA","AAA","AA","A"];
                            }
                           else  if(i=="各区各单位性质统计情况")
                            {
                                _self.typeData=data[i];
                                legendData=["总量","公助民营","公办民营","民办民营","公建民营","公办公营I","公办公营II"];
                            }
                            for(var  j in data[i])
                            {
                                xAxisData.push(j);
                            }
                            for(var k in legendData)
                            {
                                var data0=[];
                                for(var  j in data[i])
                                {
                                    data0.push(data[i][j][k]);
                                }
                                seriesData.push({
                                    name:legendData[k],
                                    type:'bar',
                                    data:data0
                                })
                            }
                            var barOption = {
                                // title: {
                                //     text: i ,
                                //     subtext: '树状图'
                                // },
                                tooltip : {
                                    trigger: 'axis',
                                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                                    }
                                },
                                legend: {
                                    data:legendData
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
                                            formatter: function (params) {
                                                return formatter(params);
                                            }
                                        }
                                    }
                                ],
                                yAxis : [
                                    {
                                        type : 'value'
                                    }
                                ],
                                series : seriesData
                            };
                            var bar = document.getElementById('bar' + flag);
                            if(bar!=null)
                                echarts.init(bar).setOption(barOption);
                        }
                    }
                },"json"
            );
        }

    }
    function formatter(params) {
        var newParamsName = "";
        var paramsNameNumber = params.length;
        var provideNumber = 3;
        var rowNumber = Math.ceil(paramsNameNumber / provideNumber);
        if (paramsNameNumber > provideNumber) {
            for (var p = 0; p < rowNumber; p++) {
                var tempStr = "";
                var start = p * provideNumber;
                var end = start + provideNumber;
                if (p == rowNumber - 1) {
                    tempStr = params.substring(start, paramsNameNumber);
                } else {
                    tempStr = params.substring(start, end) + "\n";
                }
                newParamsName += tempStr;
            }

        } else {
            newParamsName = params;
        }
        return newParamsName
    }
}();