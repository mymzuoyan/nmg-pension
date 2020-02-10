/**
 * Created by Administrator on 2016/10/21.
 */
var Call_Statistic = function () {

    var _self = "";
    return {
        timeType: 'month',
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
            if(month.length=1)
            {
                month="0"+month;
            }
            $("#startTime").val(year+"-01");
            $("#endTime").val(year+"-"+month);
            $("#analyze").click();
        },
        selectChanged: function () {
            //查看类型
            $("#region").change(function () {

                _self.timeType = $(this).val();
                var model = 1;
                var format = "yyyy-mm";
                if (_self.timeType == "quarter") {
                    model = 1;
                    format = "yyyy-mm"
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
            $.post(window.apppath + "/admin/call/api/callInfo/getCallInfoStatistics", {
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
                        if (_self.dataType == "fromType") {
                            html += ['<tr>',
                                '									<td>',
                                _self.strToDataType(i),
                                '									</td>'].join("");
                        }
                        else {
                            html += ['<tr>',
                                '									<td>',
                                _self.strToEvaluateStr(i),
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
                            type: 'bar',
                            data: barSeriesData
                        }
                    )
                    for (var i in data) {
                        var name = "";
                        if (_self.dataType == "fromType") {
                            name = _self.strToDataType(i);
                        }
                        else {
                            name = _self.strToEvaluateStr(i);
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
                                type: 'bar',
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
            str += "";
            if (str == "200")
                return "12349热线";
            else if (str == "201")
                return "综合服务";
            else if (str == "202")
                return "紧急呼叫";
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