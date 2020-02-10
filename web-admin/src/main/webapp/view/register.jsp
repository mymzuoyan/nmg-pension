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
    <title>用户注册</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/style.css?v=2.4"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/favicon.ico"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/home/lib/bootstrap-3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/home/css/style.css">
    <style>
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
                    <input type="text" placeholder="请输入相关文字">
                    <span class="search-btn"><img src="${pageContext.request.contextPath }/assets/home/img/home/search.png" alt=""></span>
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
    <div id="news_rt_con" style="width: 1165px;">
        <div class="news_list_con_wrap">
            <div class="news_list_con_head">
                <span>用户注册</span>
                <ul>
                    <li><img src="${pageContext.request.contextPath }/assets/view/images/home_ico_03.png" alt=""
                             style="    margin-top: -4px;"/></li>
                    <li><a href="${pageContext.request.contextPath }/home.html">网站首页&gt;</a></li>
                    <li><a href="">注册</a></li>
                </ul>
            </div>
            <!--新闻详情-->
            <div class="news_list_con news_detalis">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="login_name" class="col-sm-2 control-label">手机号码</label>
                        <div class="col-sm-10">
                            <input type="text" name="login_name" class="form-control" id="login_name"
                                   placeholder="请输入手机号码">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pass_word" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" name="pass_word" id="pass_word" placeholder="输入6-18位密码">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pass_word" class="col-sm-2 control-label">确认密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" name="pass_word2" id="pass_word2" placeholder="输入6-18位密码">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="identifyCode" class="col-sm-2 control-label">手机验证码</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control " name="identifyCode"  id="identifyCode"
                                   placeholder="请输入验证码">
                            <span class="help-block"></span>
                        </div>
                        <div class="col-sm-2">
                            <button id="sendCodeBtn" type="button" class="btn" onclick="Register.sendCode();">获取验证码</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-10">
                            <button type="button" class="btn btn-success register" onclick="Register.submitForm()">注 册</button>
                            <button type="button" class="btn cancel">返 回</button>
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
<%--footer end--%>
</div>
</body>
<script src="${pageContext.request.contextPath }/assets/view/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath }/assets/view/js/function.js"></script>
<script src="${pageContext.request.contextPath }/assets/global/scripts/md5.js"></script>
<script src="${pageContext.request.contextPath }/assets/view/js/register.js"></script>
<script>
    $(function () {
        window.apppath="${pageContext.request.contextPath }";
        Register.init();
    })
</script>
</html>
