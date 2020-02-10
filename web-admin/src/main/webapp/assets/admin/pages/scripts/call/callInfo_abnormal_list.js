/**
 * Created by Administrator on 2016/10/17.
 */
var CallInfoAbnormalList = function () {
    var _self = "";
    var extension = window.parent.getExtension();
    return {
        isInit: false,
        page: 1,
        isPagination: false,
        pagination: "",
        totalPage: "",
        areaName: "",
        init: function () {
            _self = this;
            _self.getCallList();

            $("#search").click(function () {
                _self.isPagination = false;
                _self.getCallList();
            })
            
            
            $("#endCallModal .btnEndCall").click(function () {
                var infoId= $("#endCallModal input[name=infoId]").val();
                _self.updateCallInfoStatus(infoId,1);
            });

            $("#deleteCallModal .btnDeleteCall").click(function () {
                var infoId= $("#deleteCallModal input[name=infoId]").val();
                _self.updateCallInfoStatus(infoId,2);
            });


            $("#confirm .callback").click(function () {
                var extension = window.parent.getExtension();
                var agentId = window.parent.getAgentId();
                var callerId = $("#confirm input[name=callerId]").val();;
                var linkedId =$("#confirm input[name=linkedId]").val();;
                $.post(window.apppath + "/admin/call/api/callInfo/callBack", {
                    callerId: callerId,
                    agentId: agentId,
                    extension: extension,
                    linkedId: linkedId
                }, function (res) {
                    $("#confirm").fadeOut();
                }, "json");
            })

            $("#confirm .cancel").click(function () {
                $("#confirm").fadeOut();
            });


            $("#requestType").change(function () {
                var id=$("#requestType option:selected").val();
                _self.initRequestDiv();
                if(parseInt(id)>0)
                {
                    $("#requestTypeDiv"+id).css("display","block");
                }
            })


            $("#updateRequestModal .update").click(function () {
                var infoId= $("#updateRequestModal input[name=callInfoId]").val();
                var request =  $("#requestType").val();
                var requestName = "";
                $("#request"+request+" option:selected").each(function () {
                    if ($(this).attr("selected") == "selected") {
                        requestName += $(this).html() + ",";
                    }
                });
                if (requestName.length > 1) {
                    requestName = requestName.substr(0, requestName.length - 1);
                }
                _self.updateRequest(infoId,request,requestName);
            });

        },
        setAreaName: function (str) {
            _self = this;
            _self.areaName = str;
        },
        getCallList: function () {
            Metronic.blockUI({
                boxed: true,
                message: '请等待。。'
            });
            _self.areaName = "";
            $.post(window.apppath + "/admin/call/api/callInfo/AbnormalList", {
                page: _self.page,
                callerId: $("#searchDiv input[name=callerId]").val(),
                callerName: $("#searchDiv input[name=callerName]").val(),
                callerCardId: $("#searchDiv input[name=callerCardId]").val(),
                callerGroupId: $("#customerGroup").val(),
                queueName: $("#queueName").val(),
                type: $("#type").val(),
                monitorName: $("#searchDiv input[name=monitorName]").val(),
                content: $("#searchDiv input[name=content]").val(),
                returnVisit: $("#returnVisit").val(),
                customerGroup: $("#scustomerGroup").val()
            }, function (res) {
                Metronic.unblockUI();
                if (res.success) {
                    var html = [' <div class="scroller" style="" data-always-visible="0" data-rail-visible="0"',
                        ' data-handle-color="#dae3e7">'].join("");
                    var infos = res.data.infos;
                    var linkedCall = res.data.linkedCall;
                    var evaluateStar = "";
                    var display = "none";
                    var updateHandlePression = $("#updateHandlePression").val();
                    if (updateHandlePression == "1") {
                        display = "block";
                    }
                    _self.totalPage = res.data.totalPage;
                    for (var i in infos) {
                        evaluateStar = "";
                        if (infos[i].uniqueid != infos[i].linkedid) {
                            continue;
                        }
                        var idBack = "";
                        var color = "";
                        if (infos[i].type == "1") {
                            idBack = "直接拨入";
                            color = "green";
                        }
                        else if (infos[i].type == "2") {
                            idBack = "回拨";
                            color = "red";
                        }
                        else if (infos[i].type == "3") {
                            idBack = "回访";
                            color = "red";
                        }
                        html += ['<div class="todo-tasklist" style="margin-bottom: 10px">',
                            '                                <div class="todo-tasklist-item todo-tasklist-item-border-' + color + '">',
                            '                                    <div class="todo-tasklist-item-title">',
                            '                                        <div style="display: inline-block; width: 5%">No.',
                            infos[i].id,
                            '                                        </div>',
                            '                                        <div style="display: inline-block; width: 94%; text-align: right">'].join("");
                        if (infos[i].recording != null && infos[i].recording != "") {
                            if ((infos[i].recording).indexOf(".wav") >= 0)
                                html += '<audio controls="controls">' +
                                    '<source src="' + infos[i].recording + '" type="audio/mp3" />' +
                                    '</audio>';
                        }
                        if (infos[i].handleContent == null || infos[i].handleContent == "") {
                            if (extension != "") {
                                html += '  <button type="button" data="' + infos[i].id + '"' +
                                    'class="btn btn-circle blue-madison btn-sm addHandle" style="vertical-align: top">添加记录' +
                                    '</button>';
                            }
                        }
                        if (extension != "") {
                            html += '  <button type="button" data="' + infos[i].id + '"    data-evaluatestar="evaluateStarflag"' +
                                'class="btn btn-circle red-flamingo btn-sm deleteCall" style="vertical-align: top">废除工单' +
                                '</button>';
                        }
                        if (infos[i].status == null || infos[i].status != 1) {
                            if (extension != "") {
                                html += '  <button type="button" data="' + infos[i].id + '"    data-evaluatestar="evaluateStarflag"' +
                                    'class="btn btn-circle red-flamingo btn-sm endCall" style="vertical-align: top">完结工单' +
                                    '</button>';
                            }
                        }
                        var type = "";
                        if (infos[i].queueName == "200") {
                            type = ("12349热线");
                        }
                        else if (infos[i].queueName == "201") {
                            type = ("综合服务");
                        }
                        else if (infos[i].queueName == "202") {
                            type = ("紧急呼叫");
                        }
                        var btn = "";
                        if (window.parent.getExtension() != "") {
                            btn = ['<button style="padding:0px;border:0px" class="btn  btn-default callBackA " data-status="' + infos[i].status + '" data-linkedid="',
                                infos[i].uniqueId,
                                '" data="',
                                infos[i].callerId,
                                '"> <i class="icon-call-out "></i> ' + infos[i].callerId + '</button> '].join("");
                        }
                        else
                            btn = infos[i].callerId;
                        var returnVisit=false;
                        if(infos[i].returnVisit==1)
                            returnVisit=true;
                        var returnVisitHtml="";
                        if(returnVisit)
                        {
                            returnVisitHtml='<input id="returnVisit0'+infos[i].id+'" type="radio" disabled name="returnVisit'+infos[i].id+'"  value="0" ' +
                                '<label for="returnVisit0'+infos[i].id+'">不需要</label>'+
                                '<input id="returnVisit1'+infos[i].id+'" type="radio"  disabled name="returnVisit'+infos[i].id+'" value="1" checked="checked" >' +
                                '<label for="returnVisit1'+infos[i].id+'">需要</label>';
                        }
                        else {
                            returnVisitHtml='<input id="returnVisit0'+infos[i].id+'" type="radio" disabled name="returnVisit'+infos[i].id+'" checked="checked"  value="0" ' +
                                '<label for="returnVisit0'+infos[i].id+'">不需要</label>'+
                                '<input id="returnVisit1'+infos[i].id+'" type="radio" disabled name="returnVisit'+infos[i].id+'" value="1">' +
                                '<label for="returnVisit1'+infos[i].id+'">需要</label>';
                        }
                        html += [
                            '                                        </div>',
                            '                                    </div>',
                            '                                    <div class="todo-tasklist-item-text">',
                            '                                        <table class="table table-bordered">',
                            '                                            <tbody>',
                            '                                            <tr>',
                            '                                                <td rowspan="3" width="15%">' + type + '（' + idBack + '工单）</td>',
                            '                                                <td width="85%" style="text-align: center">',
                            '                                                    <div style="margin:20px 0 0 18px;height:15px;"><span',
                            '                                                            style="float:left;display:inline;margin:3px 0 0 66px;width:8px;height:8px;background:#bad288;-moz-border-radius:4px;-webkit-border-radius:4px;border-radius:4px;"></span><span',
                            '                                                            style="float:left;display:inline;margin:6px 0 0;width:250px;height:2px;background:#bad288;"></span><span',
                            '                                                            style="float:left;display:inline;margin:3px 0 0;width:8px;height:8px;background:#bad288;-moz-border-radius:4px;-webkit-border-radius:4px;border-radius:4px;"></span><span',
                            '                                                            style="float:left;display:inline;margin:6px 0 0;width:250px;height:2px;background:#bad288;"></span><span',
                            '                                                            style="float:left;display:inline;margin:3px 0 0;width:8px;height:8px;background:#bad288;-moz-border-radius:4px;-webkit-border-radius:4px;border-radius:4px;"></span>',
                            '                                                    </div>',
                            '                                                    <div style="margin:0 0 0 18px;height:65px;"><span',
                            '                                                            style="float:left;display:inline;margin:0 0 0 18px;width:330px;height:30px;text-align:center;line-height:2;">客户呼入<br><font',
                            '                                                            style="color:#999;">',
                            infos[i].createTime,
                            '                                                    </font></span><span',
                            '                                                            style="float:left;display:inline;margin:0 0 0 18px;width:330px;height:30px;text-align:center;line-height:2;">座席响应<br><font',
                            '                                                            style="color:#999;">',
                            infos[i].answerTime,
                            '                                                    </font></span><span',
                            '                                                            style="float:left;display:inline;margin:0 0 0 18px;width:162px;height:30px;text-align:center;line-height:2;">完结<br><font',
                            '                                                            style="color:#999;">',
                            infos[i].endTime,
                            '                                                    </font></span></div>',
                            '                                                </td>',
                            '                                            </tr>',
                            '                                            <tr>',
                            '                                                <td width="85%" style="padding: 0px">',
                            '                                                    <table width="100%" class="table table-bordered"',
                            '                                                           style="margin: 0px;border: 0px">',
                            '                                                        <tbody>',
                            '                                                        <tr>',
                            '                                                            <td width="15%" class="info">',
                            '                                                                客户姓名',
                            '                                                            </td>',
                            '                                                            <td width="35%">',
                            infos[i].callerName,
                            '                                                            </td>',
                            '                                                            <td width="15%" class="info">',
                            '                                                                呼叫号码',
                            '                                                            </td>',
                            '                                                            <td width="35%">',
                            btn,
                            '                                                            </td>',
                            '                                                        </tr>',
                            '                                                        <tr>',
                            '                                                            <td width="15%" class="info">',
                            '                                                                行政辖区',
                            '                                                            </td>',
                            '                                                            <td width="85%" colspan="3">',
                            infos[i].callerAddress,
                            '                                                            </td>',
                            '                                                        </tr>',
                            '                                                        <tr>',
                            '                                                            <td width="15%" class="info">',
                            '                                                                详细住址',
                            '                                                            </td>',
                            '                                                            <td width="85%" colspan="3">',
                            infos[i].callerMoreAddress,
                            '                                                            </td>',
                            '                                                        </tr>',
                            '<tr>',
                            '                                                            <td width="15%" class="info">',
                            '                                                                需求类型',
                            '                                                            </td>',
                            '                                                            <td width="35%" colspan="">',
                            _self.getRequestType(parseInt(infos[i].request))+ infos[i].requestName,
                            '<button style="float: right;display: ' + display + ';" data="' + infos[i].id + '" data-request="' + infos[i].request + '"  data-requestname="' + infos[i].requestName + '" class="btn blue-madison btn-sm updateRequest">修改</button>',
                            '                                                            </td>',
                            '                                                            <td width="15%" class="info">',
                            '                                                                是否需要回拨',
                            '                                                            </td>',
                            '                                                            <td width="35%">',
                            returnVisitHtml,
                            '                                                            </td>',
                            '                                                        </tr>',
                            '                                                        <tr>',
                            '                                                            <td width="15%" class="info">',
                            '                                                                处理情况',
                            '                                                            </td>',
                            '                                                            <td width="85%" colspan="3">'].join("");
                        for (var j in linkedCall) {
                            if (infos[i].uniqueId == linkedCall[j].linkedId) {
                                if (linkedCall[j].handleContent != null && linkedCall[j].handleContent != "") {
                                    html += [
                                        '<p class="handleTitle" >',
                                        '                                                                            座席工号:',
                                        linkedCall[j].monitorName,
                                        '于',
                                        linkedCall[j].handleTime,
                                        '                                                                            处理并记录' +
                                        '<button style="float: right;display: ' + display + ';" data="' + linkedCall[j].id + '" data-content="' + linkedCall[j].handleContent + '" class="btn blue-madison btn-sm updateHandle">修改</button>' +
                                        '</p>',
                                        '                                                                        <p>',
                                        linkedCall[j].handleContent,
                                        '</p>',
                                    ].join("");
                                }
                                if (linkedCall[j].evaluateStar != "" && parseInt(linkedCall[j].evaluateStar) > 0) {
                                    evaluateStar = parseInt(linkedCall[j].evaluateStar);
                                }
                            }
                        }
                        html += [
                            '                                                            </td>',
                            '                                                        </tr>',
                            '                                                        </tbody>',
                            '                                                    </table>',
                            '                                                </td>',
                            '                                            </tr>',].join("");
                        if (evaluateStar != "" && evaluateStar != null && evaluateStar > 0) {
                            var evaluateStarHtml = "";
                            for (var j = 5; j > evaluateStar; j--) {
                                evaluateStarHtml += [' <img src=' + window.apppath + '"/assets/global/plugins/raty/lib/images/star-on.png">'].join("");
                            }
                            var str = "";
                            // -1为未执行评价,0未评价,1为非常满意,2为满意,3为一般,4为不满意.
                            if (evaluateStar == 1) {
                                str = "4分 非常满意";
                            }
                            else if (evaluateStar == 2) {
                                str = "3分 满意";
                            }
                            else if (evaluateStar == 3) {
                                str = " 2分 一般";
                            }
                            else if (evaluateStar == 4) {
                                str = "1分 不满意";
                            }

                            html += [
                                '                                                    <td style="padding: 0px;height: 71px">',
                                '                                                        <table width="100%" height="100%" class="table table-bordered"',
                                '                                                               style="margin: 0px;border: 0px">',
                                '                                                            <tbody>',
                                '                                                            <tr>',
                                '                                                                <td width="15%" class="info">',
                                '                                                                    服务评价',
                                '                                                                </td>',
                                '                                                                <td width="85%">',
                                evaluateStarHtml,
                                '                                                        <p>',
                                str,
                                '                                                        </p>',
                                '                                                                </td>',
                                '                                                            </tr>',
                                '                                                            </tbody>',
                                '                                                        </table>',
                                '                                                    </td>'].join("");
                        }
                        html += [
                            '                                                </tr>',
                            '                                            </tbody>',
                            '                                        </table>',
                            '                                    </div>',
                            '                                </div>',
                            '</div>'].join("");
                        //更新状态
                        html= html.replace("evaluateStarflag",evaluateStar);
                    }
                    html += "</div>";
                    //总数
                    $("#allCount").html("一共" + res.data.count + "条数（总页数"+_self.totalPage+"）");
                    if (_self.totalPage == 0) {
                        if (_self.isPagination)
                            $('#pagination').jqPaginator('destroy');
                        html = "无数据";
                    }
                    $("#rowContent").html(html);
                    if (!_self.isInit) {
                        Metronic.init();
                        Layout.init();
                        _self.isInit = true;
                    }
                    $("body").animate({scrollTop: '0px'}, 200);
                    if (!_self.isPagination && _self.totalPage >= 1) {
                        _self.pagination = $.jqPaginator('#pagination', {
                            totalPages: _self.totalPage,
                            visiblePages: 5,
                            currentPage: _self.page,
                            first: '<li class="first"><a href="javascript:void(0);">首页<\/a><\/li>',
                            prev: '<li class="prev"><a href="javascript:void(0);"><i class="arrow arrow2"><\/i>上一页<\/a><\/li>',
                            next: '<li class="next"><a href="javascript:void(0);">下一页<i class="arrow arrow3"><\/i><\/a><\/li>',
                            last: '<li class="last"><a href="javascript:void(0);">末页<\/a><\/li>',
                            page: '<li class="page"><a href="javascript:void(0);">{{page}}<\/a><\/li>',
                            onPageChange: function (num, type) {
                                _self.page = num;
                                if (type != 'init') {
                                    _self.getCallList();
                                }
                            }
                        });
                        _self.isPagination = true;
                    }



                    $("#rowContent .callBackA").click(function () {
                        var callerId = $(this).attr("data");
                        var linkedId = $(this).data("linkedid");
                        var status = $(this).data("status");
                        if (status == 1) {
                            //本工单已完结
                            linkedId = "";
                        }
                        $("#confirm input[name=callerId]").val(callerId);
                        $("#confirm input[name=linkedId]").val(linkedId);
                        $("#confirm .callNum").html(callerId)
                        $("#confirm").fadeIn();
                    });
                    $(".addHandle").click(function () {
                        var infoId = $(this).attr("data");
                        $(".noSpan").html(infoId);
                        $("#callInfoId").val(infoId);
                        $("#addMoreHandle").modal("show");
                    });
                    $(".deleteCall").click(function () {
                        var infoId = $(this).attr("data");
                        $("#deleteCallModal input[name=infoId]").val(infoId);
                        $("#deleteCallModal").modal("show");
                    });


                    $(".endCall").click(function () {
                        var infoId = $(this).attr("data");
                        var evaluateStar=$(this).data("evaluatestar");
                        if(evaluateStar==null||evaluateStar==""||parseInt(evaluateStar)<=0)
                        {
                            _self.alert("该工单没有评价，请先评价");
                            return false;
                        }
                         $("#endCallModal input[name=infoId]").val(infoId);
                        $("#endCallModal").modal("show");
                    });

                    $("#addMoreHandle .add").click(function () {
                        _self.addMoreHandle();
                    });
                    $(".updateHandle").click(function () {
                        var infoId = $(this).attr("data");
                        var content = $(this).data("content");
                        $(".noSpan").html(infoId);
                        $("#callInfoId").val(infoId);
                        $("#addMoreHandle textarea[name=content]").val(content);
                        $("#addMoreHandle").modal("show");
                    });


                    $(".updateRequest").click(function () {
                        var infoId = $(this).attr("data");
                        $(".noSpan").html(infoId);
                        $("#updateRequestModal input[name=callInfoId]").val(infoId);
                        $("#updateRequestModal").modal("show");
                    });


                }
            }, "json");
        },
        updateCallInfoStatus: function (id, status) {
            $.post(window.apppath + "/admin/call/api/callInfo/update", {
                id: id,
                status: status,
            }, function (res) {
                if (res.success) {
                    window.location.reload();
                } else {
                    _self.alert(res.message);
                }
            }, "json");
        },

        updateRequest: function (id, request,requestName) {
            $.post(window.apppath + "/admin/call/api/callInfo/update", {
                id: id,
                request: request,
                requestName:requestName
            }, function (res) {
                if (res.success) {
                    _self.alert(res.message,function () {
                        window.location.reload();
                    });
                } else {
                    _self.alert(res.message);
                }
            }, "json");
        },

        addMoreHandle: function () {
            var content = $("#addMoreHandle textarea[name=content]").val();
            if (content == null || content == "") {
                _self.alert("请输入处理内容")
                return false;
            }
            $.post(window.apppath + "/admin/call/api/callInfo/addHandle", {
                id: $("#callInfoId").val(),
                handleContent: content
            }, function (res) {
                if (res.success) {
                    _self.alert(res.message,function () {
                        $("#addMoreHandle textarea[name=content]").val("");
                        window.location.reload();
                    });
                } else {
                    _self.alert(res.message,function () {
                        $("#addMoreHandle").modal("hide");
                    });
                }
            }, "json");
        },
        updateReturnVisit:function (id,flag) {
            $.post(window.apppath + "/admin/call/api/callInfo/update", {
                id: id,
                returnVisit:flag
            }, function (res) {
                // if (res.success) {
                //
                // } else {
                //     _self.alert(res.message);
                // }
            }, "json");
        },
        goToPage: function () {
            var page = $("#page").val();
            if (page != "" && page != "0") {
                page = parseInt(page);
                if (page < _self.totalPage) {
                    _self.page = page;
                    _self.getCallList();
                    $('#pagination').jqPaginator('option', {
                        currentPage: page
                    });
                }
                else {
                    _self.alert("您输入的页数大于总页数");
                    $("#page").val("");
                }
            }
            else {
                _self.alert("请输入不为0的数字");
                $("#page").val("");
            }
        },
        alert:function (res,callback) {
            alert2("确定信息",res,callback);
        },
        getRequestType:function (type) {
            if(type>=1&&type<=4)
            {
                var names=["","紧急救援","咨询服务","服务转介","投诉监管"];
                return names[type]+":";
            }
            return "";
        },
        initRequestDiv:function () {
        $("#requestTypeDiv1").css("display","none");
        $("#requestTypeDiv2").css("display","none");
        $("#requestTypeDiv3").css("display","none");
        $("#requestTypeDiv4").css("display","none");
    }
    }

}();