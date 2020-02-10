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
    <title>添加关联老人</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/extra.css"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/favicon.ico"/>
    <style>
        .error{
            color:red;
        }
        .success{
            color:green;
        }
        a{
            text-outline: none;
        }
        .alert_head_wrap a{
            top: -3px !important;
        }
        .alert_head_wrap h3{
            line-height: 46px !important;
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
            <a href="${pageContext.request.contextPath }/user/user_profile.html"><li class="active">个人信息</li></a>
            <a href="${pageContext.request.contextPath }/user/sendDemand.html"><li>发布订单</li></a>
            <a href="${pageContext.request.contextPath }/user/task_list.html"><li>工单记录</li></a>
            <a href="${pageContext.request.contextPath }/user/user_message.html"><li>我的消息</li></a>
        </ul>
    </div>
    <!--左侧列表end-->
    <c:if test="${ empty sessionScope.login_user.uid}">
        请先登录！
    </c:if>
    <c:if test="${not  empty sessionScope.login_user.uid}">
    <!--右侧内容star-->
    <div id="news_rt_con">
        <div class="news_list_con_wrap">
            <div class="news_list_con_head">
                <span>添加关联老人</span>
                <ul>
                    <li><img src="${pageContext.request.contextPath }/assets/view/images/home_ico_03.png" alt=""/></li>
                    <li><a href="">网站首页&gt;</a></li>
                    <li><a href="">账号信息&gt;</a></li>
                    <li><a href="">个人信息&gt;</a></li>
                    <li><a href="">添加关联老人</a></li>
                </ul>
            </div>
            <!--个人信息 S-->
            <div class="public_box">
                <div class="public_box">
                    <h2 class="pub_tit">关联老人信息</h2>
                    <div class="row_from">
                        <input type="hidden" name="id" value="${userLinkElder.id}"/>
                        <span class="tit lf">姓名 :</span>
                        <div class="row_from_info lf">
                            <input type="text" name="elderName" value="${userLinkElder.elderName}" placeholder="填写老人姓名"/>

                        </div>
                    </div>
                    <div class="row_from">
                        <span class="tit lf">身份证号码 :</span>
                        <div class="row_from_info lf">
                            <input type="text" name="elderCardNo" value="${userLinkElder.elderCardNo}" placeholder="填写老人身份证号码"/>

                        </div>
                    </div>
                    <div class="row_from">
                        <span class="tit lf">联系方式 :</span>
                        <div class="row_from_info lf">
                            <input type="text" name="elderMobile" value="${userLinkElder.elderMobile}" placeholder="填写老人联系方式"/>
                        </div>
                    </div>
                    <div class="row_from">
                        <span class="tit lf">居住地址 :</span>
                        <div class="row_from_info lf">
                            <input type="text" name="elderAddress"  value="${userLinkElder.elderAddress}" placeholder="填写老人居住地址"/>
                        </div>
                    </div>
                    <div class="addOldMan">
                        <a href="javascript:void(0)" onclick="AddLinkElder.addOrUpdateLinkElder()" class="active">
                            <c:if test="${empty userLinkElder}">
                                添加老人
                            </c:if>
                            <c:if test="${not empty userLinkElder}">
                                更新老人
                            </c:if>
                            </a>
                        <span class="help_text error" ></span>
                    </div>
                </div>
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
<script src="${pageContext.request.contextPath }/assets/view/js/add_linkElder.js"></script>
<script>
    $(function () {
        window.apppath = "${pageContext.request.contextPath }";
        AddLinkElder.init();
    });
    //    导航切换
    $("#main_nav li").click(function () {
        $(this).children("a").attr("class", "active").parent("li")
            .siblings().children("a").removeClass("active");
    });
</script>
</html>
