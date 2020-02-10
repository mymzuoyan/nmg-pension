<%--
  Created by IntelliJ IDEA.
  User: MaiBenBen
  Date: 2017/5/15
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>我的信息</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <link href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/extra.css?v=1"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/favicon.ico"/>
    <style>
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
            <a href="${pageContext.request.contextPath }/user/user_profile.html"><li class="active">个人信息</li></a>
            <a href="${pageContext.request.contextPath }/user/sendDemand.html"><li>发布订单</li></a>
            <a href="${pageContext.request.contextPath }/user/task_list.html"><li>工单记录</li></a>
            <a href="${pageContext.request.contextPath }/user/user_message.html"><li class="active">我的消息 </li></a>
        </ul>
    </div>
    <!--左侧列表end-->
    <c:if test="${ empty sessionScope.login_user.uid}">
        请先登录！
    </c:if>
    <c:if test="${not  empty sessionScope.login_user.uid}">
    <!--右侧内容star-->
    <div  id="news_rt_con">
        <div class="news_list_con_wrap">
            <div class="news_list_con_head">
                <span>我的消息</span>
                <ul>
                    <li><img src="${pageContext.request.contextPath }/assets/view/images/home_ico_03.png" alt=""/></li>
                    <li><a href="">网站首页&gt;</a></li>
                    <li><a href="">账户信息&gt;</a></li>
                    <li><a href="">个人信息</a></li>
                </ul>
            </div>
            <!--个人信息 S-->
            <div class="public_box" >
                <div class="alert_box">
                    <div class="alert_con alert_msg warning">
                        消息通知（共<psan id="messageCount"></psan>条）
                    </div>
                </div>
                <div id="messageDiv" style="min-height: 400px">

                </div>
                <ul class="pagination pull-right" id="pagination" style=""></ul>
            </div>
            <!--个人信息 E-->
        </div>
    </div>
    <!--右侧内容end-->
</section>
</c:if>
<%--footer begin--%>
<jsp:include page="view_footer.jsp"></jsp:include>
<%--footer end--%>
</body>
<script src="${pageContext.request.contextPath }/assets/view/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath }/assets/view/js/function.js"></script>
<script type="text/javascript"  src="${pageContext.request.contextPath}/assets/global/scripts/jqPaginator.js"></script>
<script src="${pageContext.request.contextPath }/assets/view/js/user_message.js?v=1"></script>
<script>
    $(function () {
        window.apppath = "${pageContext.request.contextPath }";
        UserMessage.init();
    });
    //    导航切换
    $("#main_nav li").click(function () {
        $(this).children("a").attr("class", "active").parent("li")
            .siblings().children("a").removeClass("active");
    });
</script>
</html>
