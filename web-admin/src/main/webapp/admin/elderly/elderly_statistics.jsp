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
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>数据统计</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
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
                    <a href="#">老人信息管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">数据统计</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <!-- BEGIN PROFILE CONTENT -->
                <div class="profile-content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="portlet ">
                                <div class="portlet-title tabbable-line">
                                    <div class="caption">
                                        <i class="icon-equalizer font-purple-plum hide"></i>
                                        <span class="caption-subject font-red-sunglo bold uppercase">数据统计</span>
                                    </div>
                                    <ul class="nav nav-tabs">
                                        <shiro:hasPermission name="elderly-elderlyMsg-data-statistic-elder-lrhjtj">
                                            <li class="">
                                                <a href="#tab_1_1" data-toggle="tab" aria-expanded="false">老人户籍统计</a>
                                            </li>
                                        </shiro:hasPermission>
                                        <shiro:hasPermission name="elderly-elderlyMsg-data-statistic-elder-zfgmtj">
                                            <li class="">
                                                <a href="#tab_1_2" data-toggle="tab" aria-expanded="false">政府购买统计</a>
                                            </li>
                                        </shiro:hasPermission>
                                        <shiro:hasPermission name="elderly-elderlyMsg-data-statistic-elder-lrnlpgtj">
                                            <li class="">
                                                <a href="#tab_1_3" data-toggle="tab" aria-expanded="true">老人能力评估统计</a>
                                            </li>
                                        </shiro:hasPermission>
                                    </ul>
                                </div>
                                <div class="portlet-body">
                                    <div class="tab-content">
                                        <!-- PERSONAL INFO TAB -->
                                        <shiro:hasPermission name="elderly-elderlyMsg-data-statistic-elder-lrhjtj">
                                            <div class="tab-pane " id="tab_1_1">
                                                <div class="">
                                                    <div id="bar1" class="bar" style="width: 750px;height: 400px"></div>
                                                    <div id="pie1" class="pie" style="width: 750px;height: 400px"></div>
                                                </div>
                                            </div>
                                        </shiro:hasPermission>
                                            <div class="tab-pane " id="tab_1_4">
                                                <div style="text-align: left;margin: 5px 0px 20px 0px">
                                                    <div class="table-actions-wrapper ">
                                                        <div id="customerRange"
                                                             style=" vertical-align: middle; display: inline-block">
                                                            <div class="input-group input-large date-picker input-daterange">
                                                                <input id="startTime" type="text" class="form-control"
                                                                       name="from">
                                                                <span class="input-group-addon">
                                                    至 </span>
                                                                <input id="endTime" type="text" class="form-control"
                                                                       name="to">
                                                            </div>
                                                        </div>
                                                        <%--<shiro:hasPermission name="elderly-elderlyMsg-data-statistic-elder-list">--%>
                                                        <button id="analyze" class="btn btn-circle  btn-import ">查询
                                                        </button>
                                                        <%--</shiro:hasPermission>--%>
                                                    </div>
                                                    <div class="">
                                                        <div id="bar4" class="bar"
                                                             style="width: 750px;height: 400px"></div>
                                                        <div id="pie4" class="pie"
                                                             style="width: 750px;height: 400px"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        <shiro:hasPermission name="elderly-elderlyMsg-data-statistic-elder-zfgmtj">
                                            <div class="tab-pane" id="tab_1_2">
                                                <div class="">
                                                    <div id="bar2" class="bar" style="width: 750px;height: 400px"></div>
                                                    <div id="pie2" class="pie" style="width: 750px;height: 400px"></div>
                                                </div>
                                            </div>
                                        </shiro:hasPermission>
                                        <shiro:hasPermission name="elderly-elderlyMsg-data-statistic-elder-lrnlpgtj">
                                            <div class="tab-pane" id="tab_1_3">
                                                <div class="">
                                                    <div id="bar3" class="bar" style="width: 750px;height: 400px"></div>
                                                    <div id="pie3" class="pie" style="width: 750px;height: 400px"></div>
                                                </div>
                                            </div>
                                        </shiro:hasPermission>
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
        <script src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/elderly/elderly_statistics.js?v=1.6"
                type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                ElderMsgStatistics.init();
                //时间控件初始化
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: "yyyy-mm",
                    maxViewMode: 1,
                    minViewMode: 1,
                });
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

