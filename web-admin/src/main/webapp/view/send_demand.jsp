<%--
  Created by IntelliJ IDEA.
  User: MaiBenBen
  Date: 2017/5/16
  Time: 13:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>发布需求</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <link href="${pageContext.request.contextPath }/assets/global/plugins/font-awesome/css/font-awesome.min.css"
          rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/style.css?v=2.4"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/alertStyle.css?v=1"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/extra.css"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/favicon.ico"/>
    <style>
        h2{
            font-size: 20px;
        }
        .error{
            color:red;
        }
        .success{
            color:green;
        }
    </style>
</head>
<body>
<!--头部  begin-->
<jsp:include page="view_header.jsp"/>
<!--头部  end-->
<section id="main_con" class="content_box">
    <!--左侧列表star-->
    <div id="news_lf_con">
        <h2>账号信息</h2>
        <ul>
            <a href="${pageContext.request.contextPath }/user/user_profile.html"><li >个人信息</li></a>
            <a href="${pageContext.request.contextPath }/user/sendDemand.html"><li class="active"> 发布需求</li></a>
            <a href="${pageContext.request.contextPath }/user/task_list.html"><li>工单记录</li></a>
            <a href="${pageContext.request.contextPath }/user/user_message.html"><li>我的消息</li></a>
        </ul>
    </div>
    <!--左侧列表end-->

    <!--右侧内容star-->
    <div  id="news_rt_con">
        <div class="news_list_con_wrap">
            <div class="news_list_con_head">
                <span>发布需求</span>
                <ul>
                    <li><img src="${pageContext.request.contextPath }/assets/view/images/home_ico_03.png" alt=""/></li>
                    <li><a href="">网站首页&gt;</a></li>
                    <li><a href="">账号信息&gt;</a></li>
                    <li><a href="">发布需求</a></li>
                </ul>
            </div>
            <!--个人信息 S-->
            <div class="public_box">
                <h2 class="pub_tit">需求信息</h2>
                <!--选择老人-->
                <div class="row_from">
                    <span class="tit lf">选择老人 :</span>
                    <div class="row_from_info lf">
                        <select name="elderId" id="link_elder_list">
                            <option value="">请选择需求老人(必选)</option>
                        </select>
                    </div>
                </div>
                <!--服务类型-->
                <div class="row_from">
                    <span class="tit lf">服务类型 :</span>
                    <div class="row_from_info lf">
                        <select name="serviceType">
                        </select>
                    </div>
                </div>
                <div class="row_from" id="serviceNameDiv" style="display: none">
                    <span class="tit lf">服务项目 :</span>
                    <div class="row_from_info lf">
                        <select name="serviceName">
                            <option value="">请选择服务项目</option>
                        </select>
                    </div>
                </div>
                <!--选择服务组织-->
                <div class="row_from">
                    <span class="tit lf">选择服务组织 :</span>
                    <div class="row_from_info lf">
                        <select name="serviceOrgId">
                            <option value="">请选择服务组织(非必选)</option>
                        </select>
                    </div>
                </div>
                <!--选择服务时间-->
                <div class="row_from">
                    <span class="tit lf">服务时间 :</span>
                    <div class="row_from_info lf">
                        <input name="date" class="form-control date-picker" data-date-start-date="+0d"
                               style="float: left;width: 65%; margin-right: 5px" type="text"
                               value="" readonly/>
                        <input name="time" type="text"
                               class="form-control timepicker timepicker-24"
                               style="width: 30%;float: right;" value="" readonly>
                    </div>
                </div>
                <h2 class="pub_tit">服务描述</h2>
                <!--发布人联系方式-->
                <div class="row_from">
                    <span class="tit lf">填写服务需求 :</span>
                    <div class="row_from_info lf">
                        <textarea name="content" id="" cols="10" rows="5"></textarea>
                    </div>
                </div>
                <div class="addOldMan">
                    <a href="javascript:void(0)" class="active" onclick="SendDemand.sendADemand();">发布订单</a>
                    <span class="help_text error" ></span>
                </div>
            </div>
            <!--个人信息 E-->
        </div>
    </div>
    <!--右侧内容end-->
</section>
<%--footer begin--%>
<jsp:include page="view_footer.jsp"></jsp:include>
<%--footer end--%>
<div id="alertModal2" class='alert_wrap' style="display: none">
    <div class="alert_main">
        <div class="alert_wrap_con">
            <div class="alert_head_wrap">
                <h4 style="margin: 0px;padding: 10px">提示信息</h4>
                <a class="cancel" href="javascript:void(0)">×</a>
            </div>
            <div class="alert_info_con">
                <p class="alertModalMes"></p>
            </div>
            <div class="alert_btm_con">
                <a href="javascript:void(0)" class="confirm lg_btn">确定</a>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath }/assets/view/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath }/assets/view/js/function.js"></script>
<script src="${pageContext.request.contextPath }/assets/view/js/send_demand.js?v=1.4"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript"
        src="http://api.map.baidu.com/api?v=2.0&ak=UtTMI5ofPulxrOYjzLcEWHGXRlyAEfUB"></script>
<script>
    $(function () {
        window.apppath = "${pageContext.request.contextPath }";
        $('.date-picker').datepicker({
            autoclose: true,
            orientation: "left",
            autoclose: true,
            format: 'yyyy-mm-dd'
        });
        $('.timepicker-24').click( function (e) {
            $('.timepicker-24').timepicker({
                minuteStep: 5,
                showSeconds: false,
                showMeridian: false
            });
            $(this).timepicker('showWidget');
        });
        SendDemand.init();
    });
    //    导航切换
    $("#main_nav li").click(function () {
        $(this).children("a").attr("class", "active").parent("li")
            .siblings().children("a").removeClass("active");
    });
    function alert(res, callback) {
        $("#alertModal2 .alertModalMes").html(res);
        $('#alertModal2').show();

        $("#alertModal2 .confirm").unbind('click').click(function () {
            $("#alertModal2").hide();
            if (callback != null)
                callback();
        })

        $("#alertModal2 .cancel").unbind('click').click(function () {
            $("#alertModal2").hide();
        })

    }
</script>
</html>
