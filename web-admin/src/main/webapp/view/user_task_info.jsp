<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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
    <title>需求详情</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/style.css"/>
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
                <span>工单详情</span>
                <ul>
                    <li><img src="${pageContext.request.contextPath }/assets/view/images/home_ico_03.png" alt=""/></li>
                    <li><a href="">网站首页&gt;</a></li>
                    <li><a href="">账号信息&gt;</a></li>
                    <li><a href="">工单详情</a></li>
                </ul>
            </div>
            <!--个人信息 S-->
            <div class="public_box">
                <h2 class="pub_tit">工单编号： ${task.number}</h2>
                <!--选择老人-->
                <div class="row_from">
                    <span class="tit lf">服务对象 ：</span>
                    <div class="row_from_info lf">
                        ${task.elderName}
                    </div>
                </div>
                <div class="row_from">
                    <span class="tit lf">服务地址 ：</span>
                    <div class="row_from_info lf">
                        ${task.serviceAddress}
                    </div>
                </div>
                <!--服务类型-->
                <div class="row_from">
                    <span class="tit lf">服务类型 ：</span>
                    <div class="row_from_info lf">
                        ${task.serviceType}， ${task.content}
                    </div>
                </div>
                <!--选择服务组织-->
                <div class="row_from">
                    <span class="tit lf">服务组织 ：</span>
                    <div class="row_from_info lf">
                        ${task.receiverServiceOrg}
                    </div>
                </div>
                <!--选择服务组织-->
                <div class="row_from">
                    <span class="tit lf">服务人员 ：</span>
                    <div class="row_from_info lf">
                        ${task.receiverName}
                    </div>
                </div>
                <!--选择服务时间-->
                <div class="row_from">
                    <span class="tit lf">服务时间 ：</span>
                    <div class="row_from_info lf">
                        <div id="serviceTime"></div>
                    </div>
                </div>
                <!--选择服务时间-->
                <div class="row_from">
                    <span class="tit lf">状态 ：</span>
                    <div class="row_from_info lf">
                        ${["已拒绝", "待响应", "组织已响应", "组织已派遣", "组织已拒绝", "服务人员已接单", "服务人员已上门", "服务人员已拒绝", "待付款","已完成", "已评价", "已调度"][task.status]}
                    </div>
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
<script>
    $(function () {
        window.apppath = "${pageContext.request.contextPath }";
        var time=new Date("${task.serviceTime}");
        var serviceTime= time.getFullYear()+"-"+formatTwo(time.getMonth()+1)+"-"+formatTwo(time.getDate())+" "+formatTwo(time.getHours())+":"+formatTwo(time.getMinutes())+":"+formatTwo(time.getSeconds());
        $("#serviceTime").html(serviceTime);
    });
    //    导航切换
    $("#main_nav li").click(function () {
        $(this).children("a").attr("class", "active").parent("li")
            .siblings().children("a").removeClass("active");
    });
    function formatTwo(str)
    {
        str=str+"";
        if(str.length==1)
        {
            str="0"+str;
        }
        return str;
    }
</script>
</html>
