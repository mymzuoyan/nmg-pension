/**
 * Created by gengqiang on 2017/6/2.
 */
var ElderAddAndUpStatistics = function () {
    var _self = "";
    return {
        init: function () {
            _self = this;
            _self.tableInit();
        },
        tableInit: function () {
            var tableContainer = $("#addTable").parent();
            Metronic.blockUI({
                message: '查询中...',
                target: tableContainer,
                overlayColor: 'none',
                cenrerY: true,
                boxed: true
            });
            $.post(window.apppath + "/admin/api/elderly/getAddAndUpElderInfo", {}, function (res) {
                Metronic.unblockUI(tableContainer);
                var strs = ["玄武区", "秦淮区", "建邺区", "鼓楼区", "浦口区", "栖霞区", "雨花台区", "江宁区", "六合区", "溧水区", "高淳区", "江北新区", "南京市"]
                var html = "";
                var flag = 0;
                var allCount = [0, 0, 0];
                for (var i in strs) {
                    flag++;
                    var counts = res[strs[i]];
                    var name = strs[i];
                    if (counts == null) {
                        counts = [0, 0, 0]
                    }
                    for (var j in allCount) {
                        allCount[j] += counts[j];
                    }
                    if (strs[i] == "南京市") {
                        counts = allCount;
                        name = "合计"
                    }
                    html +=
                        "<tr>" +
                        "<td>" +
                        flag +
                        "</td>" +
                        "<td>" +
                        name +
                        "</td>" +
                        "<td><a style='text-decoration: none' onclick='ElderAddAndUpStatistics.showInfo(\"" + strs[i] + "\",79)'>" +
                        counts[0] +
                        "</a></td>" +
                        "<td><a style='text-decoration: none' onclick='ElderAddAndUpStatistics.showInfo(\"" + strs[i] + "\",89)'>" +
                        counts[1] +
                        "</td>" +
                        "<td><a style='text-decoration: none' onclick='ElderAddAndUpStatistics.showInfo(\"" + strs[i] + "\",99)'>" +
                        counts[2] +
                        "</td>" +
                        "</tr>";
                }
                $("#addTable").append(html)
            }, "json")
        },
        showInfo: function (str, i) {
            window.parent.addTab("elder_add_up_list", "高龄补贴新增老人列表", window.apppath + "/admin/elderly/elder_add_up_list?areaName=" + str + "&age=" + i);
        }

    }
}();