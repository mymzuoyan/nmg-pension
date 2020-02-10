<%--
Created by IntelliJ IDEA.
User: Administrator
Date: 2016/9/12
Time: 20:41
To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>后台首页</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/admin/pages/css/map.css?v=1.6"/>
        <!--[if lt IE 9]>
        <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <style>
            .unit {
                font-size: 10px;
                margin-left: 5px;
            }

            .list_con {
                padding: 0px;
                width: 100%;
                overflow: hidden;
                height: 156px;
            }

            .list_con li {
                line-height: 30px;
                height: 30px;
            }

            .list_con a {
                color: #333;
                display: inline-block;
                max-width: 325px;
                vertical-align: middle;
                text-overflow: ellipsis;
                white-space: nowrap;
                overflow: hidden;
            }

            .list_con a:hover {
                color: #FF6600;
            }

            .details_lf_wrap .list_con a {
                max-width: 395px;
            }

            .details_wrap_half .list_con a {
                max-width: 435px;
            }

            .list_con img {
                margin: 0 3px;
            }

            .list_con .time_con {
                float: right;
                width: 55px;
                text-align: center;
                margin-right: 4px;
            }

            .details_rt_wrap .list_con a {
                max-width: 205px;
            }

            .row .col-new {
                width: 20%;
            }

            .dashboard-stat {
                position: relative;
            }

            .details_big {
                position: absolute;
                width: 100%;
                text-align: center;
            }

            .dashboard-stat .details_big .desc {
                padding-top: 18px;
                text-align: center;
                font-size: 21px;
                letter-spacing: 0px;
                font-weight: 300;
                color: #fff;
            }

            .dashboard-stat .details_big .number {
                text-align: right;
                font-size: 21px;
                line-height: 36px;
                letter-spacing: -1px;
                margin-bottom: 0px;
                font-weight: 300;
                color: #fff;
                text-align: center;
            }

            .unit1 {
                font-size: 21px;
                margin-left: 5px;
            }

        </style>


    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">

        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">管理后台</a>
                    <i class="fa fa-angle-right"></i>
                </li>
            </ul>
        </div>
        <!-- BEGIN DASHBOARD STATS -->
        <div class="row" style="overflow: visible;">
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-new">
                <div class="dashboard-stat red-intense">
                    <div class="visual">
                        <i class="fa fa-shopping-cart"></i>
                    </div>
                    <div class="details_big">
                        <div class="desc">
                            居家养老服务量
                        </div>
                        <div id="cardCount" class="number">
                            <span class="unit1">次</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-new">
                <div class="dashboard-stat yellow-casablanca">
                    <div class="visual">
                        <i class="fa fa-globe"></i>
                    </div>
                    <div class="details_big">
                        <div class="desc">
                            养老平台话务量
                        </div>
                        <div id="callCount" class="number">
                            <span class="unit1">次</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-new">
                <div class="dashboard-stat yellow-casablanca"
                     style="background-color: rgb(21, 163, 4)">
                    <div class="visual">
                        <i class="fa fa-globe"></i>
                    </div>
                    <div class="details_big">
                        <div class="desc">
                            高龄补贴发放
                        </div>
                        <div id="zunCount" class="number">
                            <span class="unit1">万元</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-new">
                <div class="dashboard-stat green-haze"
                        <shiro:hasRole name="suadmin">
                            data-url="${pageContext.request.contextPath }/admin/serviceOrgShow" data-name="养老服务组织"
                        </shiro:hasRole>
                     data="side-serviceOrg-list">
                    <div class="visual">
                        <i class="fa fa-bar-chart-o"></i>
                    </div>
                    <div class="details_big">
                        <div class="desc">
                            养老服务资源
                        </div>
                        <div id="serviceOrgCount" class="number">
                            <span class="unit1">个</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-new">
                <div class="dashboard-stat blue-madison"
                        <shiro:hasRole name="suadmin">
                            data-url="${pageContext.request.contextPath }/admin/elderly/list" data-name="老人基础信息"
                        </shiro:hasRole>
                     data="elder_Info">
                    <div class="visual">
                        <i class="fa fa-comments"></i>
                    </div>
                    <div class="details_big">
                        <div class="desc">
                            60岁以上老人数量
                        </div>
                        <div id="elderCount" class="number">
                            <span class="unit1">人</span>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- END DASHBOARD STATS -->
        <div class="clearfix">
        </div>
        <div class="row">
            <shiro:hasAnyRoles name="suadmin,muadmin">
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <div class="portlet box blue-steel">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-bar-chart-o"></i>老人和服务组织分布图
                            </div>
                        </div>
                        <div class="portlet-body" style="background-color: #fff;position: relative">
                            <div class="row">
                                <div class="col-md-12  col-sm-12 col-xs-12 " style="height: 400px">
                                    <div id="map-wrap">
                                        <div class="kangping">
                                            <img src="${pageContext.request.contextPath}/assets/admin/pages/img/map/kangping.png"
                                                 alt=""/>
                                            <span class="linkBox"><a href="">康平县:0</a></span>
                                        </div>
                                        <div class="faku">
                                            <img src="${pageContext.request.contextPath}/assets/admin/pages/img/map/faku.png"
                                                 alt=""/>
                                            <span class="linkBox"><a href="">法库县:0</a></span>
                                        </div>
                                        <div class="shenbeixinqu">
                                            <img src="${pageContext.request.contextPath}/assets/admin/pages/img/map/shenbeixinqu.png"
                                                 alt=""/>
                                            <span class="linkBox"><a href="">沈北新区:0</a></span>
                                        </div>
                                        <div class="dadong">
                                            <img src="${pageContext.request.contextPath}/assets/admin/pages/img/map/dadong.png"
                                                 alt=""/>
                                            <span class="linkBox"><a href="">大东区:0</a></span>
                                        </div>
                                        <div class="shenhe ">
                                            <img src="${pageContext.request.contextPath}/assets/admin/pages/img/map/shenhe.png"
                                                 alt=""/>
                                            <span class="linkBox"><a href="">沈河区:0</a></span>
                                        </div>
                                        <div class="hunnan">
                                            <img src="${pageContext.request.contextPath}/assets/admin/pages/img/map/hunnan.png"
                                                 alt=""/>
                                            <span class="linkBox"><a href="">浑南区:0</a></span>
                                        </div>
                                        <div class="sujiatun ">
                                            <img src="${pageContext.request.contextPath}/assets/admin/pages/img/map/sujiatun.png"
                                                 alt=""/>
                                            <span class="linkBox"><a href="">苏家屯区:0</a></span>
                                        </div>
                                        <div class="huanggu ">
                                            <img src="${pageContext.request.contextPath}/assets/admin/pages/img/map/huanggu.png"
                                                 alt=""/>
                                            <span class="linkBox"><a href="">皇姑区:0</a></span>
                                        </div>
                                        <div class="heping">
                                            <img src="${pageContext.request.contextPath}/assets/admin/pages/img/map/heping.png"
                                                 alt=""/>
                                            <span class="linkBox"><a href="">和平区:0</a></span>
                                        </div>
                                        <div class="yuhong">
                                            <img src="${pageContext.request.contextPath}/assets/admin/pages/img/map/yuhong.png"
                                                 alt=""/>
                                            <span class="linkBox"><a href="">于洪区:0</a></span>
                                        </div>
                                        <div class="tiexi">
                                            <img src="${pageContext.request.contextPath}/assets/admin/pages/img/map/tiexi.png"
                                                 alt=""/>
                                            <span class="linkBox"><a href="">铁西区:0</a></span>
                                        </div>
                                        <div class="xinmin">
                                            <img src="${pageContext.request.contextPath}/assets/admin/pages/img/map/xinmin.png"
                                                 alt=""/>
                                            <span class="linkBox"><a href="">新民市:0</a></span>
                                        </div>
                                        <div class="liaozhong">
                                            <img src="${pageContext.request.contextPath}/assets/admin/pages/img/map/liaozhong.png"
                                                 alt=""/>
                                            <span class="linkBox"><a href="">辽中区:0</a></span>
                                        </div>
                                    </div>
                                    <!--切换-->
                                    <p id="btn_wrap" style="display: none;op: 12%;    left: 5%;">
                                        <button type="button" class="btn btn-sm yellow oder"
                                                style="display: block;margin-bottom: 10px;">老人数据
                                        </button>
                                        <button type="button" class="btn btn-sm group"
                                                style="display: block;margin-bottom: 10px;">组织数据
                                        </button>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </shiro:hasAnyRoles>
            <shiro:hasAnyRoles name="readmin">
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <div class="portlet box blue-steel">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-bar-chart-o"></i>老人和服务组织分布图
                            </div>
                        </div>
                        <div class="portlet-body" style="background-color: #fff;position: relative">
                            <div class="row">
                                <div class="col-md-12  col-sm-12 col-xs-12 " style="height: 400px">
                                    <input type="hidden" id="areaName" value="${area.name}">
                                    <div id="map-wrap-area">
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </shiro:hasAnyRoles>
            <div class="col-md-6 col-sm-6 col-xs-6">
                <div class="portlet box blue-steel">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-bar-chart-o"></i>老人统计图
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="row">
                            <div id="bar1" class="bar col-md-12  col-sm-12 col-xs-12" style="height: 400px"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-6">
                <div class="portlet box green-haze tasks-widget">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-bar-chart-o"></i>服务组织统计图
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="row">
                            <div id="bar2" class="bar col-md-12  col-sm-12 col-xs-12" style="height: 400px"></div>
                        </div>
                    </div>
                </div>
            </div>
            <shiro:hasAnyRoles name="suadmin,muadmin,readmin">
            <div class="col-md-6 col-sm-6 col-xs-6">
                <div class="portlet box red-sunglo" style="border:1px solid rgb(20,167,155)">
                    <div class="portlet-title" style="background-color:rgb(20,167,155) ">
                        <div class="caption">
                            <i class="fa fa-calendar"></i>工单数据统计
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="row">
                            <div id="line3" class="bar col-md-12  col-sm-12 col-xs-12" style="height: 400px;"></div>
                        </div>
                    </div>
                </div>
            </div>
            </shiro:hasAnyRoles>
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script src="${pageContextgetStatisticsByAreaAndLevel.request.contextPath }/assets/global/scripts/echarts.min.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/home.js?v=2.4"
                type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                HomeInit.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

