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
              href="${pageContext.request.contextPath}/assets/admin/pages/css/map.css?v=1.4"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>

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
                            在院老人数
                        </div>
                        <div id="elderlyCount" class="number">
                            <span class="unit1">人</span>
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
                            床位数
                        </div>
                        <div id="bedCount" class="number">
                            <span class="unit1">个</span>
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
                            空床位数
                        </div>
                        <div id="emptyBedCount" class="number">
                            <span class="unit1">个</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-new" onmouseover="mouseover()">
                <div class="dashboard-stat green-haze"
                     data-url="${pageContext.request.contextPath }/" data-name="服务人员数"
                     data="side-serviceOrg-list">
                    <div class="visual">
                        <i class="fa fa-bar-chart-o"></i>
                    </div>
                    <div class="details_big">
                        <div class="desc">
                            服务人员数
                        </div>
                        <div id="fuwuCount" class="number">
                            <span class="unit1">人</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-new">
                <div class="dashboard-stat blue-madison"
                     data-url="${pageContext.request.contextPath }/" data-name="志愿者"
                     data="elder_Info">
                    <div class="visual">
                        <i class="fa fa-comments"></i>
                    </div>
                    <div class="details_big">
                        <div class="desc">
                            志愿者
                        </div>
                        <div id="volunteersCount" class="number">
                            <span class="unit1">人</span>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- END DASHBOARD STATS -->
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="portlet box blue-steel">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-calendar"></i>告警信息列表
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="tab-content">
                            <div class="tab-pane fade active in">
                                <div class="table-container">
                                    <table class="table table-striped table-bordered table-hover" id="datatable_nurse_list">
                                        <thead>
                                            <tr role="row" class="heading">
                                                <th width="8%">
                                                    标签ID
                                                </th>
                                                <th width="8%">
                                                    老人名称
                                                </th>
                                                <th width="10%">
                                                    报警类型
                                                </th>
                                                <th width="12%">
                                                    <span id="param1"> 围栏名称</span>
                                                </th>
                                                <th width="5%">
                                                    <span id="param2">围栏类型</span>
                                                </th>
                                                <th width="12%">
                                                    报警时间
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                    <div class="table-actions-check-wrapper">
                                        <div class="pagination-panel"> 页数 <input type="text" id="page"
                                                                                 class="pagination-panel-input form-control input-mini input-inline input-sm"
                                                                                 maxlenght="5"
                                                                                 style="text-align:center; margin: 0 5px;">
                                            <button
                                                    href="" id="goPage" class="btn btn-sm default "
                                                    onclick="HomeOrgInit.goToPage()" title="GO">GO
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/echarts.min.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/home_org.js?v=1.6" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                HomeOrgInit.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

