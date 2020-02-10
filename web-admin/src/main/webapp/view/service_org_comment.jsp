<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <title>内蒙古市养老</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/assets/home/lib/bootstrap-3.3.7/css/bootstrap.min.css">
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

        .evaluate-cont {
            margin-top: 20px;
            border-top: 1px solid #e8ebed;
        }

        .evaluate-cont .level {
            padding-top: 35px;
            padding-bottom: 35px;
        }

        .evaluate-cont .level ul {
            overflow: hidden;
            zoom: 1;
            width: 361px;
            margin: 0 auto;
        }

        .evaluate-cont .level ul li {
            float: left;
            width: 105px;
            height: 100px;
            margin-right: 20px;
            padding-top: 15px;
            border: 1px solid #ffffff;
            text-align: center;
            cursor: pointer;
        }

        .evaluate-cont .level ul li .icon {
            display: inline-block;
            width: 46px;
            height: 46px;
            background-image: url(${pageContext.request.contextPath }/assets/view/images/satisfy_sprite.png);
        }

        .evaluate-cont .level ul li .icon.icon-0 {
            background-position: 0 -138px;
        }

        .evaluate-cont .level ul li .icon.icon-1 {
            background-position: 0 -230px;
        }

        .evaluate-cont .level ul li .icon.icon-2 {
            background-position: 0 -46px;
        }

        .evaluate-cont .level ul li .text {
            color: #333333;
            font-size: 16px;
        }

        .evaluate-cont .level ul li.z-selected {
            border-color: #ebebeb;
            background-color: #f0f0f0;
            -webkit-border-radius: 6px;
            -moz-border-radius: 6px;
            border-radius: 6px;
        }

        .evaluate-cont .level ul li.z-selected .icon.icon-0 {
            background-position: 0 -184px;
        }

        .evaluate-cont .level ul li.z-selected .icon.icon-1 {
            background-position: 0 0;
        }

        .evaluate-cont .level ul li.z-selected .icon.icon-2 {
            background-position: 0 -92px;
        }

        .evaluate-cont .level ul li.z-selected .text {
            color: #fbbf22;
        }

        .evaluate-cont .keys {
            margin-top: 10px;
            margin-bottom: 6px;
        }

        .evaluate-cont .keys ul {
            overflow: hidden;
            zoom: 1;
        }

        .evaluate-cont .keys ul li {
            float: left;
            width: 130px;
            height: 37px;
            line-height: 37px;
            margin-right: 10px;
            margin-bottom: 10px;
            border: 1px solid #dfdfdf;
            color: #666666;
            font-size: 14px;
            text-align: center;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            cursor: pointer;
        }

        .evaluate-cont .keys ul li.z-selected {
            border-color: #ffde89;
            background-color: #fff8e5;
        }

        .evaluate-cont .cont textarea {
            width: 97%;
            height: 165px;
            border: 1px solid #dfdfdf;
            color: #666666;
            font-size: 14px;
        }

        .evaluate-cont .submit, .evaluate-cont .g-register .g-bd .cont .inline .reset, .g-register .g-bd .cont .inline .evaluate-cont .reset {
            margin-top: 18px;
        }

        .evaluate-cont .submit .submit-btn, .evaluate-cont .g-register .g-bd .cont .inline .reset .submit-btn, .g-register .g-bd .cont .inline .evaluate-cont .reset .submit-btn, .evaluate-cont .detail .wrap .submit .reset-btn, .g-personal .main-right .bottom .detail .wrap .case .item .evaluate-cont .submit .reset-btn, .evaluate-cont .detail .wrap .g-register .g-bd .cont .inline .reset .reset-btn, .g-personal .main-right .bottom .detail .wrap .case .item .evaluate-cont .g-register .g-bd .cont .inline .reset .reset-btn, .g-personal .main-right .bottom .detail .wrap .g-register .g-bd .cont .inline .evaluate-cont .reset .reset-btn, .evaluate-cont .g-register .g-bd .cont .inline .g-personal .main-right .bottom .detail .wrap .reset .reset-btn, .g-register .g-bd .cont .inline .evaluate-cont .detail .wrap .reset .reset-btn, .g-register .g-bd .cont .inline .g-personal .main-right .bottom .detail .wrap .case .item .evaluate-cont .reset .reset-btn {
            display: inline-block;
            width: 127px;
            height: 36px;
            line-height: 36px;
            border: none;
            outline: none;
            text-align: center;
            color: #ffffff;
            font-size: 14px;
            background-color: #2862c6;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            cursor: pointer;
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
                <div class="log"><img src="${pageContext.request.contextPath }/assets/home/img/home/log.png" alt="">
                </div>
                <div class="weather">鞍山 <img src="${pageContext.request.contextPath }/assets/home/img/home/weather.png"
                                             alt="" class="icon"> 21°C-24°C &nbsp;&nbsp;| &nbsp;&nbsp;空气质量：<span
                        class="color">优</span></div>
                <div class="hotLine"><img src="${pageContext.request.contextPath }/assets/home/img/home/hotline.png"
                                          alt="" class="icon"> 24小时热线：12349
                </div>
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
    <!--头部  end-->
    <section id="main_con" class="content_box">
        <!--养老动态-->

        <!--左侧列表star-->
        <div id="news_lf_con">
            <h2>组织评价</h2>
        </div>
        <!--左侧列表end-->

        <!--右侧内容star-->
        <div id="news_rt_con">
            <div class="news_list_con_wrap">
                <div class="news_list_con_head">
                    <span>评价</span>
                    <ul>
                        <li><img src="${pageContext.request.contextPath }/assets/view/images/home_ico_03.png" alt=""/>
                        </li>
                        <li><a href="${pageContext.request.contextPath }/home.html">网站首页&gt;</a></li>
                        <li><a href="">组织评价</a></li>
                    </ul>
                </div>
                <!--新闻详情-->
                <div class="news_list_con news_detalis">
                    <div class="evaluate-cont">
                        <form action="" method="post">
                            <div class="level">
                                <ul class="j-evaluate">
                                    <li data-value="0" class="z-selected">
                                        <div class="icon icon-2"></div>
                                        <div class="text">非常满意</div>
                                    </li>
                                    <li data-value="1">
                                        <div class="icon icon-1"></div>
                                        <div class="text">满意</div>
                                    </li>
                                    <li data-value="2" style="margin-right: 0;">
                                        <div class="icon icon-0"></div>
                                        <div class="text">不满意</div>
                                    </li>
                                </ul>
                                <input type="hidden" value="0" class="starLevel" name="level">
                            </div>
                            <div class="keys">
                            </div>
                            <div class="cont">
                                <textarea id="comment" name="comment" style="height: 80px; width: 93%;"
                                          maxlength="30"></textarea>
                                <p class="tip" style="color:gray">请输入30个字以内！</p>
                            </div>
                            <div class="submit">
                                <input type="hidden" id="serviceOrgId" value="${serviceOrg.id}">
                                <input type="button" class="submit-btn" id="submit" value="提交">
                                <span id="labelmsg" class="label"></span>
                                <button onclick="javascript:window.history.back(-1)"
                                        class="submit-btn" type="button">返回
                                </button>
                            </div>
                        </form>
                    </div>
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
                <div class="v-code"><img src="${pageContext.request.contextPath }/assets/home/img/home/v-code.png"
                                         alt=""></div>
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


    });
    $('body').on('click', '.j-evaluate li', function () {
        $(this).addClass('z-selected').siblings().removeClass('z-selected');
        $(this).parents('.level').find('input').val($(this).attr('data-value'));
        var data = $(this).data("value");
        $(".starLevel").val(data);
    });

    $("#submit").click(function () {
        //判断满意度对应的等级
        var starLevel = $(".starLevel").val();
        var star = '';
        if ("0" == starLevel) {
            star = '5';
        } else if ("1" == starLevel) {
            star = '3';
        } else if ("2" == starLevel) {
            star = '1';
        } else {
            return false;
        }
        var serviceOrgId = $('#serviceOrgId').val();
        var comment = $('#comment').val();
        $("#letterSubmit").attr("disabled", "disabled");
        $.post("${pageContext.request.contextPath }/view/api/serviceOrg/addComment",
            {
                "serviceOrg.id": serviceOrgId,
                "comment": comment,
                "score": star,
            },
            function (res) {
                if (res.success) {
                    $("#labelmsg").text(res.message).addClass("label-success");
                    setTimeout(function () {
                        window.history.back(-1);
                    }, 1000);
                } else {
                    $("#labelmsg").text(res.message).addClass("label-danger");
                }
            }, "json");
    });
</script>
</html>
