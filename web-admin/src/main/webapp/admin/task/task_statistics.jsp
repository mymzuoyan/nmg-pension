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
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>数据统计</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>

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
                    <a href="#">呼叫记录</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">数据统计</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet">
                    <div class="analyzeInfo portlet-body from">
                        <div style="text-align: left;margin: 5px 0px 20px 0px">
                            <div class="table-actions-wrapper ">
                                <select id="dataType"
                                        class="table-group-action-input form-control input-inline input-small ">
                                    <option value="fromType" selected>按服务类型</option>
                                    <option value="evaluate">按满意度</option>
                                    <option value="money">按消费金额</option>
                                </select>
                                <select id="region"
                                        class="table-group-action-input form-control input-inline input-small ">
                                    <option value="day" selected>按天数统计</option>
                                    <option value="month" >按月份统计</option>
                                    <option value="year">按年份统计</option>
                                </select>

                                <div id="customerRange" style=" vertical-align: middle; display: inline-block">
                                    <div class="input-group input-large date-picker input-daterange">
                                        <input id="startTime" type="text" class="form-control" name="from">
                                        <span class="input-group-addon">
                                                    至 </span>
                                        <input id="endTime" type="text" class="form-control" name="to">
                                    </div>

                                </div>

                                <button id="analyze" class="btn btn-circle  green ">查询</button>
                            </div>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="row">
                            <div class="col-md-2 col-sm-2 col-xs-2">
                                <ul class="nav nav-tabs tabs-left">
                                    <li class="active">
                                        <a href="#table" data-toggle="tab">
                                            列表方式 </a>
                                    </li>
                                    <li>
                                        <a href="#picture" data-toggle="tab">
                                            图形方式 </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-10 col-sm-10 col-xs-10">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="table">
                                    </div>
                                    <div class="tab-pane" id="picture">
                                        <div id="bar" class="bar" style="  width: 800px; height:400px;"></div>
                                        <div id="pie" class="pie"  style="  width: 800px; height:400px;"></div>
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
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/echarts.min.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/task/task_statistics.js?v=1.5"
                type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                //时间控件初始化
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: "yyyy-mm-dd",
                    maxViewMode: 0,
                    minViewMode: 0,
                });

                Task_Statistic.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

