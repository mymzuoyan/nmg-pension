<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/7
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <title></title>
    <link href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/style.css?v=2.4"/>
    <script src="${pageContext.request.contextPath }/assets/view/js/jquery-1.9.1.js"></script>
    <script src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/js/bootstrap.min.js"
            type="text/javascript"></script>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/favicon.ico"/>
</head>
<body>
<!--头部-->
<!--头部  begin-->
<jsp:include page="view_header.jsp"/>
<!--头部  end-->
<section id="main_con" class="content_box">
    <!--右侧内容star-->
    <div id="news_rt_con" style="width: 1165px;">
        <div class="news_list_con_wrap">
            <div class="news_list_con_head">
                <span class="">商城</span>
                <ul>
                    <li><img src="${pageContext.request.contextPath }/assets/view/images/home_ico_03.png" alt="" style="    margin-top: -4px;"/></li>
                    <li><a href="${pageContext.request.contextPath }/home.html">网站首页&gt;</a></li>
                    <li><a href="" class="">商城</a></li>
                </ul>
            </div>
            <div class="news_list_con">
                <ul class="news_list_con_ul">
                </ul>
            </div>
            <ul class="pagination pull-right" id="pagination" style=""></ul>
        </div>
    </div>
    <!--右侧内容end-->
</section>
<%--footer begin--%>
<jsp:include page="view_footer.jsp"></jsp:include>
<%--footer end--%>
</body>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/global/scripts/jqPaginator.js"></script>
<script src="${pageContext.request.contextPath }/assets/view/js/goods_list.js?v=1.2"></script>
<script>
    $(function () {
        window.apppath = '${pageContext.request.contextPath}';
        var classId="${classId}";
        $(".lf a").removeClass("active");
        GoodsList.init(classId);

    });
</script>
</html>
