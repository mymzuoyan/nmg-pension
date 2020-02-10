/**
 * Created by gengqiang on 2017/9/29.
 */
var ServiceOrgAssessStatistic = function () {
    var _self = "";
    return {
        areaId:"",
        init: function (id) {
            _self = this;
            _self.areaId=id;
            _self.getData();
        }, getData: function () {
            Metronic.blockUI({
                message: '处理中...',
                target: $("#AssessTable").parent(),
                overlayColor: 'none',
                cenrerY: true,
                boxed: true
            });
            $.post(window.apppath + "/admin/api/orgAssess/getStatistic", {
                areaId:_self.areaId
            }, function (res) {
                var html = "";
                var flag=0;
                var length=0;
                for (var i in res) {
                    length++;
                }
                if (res) {
                    for (var i in res) {
                        flag++;
                        var name=i;
                        if(flag==length)
                        {
                            name="合计";
                        }
                        html+="<tr>" +
                            "<td>" +
                            flag+
                            "</td>" +
                            "<td>" +
                            "<a href='"+window.apppath+"/admin/orgAssess/statistic?areaName="+i+"'>"+name+"</a>" +
                            "</td>";
                        html+="<td>" +
                            "<a data='"+window.apppath+"/admin/orgAssessShow?areaName="+i+"'>"+res[i][0]+"</a>" +
                            "</td>";
                        html+="<td>" +
                            "<a data='"+window.apppath+"/admin/orgAssessShow?areaName="+i+"&standard=1'>"+res[i][1]+"</a>" +
                            "</td>";
                        html+="<td>" +
                            "<a data='"+window.apppath+"/admin/orgAssessShow?areaName="+i+"&gradeDictId=2'>"+res[i][2]+"</a>" +
                            "</td>";
                        html+="<td>" +
                            "<a data='"+window.apppath+"/admin/orgAssessShow?areaName="+i+"&gradeDictId=2&standard=1'>"+res[i][3]+"</a>" +
                            "</td>";
                        html+="<td>" +
                            "<a data='"+window.apppath+"/admin/orgAssessShow?areaName="+i+"&gradeDictId=3'>"+res[i][4]+"</a>" +
                            "</td>";
                        html+="<td>" +
                            "<a data='"+window.apppath+"/admin/orgAssessShow?areaName="+i+"&gradeDictId=3&standard=1'>"+res[i][5]+"</a>" +
                            "</td>";
                        html+="<td>" +
                            "<a data='"+window.apppath+"/admin/orgAssessShow?areaName="+i+"&gradeDictId=4'>"+res[i][6]+"</a>" +
                            "</td>";
                        html+="<td>" +
                            "<a data='"+window.apppath+"/admin/orgAssessShow?areaName="+i+"&gradeDictId=4&standard=1'>"+res[i][7]+"</a>" +
                            "</td>";
                        html+="<td>" +
                            "<a data='"+window.apppath+"/admin/orgAssessShow?areaName="+i+"&gradeDictId=12'>"+res[i][8]+"</a>" +
                            "</td>";
                        html+="<td>" +
                            "<a data='"+window.apppath+"/admin/orgAssessShow?areaName="+i+"&gradeDictId=12&standard=1'>"+res[i][9]+"</a>" +
                            "</td>";


                        html+= "/tr>"
                    }
                    $("#tbody").html(html);
                    $("#tbody a").click(function () {
                        var href=$(this).attr("data");
                        if(href!=""&&href.length>0)
                        {
                            window.parent.addTab("side-orgAssessShow","养老服务评估列表",href);
                        }
                    })

                }
                Metronic.unblockUI($("#AssessTable").parent());

            }, 'json');
        }
    }
}();