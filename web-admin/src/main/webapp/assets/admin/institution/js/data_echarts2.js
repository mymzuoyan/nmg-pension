//柱状图
var zzbjksfb_Echarts = echarts.init(document.getElementById('zzbjksfb'));
var ksfbOption = {
    color: ['#fffff'],              //底纹颜色
    tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'line'        // 默认为直线，可选为：'line' | 'shadow'
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'category',
            data : ['老年养护一部北','老年养护二部北'],
            axisTick: {
                alignWithLabel: true
            },
            axisLabel: {
                inside: false,
                textStyle: {
                    color: '#333',   //底部文字颜色
                    fontSize : '14',
                }
            },
            axisLine: {            // 坐标轴线
                lineStyle: {       // 属性lineStyle控制线条样式
                    color: '#626b80',
                    width: 1,
                    //shadowColor : '#fff', //默认透明
                    shadowBlur: 10
                }
            },

        }
    ],
    yAxis : [
        {
            type : 'value',
            axisLabel: {
                inside: false,
                textStyle: {
                    color: '#333',   //左侧标记数字颜色
                    fontSize : '14',
                }
            },
            axisLine: {            // 坐标轴线
                lineStyle: {       // 属性lineStyle控制线条样式
                    color: '#626b80',
                    width: 1,
                    //shadowColor : '#fff', //默认透明
                    shadowBlur: 10
                }
            },
            splitLine:{
                    lineStyle: {
	                    color: ['rgba(255,255,255,0.2)'],
                        width: 1,
                        type: 'dotted'
                    }
            }

        }
    ],
    series : [
        {
            name:'总数',
            type:'bar',
            itemStyle: {
                    normal: {color: 'rgb(6,104,207)'}
                },
            label:{
    	            normal:{
    		            position:"top",
    		            show:true,
    		
    		            textStyle:{
	                		            fontWeight:500,
							            fontSize :'14',
							            color:'#333'           //内容数字颜色
            			            }
    	            }
                },
            barWidth: '40%',
            data:[300,6243]
            // [4,18,14,173,300,34,6243]totalCountArr
        }
    ]
};
// 使用刚指定的配置项和数据显示图表。
zzbjksfb_Echarts.setOption(ksfbOption);







//曲线图
// 指定图表的配置项和数据
var zzbjqxfx_Echarts = echarts.init(document.getElementById('zzbjqsfx'));
var zzbjqsfxoption = {
    tooltip : {
        //trigger: 'axis',
        axisPointer: {
            type: 'cross',
            label: {
                backgroundColor: '#2397e9'
            }
        }
    },
        toolbox: {
        show : false,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {
                show: true,
                type: ['pie', 'funnel']
            },
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    legend: {
        x : 'center',
        y : 'top',
        data:['自助','越界','离床','设备'],
        textStyle:{color: '#333'}
    },
    // legend: {
    //     data:['趋势分析'],
    //     color:'#fff'
    // },

    textStyle: {
    color: 'rgba(255, 255, 255, 0.8)'
         },

    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'category',
            boundaryGap : false,
            // categories : ['1-2月','3-4月','5-6月','7-8月','9-10月','11-12月'],
            data :['1-2月','3-4月','5-6月','7-8月','9-10月','11-12月'],
            // ['自助','越界','离床','设备'],
            axisLabel: {
                inside: false,
                textStyle: {
                    color: '#333',
                    fontSize : '14',
                }
            },
            axisLine: {            // 坐标轴线
                lineStyle: {       // 属性lineStyle控制线条样式
                    color: '#626b80',
                    width: 1,
                    //shadowColor : '#fff', //默认透明
                    shadowBlur: 10
                }
            },
        }
    ],
    yAxis : [
        {
            type : 'value',
            axisLabel: {
                inside: false,
                textStyle: {
                    color: '#333',
                    fontSize : '14',
                }
            },
            axisLine: {            // 坐标轴线
                lineStyle: {       // 属性lineStyle控制线条样式
                    color: '#626b80',
                    width: 1,
                    //shadowColor : '#fff', //默认透明
                    shadowBlur: 10
                }
            },
            splitLine:{
                    lineStyle: {
                        color: ['rgba(255,255,255,0.2)'],
                        width: 1,
                        type: 'dotted'
                    }
            }
        }
    ],
    series : [{
            name: '自助',
            type :'line',
            data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5]
        }, {
            name: '越界',
            type :'line',
            data: [4.0, 2.9, 5.5, 24.5, 18.4, 11.5]
            
        }, {
            name: '离床',
            type :'line',
            data: [14.0, 12.9, 15.5, 14.5, 28.4, 21.5]
        }, {
            name: '设备',
            type :'line',
            data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2]
        }]
};
zzbjqxfx_Echarts.setOption(zzbjqsfxoption);






//饼状图
var zzbjjg_Echarts = echarts.init(document.getElementById('zzbjjg'));
var zzbjjgtoption = {
	backgroundColor:'white',
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        // orient : 'vertical',
        x : 'center',
        y : 'bottom',
        data:['已处理','未处理']
    },
    toolbox: {
        show : false,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {
                show: true,
                type: ['pie', 'funnel'],
                option: {
                    funnel: {
                        x: '25%',
                        width: '50%',
                        funnelAlign: 'center',
                        max: 1548
                    }
                }
            },
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : false,
    series : [
        {
            name:'报警处理分析',
            type:'pie',
            center:['50%','40%'],
            radius : ['30%', '52%'],
            itemStyle : {
                normal : {
                    label : {
                        show : true
                    },
                    labelLine : {
                        show : false
                    }
                },
                emphasis : {
                    label : {
                        show : true,
                        position : 'center',
                        textStyle : {
                            fontSize : '14',
                            fontWeight : 'bold'
                        }
                    }
                }
            },
            data:[
                {name:'已处理',value:2780},
                {name:'未处理',value:200}
            ]
        }
    ]
};
// 使用刚指定的配置项和数据显示图表。
zzbjjg_Echarts.setOption(zzbjjgtoption);

