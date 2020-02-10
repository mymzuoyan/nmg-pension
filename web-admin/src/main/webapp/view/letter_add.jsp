<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <title>内蒙古市养老</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/home/lib/bootstrap-3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/home/css/style.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/style.css?v=2.4"/>
    <script src="${pageContext.request.contextPath }/assets/view/js/jquery-1.9.1.js"></script>
    <script src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/js/bootstrap.min.js"
            type="text/javascript"></script>
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
<!--头部-->
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
                    <li><a href="${pageContext.request.contextPath }/serviceOrgMap.html">地图查询</a></li>
                    <li><a href="#">为老服务</a></li>
                    <li class="z-current"><a href="${pageContext.request.contextPath }/letter/add">12349信箱</a></li>
                    <li><a href="#">特色养老</a></li>
                </ul>
            </div>
        </div>
    </div>
<!--头部  end-->
<section id="main_con" class="content_box">
    <!--养老动态-->

    <!--左侧列表star-->
    <div id="news_lf_con">
        <h2>12349信箱</h2>
    </div>
    <!--左侧列表end-->

    <!--右侧内容star-->
    <div id="news_rt_con">
        <div class="news_list_con_wrap">
            <div class="news_list_con_head">
                <span>12349信箱</span>
                <ul>
                    <li><img src="${pageContext.request.contextPath }/assets/view/images/home_ico_03.png" alt=""/></li>
                    <li><a href="${pageContext.request.contextPath }/home.html">网站首页&gt;</a></li>
                    <li><a href="">12349信箱</a></li>
                </ul>
            </div>
            <!--新闻详情-->
            <div class="news_list_con news_detalis">
                <form id="addLetter">
                    <div class="form-group">
                        <span class="required" style="color: red">*</span>
                        <label class="control-label">信件类型：</label>
                        <select name="letterType" class="form-control" id="letterType">
                            <option value="">--请选择--</option>
                            <option value="1">意见</option>
                            <option value="2">咨询</option>
                            <option value="3">投诉</option>
                            <option value="4">其他</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <span class="required" style="color: red">*</span>
                        <label class="control-label">信件标题：</label>
                        <input type="text" name="letterTitle" class="form-control" id="letterTitle">
                    </div>
                    <div class="form-group">
                        <span class="required" style="color: red">*</span>
                        <label class="control-label">信件内容：</label>
                        <textarea name="letterContent" rows="5" class="form-control" id="letterContent"></textarea>
                    </div>
                    <div class="form-actions">
                        <div class="col-md-12">
                            <div class="col-md-offset-8" style="float:left;">
                                <button type="button" class="btn"
                                        id="letterSubmit">
                                    提交
                                </button>
                                <span id="labelmsg" class="label"></span>
                            </div>
                            <div class="col-md-offset-11">
                                <button onclick="javascript:window.history.back(-1)"
                                        class="btn" type="button">返回
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
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
</div>
<%--footer end--%>
</body>
<script>
    $(function () {

        $(".lf a").removeClass("active");
        $(".lf a").eq(4).addClass("active");

        //    导航切换
        $("#main_nav li").click(function () {
            $(this).children("a").attr("class", "active").parent("li")
                .siblings().children("a").removeClass("active");
        });

        $("#letterSubmit").click(function () {
            var type = $("#letterType").val();
            var title = $("#letterTitle").val();
            var content = $("#letterContent").val();
            if (type == "") {
                $("#labelmsg").text("请选择信件类型").addClass("label-danger");
            } else if (title == '' || title == null) {
                $("#labelmsg").text("请输入信件标题").addClass("label-danger");
            } else if (content == '' || content == null) {
                $("#labelmsg").text("请输入信件内容").addClass("label-danger");
            } else {
                $("#labelmsg").text('');
                $("#letterSubmit").attr("disabled", "disabled");
                $.post("${pageContext.request.contextPath }/letter/api/add",
                    $("#addLetter").serialize(),
                    function (res) {
                        if (res.success) {
                            $("#labelmsg").text(res.message).addClass("label-success");
                            setTimeout(function () {
                                window.location.reload();
                            }, 1000);
                        } else {
                            $("#labelmsg").text(res.message).addClass("label-danger");
                        }
                    }, "json");
            }
        });
    });
</script>
</html>
