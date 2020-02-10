/**
 * Created by gengqiang on 2017/9/22.
 */
var ElderMsgPoorApplyStatistics = function () {
    var _self = "";
    var level = $("#level").val();
    return {
        init: function (startYear, endYear) {
            _self = this;
            _self.getData(parseInt(level), startYear, endYear);
            $("#analyze").click(function () {
                var startTime = $("#startTime").val();
                var endTime = $("#endTime").val();
                if (startTime == null || startTime == "") {
                    alert("请选择开始年份");
                    return false;
                }
                if (endTime == null | endTime == "") {
                    alert("请选择结束年份");
                    return false;
                }
                var title = "";
                if (startTime == endTime) {
                    title = startTime + "年" + $("#areaName").val() + "特困人员供养数据统计"
                } else {
                    title = startTime + "年至" + endTime + "年" + $("#areaName").val() + "特困人员供养数据统计"

                }
                $("#tableTitle").html(title);
                _self.getData(parseInt(level), startTime, endTime);
            })
        },
        getData: function (type, startYear, endYear) {
            Metronic.blockUI({
                message: '处理中...',
                target: $("#addTable").parent(),
                overlayColor: 'none',
                cenrerY: true,
                boxed: true
            });
            $.post(window.apppath + "/admin/api/elderly/poor/getStatistics", {
                type: type,
                areaId: $("#areaId").val(),
                startYear: startYear,
                endYear: endYear
            }, function (res) {
                Metronic.unblockUI($("#addTable").parent());
                var html = "";
                var flag = 0;
                var length=0;
                for (var i in res) {
                    length++;
                }
                if (res) {
                    for (var i in res) {
                        flag++;
                        var name = i;
                        var param="region" + type + "=" + i;
                        if(flag==length)
                        {
                            name="合计";
                            param="";
                        }
                        if (type != 3&&(flag!=length)) {
                            name = '<a href="' + window.apppath + '/admin/elderly/poor/statistics?areaName=' + i + '">' + i + '</a>';
                        }
                        html += '<tr>' +
                            '<td>' +
                            flag +
                            '</td>' +
                            '<td>' +
                            name +
                            '</td>' +
                            '<td>' +
                            '<a onclick="ElderMsgPoorApplyStatistics.addTab(this)" data="' + window.apppath + '/admin/elderly/poor/list?'+param+'">' + res[i][0] + '</a>' +

                            '</td>' +
                            '<td>' +
                            '<a onclick="ElderMsgPoorApplyStatistics.addTab(this)" data="' + window.apppath + '/admin/elderly/poor/list?result=1&'+param+'">' + res[i][2] + '</a>' +

                            '</td>' +
                            '<td>' +
                            '<a onclick="ElderMsgPoorApplyStatistics.addTab(this)" data="' + window.apppath + '/admin/elderly/poor/list?result=0&'+param+'">' + res[i][1] + '</a>' +
                            '</td>' +
                            '<td>' +
                            '<a onclick="ElderMsgPoorApplyStatistics.addTab(this)" data="' + window.apppath + '/admin/elderly/poor/list?result=2&'+param+'">' + res[i][3] + '</a>' +
                            '</td>' +
                            '</tr>';
                    }
                    $("#tbody").html(html);

                }
            }, 'json');
        },
        addTab: function (e) {
            var href = $(e).attr("data");
            window.parent.addTab("elder_poor_list", "城乡特困人员查询", href);
        }
    }
}();