/**
 * Created by Administrator on 2016/10/18.
 */
var CallAbandonedList = function () {
    var _self = "";
    return {
        init: function () {
            _self = this;
            _self.getList();
            _self.getNeedCallBackedList();
        },
        getList: function () {
            var queueName = window.parent.queueName;
            $.post(window.apppath + "/admin/call/api/callInfo/abandonedList", {
                callbacked: false,
                queueName: queueName
            }, function (res) {
                if (res != null) {
                    var html = "";
                    for (var i in res) {
                        var id = parseInt(i) + 1;
                        html += '<tr><td>'+  id + '</td>'
                             +  '<td>' +  res[i].customer_num + '</td>'
                             +  '<td>' +  (res[i].vip_flag==1?'是':'否') + '</td>'
                             +  '<td>' +  res[i].enter_queue_time +  '</td>'
                             +  '<td>' + res[i].wait_time + '</td>'
                             +  '<td><button type="button" data="'+ res[i].id +  '" onclick=window.parent.callResponse("'+res[i].customer_num+'") class="btn btn-circle yellow-crusta btn-sm addHandle">响应</button></td></tr>';
                    }
                    $("#table_abandonedList").html(html);

                    $("#table_abandonedList .addHandle").click(function () {
                        var data = $(this).attr("data");
                        var extension = window.parent.getExtension();
                        var agentId = window.parent.getAgentId();
                        var _this = this;
                        $.post(window.apppath + "/admin/call/api/callInfo/handleAbandonedCall", {
                            abandonedId: data,
                            agentId: agentId,
                            extension: extension
                        }, function (res) {
                            if (res.success) {
                                $(_this).parent().parent().remove();
                                _self.getNeedCallBackedList();
                            }
                            else {
                                alert(res.message);
                            }

                        }, "json");
                    })


                }
                else {
                    $("#table_abandonedList").html("");
                }
            }, "json");
        },
        getNeedCallBackedList: function () {
            var agentnum = window.parent.agentno;
            var pstnnumber = window.parent.pstnnumber;
            $.post(window.apppath + "/admin/call/api/callInfo/needCallBackList", {
                agentnum: agentnum,
                pstnnumber:pstnnumber
            }, function (res) {
                if (res != null) {
                    var html = "";
                    for (var i in res) {
                        var id = parseInt(i) + 1;
                        var phone = '';
                        var calltype = '';
                        if(res[i].caller_num==agentnum||res[i].caller_num==pstnnumber){
                            calltype =  '呼出';
                            phone = res[i].callee_num;
                        }else{
                            calltype =  '呼入';
                            phone = res[i].caller_num;
                        }
                        html += '<tr><td>' + id + '</td>' +
                            '<td>' + calltype +  '</td>' +
                            '<td>' + phone + '</td>' +
                            '<td>' +  res[i].start_time + '</td>' +
                            '<td>' +  res[i].end_time + '</td>' +
                            // '<td><button type="button" data="'+(res[i].call_type==1?res[i].caller_num:res[i].callee_num) + '" id="' + res[i].id + '"' + 'class="btn btn-circle yellow-crusta btn-sm addHandle">回拨</button>'+(res[i].record_file_name==null?'':'<audio src="http://demo.yuneasy.cn/yscrm/recordPath/'+res[i].record_file_name.replace('/YunEasy/FsPbx/CTI/DATA','')+'" controls="controls"></audio>')+'</td>' +
                            '<td>' + (res[i].record_file_name==null?'':'<audio src="http://demo.yuneasy.cn/yscrm/recordPath/'+res[i].record_file_name.replace('/YunEasy/FsPbx/CTI/DATA','')+'" controls="controls"></audio>')+'</td>' +
                            '</tr>';

                    }
                    $("#table_needCallBackList").html(html);

                    $("#table_needCallBackList .addHandle").click(function () {
                        var data = $(this).attr("data");
                        var id = $(this).attr("id");
                        var extension = window.parent.getExtension();
                        var agentId = window.parent.getAgentId();
                        var _self = this;
                        $.post(window.apppath + "/admin/call/api/callInfo/callBack", {
                            callBackId: id,
                            callerId: data,
                            agentId: agentId,
                            extension: extension
                        }, function (res) {
                            if (res.success) {
                                $(_self).parent().parent().remove();
                            }

                        }, "json");
                    })


                }

            }, "json");
        }
    }

}();