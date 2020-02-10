<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/7
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <title>组织地图</title>
    <link href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/css/bootstrap.min.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/assets/global/css/components.css" id="style_components"
          rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/style.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/assets/view/css/alertStyle.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/assets/view/css/completer.css"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/favicon.ico"/>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/home/lib/bootstrap-3.3.7/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/home/css/style.css">
    <style>
        .news_list_con {
            min-height: 500px;
            position: relative
        }

        .foot_link {
            position: absolute;
            bottom: 0px;
            height: 30px;
            width: 814px;
        }
    </style>
</head>
<body>
<!--头部  begin-->
<div class="g-home">
    <div class="g-hd">
        <div class="m-center">
            <div class="m-hd">
                <div class="log"><img src="${pageContext.request.contextPath }/assets/home/img/home/log.png" alt=""></div>
                <div class="weather">鞍山 <img src="${pageContext.request.contextPath }/assets/home/img/home/weather.png" alt="" class="icon"> 21°C-24°C &nbsp;&nbsp;| &nbsp;&nbsp;空气质量：<span class="color">优</span></div>
                <div class="hotLine"><img src="${pageContext.request.contextPath }/assets/home/img/home/hotline.png" alt="" class="icon"> 24小时热线：12349</div>
                <div class="search">
                    <%--<input type="text" placeholder="请输入相关文字">--%>
                    <%--<span class="search-btn"><img src="${pageContext.request.contextPath }/assets/home/img/home/search.png" alt=""></span>--%>
                </div>
            </div>
        </div>
    </div>
    <div class="g-nav">
        <div class="m-center">
            <div class="m-nav">
                <ul>
                    <li ><a href="${pageContext.request.contextPath }/home.html">首页</a></li>
                    <li><a href="${pageContext.request.contextPath }/moduleMes/list/1">新闻宣传</a></li>
                    <li class="z-current"><a href="${pageContext.request.contextPath }/serviceOrgMap.html">地图查询</a></li>
                    <li><a href="#">为老服务</a></li>
                    <li><a href="${pageContext.request.contextPath }/letter/add">12349信箱</a></li>
                    <li><a href="#">特色养老</a></li>
                </ul>
            </div>
        </div>
    </div>
<!--头部  end-->
<section id="main_con" class="content_box">

    <!--右侧内容star-->
    <div id="news_rt_con" style="width: 1165px;">
        <div class="news_list_con_wrap">
            <div class="news_list_con_head">
                <span>组织地图</span>
                <ul>
                    <li><img src="${pageContext.request.contextPath }/assets/view/images/home_ico_03.png" alt=""/></li>
                    <li><a href="${pageContext.request.contextPath }/home.html">网站首页&gt;</a></li>
                    <li><a href="">组织地图</a></li>
                </ul>
            </div>
            <!--新闻详情-->
            <div class="news_list_con">
                <div style="margin-bottom:10px;text-align: right ">
                    <select id="typeId" class="table-group-action-input form-control input-inline input-small input-sm" onchange="Home.selectTypeId()">
                        <option value='0' selected>服务组织</option>
                        <option value='9'>养老机构</option>
                    </select>
                    <select id="area1" style="display: none"
                            class="table-group-action-input form-control input-inline input-small input-sm">
                    </select>
                    <select id="area2"
                            class="table-group-action-input form-control input-inline input-small input-sm">
                    </select>
                    <select id="institutionTypeDictId"
                            class="table-group-action-input form-control input-inline input-small input-sm">
                        <option value=''>所有类型</option>
                        <option value='1'>社区养老服务中心（A）</option>
                        <option value='2'>社区养老服务中心（B）</option>
                        <option value='3'>社区养老服务中心（C）</option>
                        <option value='9'>社区养老服务中心（D）</option>
                        <option value='4'>老年人助餐点</option>
                        <option value='5'>老年人助浴点</option>
                        <option value='6'>老年人日间照料中心</option>
                        <option value="7">居家乐托养点</option>
                        <option value='8'>其他</option>
                    </select>
                    <select id="serviceProject"
                            class="table-group-action-input form-control input-inline input-small input-sm">
                    </select>
                    <div id="nameDiv" style="display: inline-block;">
                        <input id="name"
                               class="table-group-action-input form-control input-inline input-small input-sm">
                        </input>
                    </div>
                    <button id="search" class="btn btn-sm btn-circle btn-import "><i class="fa fa-check"></i>查询
                    </button>
                </div>
                <input type="text" id="suggestId" class="form-control input-inline input-sm"
                       placeholder="搜索地址..." style="position: absolute; z-index: 1; margin: 5px;display: none;">
                <div id="allmap" style="height: 480px"></div>
            </div>
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
<script src="${pageContext.request.contextPath }/assets/view/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/js/bootstrap.min.js"
        type="text/javascript"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/view/js/completer.min.js"></script>
<script type="text/javascript"
        src="http://api.map.baidu.com/api?v=2.0&ak=UtTMI5ofPulxrOYjzLcEWHGXRlyAEfUB"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/view/js/InfoBox.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/view/js/home.js?v=4.67"></script>
<script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/Global.js?v=1.1"
        type="text/javascript"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/view/js/service_org_map.js?v=1.11"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/view/js/institution_map.js?v=1.7"></script>

<!-- END PAGE LEVEL SCRIPTS -->
<script>
    jQuery(document).ready(function () {
        window.apppath = '${pageContext.request.contextPath }';
        $(".lf a").removeClass("active");
        $(".lf a").eq(2).addClass("active");
        ServiceOrgMap.init();
        ServiceOrgMap.searchInit();
        //初始化添加所有marker
        ServiceOrgMap.addMarker("");
        Home.init();
//        //获取区级以上的区域
        $.post(window.apppath + "/admin/api/area/getAreaLessLevel", {
                level: 2
            },
            function (res) {
                if (res != null) {
                    var area1Html = "";
                    var area2Html = "<option value='-1'>所有区</option>";
                    for (var i in res) {
                        if (res[i].level == 1) {
                            area1Html += '<option value="' + res[i].value + '">' + res[i].name + '</option>';
                        }
                        else {
                            area2Html += '<option value="' + res[i].value + '">' + res[i].name + '</option>';
                        }
                    }
                    $("#area1").html(area1Html);
                    $("#area2").html(area2Html);
                }
            }, 'json');
        //获取服务类型
        $.post(window.apppath + "/admin/api/dictionary/serviceProject/all",
            function (res) {
                if (res != null) {
                    var serviceProjectHtml = "<option value='-1'>服务类型</option>";
                    for (var i in res) {
                        serviceProjectHtml += '<option value="' + res[i].id + '">' + res[i].name + '</option>';
                    }
                    $("#serviceProject").html(serviceProjectHtml);
                }
            }, 'json');
    });
</script>
</html>
