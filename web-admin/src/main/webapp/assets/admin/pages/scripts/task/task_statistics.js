/**
 * Created by Administrator on 2016/10/21.
 */
var Task_Statistic = function () {

    var _self = "";
    return {
        timeType: 'day',
        dataType: "fromType",
        init: function () {
            _self = this;
            _self.selectChanged();
            $("#analyze").click(function () {
                _self.analyzeInfo();
            })
            //初始化本年一月到现在
            var year=new Date().getFullYear();
            var month=(new Date().getMonth()+1)+"";
            var day=(new Date().getDate());
            if(month.length==1)
            {
                month="0"+month;
            }
            if(day.length==1)
            {
                day="0"+day;
            }
            $("#startTime").val(_self.addDate(year+"-"+month+"-"+day,-7));
            $("#endTime").val(year+"-"+month+"-"+day);
            $("#analyze").click();
        },
        selectChanged: function () {
            //查看类型
            $("#region").change(function () {

                _self.timeType = $(this).val();
                var model = 0;
                var format = "yyyy-mm-dd";
                if (_self.timeType == "day") {
                    model = 0;
                    format = "yyyy-mm-dd"
                }
                else if (_self.timeType == "month") {
                    model = 1;
                    format = "yyyy-mm"
                }
                else if (_self.timeType == "year") {
                    model = 2;
                    format = "yyyy"
                }
                //重置
                $("#customerRange").html($("#customerRange").html());
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: format,
                    maxViewMode: model,
                    minViewMode: model,
                });
            });
            $("#dataType").change(function () {
                _self.dataType = $(this).val();
            });


        },
        analyzeInfo: function () {

            if ($("#startTime").val() == null || $("#startTime").val() == "") {
                alert("请选择开始时间");
                return false;
            }
            if ($("#endTime").val() == null || $("#endTime").val() == "") {
                alert("请选择结束时间");
                return false;
            }
            Metronic.blockUI({
                boxed: true,
                message: '请等待。。'
            });
            $.post(window.apppath + "/admin/api/task/getTaskInfoStatistics", {
                dataType: _self.dataType,
                timeType: _self.timeType,
                startTime: $("#startTime").val(),
                endTime: $("#endTime").val(),
            }, function (res) {
                Metronic.unblockUI();
                if (res.success) {

                    //表格形式
                    var html = "";
                    var data = res.data;
                    var flag = 0;
                    var count=[];
                    for (var i in data) {
                        if (flag == 0) {
                            html += ['<table class="table table-bordered table-hover">',
                                '                                            <thead>',
                                '                                            <tr>',
                                '                                                <th>',
                                '                                                    服务类型',
                                '                                                </th>'].join("");
                            for (var j in data[i]) {
                                html += ['<th>',
                                    j,
                                    '                                                </th>'].join("");
                            }
                            html += [
                                '                                            </thead>'].join("");
                            html += "<tbody>";

                        }
                        if (_self.dataType == "evaluate") {
                            html += ['<tr>',
                                '									<td>',
                                _self.strToEvaluateStr(i),
                                '									</td>'].join("");
                        }
                        else {
                            html += ['<tr>',
                                '									<td>',
                                _self.strToDataType(i),
                                '									</td>'].join("");
                        }
                        var tag=0;
                        for (var j in data[i]) {

                            html += ['<th>',
                                data[i][j],
                                '                                                </th>'].join("");
                            if(count[tag]==null)
                            {
                                count[tag]=(data[i][j])
                            }
                            else {
                                count[tag]=(count[tag]+data[i][j]) ;
                            }
                            tag++;
                        }
                        html += ['								</tr>',
                        ].join("");
                        flag++;
                    }
                    html += ['<tr>',
                        '									<td>',
                        '合计',
                        '									</td>'].join("");
                    for (var i in count) {
                        html += ['<th>',
                            count[i],
                            '                                                </th>'].join("");
                    }
                    html += ['								</tr>',
                    ].join("");
                    html += "</tbody></table>";
                    $("#table").html(html);


                    var legendDate = [];
                    var pieLegendDate=[];
                    var xAxisData = [];
                    var barSeries = [];
                    var barSeriesData = [];
                    var pieData=[];
                    //图表形式
                    legendDate.push("合计");
                    for (var j in count) {

                        barSeriesData.push(count[j]);
                    }
                    barSeries.push(
                        {
                            name: "合计",
                            type: 'line',
                            data: barSeriesData
                        }
                    )
                    for (var i in data) {
                        var name = "";
                        if (_self.dataType == "evaluate") {
                            name = _self.strToEvaluateStr(i);
                        }
                        else {
                            name = _self.strToDataType(i);
                        }
                        legendDate.push(name);
                        pieLegendDate.push(name);
                        if (xAxisData.length == 0) {
                            for (var j in data[i]) {

                                xAxisData.push(j)
                            }

                        }
                        barSeriesData = [];
                        var allcount=0;
                        for (var j in data[i]) {
                            barSeriesData.push(data[i][j]);
                            allcount+=data[i][j];
                        }
                        barSeries.push(
                            {
                                name: name,
                                type: 'line',
                                data: barSeriesData
                            }
                        )
                        pieData.push(
                            {value: allcount, name:name}
                        )
                    }
                    var barOption = {
                        legend: {
                            data: legendDate
                        },
                        tooltip: {
                            trigger: 'axis',
                            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                            }
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
                        series: barSeries
                    };
                    var pieOption = {
                        tooltip: {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        legend: {
                            orient: 'vertical',
                            left: 'left',
                            data: pieLegendDate
                        },
                        series: [
                            {
                                name: '',
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
                    var bar = echarts.init(document.getElementById('bar'));
                    bar.setOption(barOption);
                    var pie = echarts.init(document.getElementById('pie'));
                    pie.setOption(pieOption);


                }
            }, "json");
        },
        strToDataType: function (str) {
           return str;
        },
        strToEvaluateStr: function (str) {
            if(str==0)
            {
                return "未评价"
            }
            str += "星";
            return str;
        },
        addDate:function (date,days){
        var d=new Date(date);
        d.setDate(d.getDate()+days);
        var month=d.getMonth()+1;
        var day = d.getDate();
        if(month<10){
            month = "0"+month;
        }
        if(day<10){
            day = "0"+day;
        }
        var val = d.getFullYear()+"-"+month+"-"+day;
        return val;
    }
    }
}();