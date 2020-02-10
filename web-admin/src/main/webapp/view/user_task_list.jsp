<%--
  Created by IntelliJ IDEA.
  User: MaiBenBen
  Date: 2017/5/16
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>工单记录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <link href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/style.css?v=1"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/extra.css"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/favicon.ico"/>
    <style>
        a,a:hover{
            outline: none;
        }
    </style>
</head>
<body>
<!--头部  begin-->
<jsp:include page="view_header.jsp"/>
<!--头部  end-->
<section id="main_con" class="content_box">
    <!--养老动态-->

    <!--左侧列表star-->
    <div id="news_lf_con">
        <h2>账号信息</h2>
        <ul>
            <a href="${pageContext.request.contextPath }/user/user_profile.html"><li >个人信息</li></a>
            <a href="${pageContext.request.contextPath }/user/sendDemand.html"><li> 发布需求</li></a>
            <a href="${pageContext.request.contextPath }/user/task_list.html"><li class="active">工单记录</li></a>
            <a href="${pageContext.request.contextPath }/user/user_message.html"><li>我的消息</li></a>
        </ul>
    </div>
    <!--左侧列表end-->

    <!--右侧内容star-->
    <div id="news_rt_con">
        <div class="news_list_con_wrap">
            <div class="news_list_con_head">
                <span>工单记录</span>
                <ul>
                    <li><img src="${pageContext.request.contextPath }/assets/view/images/home_ico_03.png" alt=""/></li>
                    <li><a href="">网站首页&gt;</a></li>
                    <li><a href="">账号信息&gt;</a></li>
                    <li><a href="">工单记录</a></li>
                </ul>
            </div>
            <!--个人信息 S-->
            <div class="public_box">
                <div class="row_from">
                    <ul class="lf" id="indent_nav">
                        <li class="active"><a href="javascript:void(0)" data="2">全部订单</a></li>
                        <li class=""><a href="javascript:void(0)" data="0"> 未完成订单</a></li>
                        <li class=""><a href="javascript:void(0)"  data="1">待评价</a></li>
                    </ul>
                    <div id="indent_seach" class="rt">
                        <input type="text" placeholder="服务订单号/服务时间"/><input type="submit" value=""/>
                    </div>
                </div>
                <div class="row_from" style="min-height: 400px">
                    <table id="indent_table">
                        <thead>
                        <tr>
                            <td>订单详情</td>
                            <td>服务对象</td>
                            <td>服务金额</td>
                            <td>
                                <select name="" id="">
                                    <option value="">全部状态</option>
                                    <option value="">已完成</option>
                                    <option value="">未完成</option>
                                </select>
                            </td>
                            <td>操作</td>
                        </tr>
                        </thead>
                        <tbody id="listTbody">
                        </tbody>
                    </table>
                </div>
                <ul class="pagination pull-right" id="pagination" style=""></ul>
            </div>
            <!--个人信息 E-->
        </div>
    </div>
    <!--右侧内容end-->
</section>
<%--footer begin--%>
<jsp:include page="view_footer.jsp"></jsp:include>
<%--footer end--%>
</body>
<script src="${pageContext.request.contextPath }/assets/view/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath }/assets/view/js/function.js"></script>
<script type="text/javascript"  src="${pageContext.request.contextPath }/assets/global/scripts/jqPaginator.js"></script>
<script src="${pageContext.request.contextPath }/assets/view/js/user_task_list.js?v=1.2"></script>
<script>
    $(function () {
        window.apppath="${pageContext.request.contextPath }";
        UserTaskList.init();
    })
    //    导航切换
    $("#main_nav li").click(function () {
        $(this).children("a").attr("class", "active").parent("li")
            .siblings().children("a").removeClass("active");
    });
</script>
</html>