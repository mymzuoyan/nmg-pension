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
              href="${pageContext.request.contextPath}/assets/admin/pages/css/map.css"/>
        <style>
            .unit {
                font-size: 10px;
                margin-left: 5px;
            }

            #monitor_status_ul li {
                display: inline-block;
                width: 10%;
            }

            .monitor {
                text-align: center;
            }

            .monitor img {
                display: none;
            }

            .monitor img.active {
                display: inline;
            }

            .monitor .name {
                margin-top: 10px;
            }
            .row .col-new {
                width: 20%;
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
        <div class="row">
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-new">
                <div class="dashboard-stat blue-madison">
                    <div class="visual">
                        <i class="fa fa-comments"></i>
                    </div>
                    <div class="details">
                        <div id="callInfoCount" class="number">
                            <span class="unit">个</span>
                        </div>
                        <div class="desc">
                            呼叫系统工单总量
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-new">
                <div class="dashboard-stat green-haze">
                    <div class="visual">
                        <i class="fa fa-bar-chart-o"></i>
                    </div>
                    <div class="details">
                        <div id="todayCount" class="number">
                            <span class="unit">个</span>
                        </div>
                        <div class="desc">
                            当日工单量
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-new">
                <div class="dashboard-stat green-jungle">
                    <div class="visual">
                        <i class="fa fa-bar-chart-o"></i>
                    </div>
                    <div class="details">
                        <div id="doneCount" class="number">
                            <span class="unit">个</span>
                        </div>
                        <div class="desc">
                            已完成工单量
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-new">
                <div class="dashboard-stat red-intense">
                    <div class="visual">
                        <i class="fa fa-shopping-cart"></i>
                    </div>
                    <div class="details">
                        <div id="undoCount" class="number">
                            <span class="unit">个</span>
                        </div>
                        <div class="desc">
                            未完成工单量
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-new">
                <div class="dashboard-stat yellow-casablanca">
                    <div class="visual">
                        <i class="fa fa-shopping-cart"></i>
                    </div>
                    <div class="details">
                        <div id="pdCount" class="number">
                            <span class="unit">个</span>
                        </div>
                        <div class="desc">
                            排队数
                        </div>
                    </div>
                </div>
            </div>
            <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">--%>
                <%--<div class="dashboard-stat yellow-casablanca" style="background-color: rgb(21, 163, 4)">--%>
                    <%--<div class="visual">--%>
                        <%--<i class="fa fa-shopping-cart"></i>--%>
                    <%--</div>--%>
                    <%--<div class="details">--%>
                        <%--<div  id="jtCount" class="number">--%>
                            <%--<span class="unit"></span>--%>
                        <%--</div>--%>
                        <%--<div class="desc">--%>
                            <%--接通率--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        </div>
        <!-- END DASHBOARD STATS -->
        <div class="clearfix">
        </div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="portlet box blue-steel" style="border:1px solid rgb(20,195,181)">
                    <div class="portlet-title" style="background-color:rgb(20,195,181) ">
                        <div class="caption">
                            <i class="fa fa-calendar"></i>坐席状态
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="row">
                            <div class="bar col-md-12" style="">
                                <ul id="monitor_status_ul">

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-6">
                <div class="portlet box red-sunglo" style="border:1px solid rgb(20,167,155)">
                    <div class="portlet-title" style="background-color:rgb(20,167,155) ">
                        <div class="caption">
                            <i class="fa fa-calendar"></i>工单统计
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="row">
                            <div id="line2" class="bar col-md-12" style="height: 400px"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-6">
                <div class="portlet box red-sunglo" style="border:1px solid rgb(20,167,155)">
                    <div class="portlet-title" style="background-color:rgb(20,167,155) ">
                        <div class="caption">
                            <i class="fa fa-calendar"></i>话务坐席状态
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="row">
                            <div id="bar1" class="bar col-md-12" style="height: 400px"></div>
                        </div>
                    </div>
                </div>
            </div>
            <%--<div class="col-md-6 col-sm-6 col-xs-6">--%>
                <%--<div class="portlet box red-sunglo" style="border:1px solid rgb(20,167,155)">--%>
                    <%--<div class="portlet-title" style="background-color:rgb(20,167,155) ">--%>
                        <%--<div class="caption">--%>
                            <%--<i class="fa fa-calendar"></i>当前月份服务类型统计--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="portlet-body">--%>
                        <%--<div class="row">--%>
                            <%--<div id="pie1" class="bar col-md-12" style="height: 400px"></div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="col-md-6 col-sm-6 col-xs-6">--%>
                <%--<div class="portlet box blue-steel" style="border:1px solid rgb(36,195,183)">--%>
                    <%--<div class="portlet-title" style="background-color:rgb(36,195,183) ">--%>
                        <%--<div class="caption">--%>
                            <%--<i class="fa fa-bell-o"></i>呼叫类型统计--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="portlet-body">--%>
                        <%--<div class="row">--%>
                            <%--<div id="pie2" class="bar col-md-12" style="height: 400px"></div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="col-md-6 col-sm-6 col-xs-6">--%>
                <%--<div class="portlet box blue-steel" style="border:1px solid rgb(36,195,183)">--%>
                    <%--<div class="portlet-title" style="background-color:rgb(36,195,183) ">--%>
                        <%--<div class="caption">--%>
                            <%--<i class="fa fa-bell-o"></i>当前月份服务满意统计--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="portlet-body">--%>
                        <%--<div class="row">--%>
                            <%--<div id="pie3" class="bar col-md-12" style="height: 400px"></div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="col-md-6 col-sm-6 col-xs-6">--%>
                <%--<div class="portlet box blue-steel" style="border:1px solid rgb(36,195,183)">--%>
                    <%--<div class="portlet-title" style="background-color:rgb(36,195,183) ">--%>
                        <%--<div class="caption">--%>
                            <%--<i class="fa fa-bell-o"></i>回访记录统计--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="portlet-body">--%>
                        <%--<div class="row">--%>
                            <%--<div id="pie4" class="bar col-md-4" style="height: 400px"></div>--%>
                            <%--<div id="pie5" class="bar col-md-4" style="height: 400px"></div>--%>
                            <%--<div id="pie6" class="bar col-md-4" style="height: 400px"></div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        </div>
        <div id="monitor_status_modal" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">坐席详情</h4>
                    </div>
                    <div class="modal-body">
                        <table class="table table-bordered" id="table_monitor_info" style="text-align: center;">
                            <tr>
                                <th style="width: 20%;">
                                    坐席名称
                                </th>
                                <td style="width: 30%;" id="zxmc">

                                </td>
                                <th style="width: 20%;">
                                    坐席组名称
                                </th>
                                <td style="width: 30%;" id="zxzmc">

                                </td>
                            </tr>
                            <tr>
                                <th>
                                    外线号码
                                </th>
                                <td id="wxhm">

                                </td>
                                <th>
                                    是否组长
                                </th>
                                <td id="sfzc">

                                </td>
                            </tr>
                            <tr>
                                <th>
                                    队列
                                </th>
                                <td id="dl">

                                </td>
                                <th>
                                    系统用户
                                </th>
                                <td id="xtyh">

                                </td>
                            </tr>
                            <tr id="ldhmtr">
                                <th>来电号码</th>
                                <td colspan="3" id="ldhm"></td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/echarts.min.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/call/call_home.js?v=1.1"
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
