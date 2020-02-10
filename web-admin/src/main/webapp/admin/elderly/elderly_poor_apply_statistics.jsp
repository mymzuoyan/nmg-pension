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
        <title>特困人员供养数据统计</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <style>
            #addTable tr td {
                text-align: center;
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
                    <a href="#">购买居家养老服务</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">特困人员供养数据统计</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet">
                    <input type="hidden" id="areaId" value="${areaId}">
                    <input type="hidden" id="areaName" value="${areaName}">
                    <input type="hidden" id="level" value="${level}">
                    <div class="portlet-body">
                        <a id="back_a" style="display: none;float: right;margin-bottom: 5px"
                           class="btn btn-default btn-circle"
                           onclick="window.history.back()">返回</a>
                        <div id="customerRange"
                             style=" vertical-align: middle; display: inline-block;margin-bottom: 5px">
                            <div class="input-group input-large date-picker input-daterange">
                                <input id="startTime" type="text" class="form-control" name="from" value="${startYear}">
                                <span class="input-group-addon">
                                                    至 </span>
                                <input id="endTime" type="text" class="form-control" name="to" value="${endYear}">
                            </div>

                        </div>
                        <button id="analyze" class="btn btn-circle  green " style="vertical-align: top">查询</button>
                        <table class="table table-striped table-bordered" id="addTable">
                            <tr>
                                <td colspan="6">
                                    <h1 style="text-align: center" id="tableTitle">
                                        <c:if test="${startYear==endYear}">
                                            ${startYear}年${areaName}特困人员供养数据统计

                                        </c:if>
                                        <c:if test="${startYear!=endYear}">
                                            ${startYear}年至${endYear}年${areaName}特困人员供养数据统计
                                        </c:if>

                                    </h1>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center;vertical-align: middle">
                                    序号
                                </td>

                                <td style="text-align: center;vertical-align: middle">
                                    区域
                                </td>
                                <td style="text-align: center;vertical-align: middle">
                                    特困人员申请人数
                                </td>
                                <td style="text-align: center">
                                    审核通过
                                </td>
                                <td style="text-align: center">
                                    审核中
                                </td>
                                <td style="text-align: center">
                                    审核不通过
                                </td>
                            </tr>
                            <tbody id="tbody">

                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- End: life time stats -->
            </div>
        </div>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/elderly/elderly_poor_apply_statistics.js?v=1.0"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: "yyyy",
                    maxViewMode: 2,
                    minViewMode: 2,
                });
                var areaId = "${areaId}";
                var userAreaId = "${sessionScope.login_user.areaId}";
                if (userAreaId != areaId) {
                    $("#back_a").show();
                }
                ElderMsgPoorApplyStatistics.init(${startYear},${endYear});
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

