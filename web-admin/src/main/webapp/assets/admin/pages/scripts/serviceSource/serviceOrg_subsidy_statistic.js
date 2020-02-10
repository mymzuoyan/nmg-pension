/**
 * Created by gengqiang on 2017/9/29.
 */
var ServiceOrgSubsidyStatistic = function () {
    var _self = "";
    return {
        areaId: "",
        init: function (id,object) {
            _self = this;
            _self.areaId = id;
            _self.object = object;
            _self.getData();
        }, getData: function () {
            Metronic.blockUI({
                message: '处理中...',
                target: $("#AssessTable").parent(),
                overlayColor: 'none',
                cenrerY: true,
                boxed: true
            });
            $.post(window.apppath + "/admin/api/serviceOrg/subsidy/getStatistics", {
                areaId: _self.areaId,
                subsidyObject: _self.object,
            }, function (data) {
                var html = "";
                var flag = 0;
                var res = data.data;
                if (res) {
                    for (var i in res) {
                        flag++;
                        html += "<tr>" +
                            "<td>" +
                            flag +
                            "</td>" +
                            "<td>" +
                            "<a href='" + window.apppath + "/admin/serviceOrg/subsidy/statistic?type=1&object=2&areaId=" + res[i].areaId + "'>" + res[i].areaName + "</a>" +
                            "</td>";
                        html += "<td>" +
                            "<a data='" + window.apppath + "/admin/orgAssessShow?areaName=" + i + "'>" + res[i].count + "</a>" +
                            "</td>";
                        html += "<td>" +
                            "<a data='" + window.apppath + "/admin/orgAssessShow?areaName=" + i + "&standard=1'>" + res[i].jsCount + "</a>" +
                            "</td>";
                        html += "<td>" +
                            "<a data='" + window.apppath + "/admin/orgAssessShow?areaName=" + i + "&gradeDictId=2'>" + res[i].jsUndoCount + "</a>" +
                            "</td>";
                        html += "<td>" +
                            "<a data='" + window.apppath + "/admin/orgAssessShow?areaName=" + i + "&gradeDictId=2&standard=1'>" + res[i].jsDoneCount + "</a>" +
                            "</td>";
                        html += "<td>" +
                            "<a data='" + window.apppath + "/admin/orgAssessShow?areaName=" + i + "&gradeDictId=3'>" + res[i].jsRefuseCount + "</a>" +
                            "</td>";
                        html += "<td>" +
                            "<a data='" + window.apppath + "/admin/orgAssessShow?areaName=" + i + "&gradeDictId=3&standard=1'>" +res[i].yyCount + "</a>" +
                            "</td>";
                        html += "<td>" +
                            "<a data='" + window.apppath + "/admin/orgAssessShow?areaName=" + i + "&gradeDictId=4'>" + res[i].yyUndoCount+ "</a>" +
                            "</td>";
                        html += "<td>" +
                            "<a data='" + window.apppath + "/admin/orgAssessShow?areaName=" + i + "&gradeDictId=4&standard=1'>" + res[i].yyDoneCount+ "</a>" +
                            "</td>";
                        html += "<td>" +
                            "<a data='" + window.apppath + "/admin/orgAssessShow?areaName=" + i + "&gradeDictId=12'>" + res[i].yyRefuseCount + "</a>" +
                            "</td>";
                        html += "/tr>"
                    }
                    $("#tbody").html(html);
                    // $("#tbody a").click(function () {
                    //     var href = $(this).attr("data");
                    //     if (href != "" && href.length > 0) {
                    //         window.parent.addTab("side-orgAssessShow", "养老服务评估列表", href);
                    //     }
                    // })

                }
                Metronic.unblockUI($("#AssessTable").parent());

            }, 'json');
        }
    }
}();