    /**
	 * 一些基本配置，如服务器地址、座席信息、使用的外线号码
	 */
	var websocketUrl = ''//呼叫中心服务器websocket请求地址
	var agentno = '';//座席号码
	var password = '';//座席密码
	var exten = '';//座席分机
	var pstnnumber = '';//外线号码
	var popupUrl = '';//来电弹屏地址
	
    function Map(){
		this.container = new Object();
	}
	
	Map.prototype.put = function(key, value){
		this.container[key] = value;
	}

	Map.prototype.get = function(key){
		return this.container[key];
	}
	
    var websocket = null;//websocket对象
    var hasResponse = false;//是否响应
    var signin = false;//是否登录
	var method = "";//请求类型
	var agentstatus = "0";//座席状态
	var callee = "";//被叫号码
	var timeoutSec = 30;//心跳检测时间（秒）
	var heartbeatId=-1;//心跳事件ID
	var changeStatusId=-1;//统计座席状态时间事件ID
	var loseHeartbeat=0;//心跳丢包次数
	var agentGroupStr='[{"id":1,"parent":0,"name":"座席组","open":false,"isParent":true,"busid":"-1"}';//座席组信息
	var queueStr=',{"id":2,"parent":0,"name":"队列","open":false,"isParent":true,"busid":"-1"}';//队列信息
	var monitorAgents="";//监听座席列表
	var selectAgent="";//当前选中座席
	var roleAgentGroupNum="";//当前座席可以管理的座席组
	var roleQueueNum="";//当前座席可以管理的队列
	var statusMap = new Map();//座席状态MAP
	statusMap.put("-1", "离线");
	statusMap.put("0","空闲");
	statusMap.put("1","振铃");
	statusMap.put("2","通话");
	statusMap.put("3","保持");
	statusMap.put("4","后处理");
	statusMap.put("5","被占用");
	statusMap.put("6","忙碌");
	statusMap.put("7","离开");
	statusMap.put("8","仅呼出");
  	
  	function closeWebSocket(){
  		websocket.close();
  	}
  	
  	function send(){
  		var message = "{'method':'"+method+"','agentno':'"+agentno+"','password':'"+password+"','exten':'"+exten+"','agentstatus':'"+agentstatus+"','pstnnumber':'"+pstnnumber+"','callee':'"+callee+"'}";
  		websocket.send(message);
  	}

    //根据座席状态设置工具栏功能键启用状态
    function setToolbarByStatus(state){
        var seatState = $('#monitorStatus');
        if(state=="-1"){
            seatState.text("离线");
        }else if(state=="0"){
            seatState.text("空闲");
        }else if(state=="1"){
            seatState.text("振铃");
        }else if(state=="2"){
            seatState.text("通话");
        }else if(state=="3"){
            seatState.text("保持");
        }else if(state=="4"){
            seatState.text("后处理");
        }else if(state=="5"){
            seatState.text("被占用");
        }else if(state=="6"){
            seatState.text("忙碌");
        }else if(state=="7"){
            seatState.text("离开");
        }else if(state=="8"){
            seatState.text("仅呼出");
        }
    }
    //签入
    function signIn(){
		if(heartbeatId>=0){
			clearInterval(heartbeatId);
		}
    	hasResponse = false;
    	method = "signin";
        agentstatus = "0";//签入时默认为空闲
  		send();
  		setTimeout('timeout()',6000);
	}

	function signInOrOut(obj){
		if($(obj).html()=='未签入'){
            signIn();
            $(obj).attr('title','点击签出');
		}else{
            if(heartbeatId>=0){
                clearInterval(heartbeatId);
            }
            method = 'signout';
            send();
            $(obj).attr('title','点击签入');
		}
	}
	//请求超时
	function timeout(){
		if(!hasResponse){
			loseHeartbeat = 0;
			signin = false;
			$('#monitorStatus').html('未签入');
            $('#monitorStatus').attr('title','点击签入');
			if(heartbeatId>=0){
				clearInterval(heartbeatId);
			}
			alert("与服务器连接中断，请重新签入");
		}	
	}
	
	//心跳检测
	function heartbeat(){
		if(loseHeartbeat>1){
			loseHeartbeat = 0;
			signin = false;
            $('#monitorStatus').html('未签入');
            $('#monitorStatus').attr('title','点击签入');
			if(heartbeatId>=0){
				clearInterval(heartbeatId);
			}
			alert("与服务器连接中断，请重新签入");
		}else{
			loseHeartbeat = loseHeartbeat+1;
			var message = "{'method':'heartbeat','agentno':'"+agentno+"'}";
	  		websocket.send(message);
  		}
	}
	
	//响应事件 
	function onEvent(eventType,state,methodType,code,jsonStr){
		var eventAgentNo = jsonStr.agentno;
		if(eventType=='event'){
			if(methodType=='signin'){
						if(code=='0'){
		  					signin = true;
                            $('#monitorStatus').html('已签入');
                            $('#monitorStatus').attr('title','点击签出');
							agentstatus="1";
							method="setAcsType";//通话结束后座席状态默认空闲
							send();
							if(heartbeatId>=0){
								clearInterval(heartbeatId);
							}
							heartbeatId = setInterval("heartbeat()",timeoutSec*1000);
							
							method="getDefinedRoleRights";//获取座席权限
							send();
                            $('#monitorStatus').html('已签入');
                            $('#monitorStatus').attr('title','点击签出');
		  				}else if(code=='-53'){
                            $('#monitorStatus').html('未签入');
                            $('#monitorStatus').attr('title','点击签入');
							alert("呼叫中心用户名或密码错误，签入失败");
						}else{
                            $('#monitorStatus').html('未签入');
                            $('#monitorStatus').attr('title','点击签入');
		  					alert("签入失败[ErrorCode:"+code+"]");
		  				}
			}else if(methodType=='disconnect'){
				hasResponse = true;
	  			if(methodType=='disconnect'){//连接断开
	  				signin = false;
                    $('#monitorStatus').html('未签入');
                    $('#monitorStatus').attr('title','点击签入');
					if(heartbeatId>=0){
						clearInterval(heartbeatId);
					}
					if(changeStatusId>=0){
						clearInterval(changeStatusId);
					}
	  			}
			}else if(methodType=='agent_status_change'){//座席状态被改变
				if(eventAgentNo==agentno){
                    setToolbarByStatus(state);
				}
				if($("#doctree").length>0){
					setMonitorbarStatus(eventAgentNo,state);
				}
			}else if(methodType=="common_callin_bridge_ring"){//呼入弹屏
				if(eventAgentNo==agentno){
					var customerNum = jsonStr.customerNum;
					var url=popupUrl+"?phone="+customerNum+"&agentno="+eventAgentNo;
                    ldtx(customerNum);
				}
			}else if(methodType=="manual_callout_agent_ring"){//呼出弹屏
				if(eventAgentNo==agentno){
					var customerNum = jsonStr.customerNum;
					var url=popupUrl+"?phone="+customerNum+"&agentno="+eventAgentNo;
			//		window.open (url,'呼出弹屏')
				}
			} 
		}else if(eventType=='response'){
			if(methodType=='signin'){
					hasResponse = true;
					hideLoadingMessage();
					if(code=='-6'){
                        $('#monitorStatus').html('已签入');
                        $('#monitorStatus').attr('title','点击签出');
		  			}else if(code=='-11'){
                        $('#monitorStatus').html('未签入');
                        $('#monitorStatus').attr('title','点击签入');
		  				alert("分机不在线，签入失败");
		  			}else if(code=='-12'){
                        $('#monitorStatus').html('未签入');
                        $('#monitorStatus').attr('title','点击签入');
		  				alert("分机已被其他座席绑定，签入失败");
		  			}else if(code!='0'){
                        $('#monitorStatus').html('未签入');
                        $('#monitorStatus').attr('title','点击签入');
		  				alert("签入失败[ErrorCode:"+code+"]");
		  			}
	  		}else if(methodType=='signout'){
					hasResponse = true;
					hideLoadingMessage();
					if(code=='0'){
	  					signin = false;
                        $('#monitorStatus').html('未签入');
                        $('#monitorStatus').attr('title','点击签入');
						if(heartbeatId>=0){
							clearInterval(heartbeatId);
						}
						seatState.text("未签入");
	  				}else{
	  					alert("签出失败");
	  				}
	  		}else if(methodType=='manual_callout'){//外呼
				if(code=='-19' || code=='-22'){
					alert("接入号不正确，呼叫失败");
				}else if(code=='-24' || code=='-31'){
					alert("座席非空闲状态，呼叫失败");
				}else if(code!='0'){
					alert("呼叫失败[ErrorCode:"+code+"]");
				}
			}else if(methodType=='internal_call'){//内呼
				if(code=='-30'){
					alert("被叫座席不在线，呼叫失败");
				}else if(code=='-24' || code=='-31'){
					alert("座席非空闲状态，呼叫失败");
				}else if(code!='0'){
					alert("呼叫失败[ErrorCode:"+code+"]");
				}
			}else if(methodType=='blind_transfer'){//转接座席
				if(code=='-30'){
					alert("被叫座席不在线，呼叫失败");
				}else if(code=='-24' || code=='-31' || code=='-32'){
					alert("座席非空闲状态，呼叫失败");
				}else if(code!='0'){
					alert("呼叫失败[ErrorCode:"+code+"]");
				}
			}else if(methodType=='threeway'){//三方
				if(code=='-30'){
					alert("被叫座席不在线，呼叫失败");
				}else if(code=='-24' || code=='-31' || code=='-32'){
					alert("座席非空闲状态，呼叫失败");
				}else if(code!='0'){
					alert("呼叫失败[ErrorCode:"+code+"]");
				}
			}else if(methodType=='eavesdrop'){//监听
				if(code=='0'){
					setSingleButtonEnabled('eavesdrop','diabled');
				}else{
					alert("监听失败[ErrorCode:"+code+"]");
				}
			}else if(methodType=='whisper'){//密语
				if(code=='0'){
					setSingleButtonEnabled('whisper','diabled');
				}else{
					alert("密语失败[ErrorCode:"+code+"]");
				}
			}else if(methodType=='bargein'){//强插
				if(code=='0'){
					setSingleButtonEnabled('bargein','diabled');
				}else{
					alert("强插失败[ErrorCode:"+code+"]");
				}
			}else if(methodType=='force_hangup'){//强拆
				if(code=='0'){
					setSingleButtonEnabled('forceHangup','diabled');
				}else{
					alert("强拆失败[ErrorCode:"+code+"]");
				}
			}else if(methodType=='heartbeat'){//心跳检测
				if(code=='0'){
					loseHeartbeat = 0;
				}
			}
		}
	}
	
	//修改座席状态
	function changeStatus(state){
		agentstatus = state;
		method="changeStatus";
		send();
	}

    function ldtx(phone){
        $('#ldhm').html(phone);
        $('#unknowKH').hide();
        $('.KHInfo').hide();
        $('#khphoto').hide();
        $('#ldmodel').modal({
            keyboard: true
        });
        $.post(window.apppath + "/admin/api/elderly/getElderByPhone", {
            phone: phone
        }, function (res) {
            if(res==null){
                $('#unknowKH').show();
            }else{
                if(res.photo!=null&&res.photo!=''){
                    $('#khphoto').attr('sec',res.photo);
                    $('#khphoto').show();
                }
                $('#khxm').html(res.elderName);
                $('#khidcard').html(res.idcardno);
                $('#khaddress').html(res.realAddress);
                $('.KHInfo').show();
            }
        }, "json");
    }
	
	//外呼
	function callResponse(phoneNumber){
  		var  message = "{'method':'manualCallout','agentno':'"+agentno+"','pstnnumber':'"+pstnnumber+"','callee':'"+phoneNumber+"'}";
  		// if(type==''){
         //    message = "{'method':'internalCall','agentno':'"+agentno+"','callee':'"+phoneNumber+"'}";
		// }else{
         //    message = "{'method':'manualCallout','agentno':'"+agentno+"','pstnnumber':'"+pstnnumber+"','callee':'"+phoneNumber+"'}";
		// }
  		websocket.send(message);

	}
	
	//挂断
	function hangUp(){
		method="hangup";
		send();
	}
	
	//评分
	function customerEvaluate(){
		method="evaluate";
		send();
	}
	
	//保持
	function hold(){
		method="hold";
		send();
	}
	
	//解除保持
	function unHold(){
		method="unhold";
		send();
	}
	
	//转接座席
	function transfer(){	
		var dialog = art.dialog({
		title: '转接座席',
	    content: '<p>座席号码：'+'<input id="demo-labs-input" style="width:15em; padding:4px" /></p>',
	    fixed: true,
	    id: 'Fm7',
	    icon: 'succeed',
	    //time: 2,
	    okVal: '确定',
	    ok: function () {
	    	var input = document.getElementById('demo-labs-input');
	    	var reNum =/^[0-9]+$/;
	    	if (!reNum.test(input.value)) {
	            input.select();
	            input.focus();
	            alert("请输入有效的座席号码");
	            return false;
	        } else {
				var message = "{'method':'blindTransfer','agentno':'"+agentno+"','callee':'"+input.value+"'}";
	  			websocket.send(message);
	        };
	    },
	    cancel: true
		});
	}
	
	//三方
	function threeway(){	
		var dialog = art.dialog({
		title: '三方',
	    content: '<p>座席号码：'+'<input id="demo-labs-input" style="width:15em; padding:4px" /></p>',
	    fixed: true,
	    id: 'Fm7',
	    icon: 'succeed',
	    //time: 2,
	    okVal: '确定',
	    ok: function () {
	    	var input = document.getElementById('demo-labs-input');
	    	var reNum =/^[0-9]+$/;
	    	if (!reNum.test(input.value)) {
	            input.select();
	            input.focus();
	            alert("请输入有效的座席号码");
	            return false;
	        } else {
				var message = "{'method':'threeway','agentno':'"+agentno+"','callee':'"+input.value+"'}";
	  			websocket.send(message);
	        };
	    },
	    cancel: true
		});
	}