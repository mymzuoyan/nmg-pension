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

            .MapLocation .MapLocation_con_list img {
                vertical-align: top;
                height: 16px;
                margin-top: 2px;
            }

            .MapLocation .MapLocation_con_list p {
                display: inline-block;
                margin-left: 8px;
            }

            .MapLocation .MapLocation_con_list strong {
                font-weight: 400;
                color: #333333;
            }

            .about4_main ul li {
                padding-left: 25px;
                font-size: 14px;
                color: #333333;
                line-height: 30px;
                margin-bottom: 5px;
                background: url(${pageContext.request.contextPath}/assets/admin/pages/img/about4_icon.png) left center no-repeat;
            }

            .about4_main ul li:last-child {
                margin-bottom: 0px;
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
                        <div id="serviceCount" class="number">
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
                            服务老人数
                        </div>
                        <div id="serviceElder" class="number">
                            <span class="unit1">人</span>
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
                        <div class="desc" >
                            服务人员数
                        </div>
                        <div id="fuwuCount" class="number">
                            <span class="unit1">人</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-new" onmouseover="mouseover()">
                <div class="dashboard-stat green-haze"
                     data-url="${pageContext.request.contextPath }/admin/serviceOrgShow" data-name="养老服务组织"
                     data="side-serviceOrg-list">
                    <div class="visual">
                        <i class="fa fa-bar-chart-o"></i>
                    </div>
                    <div class="details_big">
                        <div class="desc">
                            志愿者数
                        </div>
                        <div id="volCount" class="number">
                            <span class="unit1">个</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-new">
                <div class="dashboard-stat blue-madison"
                     data-url="${pageContext.request.contextPath }/admin/elderly/list" data-name="老人基础信息"
                     data="elder_Info">
                    <div class="visual">
                        <i class="fa fa-comments"></i>
                    </div>
                    <div class="details_big">
                        <div class="desc">
                            设备数
                        </div>
                        <div id="deviceCount" class="number">
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
            <div class="col-md-6 col-sm-6 col-xs-6">
                <div class="portlet box red-sunglo" style="border:1px solid rgb(20,167,155)">
                    <div class="portlet-title" style="background-color:rgb(20,167,155) ">
                        <div class="caption">
                            <i class="fa fa-calendar"></i>养老服务量统计
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="row">
                            <div id="line3" class="bar col-md-12  col-sm-12 col-xs-12" style="height: 400px;"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-6">
                <div class="portlet box red-sunglo" style="border:1px solid rgb(20,167,155)">
                    <div class="portlet-title" style="background-color:rgb(20,167,155) ">
                        <div class="caption">
                            <i class="fa fa-calendar"></i>服务人员好评率
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="row">
                            <div id="line4" class="bar col-md-12  col-sm-12 col-xs-12" style="height: 400px;"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="portlet box blue-steel">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-calendar"></i>待响应工单
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="tab-content">
                            <div class="tab-pane fade active in">
                                <div class="table-container">
                                    <table class="table table-striped table-bordered table-hover"
                                           id="datatable_task_list">
                                        <thead>
                                        <tr role="row" class="heading">
                                            <th width="20%">
                                                工单编号
                                            </th>
                                            <th width="10%">
                                                需求发布人
                                            </th>
                                            <th width="10%">
                                                服务对象
                                            </th>
                                            <th width="10%">
                                                需求
                                            </th>
                                            <th width="10%">
                                                服务组织
                                            </th>
                                            <th width="10%">
                                                服务人员
                                            </th>
                                            <th width="10%">
                                                工单状态
                                            </th>
                                            <th width="10%">
                                                评价
                                            </th>
                                            <th width="10%">
                                                查看
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                    <shiro:hasRole name="zuadmin">
                                        <input type="hidden" name="canDispath" value="1">
                                    </shiro:hasRole>
                                    <shiro:hasPermission name="task-call-manager-taskSupervise-list">
                                        <input type="hidden" id="taskSupList" value="1">
                                    </shiro:hasPermission>
                                    <shiro:hasPermission name="task-call-manager-taskSupervise-delete">
                                        <input type="hidden" id="taskSupDel" value="1">
                                    </shiro:hasPermission>
                                    <div class="table-actions-check-wrapper">
                                        <div class="pagination-panel"> 页数 <input type="text" id="page"
                                                                                 class="pagination-panel-input form-control input-mini input-inline input-sm"
                                                                                 maxlenght="5"
                                                                                 style="text-align:center; margin: 0 5px;">
                                            <button
                                                    href="" id="goPage" class="btn btn-sm default "
                                                    onclick="TaskSupervise.goToPage()" title="GO">GO
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
        <div class="modal" id="taskInfo" tabindex="" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" style="width: 900px">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">工单详情</h4>
                    </div>
                    <div class="modal-body">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary"
                                data-dismiss="modal">确定
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
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

        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/home_zuzhi.js?v=2.0"
                type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                HomeZuZhiInit.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

