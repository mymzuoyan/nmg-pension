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
    <title>内蒙古市养老</title>
    <link href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/style.css?v=2.4"/>
    <script src="${pageContext.request.contextPath }/assets/view/js/jquery-1.9.1.js"></script>
    <script src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/js/bootstrap.min.js"
            type="text/javascript"></script>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/favicon.ico"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/home/lib/bootstrap-3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/home/css/style.css">
</head>
<body>
<!--头部-->
<!--头部  begin-->
<div class="g-home">
    <div class="g-hd">
        <div class="m-center">
            <div class="m-hd">
                <div class="log"><img src="${pageContext.request.contextPath }/assets/home/img/home/log.png" alt=""></div>
                <div class="hotLine"><img src="${pageContext.request.contextPath }/assets/home/img/home/hotline.png" alt="" class="icon"> 24小时热线：12349</div>
            </div>
        </div>
    </div>
<div class="g-nav">
    <div class="m-center">
        <div class="m-nav">
            <ul>
                <li ><a href="${pageContext.request.contextPath }/home.html">首页</a></li>
                <li class="z-current"><a href="${pageContext.request.contextPath }/moduleMes/list/1">新闻宣传</a></li>
                <li><a href="${pageContext.request.contextPath }/serviceOrgMap.html">地图查询</a></li>
                <li><a href="#">为老服务</a></li>
                <li><a href="${pageContext.request.contextPath }/letter/add">12349信箱</a></li>
                <li><a href="#">特色养老</a></li>
            </ul>
        </div>
    </div>
</div>
    <div class="g-banner-list"></div>
<!--头部  end-->
<section id="main_con" class="content_box">
    <!--养老动态-->

    <!--右侧内容star-->
    <div id="news_rt_con" style="width: 1165px;">
        <div class="news_list_con_wrap">
            <div class="news_list_con_head">
                <span class="moduleName"></span>
                <ul>
                    <li><img src="${pageContext.request.contextPath }/assets/view/images/home_ico_03.png" alt="" style="    margin-top: -4px;"/></li>
                    <li><a href="${pageContext.request.contextPath }/home.html">网站首页&gt;</a></li>
                    <li><a href="" class="moduleName"></a></li>
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
    <div class="g-ft">
        <div class="m-ft">
            <div class="m-center">
                <p><a href="">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">版本信息</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                        href="#">法律申明</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">站长统计</a></p>
                <p>版权所有：12349健康养老服务中心 版权所有 2010-2016 all rights reserved</p>
                <p>苏ICP备10041635号 设计维护：南京援通养老服务发展中心</p>
                <div class="v-code"><img src="${pageContext.request.contextPath }/assets/home/img/home/v-code.png" alt=""></div>
            </div>
        </div>
    </div>
<%--footer end--%>
</div>
</body>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/global/scripts/jqPaginator.js"></script>
<script src="${pageContext.request.contextPath }/assets/view/js/moduleMes_list.js?v=1.2"></script>
<script src="${pageContext.request.contextPath }/assets/home/lib/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/home/lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/home/lib/roundabout/jquery.roundabout.js"></script>
<script>
    $(function () {
        window.apppath = '${pageContext.request.contextPath }';
        var moduleId="${moduleId}";
        $(".lf a").removeClass("active");
        if(moduleId==1)
        {
            $(".lf a").eq(1).addClass("active");
        }
        if(moduleId==3)
        {
            $(".lf a").eq(8).addClass("active");
        }
        ModuleMesList.init(moduleId);

    });
</script>
</html>
