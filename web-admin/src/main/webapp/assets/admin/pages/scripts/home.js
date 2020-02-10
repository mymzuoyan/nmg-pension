/**
 * Created by CoderQiang on 2017/1/9.
 */
/*$(function () {
    //alert($("#mapBox").width())
    $("#mapBox").height($("#mapBox").width()/1.42);
});*/

var HomeInit = function () {

    var _self = "";
    var mapData = [
        {
            loc: '康平县',
            numLink: '',
            groupLink: '',
            num: '0',
            group: '0',
            ylsq: '10'

        },
        {
            loc: '法库县',
            numLink: '',
            groupLink: '',
            num: '0',
            group: '0',
            ylsq: '20'
        },

        {
            loc: '沈北新区',
            numLink: '',
            groupLink: '',
            num: '0',
            group: '0',
            ylsq: '9'
        },
        {
            loc: '大东区',
            numLink: '',
            groupLink: '',
            num: '0',
            group: '0',
            ylsq: '27'
        },
        {
            loc: '沈河区',
            numLink: '',
            groupLink: '',
            num: '0',
            group: '0',
            ylsq: '54'
        },
        {
            loc: '浑南区',
            numLink: '',
            groupLink: '',
            num: '0',
            group: '0',
            ylsq: '59'

        },
        {
            loc: '苏家屯区',
            numLink: '',
            groupLink: '',
            num: '0',
            group: '0',
            ylsq: '49'
        },
        {
            loc: '皇姑区',
            numLink: '',
            groupLink: '',
            num: '0',
            group: '0',
            ylsq: '25'
        },
        {
            loc: '和平区',
            numLink: '',
            groupLink: '',
            num: '0',
            group: '0',
            ylsq: '25'
        },
        {
            loc: '于洪区',
            numLink: '',
            groupLink: '',
            num: '0',
            group: '0',
            ylsq: '47'
        },
        {
            loc: '铁西区',
            numLink: '',
            groupLink: '',
            num: '0',
            group: '0',
            ylsq: '26'
        },
        {
            loc: '新民市',
            numLink: '',
            groupLink: '',
            num: '0',
            group: '0',
            ylsq: '29'
        },
        {
            loc: '辽中区',
            numLink: '',
            groupLink: '',
            num: '0',
            group: '0',
            ylsq: '62'
        }
    ];
    return {
        init: function () {
            _self = this;
            _self.mapInit();
            _self.getData();
            _self.eChartInit();
            $(".dashboard-stat").click(function () {
                var id = $(this).attr("data");
                var url = $(this).data("url");
                var name = $(this).data("name");
                //页面色块链接
                if (url != null && url != "")
                    window.parent.addTab(id, name, url);
            });
        },
        init2: function () {
            _self = this;
            _self.mapInit();
            _self.elderStatisticsInit();
            _self.serviceOrgStatisticsInit();
        },
        mapInit: function () {

            setTimeout(function () {

                $('.kangping').addClass('kangping-active').width($(".kangping img").width());
                $('.faku').addClass('faku-active').width($(".faku img").width());
                $('.shenbeixinqu').addClass('shenbeixinqu-active').width($(".shenbeixinqu img").width());
                $('.dadong').addClass('dadong-active').width($(".dadong img").width());
                $('.shenhe').addClass('dadong-active').width($(".shenhe img").width());
                $('.hunnan').addClass('hunnan-active').width($(".hunnan img").width());
                $('.sujiatun').addClass('sujiatun-active').width($(".sujiatun img").width());
                $('.huanggu').addClass('dadong-active').width($(".huanggu img").width());
                $('.heping').addClass('dadong-active').width($(".heping img").width());
                $('.yuhong').addClass('dadong-active').width($(".yuhong img").width());
                $('.tiexi').addClass('dadong-active').width($(".tiexi img").width());
                $('.xinmin').addClass('xinmin-active').width($(".xinmin img").width());
                $('.liaozhong').addClass('liaozhong-active').width($(".liaozhong img").width());
                setTimeout(function () {
                    $('#map-wrap>div').each(function (index) {
                        //$("#link_box").fadeIn();
                        $(".linkBox").fadeIn();
                    });
                }, 1200);
            }, 1000);
            //        老人数据
            $(".oder").click(function () {
                $(".group").removeClass("purple");
                $(".oder").addClass("yellow");
                $('#map-wrap>div>span').each(function (index) {
                    var str = ":";
                    $(this).html("<a href='" + mapData[index].numLink + "'>" + mapData[index].loc + str + mapData[index].num + "</a>")
                    $("#link_box>li>a").click(function () {
                        var href = $(this).attr("href");
                        if ($(".oder").hasClass("yellow")) {
                            window.parent.addTab("elder_Info", "老人基础信息", href);
                        }
                        else {
                            window.parent.addTab("side-serviceOrg-list", "养老服务组织", href);
                        }
                        return false;
                    })
                });
            });
            $(".group").click(function () {
                $(".oder").removeClass("yellow");
                $(".group").addClass("purple");
                console.log(mapData);
                $('#map-wrap>div>span').each(function (index) {
                    var str = ":";
                    $(this).html("<a href='" + mapData[index].groupLink + "'>" + mapData[index].loc + str + mapData[index].group + "</a>")
                    $("#link_box>li>a").click(function () {
                        var href = $(this).attr("href");
                        if ($(".oder").hasClass("yellow")) {
                            window.parent.addTab("elder_Info", "老人基础信息", href);
                        }
                        else {
                            window.parent.addTab("side-serviceOrg-list", "养老服务组织", href);
                        }
                        return false;
                    })
                });
            });
            $("#jgyl").click(function () {
                var href = $(this).attr("href");
                window.parent.addTab("datatable_List", "养老机构信息", href);
                return false;


            });
            $("#jjyl").click(function () {
                var href = $(this).attr("href");
                window.parent.addTab("datatable_serviceOrg_List", "服务组织信息", href);
                return false;


            });
        },
        showMapButton: function () {
            $("#btn_wrap").show();
            $('#map-wrap>div>span').each(function (index) {
                var str = ":";
                $(this).html("<a href='" + mapData[index].numLink + "'>" + mapData[index].loc + str + mapData[index].num + "</a>")
                $("#map-wrap>div>span>a").click(function () {
                    var href = $(this).attr("href");
                    if ($(".oder").hasClass("yellow")) {
                        window.parent.addTab("elder_Info", "老人基础信息", href);
                    }
                    else {
                        window.parent.addTab("side-serviceOrg-list", "养老服务组织", href);
                    }
                    return false;
                })
            });
            var areaName = $("#areaName").val();
            if (areaName != null && areaName != '') {
                console.log(mapData);
                for (var i = 0; i < mapData.length; i++) {
                    if (mapData[i].loc === areaName) {
                        $("#map-wrap-area").addClass(mapData[i].loc).html("<div id='thisLink'><p>" + mapData[i].loc + "</p><p>老人数据：" + mapData[i].num + "</p><p>组织数据：" + mapData[i].group + "</p></div>");
                    }
                }
            }


        },
        getData: function () {
            $.post(window.apppath + "/admin/api/user/getStatisticsData",
                {}, function (data) {
                    if (data != "") {
                        var ids = ["elderCount", "serviceOrgCount", "serviceUserCount", "cardCount", "callCount1"];
                        var flag = 0;
                        for (var i in data) {
                            $("#" + ids[flag]).html(data[i] + $("#" + ids[flag]).html());
                            flag++;
                        }
                        var allCallCount = "0";
                        if (data["呼叫总量"] != undefined) {
                            allCallCount = data["呼叫总量"];
                        }
                        $("#callCount").html(allCallCount + '次');
                        $("#zunCount").html("0" + $("#zunCount").html());
                    }
                }, "json");
        },


        eChartInit: function () {
            _self.elderStatisticsInit();
            _self.serviceOrgStatisticsInit();
            _self.cardInfoStatisticsInit();
            _self.taskServiceTypeStatisticsInit();
        },
        elderStatisticsInit: function () {
            Metronic.blockUI({
                target: $("#bar1").parent().parent().parent(),
                boxed: true,
                message: '请等待。。'
            });
            $.post(window.apppath + "/admin/api/elderly/getCountByElderTypeDictIds",
                {}, function (data) {
                    console.log(data);
                    Metronic.unblockUI($("#bar1").parent().parent().parent());
                    $(".area").html("内蒙古市");
                    var legendData = ["总量", "城市三无", "农村五保", "城市低保", "农村低保", "经济困难的失能/半失能老人 ", "70周岁及以上的计生特扶老人", "百岁老人 ", "空巢", "独居"];
                    var xAxisData = [];
                    var seriesData = [];
                    for (var j in data) {
                        xAxisData.push(j);
                        for (var n in mapData) {
                            if (j.indexOf(mapData[n].loc) >= 0) {
                                mapData[n].num = data[j][0];
                                mapData[n].numLink = window.apppath + "/admin/elderly/list?areaName=" + j;
                            }
                        }
                    }
                    _self.showMapButton();

                    for (var k in legendData) {
                        var data0 = [];
                        for (var j in data) {
                            data0.push(data[j][k]);
                        }
                        seriesData.push({
                            name: legendData[k],
                            type: 'bar',
                            data: data0,
                            barWidth: 20
                        })
                    }
                    var option = {
                        title: {
                            top: 10
                        },
                        tooltip: {
                            trigger: 'axis',
                            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                            }
                        },
                        legend: {
                            data: legendData,
                            selectedMode: "single",
                            padding: 10

                        },
                        grid: {
                            left: '3%',
                            right: '4%',
                            bottom: '3%',
                            top: "25%",
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
                        yAxis: [
                            {
                                type: 'value',
                                name: "老人数量",

                            }
                        ],
                        series: seriesData
                    };
                    var bar = document.getElementById('bar1');
                    if (bar != null)
                        echarts.init(bar).setOption(option);
                }, "json");
        },
        serviceOrgStatisticsInit: function () {
            Metronic.blockUI({
                target: $("#bar2").parent().parent().parent(),
                boxed: true,
                message: '请等待。。'
            });
            $.post(window.apppath + "/admin/api/serviceOrg/getStatisticsByAreaAndLevel",
                {}, function (data) {
                    Metronic.unblockUI($("#bar2").parent().parent().parent());
                    if (data != "" && data != null) {
                        var flag = 0;
                        var barOption = null;
                        var xAxisData = [];
                        var legendData = ["总量", "AAAAA", "AAAA", "AAA", "AA", "A"];
                        var seriesData = [];
                        for (var j in data) {
                            xAxisData.push(j);
                            for (var n in mapData) {
                                if (j.indexOf(mapData[n].loc) >= 0) {
                                    mapData[n].group = data[j][0];
                                    mapData[n].groupLink = window.apppath + "/admin/serviceOrgShow?areaName=" + j;
                                }
                            }
                        }
                        _self.showMapButton();

                        for (var k in legendData) {
                            var data0 = [];
                            for (var j in data) {
                                data0.push(data[j][k]);
                            }
                            seriesData.push({
                                name: legendData[k],
                                type: 'bar',
                                data: data0,
                                barWidth: 20
                            })
                        }
                        barOption = {
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                                }
                            },
                            legend: {
                                data: legendData,
                                selectedMode: "single"
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
                            yAxis: [
                                {
                                    type: 'value',
                                    name: "组织数量"
                                }
                            ],
                            series: seriesData
                        };
                        var bar = document.getElementById('bar2');
                        if (bar != null)
                            echarts.init(bar).setOption(barOption);
                    }
                    else {
                        $("#bar2").closest(".col-md-6").remove();
                    }
                }, 'json');
        },
        cardInfoStatisticsInit: function () {
            Metronic.blockUI({
                target: $("#line3").parent().parent().parent(),
                boxed: true,
                message: '请等待。。'
            });
            $.post(window.apppath + "/admin/api/task/recordPool", function (data) {
                Metronic.unblockUI($("#line3").parent().parent().parent());
                if (data != "") {
                    var scdata = data[0];
                    var jhdata = data[1];
                    var date = [];
                    var scSeriesData = [];
                    var jhSeriesData = [];
                    for (var i in scdata) {
                        for (var key in scdata[i]) {
                            date.push(key);
                            scSeriesData.push(scdata[i][key]);
                        }
                        for (var key in jhdata[i]) {
                            jhSeriesData.push(jhdata[i][key]);
                        }
                    }
                    var option = {
                        tooltip: {
                            trigger: 'axis',
                            axisPointer: {
                                type: 'shadow',
                                label: {
                                    show: true
                                }
                            }
                        },
                        toolbox: {
                            show: true,
                            feature: {}
                        },
                        calculable: true,
                        legend: {
                            data: ['市场工单', '计划工单'],
                            itemGap: 5
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
                                data: date
                            }
                        ],
                        yAxis: [
                            {
                                type: 'value',
                                name: "近30日工单统计",
                                axisLabel: {
                                    formatter: '{value} '
                                },
                            }
                        ],
                        series: [
                            {
                                name: '市场工单',
                                type: 'line',
                                data: scSeriesData
                            },
                            {
                                name: '计划工单',
                                type: 'line',
                                data: jhSeriesData
                            }
                        ]
                    };
                    var line = document.getElementById('line3');
                    if (line != null) {
                        echarts.init(line).setOption(option);
                    }
                }

            }, 'json');
        },
        goldMoneyStatisticsInit: function () {
            Metronic.blockUI({
                target: $("#line4").parent().parent().parent(),
                boxed: true,
                message: '请等待。。'
            });
            $.post(window.apppath + "/admin/call/api/callInfo/getGoldMoneyStatistics",
                {}, function (data) {
                    Metronic.unblockUI($("#line4").parent().parent().parent());
                    if (data != "") {
                        var xAxisData = [];
                        var seriesData = [];
                        for (var i in data) {
                            var str = i.substr(0, i.lastIndexOf("-"));
                            xAxisData.push(str);
                            seriesData.push(parseInt(data[i]));
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
                                    formatter: '{value}万 '
                                },
                                name: "高龄补贴发放统计",
                            },
                            series: [
                                {
                                    name: '高龄补贴发放统计',
                                    type: 'line',
                                    smooth: true,
                                    data: seriesData,
                                    areaStyle: {
                                        normal: {
                                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                                offset: 0,
                                                color: 'rgb(255, 158, 68)'
                                            }, {
                                                offset: 1,
                                                color: 'rgb(255, 70, 131)'
                                            }])
                                        }
                                    },
                                }
                            ]
                        };
                        var line = document.getElementById('line4');
                        if (line != null)
                            echarts.init(line).setOption(option);
                    }

                }, 'json');
        },
        taskServiceTypeStatisticsInit: function () {
            $.post(window.apppath + "/admin/api/task/getTaskServiceTypeStatistics", {}, function (res) {
                if (res) {

                    var serviceType = [];
                    var seriesData = [];
                    var data = res.data;
                    for (var i in data) {
                        seriesData.push({value: data[i], name: i});
                        serviceType.push(i);
                    }
                    console.log(seriesData);

                    var option = {
                        tooltip: {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        legend: {
                            x: 'center',
                            y: 'top',
                            data: serviceType
                        },
                        series: [
                            {
                                name: '服务类型',
                                type: 'pie',
                                radius: '55%',
                                center: ['50%', '60%'],
                                data: seriesData,
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
                    var line = document.getElementById('pie1');
                    if (line != null)
                        echarts.init(line).setOption(option);

                }
            }, "json");

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