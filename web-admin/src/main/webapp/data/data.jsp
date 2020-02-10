<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<!DOCTYPE html>
<html lang="en" style="background: #020720;">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--<link rel="stylesheet" href="css/reset.css">-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/data/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/data/css/style.css">
</head>
<body>
<div class="g-home">
    <div class="g-hd"></div>
    <div class="g-bd">
        <div class="layout-left">
            <div class="layout-left-border">
                <div class="trend">
                    <div class="m-title">养老态势</div>
                    <ul class="list clearfix">
                        <li class="pull-left">
                            <div class="num" id="elderCount">1864355</div>
                            <div class="text">老人总量</div>
                        </li>
                        <li class="pull-left">
                            <div class="num" id="serviceOrgCount">602</div>
                            <div class="text">组织总量</div>
                        </li>
                        <li class="pull-left">
                            <div class="num" id="elderlyCommCount">909</div>
                            <div class="text">涉老社区</div>
                        </li>
                        <li class="pull-left">
                            <div class="num" id="cardCount">27</div>
                            <div class="text">刷卡总量</div>
                        </li>
                        <li class="pull-left">
                            <div class="num" id="callCount">21</div>
                            <div class="text">呼叫总量</div>
                        </li>
                        <li class="pull-left">
                            <div class="num" id="zunCount">0<span class="yuan">万元</span></div>
                            <div class="text">养老金发放额</div>
                        </li>
                    </ul>
                </div>
                <div class="nanjing clearfix">
                    <div class="nj-left pull-left" id="tz-map">

                    </div>
                    <div class="nj-right pull-right">
                        <div class="title" id="city">内蒙古市</div>
                        <ul class="list">
                            <li><span class="ico"></span><span class="text">老人数量</span><span class="num old-num">0</span></li>
                            <li><span class="ico"></span><span class="text">组织数量</span><span class="num organize-num">0</span></li>
                            <li><span class="ico"></span><span class="text">涉老社区</span><span class="num community-num">909</span></li>
                            <li><span class="ico"></span><span class="text">刷卡量</span><span class="num card-num">27</span></li>
                            <li><span class="ico"></span><span class="text">呼叫量</span><span class="num call-num">21</span></li>
                            <li><span class="ico"></span><span class="text">高龄补贴</span><span class="num gold-num">0</span></li>
                        </ul>
                    </div>
                </div>
                <div class="service">
                    <div class="m-title">服务类型统计</div>
                    <div class="service-cont" id="service-cont">

                    </div>
                </div>
            </div>
        </div>
        <div class="layout-center">
            <div class="menu">
                <ul class="clearfix">
                    <li class="pull-left">
                        <div class="wrap">
                            <div class="title">助老卡刷卡量</div>
                            <div class="cont">今年 <span class="year">27</span>&nbsp;今日 <span class="date">0</span></div>
                            <div class="num">1</div>
                        </div>
                    </li>
                    <li class="pull-left">
                        <div class="wrap">
                            <div class="title">12349呼叫量</div>
                            <div class="cont">今年 <span class="year">21</span>&nbsp;今日 <span class="date">0</span></div>
                            <div class="num">2</div>
                        </div>
                    </li>
                    <li class="pull-left">
                        <div class="wrap">
                            <div class="title">高龄补贴发放量</div>
                            <div class="cont">今年 <span class="year">0</span>&nbsp;今日 <span class="date">0</span></div>
                            <div class="num">3</div>
                        </div>
                    </li>
                    <li class="pull-left">
                        <div class="wrap">
                            <div class="title">居家养老服务工单</div>
                            <div class="cont">今年 <span class="year">27</span>&nbsp;今日 <span class="date">0</span></div>
                            <div class="num">4</div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="map clearfix">
                <div class="map-left pull-left">
                    <div class="line"></div>
                    <!--<div class="tab-hd">-->
                    <!--<ul>-->
                    <!--<li class="z-current"></li>-->
                    <!--</ul>-->
                    <!--</div>-->
                    <div class="map-cont" id="map-cont">

                    </div>
                </div>
                <div class="map-right pull-left">
                    <div class="map-right-cont">
                        <div class="hd">
                            <div class="text">内蒙古市</div>
                        </div>
                        <div class="bd">
                            <ul>
                                <li class="num1">
                                    <div class="title">助老卡</div>
                                    <div class="year" id="year0">今年&nbsp;&nbsp;<span>0</span></div>
                                    <div class="date" id="date0">今日&nbsp;&nbsp;<span>0</span></div>
                                </li>
                                <li class="num2">
                                    <div class="title">12349</div>
                                    <div class="year" id="year1">今年&nbsp;&nbsp;<span>0</span></div>
                                    <div class="date" id="date1">今日&nbsp;&nbsp;<span>0</span></div>
                                </li>
                                <li class="num3">
                                    <div class="title">养老金</div>
                                    <div class="year" id="goldYear">今年&nbsp;&nbsp;<span>0</span></div>
                                    <div class="date" id="goldDay">今日&nbsp;&nbsp;<span>0</span></div>
                                </li>
                                <li class="num4">
                                    <div class="title">居家养老<br>服务工单</div>
                                    <div class="year" id="year3">今年&nbsp;&nbsp;<span>0</span></div>
                                    <div class="date" id="date3">今日&nbsp;&nbsp;<span>0</span></div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drift">
                <div class="m-title">养老服务工单走势图</div>
                <div class="drift-cont" id="drift-cont">

                </div>
            </div>
        </div>
        <div class="layout-right">
            <div class="warn">
                <div class="m-title">预警告警</div>
                <ul class="list">
                    <li><span class="text">1. 围栏预警</span><span class="dot">················································</span><span class="num" id="wlgj">0个</span></li>
                    <li><span class="text">2. SOS告警</span><span class="dot">················································</span><span class="num">0个</span></li>
                    <li><span class="text">3. 体征告警</span><span class="dot">················································</span><span class="num">0个</span></li>
                    <li><span class="text">4. 异常告警</span><span class="dot">················································</span><span class="num">0个</span></li>
                </ul>
            </div>
            <div class="call">
                <div class="m-title">呼叫动态详情</div>
                <ul class="list clearfix">
                    <li class="pull-left num1">
                        <div class="title">12349热线</div>
                        <div class="year"><span>今年</span>254146</div>
                        <div class="date"><span>今日</span>13247</div>
                    </li>
                    <li class="pull-left num2">
                        <div class="title">综合服务</div>
                        <div class="year"><span>今年</span>254146</div>
                        <div class="date"><span>今日</span>13247</div>
                    </li>
                    <li class="pull-left num3">
                        <div class="title">紧急呼叫</div>
                        <div class="year"><span>今年</span>254146</div>
                        <div class="date"><span>今日</span>13247</div>
                    </li>
                </ul>
            </div>
            <div class="category">
                <div class="m-title">服务类别</div>
                <div class="category-cont" id="category-cont">

                </div>
            </div>
        </div>
    </div>
    <div class="g-ft"></div>
</div>

<script src="${pageContext.request.contextPath}/assets/data/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/data/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/data/lib/echarts/echarts.js"></script>
<script>
    $(function () {
        $.post("${pageContext.request.contextPath}/admin/api/user/getStatisticsData",{},function(data){
            if (data != "") {
                var ids = ["elderCount", "serviceOrgCount", "elderlyCommCount", "cardCount", "callCount","zunCount"];
                var flag = 0;
                for (var i in data) {
                    $("#" + ids[flag]).html(data[i]);
                    flag++;
                }
                var classes = ["old-num", "organize-num", "community-num", "card-num", "call-num","gold-num"];
                var  index= 0;
                for (var i in data) {
                    $("." + classes[index]).html(data[i]);
                    index++;
                }
            }
        },"json");
        $.post("${pageContext.request.contextPath}/admin/api/nurse/alarm/getAlarmTypeCount",{},function(data){
            if (data != "") {
                for(var key in data.all){
                    var key=key;
                    if("围栏告警"==key){
                        $(".warn .num")[0].innerHTML=data.all[key]+"个";
                    }
                    if("SOS告警"==key){
                        $(".warn .num")[1].innerHTML=data.all[key]+"个";
                    }
                    if("体征告警"==key){
                        $(".warn .num")[2].innerHTML=data.all[key]+"个";
                    }
                    if("异常告警"==key){
                        $(".warn .num")[3].innerHTML=data.all[key]+"个";
                    }
                }
            }
        },"json");
        $.post("${pageContext.request.contextPath}/allData/totalCountByYearOrByDay",{},function(data){
                $(".cont .year")[2].innerHTML=data.zunYear;
                $(".cont .date")[2].innerHTML=data.zunDay;
                $(".cont .year")[3].innerHTML=data.taskYear;
                $(".cont .date")[3].innerHTML=data.taskDay;
                $("#goldYear").find("span").text(data.zunYear);
                $("#goldDay").find("span").text(data.zunDay);
                $("#year3").find("span").text(data.taskYear);
                $("#date3").find("span").text(data.taskDay);
        },"json");
        $.get('${pageContext.request.contextPath}/assets/data/lib/echarts/taizhou.json', function (tz) {
            echarts.registerMap('taizhou', tz);
            var tzChart = echarts.init(document.getElementById('tz-map'));
            var tzOption = {
                series: [
                    {
//                      name:'',
                        type:'map',
                        mapType: 'taizhou',
                        roam: false,
                        data:(function () {
                            var arr=new Array();
                            $.ajax({
                                type:"post",
                                async:false,
                                url:"${pageContext.request.contextPath}/allData/countByCity",
                                data:{},
                                dataType:"json",
                                success:function(result){
                                    for(var i=0;i<result.length;i++){
                                        arr[i]={name:result[i].name,
                                        value:[{'old':result[i].old},{'organize':result[i].organize},{'community':result[i].community},{'card':result[i].card},{'call':result[i].call},{'gold':result[i].gold}]};
                                    }
                                }
                            });
                                return arr;
                        })(),
                        itemStyle: {
                            normal: {
                                borderWidth:1,
                                borderColor:'#0c75c6',
                                label: {
                                    show: false
                                },
                                areaColor: 'transparent'
                            },
                            emphasis: {                 // 选中样式
                                label: {
                                    show: true,
                                    textStyle: {
                                        color: '#fff'
                                    }
                                },
                                areaColor: '#0c75c6'
                            }
                        }
                    }
                ]
            };

            //给地图赋值
            tzChart.setOption(tzOption);
            console.log(tzOption.series[0].data[1].value[0]);
            //绑定点击事件
            tzChart.on('click', function (params) {
                $('.nj-right .title').text(params.data.name);
                $('.old-num').text(params.data.value[0].old);
                $('.organize-num').text(params.data.value[1].organize);
                $('.community-num').text(params.data.value[2].community);
                $('.card-num').text(params.data.value[3].card);
                $('.call-num').text(params.data.value[4].call);
                $('.gold-num').text(params.data.value[5].gold);
            });

            //
            function timing(){
                var a =tzOption.series[0].data;
                for (var i=0;i< a.length;i++){
                    /*window.setTimeout(function(){*/
                        $('.nj-right .title').text(a[i].name);
                        $('.old-num').text(a[i].value[0].old);
                        $('.organize-num').text(a[i].value[1].organize);
                        $('.community-num').text(a[i].value[2].community);
                        $('.card-num').text(a[i].value[3].card);
                        $('.call-num').text(a[i].value[4].call);
                        $('.gold-num').text(a[i].value[5].gold);
                    /*},1000);*/
                }
            }
            setInterval(timing,3000);
        });


        $.get('${pageContext.request.contextPath}/assets/data/lib/echarts/taizhou.json', function (tz) {
            echarts.registerMap('taizhou', tz);
            var mapChart = echarts.init(document.getElementById('map-cont'));
            var mapOption = {
                tooltip : {
//                        trigger: 'axis',
                    show:true
                },
                legend: {
//                        orient: 'vertical',
                    x:'left',
                    y:15,
                    textStyle:{
                        color:'#4ad0f8',
                        fontSize:12
                    },
                    data:['助老卡刷卡量','12349呼叫量','高龄补贴发放量','居家养老服务工单']
                },
                visualMap: {
                    min: 0,
                    max: 2500,
                    left: 'left',
                    top: 'bottom',
                    text: ['高','低'],           // 文本，默认为数值文本
                    calculable: true,
                    inRange: {
                        color: ['#6e3d0e', '#f5a556']
//                            symbolSize: [30, 100]
                    }
                },
                series: [
                    {
                        name:'助老卡刷卡量',
                        type:'map',
                        mapType: 'taizhou',
                        roam: false,
                        data:[
                            {name: '和平区', value: 345},
                            {name: '沈河区', value: 94},
                            {name: '大东区', value: 643},
                            {name: '皇姑区', value: 2500},
                            {name: '铁西区', value: 324},
                            {name: '苏家屯区', value: 290},
                            {name: '浑南区', value: 290},
                            {name: '沈北新区', value: 290},
                            {name: '于洪区', value: 290},
                            {name: '辽中区', value: 290},
                            {name: '康平县', value: 290},
                            {name: '法库县', value: 290},
                            {name: '新民市', value: 290},
                        ],
                        <%--data:(function () {--%>
                            <%--var arr=new Array();--%>
                            <%--$.ajax({--%>
                                <%--type:"post",--%>
                                <%--async:false,--%>
                                <%--url:"${pageContext.request.contextPath}/allData/zuElderlyCount",--%>
                                <%--data:{},--%>
                                <%--dataType:"json",--%>
                                <%--success:function(result){--%>
                                    <%--console.log(result);--%>
                                    <%--for(var i=0;i<result.length;i++){--%>
                                        <%--arr[i]={name:result[i].name,--%>
                                            <%--value:[{'old':result[i].old},{'organize':result[i].organize},{'community':result[i].community},{'card':result[i].card},{'call':result[i].call},{'gold':result[i].gold}]};--%>
                                    <%--}--%>
                                <%--}--%>
                            <%--});--%>
                            <%--return arr;--%>
                        <%--})(),--%>
                        itemStyle: {
                            emphasis: {                 // 选中样式
                                label: {
                                    show: false,
                                    textStyle: {
                                        color: '#fff'
                                    }
                                },
                                areaColor: '#eca763'
                            }
                        }
                    },
                    {
                        name:'12349呼叫量',
                        type:'map',
                        mapType: 'taizhou',
                        roam: false,
                        data:[
                            {name: '和平区', value: 345},
                            {name: '沈河区', value: 94},
                            {name: '大东区', value: 643},
                            {name: '皇姑区', value: 2500},
                            {name: '铁西区', value: 324},
                            {name: '苏家屯区', value: 290},
                            {name: '浑南区', value: 290},
                            {name: '沈北新区', value: 290},
                            {name: '于洪区', value: 290},
                            {name: '辽中区', value: 290},
                            {name: '康平县', value: 290},
                            {name: '法库县', value: 290},
                            {name: '新民市', value: 290},
                        ],
                        itemStyle: {
                            emphasis: {                 // 选中样式
                                label: {
                                    show: false,
                                    textStyle: {
                                        color: '#fff'
                                    }
                                },
                                areaColor: '#eca763'
                            }
                        }
                    },
                    {
                        name:'高龄补贴发放量',
                        type:'map',
                        mapType: 'taizhou',
                        roam: false,
                        // data:[
                        //     {name: '兴化市', value: 1245},
                        //     {name: '姜堰市', value: 785},
                        //     {name: '海陵区', value: 654},
                        //     {name: '高港区', value: 1134},
                        //     {name: '泰兴市', value: 488},
                        //     {name: '靖江市', value: 652}
                        // ],
                        data:(function () {
                            var arr=new Array();
                            $.ajax({
                                type:"post",
                                async:false,
                                url:"${pageContext.request.contextPath}/allData/zunCount",
                                data:{},
                                dataType:"json",
                                success:function(result) {
                                    for (var i = 0; i < result.length; i++) {
                                        arr[i] = {
                                            name: result[i].name,
                                            value: result[i].gold
                                            // goldDay: result[i].goldDay,
                                            // goldYear:result[i].goldYear
                                        }
                                    }
                                }
                            });
                            return arr;
                        })(),
                        itemStyle: {
                            emphasis: {                 // 选中样式
                                label: {
                                    show: false,
                                    textStyle: {
                                        color: '#fff'
                                    }
                                },
                                areaColor: '#eca763'
                            }
                        }
                    },
                    {
                        name:'居家养老服务工单',
                        type:'map',
                        mapType: 'taizhou',
                        roam: false,
                        // data:[
                        //     {name: '兴化市', value: 1987},
                        //     {name: '姜堰市', value: 454},
                        //     {name: '海陵区', value: 743},
                        //     {name: '高港区', value: 2471},
                        //     {name: '泰兴市', value: 248},
                        //     {name: '靖江市', value: 887}
                        // ],
                        data:(function () {
                            var arr=new Array();
                            $.ajax({
                                type:"post",
                                async:false,
                                url:"${pageContext.request.contextPath}/allData/taskCount",
                                data:{},
                                dataType:"json",
                                success:function(result) {
                                    for (var i = 0; i < result.length; i++) {
                                        arr[i] = {
                                            name: result[i].name,
                                            value: result[i].task
                                           // taskDay: result[i].taskDay,
                                            // taskYear: result[i].taskYear
                                        }
                                    }
                                }
                            });
                            return arr;
                        })(),
                        itemStyle: {
                            emphasis: {                 // 选中样式
                                label: {
                                    show: false,
                                    textStyle: {
                                        color: '#fff'
                                    }
                                },
                                areaColor: '#eca763'
                            }
                        }
                    }
                ]
            };
            mapChart.setOption(mapOption);
            mapChart.on('click', function (params) {
                console.log("Click的"+params);
                //定义一个res变量来保存最终返回的字符结果,并且先把地区名称放到里面
//                    var res=params.name+'<br />';
                var res = [];
                //定义一个变量来保存series数据系列
                var myseries=mapOption.series;
                console.log("myseries "+myseries[2].data[2].goldDay);
                //循环遍历series数据系列
                for(var i=0;i<myseries.length;i++){
                    //在内部继续循环series[i],从data中判断：当地区名称等于params.name的时候就将当前数据和名称添加到res中供显示
                    for(var k=0;k<myseries[i].data.length;k++){
                        //console.log(myseries[i].data[k].name);
                        //如果data数据中的name和地区名称一样
                        if(myseries[i].data[k].name==params.name){
                            //将series数据系列每一项中的name和数据系列中当前地区的数据添加到res中
                            res+=myseries[i].name+':'+myseries[i].data[k].value+'<br />';
                            $('.map-right .text').text(params.data.name);
                            $('.num1 #year0').text("今年 "+myseries[0].data[k].value);
                            $('.num1 #date0').text("今日 "+myseries[0].data[k].value);
                            $('.num2 #year1').text("今年 "+myseries[1].data[k].value);
                            $('.num2 #date1').text("今日 "+myseries[1].data[k].value);
                            $('.num3 #goldDay').text("今年 "+myseries[2].data[k].value);
                            $('.num3 #goldYear').text("今日 "+myseries[2].data[k].value);
                            $('.num4 #year3').text("今年 "+myseries[3].data[k].value);
                            $('.num4 #date3').text("今日 "+myseries[3].data[k].value);
                        }
                    }
                }


                //返回res
                //console.log(res);
//                    return res;
//                    console.log(res);
            });

        });


//            服务类型统计
        var serviceChart = echarts.init(document.getElementById('service-cont'));
        var serviceOption = {
//                x:'100%',
            tooltip: {
                trigger: "item",
                formatter: "{b}: {c} ({d}%)"
//                    formatter: "{a} <br/>{b}: {c} ({d}%)"

            },
            legend: {
                itemWidth:'6',
                itemHeight:'12',
                orient: 'vertical',
                right: '18px',
                align:'right',
                itemGap:25,
                textStyle:{
                    color:'#6fb3ff',
                    fontSize:12
                },
                data:['助浴','助聊','助洁','助乐','助急','助餐','助学','助购','助医','护理','助行','其他']
            },
            series: [
                {
//                        name:'',
                    type:'pie',
                    radius: ['42%', '70%'],
                    center: ['30%', '45%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '21',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    itemStyle: {
                        normal: {
                            color: '#003679'
                        },
                        emphasis: {
                            color: '#44d2c1'
                        }
                    },
                    data:[
                        {value:335, name:'助浴'},
                        {value:310, name:'助聊'},
                        {value:234, name:'助洁'},
                        {value:135, name:'助乐'},
                        {value:41, name:'助急'},
                        {value:143, name:'助餐'},
                        {value:248, name:'助学'},
                        {value:221, name:'助购'},
                        {value:174, name:'助医'},
                        {value:632, name:'护理'},
                        {value:475, name:'助行'},
                        {value:985, name:'其他'}
                    ]
                }
            ]
        };
        serviceChart.setOption(serviceOption);


//            养老服务工单走势图
        var driftChart = echarts.init(document.getElementById('drift-cont'));
        var driftOption = {
            grid: {
                left: '6%',
                right: '6%',
                top:'16%',
                bottom:'16%'
            },
            tooltip: {
                trigger: "item"
            },
            legend: {
                textStyle:{
                    color:'#6fb3ff',
                    fontSize:12
                },
                data: ["助聊","助乐","助餐","助购","护理","助浴","助洁","助急","助学","助医","助行","其他"]
            },
            xAxis: [
                {
                    axisLabel:{
                        color: '#6db0d9'
                    },
                    axisLine:{
                        lineStyle :{
                            color: '#05254d'
                        }
                    },
                    splitLine:{
                        show:false
                    },
                    type:'value',
                    boundaryGap: false
                }
            ],
            yAxis: [
                {
                    type: "value",
                    axisLabel:{
                        color: '#6db0d9'
                    },
                    axisLine:{
                        lineStyle :{
                            color: '#05254d'
                        }
                    },
                    splitLine:{
                        show:false
                    }
                }
            ],
            series: [
                {
                    name: "助聊",
                    type: "line",
                    itemStyle: {
                        normal: {
                            color:'#979fea'
                        }
                    },
                    data: [[1,68],[4, 32],[7,33],[9,35],[12,46],[18,37],[23,88]]
                },
                {
                    name: "助乐",
                    type: "line",
                    itemStyle: {
                        normal: {
                            color:'#33a34d'
                        }
                    },
                    data: [[0,17],[7, 64],[8,17],[9,73],[12,48],[20,76],[23,49]]
                },
                {
                    name: "助餐",
                    type: "line",
                    itemStyle: {
                        normal: {
                            color:'#e9a397'
                        }
                    },
                    data: [[1,14],[3, 52],[7,28],[6,64],[10,61],[18,17],[24,73]]
                },
                {
                    name: "助购",
                    type: "line",
                    itemStyle: {
                        normal: {
                            color:'#fee600'
                        }
                    },
                    data: [[1,18],[2, 54],[4,78],[6,28],[8,87],[16,77],[22,98]]
                },
                {
                    name: "护理",
                    type: "line",
                    itemStyle: {
                        normal: {
                            color:'#9de7a4'
                        }
                    },
                    data: [[2,24],[4, 74],[7,88],[9,28],[12,113],[16,77],[22,98]]
                },
                {
                    name: "助浴",
                    type: "line",
                    itemStyle: {
                        normal: {
                            color:'#6db0d9'
                        }
                    },
                    data: [[1,17],[3, 27],[5,46],[9,75],[10,56],[15,42],[23,46]]
                },
                {
                    name: "助洁",
                    type: "line",
                    itemStyle: {
                        normal: {
                            color:'#27a4cb'
                        }
                    },
                    data: [[2,35],[3, 45],[4,72],[9,64],[10,14],[12,47],[24,87]]
                },
                {
                    name: "助急",
                    type: "line",
                    itemStyle: {
                        normal: {
                            color:'#f09308'
                        }
                    },
                    data: [[2,14],[3, 24],[4,26],[9,64],[10,17],[12,54],[24,77]]
                },
                {
                    name: "助学",
                    type: "line",
                    itemStyle: {
                        normal: {
                            color:'#f7b3cc'
                        }
                    },
                    data: [[2,35],[3, 14],[4,45],[9,28],[10,45],[12,67],[24,88]]
                },
                {
                    name: "助医",
                    type: "line",
                    itemStyle: {
                        normal: {
                            color:'#006442'
                        }
                    },
                    data: [[2,54],[3, 34],[4,45],[9,11],[10,27],[12,36],[24,74]]
                },
                {
                    name: "助行",
                    type: "line",
                    itemStyle: {
                        normal: {
                            color:'#979fea'
                        }
                    },
                    data: [[2,47],[3, 15],[4,34],[9,65],[10,22],[12,47],[24,62]]
                },
                {
                    name: "其他",
                    type: "line",
                    itemStyle: {
                        normal: {
                            color:'#979fea'
                        }
                    },
                    data: [[2,14],[3, 74],[4,32],[9,14],[10,75],[12,81],[24,67]]
                }
            ]
        };
        driftChart.setOption(driftOption);


//            服务类别
        var categoryChart = echarts.init(document.getElementById('category-cont'));
        var categoryOption =  {
            grid: {
                left: '70',
//                    right: '6%',
                top:'20%',
                bottom:'6%'
            },
            tooltip : {
                trigger: 'item'
            },
            legend: {
//                    itemWidth:'27',
//                    itemHeight:'13',
//                    orient: 'vertical',
//                    right: '18px',
//                    align:'right',
//                    itemGap:10,
                textStyle:{
                    color:'#91d0ff',
                    fontSize:12
                },
                data:['总量', '低保/低保边缘','经济困难的失能','空巢','独居','百岁老人','70周岁及以上计生特扶老人','城市三无/农村五保']
            },
            calculable : true,
            xAxis : [
                {
                    type : 'value',
                    left:'left',
                    axisLabel:{
                        color: '#91d0ff',
                        fontSize:'12'
                    },
                    axisLine:{
                        lineStyle :{
                            color: '#1a273e'
                        }
                    },
                    splitLine:{
                        show:false
                    }
                }
            ],
            yAxis : [
                {
                    type : 'category',
                    axisLabel:{
                        color: '#91d0ff',
                        fontSize:'12'
                    },
                    axisLine:{
                        lineStyle :{
                            color: '#1a273e'
                        }
                    },
                    splitLine:{
                        show:false
                    },
                    data : ['和平区','沈河区','大东区','皇姑区','铁西区','苏家屯区','浑南区','沈北新区','于洪区','辽中区','康平县','法库县','新民市']
                }
            ],
            series : [
                {
                    name:'总量',
                    type:'bar',
                    stack: '总量',
                    itemStyle : {
                        normal: {
                            color:'#1eb0dc'
                        }
                    },
                    data:[320, 302, 301, 334, 390, 330, 320 , 330 , 340 , 350 ,310 , 310 ,330]
                },
                {
                    name:'低保/低保边缘',
                    type:'bar',
                    stack: '总量',
                    itemStyle : {
                        normal: {
                            color:'#1eb0dc'
                        }
                    },
                    data:[320, 302, 301, 334, 390, 330, 320 , 330 , 340 , 350 ,310 , 310 ,330]
                },
                {
                    name:'经济困难的失能',
                    type:'bar',
                    stack: '总量',
                    itemStyle : {
                        normal: {
                            color:'#1eb0dc'
                        }
                    },
                    data:[320, 302, 301, 334, 390, 330, 320 , 330 , 340 , 350 ,310 , 310 ,330]
                },
                {
                    name:'空巢',
                    type:'bar',
                    stack: '总量',
                    itemStyle : {
                        normal: {
                            color:'#1eb0dc'
                        }
                    },
                    data:[320, 302, 301, 334, 390, 330, 320 , 330 , 340 , 350 ,310 , 310 ,330]
                },
                {
                    name:'独居',
                    type:'bar',
                    stack: '总量',
                    itemStyle : {
                        normal: {
                            color:'#1eb0dc'
                        }
                    },
                    data:[320, 302, 301, 334, 390, 330, 320 , 330 , 340 , 350 ,310 , 310 ,330]
                },
                {
                    name:'百岁老人',
                    type:'bar',
                    stack: '总量',
                    itemStyle : {
                        normal: {
                            color:'#1eb0dc'
                        }
                    },
                    data:[320, 302, 301, 334, 390, 330, 320 , 330 , 340 , 350 ,310 , 310 ,330]
                },
                {
                    name:'70周岁及以上计生特扶老人',
                    type:'bar',
                    stack: '总量',
                    itemStyle : {
                        normal: {
                            color:'#1eb0dc'
                        }
                    },
                    data:[320, 302, 301, 334, 390, 330, 320 , 330 , 340 , 350 ,310 , 310 ,330]
                },
                {
                    name:'城市三无/农村五保',
                    type:'bar',
                    stack: '总量',
                    itemStyle : {
                        normal: {
                            color:'#22cc27'
                        }
                    },
                    barWidth : 16,
                    barGap:160,
                    data:[320, 302, 301, 334, 390, 330, 320 , 330 , 340 , 350 ,310 , 310 ,330]
                }
            ]
        };
        categoryChart.setOption(categoryOption);

    });
</script>
</body>
</html>