<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/7
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/favicon.ico"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/home/lib/bootstrap-3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/home/css/style.css">
<header>
    <div class="g-hd">
        <div class="m-center">
            <div class="m-hd">
                <div class="log"><img src="${pageContext.request.contextPath }/assets/home/img/home/log.png" alt=""></div>
                <div class="hotLine"><img src="${pageContext.request.contextPath }/assets/home/img/home/hotline.png" alt="" class="icon"> 24小时热线：12349</div>
            </div>
        </div>
    </div>
    <div>
        &nbsp;
    </div>
    <div>
        &nbsp;
    </div>
    <div class="g-nav">
        <div class="m-center">
            <div class="m-nav">
                <ul>
                    <li><a href="${pageContext.request.contextPath }/home.html">首页</a></li>
                    <li><a href="${pageContext.request.contextPath }/moduleMes/list/1">新闻宣传</a></li>
                    <li><a href="${pageContext.request.contextPath }/serviceOrgMap.html">地图查询</a></li>
                    <li><a href="#">为老服务</a></li>
                    <li><a href="${pageContext.request.contextPath }/letter/add">12349信箱</a></li>
                    <li><a href="#">特色养老</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
<script src="${pageContext.request.contextPath }/assets/view/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath }/assets/home/lib/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/home/lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/home/lib/roundabout/jquery.roundabout.js"></script>
<script>
    var flag = false;
    $(".lf a").hover(function () {
        flag = $(this).hasClass("active");
        $(this).addClass("active");
    }, function () {
        if (!flag)
            $(this).removeClass("active");
    });
</script>
