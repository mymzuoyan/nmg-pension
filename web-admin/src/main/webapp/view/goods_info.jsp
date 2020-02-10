<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/7
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <base href="<%=basePath %>" />
    <title>${goods.typeName}</title>
    <link href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/css/bootstrap.min.css"
          rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/style.css?v=2.4"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/comment.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/swiper-3.4.0.min.css"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/favicon.ico"/>
    <style>
        .goodsName {
            font-size: 25px;
            margin: 20px;
            border-bottom: 1px solid #f4f4f4;
            padding-bottom: 20px;
        }

        .goodsP {
            font-size: 15px;
            margin: 20px;
            border-bottom: 1px solid #f4f4f4;
            padding-bottom: 20px;
        }

        .list_con li {
            line-height: 30px;
            height: 30px;
        }

        .list_con a {
            color: #333;
            display: inline-block;
            max-width: 240px;
            vertical-align: middle;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
            cursor: pointer;
        }
    </style>
</head>
<body>
<!--头部-->
<!--头部  begin-->
<jsp:include page="view_header.jsp"/>
<!--头部  end-->
<section id="main_con" class="content_box">
    <!--右侧内容star-->
    <div id="news_rt_con" style="width: 100%;float: left">
        <div class="news_list_con_wrap" style="margin-bottom: 10px">
            <div class="news_list_con_head" style="margin-bottom: 20px">
                <span>${goods.typeName}</span>
                <ul>
                    <li><img src="${pageContext.request.contextPath }/assets/view/images/home_ico_03.png" alt=""
                             style="    margin-top: -4px;"/></li>
                    <li><a href="${pageContext.request.contextPath }/home.html">网站首页&gt;</a></li>
                    <li><a href="">${goods.typeName}</a></li>
                </ul>
            </div>
            <div style="float: left;width: 400px;margin-right: 20px;height: 440px;margin-left:20px">
                <img style="width: 400px;height: 400px" src="${pageContext.request.contextPath }${goods.img}">
            </div>
            <div style="display: inline-block ;width: 550px;height: 440px">
                <h1 class="goodsName" style="font-size: 25px">${goods.name}</h1>
                <p class="goodsP">价格：<span style="color: red;font-size: 25px"><font
                        style="font-size: 15px">¥</font>${goods.price}</span></p>
                <p class="goodsP">库存：${goods.amount}</p>
                <c:if test="${not empty goods.goodsProperties}">
                    <c:forEach items="${goods.goodsProperties}" var="goodsAttr">
                        <p class="goodsP">${goodsAttr.property}：${goodsAttr.value}</p>
                    </c:forEach>
                </c:if>
            </div>
            <div style="padding: 10px">
                <ul class="nav nav-tabs">
                    <li role="presentation" class="active"><a href="content" style="color: red">商品详情</a></li>
                </ul>
                <div id="content" style="padding: 10px 22px;margin-bottom: 10px; ">${goods.info}</div>
            </div>
            <div style="text-align: right;height: 20px">
                <div id="ckepop" style="float: right;margin-right: 20px">
                    <span class="jiathis_txt">分享到：</span>
                    <a class="jiathis_button_weixin">微信</a>
                    <a class="jiathis_button_qq">QQ</a>
                    <a class="jiathis_button_tsina">微博</a>
                    <a href="http://www.jiathis.com/share"
                       class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank">更多</a>
                    <a class="jiathis_counter_style"></a>
                </div>
                <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=1" charset="utf-8"></script>
            </div>
        </div>
    </div>

    <!--左侧列表end-->
</section>
<%--footer begin--%>
<jsp:include page="view_footer.jsp"></jsp:include>
<%--footer end--%>
</body>
<script src="${pageContext.request.contextPath }/assets/view/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/js/bootstrap.min.js"
        type="text/javascript"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/global/scripts/jqPaginator.js"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/moment/moment-with-locales.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/jquery.lazyload.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/view/js/module_mes_comment.js?=1.1"></script>
<%--<script src="${pageContext.request.contextPath }/assets/view/js/articlePagenation.js?=1.5"></script>--%>
<script>
    var nowPage = 1;
    var all = 1;
    $(function () {
        window.apppath = "${pageContext.request.contextPath }";
        //    导航切换
        $("#main_nav li").click(function () {
            $(this).children("a").attr("class", "active").parent("li")
                .siblings().children("a").removeClass("active");
        });
        $("#content img").each(function () {
            if( !$(this).attr("src").contain("pension"))
            $(this).attr("src", window.apppath+$(this).attr("src"));

        })
    });
</script>
</html>
