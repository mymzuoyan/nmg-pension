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
    <title>个人信息</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/alertStyle.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/extra.css"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/favicon.ico"/>
    <style>
        .confirmModalMes{
            text-align: center;
        }
        .alert_head_wrap a{
            text-decoration: none !important;
        }
        .alert_head_wrap a:focus, .alert_head_wrap a:hover{
            color: white !important;
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
            <li class="active">个人信息</li>
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
                <span>个人信息</span>
                <ul>
                    <li><img src="${pageContext.request.contextPath }/assets/view/images/home_ico_03.png" alt=""/></li>
                    <li><a href="">网站首页&gt;</a></li>
                    <li><a href="">账号信息&gt;</a></li>
                    <li><a href="">个人信息</a></li>
                </ul>
            </div>
            <!--个人信息 S-->
            <div class="public_box">
                <!--基本信息-->
                <div class="table_row" id="personalMsg">
                    <div class="lf personal_info">
                        <p><span class='tit'>昵<i
                                style="opacity: 0;filter: opacity(0)">空</i>称 : </span><strong> ${sessionScope.login_user.nick_name}</strong>
                        </p>

                        <p><span class='tit'>手机号: </span><strong> ${sessionScope.login_user.phone}</strong>
                        </p>
                    </div>
                    <div class="rt personal_type">
                        <img src="${pageContext.request.contextPath }/assets/view/images/personal_03.png" class="lf"
                             alt=""/>
                        <p>用户名: ${sessionScope.login_user.login_name}</p>
                        <p>历史订单:${taskCount}</p>
                        <p>用户类型:${sessionScope.login_role.name}</p>
                    </div>
                </div>
                <!--添加关联老人  老人信息-->
                <div class="table_row" id="Associat_oldMan">
                    <div class="addOldMan">
                        <a href="${pageContext.request.contextPath }/view/add_linkElder.jsp">添加关联老人</a>
                        <span>您已创建<span id="link_elder_count">0</span>个关联老人，最多可关联<span id="link_elder_max">10</span>个</span>
                    </div>
                    <!--关联老人列表 S-->
                    <div id="link_elder_list" class="oldMan_lis_box">
                    </div>
                    <!--关联老人列表 E-->
                    <div class="addOldMan">
                        <%--<a href="" class="active">保存信息</a>--%>
                        <span>添加关联老人，更有利于发布订单！</span>
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
<div id="confirmModal2" class='alert_wrap' style="display: none">
    <div class="alert_main">
        <div class="alert_wrap_con">
            <div class="alert_head_wrap">
                <h3 style="font-size:20px">提示信息</h3>
                <a class="cancel" href="javascript:void(0)">×</a>
            </div>
            <div class="alert_info_con">

                <img src="${pageContext.request.contextPath }/assets/admin/pages/img/ask_03.png" alt=""/>
                <p class="confirmModalMes"></p>
            </div>
            <div class="alert_btm_con">
                <a href="javascript:void(0)" class="confirm">确定</a>
                <a href="javascript:void(0)" class="cancel">取消</a>
            </div>
        </div>
    </div>
</div>

<div id="qrcodeDiv" class='alert_wrap' style="display: none">
    <div class="alert_main">
        <div class="alert_wrap_con">
            <div class="alert_head_wrap">
                <h3 style="font-size:20px">二维码</h3>
                <a class="cancel" href="javascript:void(0)">×</a>
            </div>
            <div class="alert_info_con">
                <div id="qrcode">

                </div>
                <p>注：右击图片另存为下载</p>
            </div>
            <div class="alert_btm_con">
                <a href="javascript:void(0)" class="confirm">确定</a>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath }/assets/view/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath }/assets/global/scripts/jquery.qrcode.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/view/js/user_profile.js?v=1.2"></script>
<script>
    $(function () {
        window.apppath="${pageContext.request.contextPath }";
        UserProfile.init();
    });
    //    导航切换
    $("#main_nav li").click(function () {
        $(this).children("a").attr("class", "active").parent("li")
            .siblings().children("a").removeClass("active");
    });
    function showQrCode() {
        $("#qrcodeDiv").show();
        $("#qrcodeDiv .confirm").unbind('click').click(function () {
            $("#qrcodeDiv").hide();
        })
        $("#qrcodeDiv .cancel").unbind('click').click(function () {
            $("#qrcodeDiv").hide();
        })
    }

    function confirm2(res, callback) {
        $("#confirmModal2 .confirmModalMes").html(res);
        $("#confirmModal2").show();
        $("#confirmModal2 .confirm").unbind('click').click(function () {
            $("#confirmModal2").hide();
            if (callback != null)
                callback();
        })

        $("#confirmModal2 .cancel").unbind('click').click(function () {
            $("#confirmModal2").hide();
        })
    }
</script>
</html>
