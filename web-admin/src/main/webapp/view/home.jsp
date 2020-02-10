<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <title>内蒙古市养老</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/reset.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/assets/view/css/completer.css"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/favicon.ico"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/assets/home/lib/bootstrap-3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/home/css/style.css?v=1.1">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/alertStyle.css?v=2.0"/>
    <style>
        .js-alt {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            text-align: center;
            display: none;
            z-index: 9999;
        }

        .js-alt div {
            text-align: center;
            position: absolute;
            top: 40%;
            left: 38%;
            width: 26%;
            overflow: hidden;
            vertical-align: middle;
            background: #fff;
            padding: 15px;
        }

        .js-alt p {
            font-size: 18px;
            margin: 20px 0;
            text-align: center;
        }

        .js-alt a {
            display: inline-block;
            color: #ffffff;
            background: #20ABFF;
            width: 40%;
            margin: 0 auto;
            padding: 10px 0;
            text-decoration: none;
        }

        .js-alt a:hover {
            color: #ffffff;
        }

        .js-alt .cancel {
            background: #b2afb0;
        }

        #home_rota img {
            height: 342px;
            width: 513px;
        }

        .img-circle {
            width: 80px;
            height: 80px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div class="g-home">
    <div class="g-hd">
        <div class="m-center">
            <div class="m-hd">
                <div class="log"><img src="${pageContext.request.contextPath }/assets/home/img/home/log.png" alt="">
                </div>
                <div class="hotLine"><img src="${pageContext.request.contextPath }/assets/home/img/home/hotline.png"
                                          alt="" class="icon"> 24小时热线：12349
                </div>
            </div>
        </div>
    </div>
    <div class="g-nav">
        <div class="m-center">
            <div class="m-nav">
                <ul>
                    <li class="z-current"><a href="${pageContext.request.contextPath }/home.html">首页</a></li>
                    <li><a href="${pageContext.request.contextPath }/moduleMes/list/1">新闻宣传</a></li>
                    <li><a href="${pageContext.request.contextPath }/serviceOrgMap.html">地图查询</a></li>
                    <li><a href="#">为老服务</a></li>
                    <li><a href="${pageContext.request.contextPath }/letter/add">12349信箱</a></li>
                    <li><a href="#">特色养老</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="g-banner">
        <div class="m-center">
            <div class="m-login">
                <div class="hd"><img src="${pageContext.request.contextPath }/assets/home/img/home/nav-hd.png" alt="">
                </div>
                <div class="bd">
                    <div class="wrap">
                        <div class="m-tab">
                            <ul class="tab-hd">
                                <shiro:authenticated>
                                    <li class="z-current">
                                        个人信息
                                    </li>
                                    <shiro:hasRole name="serviceobject">
                                        <li><a href="${pageContext.request.contextPath }/user/user_profile.html">
                                            <span>个人中心</span></a></li>
                                    </shiro:hasRole>
                                    <shiro:hasAnyRoles name="suadmin,muadmin,readmin,stadmin,coadmin,zuadmin,assessuser,monitoradmin,monitoruser">
                                        <li><a href="${pageContext.request.contextPath }/admin/index.html">
                                            <span>管理后台</span></a></li>
                                    </shiro:hasAnyRoles>
                                </shiro:authenticated>
                                <shiro:notAuthenticated>
                                    <li class="z-current">
                                        会员登录
                                    </li>
                                    <li><a href="${pageContext.request.contextPath }/register.html">
                                        <span>注册会员</span></a></li>
                                </shiro:notAuthenticated>
                            </ul>
                            <div class="tab-bd">
                                <shiro:authenticated>
                                    <div class="tab-panel" style="display: block;">
                                        <div class="lf personal_info">
                                            <div style="text-align: center">
                                                <c:if test="${empty sessionScope.login_user.avatar}">
                                                    <img alt="" class="img-circle"
                                                         src="${pageContext.request.contextPath }/assets/admin/layout/img/avatar3_small.jpg"/>
                                                </c:if>
                                                <c:if test="${not empty sessionScope.login_user.avatar}">
                                                    <img id="avatarImg" alt="" class="img-circle"
                                                         src="${pageContext.request.contextPath }${sessionScope.login_user.avatar}"/>
                                                </c:if>
                                            </div>
                                            <p style="margin-bottom: 10px"><span
                                                    class='tit'>用户名: </span><strong> ${sessionScope.login_user.login_name}</strong>
                                            </p>
                                            <shiro:hasAnyRoles name="suadmin,muadmin,readmin,stadmin,coadmin,zuadmin,assessuser,monitoradmin,monitoruser">
                                                <p style="margin-bottom: 10px"><span
                                                        class='tit'>所在区域: </span><strong> ${sessionScope.login_user.areaName}</strong>
                                                </p>
                                                <p style="margin-bottom: 10px"><span
                                                        class='tit'>昵称: </span><strong> ${sessionScope.login_user.nick_name}</strong>
                                                </p>
                                            </shiro:hasAnyRoles>
                                            <shiro:hasRole name="serviceobject">
                                                <div class="sign">
                                                    <a href="/logout" class="sign-tn">注销</a>
                                                </div>
                                            </shiro:hasRole>
                                        </div>
                                    </div>
                                </shiro:authenticated>
                                <shiro:notAuthenticated>
                                    <div class="tab-panel" style="display: block;">
                                        <form action="${pageContext.request.contextPath }/login" id="hoem_forms">
                                            <div class="input username"><input type="text" name="login_name"
                                                                               placeholder="用户名"></div>
                                            <div class="input password"><input type="password" name="pass_word"
                                                                               placeholder="密码"></div>
                                            <div class="read"><label for="read"><input name="agree" type="checkbox"
                                                                                       id="read" class="check" value="1"
                                                                                       checked>我已阅读并接受 <a href="#">《注册问题条款》</a></label>
                                            </div>
                                            <div class="sign">
                                                <input type="button" id="loginBtn" class="sign-tn" value="立即登陆">
                                            </div>
                                        </form>
                                    </div>
                                </shiro:notAuthenticated>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="g-notice" id="notice">
        <div class="m-center">
            <div class="m-notice">
                <div class="hd">通知公告 <span class="line"></span></div>
                <div class="bd">
                    <div id="carousel-notice" class="carousel slide carousel-notice" data-ride="carousel">
                        <div class="carousel-inner js-notive" role="listbox">
                            <%--<div class="item active" style="display: none">--%>
                            <%--<img src="${pageContext.request.contextPath }/assets/home/img/home/dot.png" alt="" class="dot"> 尊老敬贤，总书记为我们率先垂范--%>
                            <%--</div>--%>
                        </div>
                        <a class="carousel-control carousel-control-left" href="#carousel-notice" role="button"
                           data-slide="prev">
                            <img src="${pageContext.request.contextPath }/assets/home/img/home/notice-left.png" alt="">
                        </a>
                        <a class="carousel-control  carousel-control-right" href="#carousel-notice" role="button"
                           data-slide="next">
                            <img src="${pageContext.request.contextPath }/assets/home/img/home/notice-right.png" alt="">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="g-dynamic">
        <div class="m-center">
            <div class="g-dynamic-left">
                <div class="m-dynamic">
                    <div class="hd"><img src="${pageContext.request.contextPath }/assets/home/img/home/hd.png" alt=""
                                         class="icon">养老行业动态
                    </div>
                    <div class="recommend">
                        <div class="title">推荐</div>
                        <div class="cont">
                            <a id="xc_news" class="js-Carousel" style="cursor: pointer"></a>
                            <p class="txt_con" id="xc_news_content" style="height: 45px;display: none"></p>
                        </div>
                    </div>
                    <div class="ft">
                        <ul class="list_con " id="moduleMesUl1" style="padding: 10px 0">
                        </ul>
                        <div class="more"><a href="${pageContext.request.contextPath }/moduleMes/list/1">更多>></a></div>
                    </div>
                </div>
            </div>
            <div class="g-dynamic-right">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <%--<ul class="home_rota" id="home_rota" style=" width:420px; height:287px;">--%>
                    <%--</ul>--%>
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    </ol>
                    <div class="carousel-inner" role="listbox" id="home_rota">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="g-list">
        <div class="m-center">
            <div class="m-list">
                <div class="hd">
                    <img src="${pageContext.request.contextPath }/assets/home/img/home/hd.png" alt="" class="icon">
                    <ul class="tab-hd">
                        <li class="z-current">养老聚焦</li>
                        <li>服务风采</li>
                        <li>惠老政策公开</li>
                    </ul>
                </div>
                <div class="tab-bd">
                    <div class="tab-panel" style="display: block;">
                        <ul id="moduleMesUl2">
                        </ul>
                        <div class="more">
                            <a href="${pageContext.request.contextPath }/moduleMes/list/2">更多>></a>
                        </div>
                    </div>
                    <div class="tab-panel">
                        <ul id="moduleMesUl7">
                        </ul>
                        <div class="more">
                            <a href="${pageContext.request.contextPath }/moduleMes/list/7">更多>></a>
                        </div>
                    </div>
                    <div class="tab-panel">
                        <ul id="moduleMesUl8">
                        </ul>
                        <div class="more">
                            <a href="${pageContext.request.contextPath }/moduleMes/list/12">更多>></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="g-map" id="yl_map">
        <div class="m-center">
            <div class="m-map">
                <div class="hd"><img src="${pageContext.request.contextPath }/assets/home/img/home/hd.png" alt=""
                                     class="icon">养老服务地图查询
                </div>
                <div class="bd">
                    <div class="m-search">
                        <div class="wrap">
                            <div class="title">精准查询</div>
                            <div class="line">
                                <select name="typeId" id="typeId" onchange="Home.selectTypeId()">
                                    <option value="0">服务组织</option>
                                    <option value='9'>养老机构</option>
                                </select>
                            </div>
                            <div class="line">
                                <select name="area2" id="area2">
                                    <option value="">所在区</option>
                                    <option value="2">海陵区</option>
                                    <option value="3">高港区</option>
                                    <option value="4">姜堰区</option>
                                    <option value="5">兴化市</option>
                                    <option value="6">靖江市</option>
                                    <option value="7">泰兴市</option>
                                    <option value="8">医药高新区</option>
                                </select>
                            </div>
                            <div class="line">
                                <select name="institutionTypeDictId" id="institutionTypeDictId">
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
                            </div>
                            <div class="line">
                                <input type="text" class="search">
                            </div>
                            <div class="search" id="search">
                                <input type="submit" class="search-btn" value="查询">
                            </div>
                        </div>
                    </div>
                    <input type="text" id="suggestId" class="form-control input-inline input-sm"
                           placeholder="搜索地址..." style="position: absolute; z-index: 1;display: none;">
                    <div id="allmap" style="height: 400px;width: 65%"></div>
                </div>
            </div>
        </div>
        <div class="g-friendLink">
            <div class="m-center">
                <div class="m-friendLink">
                    <div class="hd">友情链接</div>
                    <div class="bd">
                        <p><a href="">鞍山民政</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://www.jjmz.gov.cn/">鞍山民政网</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                                href="#">全国民政</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                                href="http://www.mca.gov.cn/">中华人民共和国民政部</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                            <a href="http://www.bjmzj.gov.cn/templet/mzj/index.shtml">北京民政网</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                                    href="http://www.shmzj.gov.cn/gb/shmzj/index.html">上海民政网</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                                    href="http://www.jsmz.gov.cn/">江苏民政网</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                                    href="http://www.gdmz.gov.cn/">广东民政网</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                                    href="http://www.qhmz.gov.cn/picture.php">青海民政网</a></p>
                        <p><a href="">为老网</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://www.zglnfw.com/">为老老年服务网</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                                href="http://www.china5080.com/">乐龄网</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                                href="http://www.lnrzj.com/">老年人之家</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                            <a href="#">养老网</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://www.zg165.cn/index.htm">养老中国</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                                    href="http://cisse.casw.org.cn/">中国养老社工网</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                                    href="http://www.sinoyanglao.com">中华养老网</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                                    href="http://www.chinaylw.com/">中国现代养老</a></p>
                        <p><a href="http://www.yanglaocn.com/">养老信息网</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">新闻天下</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                                href="http://www.people.com.cn/">人民网</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                                href="http://www.cctv.com/">央视网</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                            <a href="http://www.eastday.com/">东方网</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                                    href="http://www.xinhuanet.com/">新华网</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                                    href="http://www.china.com.cn/">中国网</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                                    href="http://www.cri.cn/">国际在线网</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                                    href="http://www.yangtse.com/">扬子晚报</a></p>
                    </div>
                </div>
            </div>
        </div>
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


    <!-- 关闭浮动二维码窗口 -->
    <script type="text/javascript">
        function close_yc() {
            document.getElementById('ycfd').style.display = 'none';
            document.getElementById('close_img').style.display = 'none';
        }
    </script>
</div>
<div id="alertModal" class="js-alt">
    <div>
        <img src="${pageContext.request.contextPath }/assets/admin/pages/img/info.png" alt=""/>
        <p class="alertModalMes">
        </p>
        <a class="btn cancel" style="width: 80%; background: #20ABFF;">确定</a>
    </div>
</div>
<script src="${pageContext.request.contextPath }/assets/home/lib/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/home/lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/home/lib/roundabout/jquery.roundabout.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/view/js/home.js?v=6.3"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=UtTMI5ofPulxrOYjzLcEWHGXRlyAEfUB"></script>
<script type="text/javascript"
        src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/view/js/InfoBox.js"></script>
<script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/Global.js?v=1.1"
        type="text/javascript"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/service_org_map.js?v=7.1"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/institution_map.js?v=9.2"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/global/scripts/md5.js"></script>
<script src="${pageContext.request.contextPath }/assets/view/js/register.js"></script>
</body>

<script>
    $(function () {
        window.apppath = '${pageContext.request.contextPath }';
        var message = "${requestScope.message_login}";
        if (message != null && message != "") {
            alert(message, function () {
                window.location.href = window.apppath + "/home.html";
            });
        }
        Home.init();
        Home.searchInit();
        ServiceOrgMap.init();
        ServiceOrgMap.setIsClick(true);
        ServiceOrgMap.addMarker("");


        $('.tab-hd li').click(function () {
            $(this).addClass('z-current').siblings().removeClass('z-current');
            $('.tab-bd .tab-panel').eq($(this).index()).show().siblings().hide();
        });

        $('.m-list .tab-hd li').click(function () {
            $(this).addClass('z-current').siblings().removeClass('z-current');
            $('.m-list .tab-bd .tab-panel').eq($(this).index()).show().siblings().hide();
        });

        $('.mmul').roundabout({
            minScale: 0.9,
            autoplay: true,
            autoplayDuration: 4000,
            autoplayPauseOnHover: true
        });


        // 验证码
        var second = 60;
        var isClick = true;
        $('.j-code').click(function () {
            var self = $(this);
            if (isClick) {
                isClick = false;
                self.addClass('z-dis').text('重新发送(' + second + 's)');
                var timer = setInterval(function () {
                    if (second <= 0) {
                        clearInterval(timer);
                        second = 60;
                        self.removeClass('z-dis').text('立即发送');
                        isClick = true;
                    }
                    else {
                        second--;
                        self.text('重新发送(' + second + 's)');
                    }
                }, 1000)
            }
        });
    });
</script>
</html>