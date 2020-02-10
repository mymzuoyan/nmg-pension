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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>养老服务补贴申请统计</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <style>
            #AssessTable tr td {
                text-align: center;
                vertical-align: middle;
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
                    <a href="#">养老服务评估</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">养老服务评估统计</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet">
                    <div class="portlet-body">
                        <a id="back_a" style="display: none;float: right;margin-bottom: 5px"
                           class="btn btn-default btn-circle"
                           onclick="window.history.back()">返回</a>
                        <table class="table table-striped table-bordered" id="AssessTable">
                            <tr>
                                <td colspan="11">
                                    <h1 style="text-align: center" id="tableTitle">
                                            ${fn:replace(areaName, ",", "")}补贴申请统计
                                    </h1>
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="2">
                                    序号
                                </td>
                                <td rowspan="2">
                                    区域
                                </td>
                                <td rowspan="2">
                                    申请组织数
                                </td>
                                <td colspan="4">
                                    建设补贴
                                </td>
                                <td colspan="4">
                                    运营补贴
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    申请组织数
                                </td>
                                <td>
                                    待审核数
                                </td>
                                <td>
                                    审核通过数
                                </td>
                                <td>
                                    审核未通过数
                                </td>
                                <td>
                                    申请组织数
                                </td>
                                <td>
                                    待审核数
                                </td>
                                <td>
                                    审核通过数
                                </td>
                                <td>
                                    审核未通过数
                                </td>
                            </tr>
                            <tbody id="tbody">

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- End: life time stats -->
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
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/serviceOrg_subsidy_statistic.js?v=1.5"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                var areaId = "${areaId}";
                var object = "${object}";
                var userAreaId = "${sessionScope.login_user.areaId}";
                if (userAreaId != areaId) {
                    $("#back_a").show();
                }
                ServiceOrgSubsidyStatistic.init(areaId,object);
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

