<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shiroL" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>内蒙古市养老服务信息平台</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="${pageContext.request.contextPath }/assets/global/plugins/font-awesome/css/font-awesome.min.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/assets/global/plugins/simple-line-icons/simple-line-icons.min.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/css/bootstrap.min.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/assets/global/plugins/uniform/css/uniform.default.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css"
          rel="stylesheet" type="text/css"/>
    <!-- BEGIN THEME STYLES -->
    <link href="${pageContext.request.contextPath }/assets/global/css/components.css" id="style_components"
          rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath }/assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath }/assets/admin/layout/css/layout.css" rel="stylesheet"
          type="text/css"/>
    <link id="style_color" href="${pageContext.request.contextPath }/assets/admin/layout/css/themes/default.css"
          rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath }/assets/admin/layout/css/custom.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath }/assets/global/plugins/bootStrap-addTabs/theme/css/bootstrap.addtabs.css"
          rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/alertStyle.css"/>
    <style>
        body {
            font-family: "微软雅黑", sans-serif;
        }

        .badge {
            font-size: 11px !important;
            font-weight: 500;
            text-align: center;
            height: 17px;
            line-height: 11px;
            -moz-border-radius: 12px !important;
            border-radius: 9px !important;
            text-shadow: none !important;
            text-align: center;
            vertical-align: middle;
        }

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

        #tabs .nav li {
            text-align: center;
            min-width: 137.6px
        }

        #tabs .nav li.active a {
            color: white;
            background-color: #4b8df8;
        }

        #tabs .nav .close-tab {capacityList
            color: white;
        }

        .tab-content .slimScrollDiv {
            height: 200px;
        }
        .img-circle{
            width: 30px;
            height: 30px;
        }

    </style>
</head>
<body style="height: 100%;overflow: hidden"
      class="page-header-fixed page-quick-sidebar-over-content page-sidebar-fixed page-sidebar-closed-hide-logo"
      onload="dwr.engine.setActiveReverseAjax(true);dwr.engine.setNotifyServerOnPageUnload(true,true);dwr.engine.setErrorHandler(function(){});"
>
<!-- BEGIN HEADER -->
<%--呼叫中心呼叫提示音--%>
<div id="oCallSound"></div>
<div class="page-header navbar navbar-fixed-top"
     style="background: url('${pageContext.request.contextPath }/assets/admin/pages/img/top_bg.jpg') no-repeat;background-size:100% 100%; background-attachment:fixed;">
    <!-- BEGIN HEADER INNER -->
    <div class="page-header-inner">
        <!-- BEGIN LOGO -->
        <div class="page-logo" style="width: 700px">
            <a href="index.html">
                <img src="${pageContext.request.contextPath }/assets/admin/pages/img/logo.png" alt="logo"
                     class="logo-default" style="width: 55px;margin: 8px;"/>
            </a>
            <h2 style="color:white; line-height: 35px;font-size:30px;font-family: '微软雅黑'; font-weight: 400;margin-left: 20px">
                养老事业服务管理平台</h2>
        </div>
        <!-- END LOGO -->
        <!-- BEGIN RESPONSIVE MENU TOGGLER -->
        <a href="javascript:" class="menu-toggler responsive-toggler" data-toggle="collapse"
           data-target=".navbar-collapse">
        </a>
        <!-- END RESPONSIVE MENU TOGGLER -->
        <!-- BEGIN TOP NAVIGATION MENU -->
        <div class="top-menu">
            <ul class="nav navbar-nav pull-right">
                <!-- BEGIN NOTIFICATION DROPDOWN -->
                <li class="dropdown dropdown-extended dropdown-notification" id="header_notification_bar">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                       data-close-others="true">
                        <i class="icon-bell"></i>
                        <span id="unDoThingCount" class="badge badge-default">0</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <p>
                                待办事项
                            </p>
                        </li>
                        <li>
                            <ul class="dropdown-menu-list scroller" style="height: 150px;">
                                <li>
                                    <a url="${pageContext.request.contextPath }/admin/message/receive/list"
                                       data-addtab="unReadMessage" title="未读公告">
									<span class="label label-sm label-icon label-success">
									<i class="fa fa-plus"></i>
									</span>
                                        您有<span id="sysMesCount">0</span>未读公告
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>

                <li class="dropdown dropdown-extended dropdown-inbox" id="header_inbox_bar" style="display: block">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                       data-close-others="true" style="color: white">
                        <i class="icon-envelope-open"></i>
                        <span class="badge badge-default taskNum" style="right: 90px;top:9px">
					        0
                        </span>
                        未完成工单
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <p>
                                有<span class="taskNum">0</span>个工单
                            </p>
                        </li>
                        <li>
                            <ul class="dropdown-menu-list scroller " id="newTaskUl" style="height: 200px;">
                            </ul>
                        </li>
                        <li class="external">
                            <a href="javascript:" onclick="Index.removeAllTask()">
                                查看所有工单 <i class="m-icon-swapright pull-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="dropdown" style="display: none;" id="monitorLi">
                    <a href="javascript:" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                       data-close-others="true" style="color: white">
                        状态：
                        <span class="monitorStatus" id="monitorStatus" onclick="signInOrOut(this)"> </span>
                    </a>

                </li>

                <li class="dropdown dropdown-quick-sidebar-toggler">
                    <a id="logout" class="dropdown-toggle"
                       style="color: white;vertical-align: text-bottom;">
                        <i class="fa fa-power-off"></i> 注销
                    </a>
                </li>
                <li class="dropdown dropdown-user">
                    <a href="javascript:" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                       data-close-others="true">
                        <c:if test="${empty sessionScope.login_user.avatar}">
                            <img alt="" class="img-circle"
                                 src="${pageContext.request.contextPath }/assets/admin/layout/img/avatar3_small.jpg"/>
                        </c:if>
                        <c:if test="${not empty sessionScope.login_user.avatar}">
                            <img id="avatarImg" alt="" class="img-circle"
                                 src="${pageContext.request.contextPath }${sessionScope.login_user.avatar}"/>
                        </c:if>
                        <span class="username username-hide-on-mobile">
                            ${sessionScope.login_user.nick_name}</span>
                        <i class="fa fa-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-default">
                        <li>
                            <a url="${pageContext.request.contextPath }/admin/user/index/1" data-addtab="user_info"
                               title="个人信息">
                                <i class="icon-user"></i> 个人信息 </a>
                        </li>
                        <li>
                            <a url="${pageContext.request.contextPath }/admin/user/index/2"
                               data-addtab="user_update_avatar" title="更新头像">
                                <i class="fa fa-undo"></i> 更新头像 </a>
                        </li>
                        <li>
                            <a url="${pageContext.request.contextPath }/admin/user/index/3"
                               data-addtab="user_update_pwd" title="修改密码">
                                <i class="icon-key"></i> 修改密码 </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- END TOP NAVIGATION MENU -->
    </div>
    <!-- END HEADER INNER -->
</div>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->
    <div class="page-sidebar-wrapper">
        <div class="page-sidebar navbar-collapse collapse">
            <shiro:hasAnyRoles name="suadmin,muadmin,readmin,stadmin,coadmin">
                <jsp:include page="menu-admin.jsp"></jsp:include>
            </shiro:hasAnyRoles>
            <shiro:hasRole name="zuadmin">
                <jsp:include page="menu_service_org.jsp"></jsp:include>
            </shiro:hasRole>
            <shiro:hasRole name="jgadmin">
                <jsp:include page="menu_institution.jsp"></jsp:include>
            </shiro:hasRole>
            <shiro:hasRole name="assessuser">
                <jsp:include page="menu_assess_user.jsp"></jsp:include>
            </shiro:hasRole>
            <shiro:hasAnyRoles name="monitoradmin,monitoruser">
                <jsp:include page="menu_monitor.jsp"></jsp:include>
            </shiro:hasAnyRoles>
        </div>
    </div>
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <div class="page-content" style="background-color: #F4F8FB;">
            <div class="row">
                <div class="col-md-12" style="padding-right: 10px">
                    <div class="full-height-content full-height-content-scrollable">
                        <div id="tabs" style="padding: 0px">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active" id="tab_tab_home"
                                    aria-url="${pageContext.request.contextPath }/admin/home">
                                    <a href="#tab_home" aria-controls="tab_home" role="tab" data-toggle="tab">主页</a>
                                </li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content" style="">
                                <div role="tabpanel" class="tab-pane active" id="tab_home">
                                    <iframe name="iframeIndex" id="iframe " class="iframeClass full-height-content-body"
                                            frameborder="no" border="0"
                                            src="${pageContext.request.contextPath }/admin/home"
                                            style="width: 100%;background-color: #F4F8FB"></iframe>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END CONTENT -->
    <!-- END CONTENT -->
</div>
<div id="alt-mge" class='alert_wrap' style="display: none">
    <div class="alert_main">
        <div class="alert_wrap_con">
            <div class="alert_head_wrap">
                <h4 style="margin: 0px;padding: 10px">工单信息</h4>
                <a class="cancel" href="javascript:void(0)">×</a>
            </div>
            <div class="alert_info_con">
                <img src="${pageContext.request.contextPath }/assets/admin/pages/img/kf.png" alt=""/>
                <p id="alertMes"></p>
                <input id="changeUrl" type="hidden"/>
            </div>
            <div class="alert_btm_con">
                <a href="javascript:void(0)" class="confirm sure">确定</a>
                <a href="javascript:void(0)" class="cancel">取消</a>
            </div>
        </div>
    </div>
</div>

<div id="alertModal" class="js-alt">
    <div>
        <img src="${pageContext.request.contextPath }/assets/admin/pages/img/info.png" alt=""/>
        <p class="alertModalMes">
        </p>
        <a class="btn cancel" style="width: 80%; background: #20ABFF;">确定</a>
    </div>
</div>
<div class='alert_wrap' id="logoutModal" style="display: none">
    <div class="alert_main">
        <div class="alert_wrap_con">
            <div class="alert_head_wrap">
                <h3 style="margin: 0px;padding: 10px">确认信息</h3>
                <a href="javascript:void(0)">×</a>
            </div>
            <div class="alert_info_con">

                <img src="${pageContext.request.contextPath }/assets/admin/pages/img/user.png" alt=""/>
                <p>确认退出！</p>
            </div>
            <div class="alert_btm_con">
                <a href="javascript:void(0)" class=" sure confirm">确定</a>
                <a href="javascript:void(0)" class="cancel">取消</a>
            </div>
        </div>
    </div>
</div>


<div id="alertModal2" class='alert_wrap' style="display: none">
    <div class="alert_main">
        <div class="alert_wrap_con">
            <div class="alert_head_wrap">
                <h4 style="margin: 0px;padding: 10px">提示信息</h4>
                <a class="cancel" href="javascript:void(0)">×</a>
            </div>
            <div class="alert_info_con">
                <p class="alertModalMes"></p>
            </div>
            <div class="alert_btm_con">
                <a href="javascript:void(0)" style="width: 30%" class="confirm lg_btn">确定</a>
                <a href="javascript:void(0)" style="width: 30%;margin-left: 20%" class="cancel lg_btn">取消</a>

            </div>
        </div>
    </div>
</div>


<div id="confrimModal3" class='alert_wrap' style="display: none">
    <div class="alert_main">
        <div class="alert_wrap_con">
            <div class="alert_head_wrap">
                <h4 style="margin: 0px;padding: 10px">提示信息</h4>
                <a class="cancel" href="javascript:void(0)">×</a>
            </div>
            <div class="alert_info_con">
                <p class="alertModalMes"></p>
            </div>
            <div class="alert_btm_con">
                <a href="javascript:void(0)" style="width: 30%" class="confirm btn1 lg_btn">确定</a>
                <a href="javascript:void(0)" style="width: 30%;margin-left: 20%" class="cancel btn2 lg_btn">取消</a>

            </div>
        </div>
    </div>
</div>

<div id="confrimModal4" class='alert_wrap' style="display: none">
    <div class="alert_main">
        <div class="alert_wrap_con">
            <div class="alert_head_wrap">
                <h4 style="margin: 0px;padding: 10px">提示信息</h4>
                <a class="cancel" href="javascript:void(0)">×</a>
            </div>
            <div class="alert_info_con">
                <p class="alertModalMes"></p>
                <p style="margin-top: 16px">
                    备注：<input type="text" name="content" class="form-control"
                              style="    display: inline-block;width: 260px">
                </p>
            </div>
            <div class="alert_btm_con">
                <a href="javascript:void(0)" style="width: 30%" class="confirm btn1 lg_btn">确定</a>
                <a href="javascript:void(0)" style="width: 30%;margin-left: 20%" class="cancel btn2 lg_btn">取消</a>

            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="ldmodel" tabindex="" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title" id="myModalLabel">来电提醒</h4>
            </div>
            <div class="modal-body" style="height: 130px;">
                <img id="khphoto" src="" style="display:none;float: left;width:90px;height: 100px;">
                <div style="margin-left: 10px;float: left;">
                    <div>
                        <label>来电号码：</label>
                        <div id="ldhm" style="display: inline;"></div>
                    </div>
                    <div class="KHInfo">
                        <label>客户姓名：</label>
                        <div style="display: inline;" id="khxm"></div>
                    </div>
                    <div class="KHInfo">
                        <label>身份证号：</label>
                        <div style="display: inline;" id="khidcard"></div>
                    </div>
                    <div class="KHInfo">
                        <label>家庭住址：</label>
                        <div style="display: inline;" id="khaddress"></div>
                    </div>
                    <div id="unknowKH" style="display:none;">
                        <label>客户信息：</label>
                        <div style="display: inline;">未知</div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">我知道了
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div id="successModal" class='alert_wrap' style="display: none;position: fixed;width: 100%;height: 100%;z-index: 100;">
    <div class="alert_main">
        <div class="alert_wrap_con">
            <div class="alert_head_wrap">
                <h3 class="successModalTitle" style="margin: 0px;padding: 10px"></h3>
                <a class="cancel" href="javascript:void(0)">×</a>
            </div>
            <div class="alert_info_con">
                <img src="${pageContext.request.contextPath }/assets/admin/pages/img/success.png" alt=""/>
                <p style="text-align: center" class="successModalMes"></p>
            </div>
            <div class="alert_btm_con">
                <a href="javascript:void(0)" class="confirm lg_btn">确定</a>
            </div>
        </div>
    </div>
</div>


<div id="confirmModal2" class='alert_wrap' style="display: none">
    <div class="alert_main">
        <div class="alert_wrap_con">
            <div class="alert_head_wrap">
                <h3 style="margin: 0px;padding: 10px">审核信息</h3>
                <a class="cancel" href="javascript:void(0)">×</a>
            </div>
            <div class="alert_info_con">

                <img src="${pageContext.request.contextPath }/assets/admin/pages/img/ask.png" alt=""/>
                <p class="confirmModalMes"></p>
            </div>
            <div class="alert_btm_con">
                <a href="javascript:void(0)" class="confirm">确定</a>
                <a href="javascript:void(0)" class="cancel">取消</a>
            </div>
        </div>
    </div>
</div>


<!-- END FOOTER -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/global/plugins/respond.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath }/assets/global/plugins/jquery.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/jquery-migrate.min.js"
        type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="${pageContext.request.contextPath }/assets/global/plugins/jquery-ui/jquery-ui.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/js/bootstrap.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/jquery.blockui.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/jquery.cokie.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/uniform/jquery.uniform.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js"
        type="text/javascript"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
<!-- END CORE PLUGINS -->
<script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/Global.js?v=1.1"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/index.js?v=1.1"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/scripts/md5.js?v=1.1"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/bootStrap-addTabs/theme/js/bootstrap.addtabs.js?v=2.8"></script>
<!--DWR消息推送 START-->
<script type='text/javascript' src='${pageContext.request.contextPath }/dwr/engine.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/dwr/util.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/dwr/interface/DwrService.js'></script>
<script src="${pageContext.request.contextPath }/assets/global/scripts/popwin.js"
        type="text/javascript"></script>
<SCRIPT src="${pageContext.request.contextPath }/assets/admin/pages/scripts/call/jquery.easyui.min.js"
        type="text/javascript"></SCRIPT>
<SCRIPT src="${pageContext.request.contextPath }/assets/admin/pages/scripts/call/wabacus_system.js"
        type="text/javascript"></SCRIPT>
<SCRIPT src="${pageContext.request.contextPath }/assets/admin/pages/scripts/call/wabacus_util.js"
        type="text/javascript"></SCRIPT>
<SCRIPT src="${pageContext.request.contextPath }/assets/admin/pages/scripts/call/wabacus_tools.js"
        type="text/javascript"></SCRIPT>
<SCRIPT src="${pageContext.request.contextPath }/assets/admin/pages/scripts/call/wabacus_api.js"
        type="text/javascript"></SCRIPT>
<SCRIPT src="${pageContext.request.contextPath }/assets/admin/pages/scripts/call/artDialog.js"
        type="text/javascript"></SCRIPT>
<SCRIPT src="${pageContext.request.contextPath }/assets/admin/pages/scripts/call/ctiClient-1.1.js"
        type="text/javascript"></SCRIPT>
<!--DWR消息推送 END  -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<!-- END PAGE LEVEL SCRIPTS -->
<script>
    <%--dwrMethod--%>
    ////初始化dwr，存入个人id来识别身份
    function onPageLoad() {
        $("iframe").css("width", "100%")
        // 获取URL中的name属性为唯一标识符
        var userId = "${sessionScope.login_user.uid}";
        // 通过代理，传入区别本页面的唯一标识符
        DwrService.onPageLoad(userId);
    }


    /**
     * 有task推送
     */
    function hasATask(str) {
        var task = eval("(" + str + ")");
        addATaskTag(task.id, task.title, task.createTime, task.creatorName);
    }

    /**
     *  有 消息推送
     **/
    function hasAMsg(msg, type) {
        if (type == "off") {
            $.ajax({
                url: window.apppath + "/admin/api/user/getUserStatus",    //请求的url地址
                async: true,//请求是否异步，默认为异步，这也是ajax重要特性
                type: "POST",   //请求方式
                success: function (data) {
                    if (isNaN(data)) {
                        //判断是否被下线
                        $.ajax({
                            url: window.apppath + "/admin/isLogin",    //请求的url地址
                            async: true,//请求是否异步，默认为异步，这也是ajax重要特性
                            type: "POST",   //请求方式
                            data: {
                                name: msg
                            },
                            success: function (res) {
                                console.log(res)
                                var strs = "您的账号在另一个地点登陆，已被迫下线，如果不是您本人的操作，请重新登陆后修改密码！"
                                if (res == 1) {
                                }
                                else {
                                    strs = "您的账号由于长时间不操作，已被迫下线，请重新登陆";
                                }

                                alert3(strs, function () {
                                    window.location.href = window.apppath + "/admin/login.jsp";
                                }, function () {
                                    window.location.href = window.apppath + "/admin/login.jsp";
                                });
                            },
                        });
                    }
                }
            });
        } else if (type == "2") {
            $.post(window.apppath + "/admin/api/message/getUnReadMessage", {}, function (res) {
                if (res != null) {
                    if (res.length > 0) {
                        $("#sysMesCount").html(res.length);
                        $("#unDoThingCount").html(res.length);
                    } else {
                        $("#sysMesCount").html(0);
                        $("#unDoThingCount").html(0);
                    }
                }
            }, "json");
        }
    }

    /**
     * 显示有一条未读工单
     *
     */
    function addATaskTag(id, title, createTime, sendName) {
        var num = $("#newTaskUl li").length + 1;
        $(".taskNum").html(num);
        var html = '<li id="task' + id + '">' +
            '<a  href="javascritp:void(0);"   data="' + id + '">' +
            '<span class="subject">' +
            '<span class="from">' +
            sendName + '发来一个工单</span>' +
            '<span class="time">' +
            createTime + ' </span>' +
            '</span>' +
            '<span class="message">' +
            title + ' </span>' +
            '</a>' +
            '</li>';
        $("#newTaskUl").html(html + $("#newTaskUl").html());
    }

    /**
     * 减去有一条未读工单
     *
     */
    function removeATaskTag(id) {
        $("#task" + id).remove();
        Index.subATask();
    }


    /**
     * 添加通知信息
     *
     */
    function addMessage(title, content, type) {
        $.post(window.apppath + "/admin/api/message/send", {
            title: title,
            content: content,
            type: type
        }, function (res) {
            console.log(res.message);
        }, 'json');
    }

    /**
     * 推送
     * @param userId
     * @param task
     */
    function sendTask2User(userId, task) {
        DwrService.sendTask2User(userId, task);
    }

    /**
     * 推送信息
     */
    function sendMessgaeToUser(userId, type, content) {
        console.log(userId);
        DwrService.sendMessgaeToUser(userId, type, content)
    }


    if (window.top != window.self) {//存在父页面
        window.parent.location.reload();
    }

    jQuery(document).ready(function () {
        Metronic.init();
        Layout.init();
        window.apppath = '${pageContext.request.contextPath }';

        window.onresize = function () {
            $(".tab-pane iframe").height(window.innerHeight - 140);
            $(".tab-pane iframe").css("width", "100%");
            $(".tab-content .slimScrollDiv").height($("iframe").height());
        };

        onPageLoad();
        window.onresize();
        $('#tabs').addtabs();
        Index.init("${sessionScope.login_user.uid}", "${userRole.id}", "${userRole.name}");
        //退出
        $("#logout").click(function () {
            $('#logoutModal').show();
        });

        $("#logoutModal .sure").click(function () {
            $("#logoutModal").hide();
            window.location.href = "${pageContext.request.contextPath }/admin/logout";
        });

        $(".js-alt .cancel").click(function () {
            $(".js-alt").fadeOut();
        });
        $(".alert_head_wrap a").click(function () {
            $('.alert_wrap').hide();
        });
        $(".alert_wrap .cancel").click(function () {
            $('.alert_wrap').hide();
        });
    });


</script>
</body>
</html>