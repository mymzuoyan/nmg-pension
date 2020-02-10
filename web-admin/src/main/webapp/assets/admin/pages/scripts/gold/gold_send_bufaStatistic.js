/**
 * Created by Administrator on 2018/1/16.
 */
var GoldSendBuFaStatistics = function () {
    var _self = "";
    return {
        init: function () {
            _self = this;
            _self.getData();

            //导出数据
            $(".excel").click(function () {
                window.location.href = window.apppath + "/admin/api/gold/goldSend/export2?areaId=" + $("#areaId").val() +
                    "&areaName=" + $("#areaName").val()+
                    "&startTimeString=" + $("#startTimeString").val() +
                    "&endTimeString=" +$("#endTimeString").val()
            })

            /**
             * 重置
             */
            $("#reload").click(function () {
                $("#searchDiv").find("input:text").val("");//找到form表单下的所有input标签并清空
                $("#searchDiv").find("select").val("");//找到form表单下的所有select标签并清空
                $("#searchDiv").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
                _self.getData();
            });

            $("#search").click(function () {
                _self.getData();
            });
        },
        getData: function () {
            Metronic.blockUI({
                message: '处理中...',
                target: $("#homeNurseCenter").parent(),
                overlayColor: 'none',
                cenrerY: true,
                boxed: true
            });
            $.post(window.apppath + "/admin/api/gold/goldSend/getBufaStatistic", {
                areaId: $("#areaId").val(),
                areaName: $("#areaName").val(),
                startTimeString: $("#startTimeString").val(),
                endTimeString: $("#endTimeString").val()
            }, function (res) {
                Metronic.unblockUI($("#homeNurseCenter").parent());
                if (res) {
                    $("#excel").show();
                }
                var html = "";
                var flag = 0;
                var length = 0;
                for (var i in res) {
                    length++;
                }
                if (res != null && res != "") {
                    for (var i in res) {
                        var name = res[i].areaName;
                        if (length == flag)
                            name = "合计";
                        html += '<tr>' +
                            '<td>' +
                            name +
                            '</td>' +
                            '<td>' +
                             res[i].countPer1 +
                            '</td>' +
                            '<td>' +
                             res[i].countMoney1 +
                            '</td>' +
                            '<td>' +
                             res[i].countPer2 +
                            '</td>' +
                            '<td>' +
                             res[i].countMoney2 +
                            '</td>' +
                            '<td>' +
                             res[i].countPer3 +
                            '</td>' +
                            '<td>' +
                             res[i].countMoney3 +
                            '</td>' +
                            '<td>' +
                             res[i].countPer4 +
                            '</td>' +
                            '<td>' +
                             res[i].countMoney4 +
                            '</td>' +
                            '<td>' +
                            '0' +
                            '</td>' +
                            '<td>' +
                            '0' +
                            '</td>' +
                            '<td>' +
                            '0' +
                            '</td>' +
                            '<td>' +
                            '0' +
                            '</td>' +
                            '<td>' +
                             res[i].allCount +
                            '</td>' +
                            '<td>' +
                             res[i].allMoney +
                            '</td>' +
                            '</tr>';
                    }
                    $("#tbody").html(html);

                }
            }, 'json');
            $("#loadingPDF").on("click",function () {
                html2canvas(document.getElementById("goldSend_statistic"), {
                    onrendered:function(canvas) {
                        var contentWidth = canvas.width;
                        var contentHeight = canvas.height;
                        var pageHeight = contentWidth / 592.28 * 841.89;
                        var leftHeight = contentHeight;
                        var position = 0;
                        var imgWidth = 595.28;
                        var imgHeight = 592.28/contentWidth * contentHeight;
                        var pageData = canvas.toDataURL('image/jpeg', 1.0);
                        var pdf = new jsPDF('', 'pt', 'a4');
                        if (leftHeight < pageHeight) {
                            pdf.addImage(pageData, 'JPEG', 0, 0, imgWidth, imgHeight );
                        } else {
                            while(leftHeight > 0) {
                                pdf.addImage(pageData, 'JPEG', 0, position, imgWidth, imgHeight)
                                leftHeight -= pageHeight;
                                position -= 841.89;
                                if(leftHeight > 0) {
                                    pdf.addPage();
                                }
                            }
                        }
                        pdf.save('高龄补贴补发汇总统计.pdf');
                    }
                })
            });
            $("#loadingWord").on("click",function () {
                $("#goldSendWord").wordExport("高龄补贴补发汇总统计");
            });
        },


        selectArea: function () {
            $('#myModal').modal({
                keyboard: true
            });
        },
        getAreaValue: function (areaName, areaId) {
            document.getElementById("areaName").value = areaName;
            document.getElementById("areaId").value = areaId;
            $('#myModal').modal('hide');
        }
    };


}();