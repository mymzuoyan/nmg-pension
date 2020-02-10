<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>养老服务组织统计</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <style>
            #serviceOrg tr td {
                text-align: center;
                vertical-align:middle;
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
                    <a href="#">资金管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">养老服务组织</a>
                </li>
            </ul>
        </div>
        <div class="row">
        <div class="col-md-12">
            <div class="portlet">
                <div class="portlet-body">
                    <table class="table table-striped table-bordered table-hover"
                           id="serviceOrg">
                        <input type="hidden" id="areaId" name="areaId" value="${areaId}">
                        <input type="hidden" id="flag" name="flag" value="${flag}">
                        <input type="hidden" id="preName" value="${sessionScope.login_user.areaName}<c:if test="${not empty areaName}">,${areaName}</c:if>">
                        <tr>
                            <td colspan="10">
                                <a id="back_a" style="display: none;float: right;margin-bottom: 5px"
                                   class="btn btn-default btn-circle"
                                   onclick="window.history.back()">返回</a>
                                <a id="showList" class="btn btn-circle  btn-black showList"
                                   style="float: left;background-color: rgb(21,134,237)"
                                   data="${pageContext.request.contextPath}/admin/serviceOrgShow"
                                   onclick="ServiceOrgStatistics1.addTab1(this);">查看列表</a>
                                <a onclick="window.location.reload()" class="btn btn-circle green" style="float: left">
                                    刷新
                                </a>
                                <h1 style="text-align: center" id="tableTitle">
                                    养老服务组织统计表
                                </h1>
                            </td>
                        </tr>
                        <tr role="row" class="heading">
                            <td width="30%">
                                序号
                            </td>
                            <td width="40%">
                                区域
                            </td>
                            <td width="30%">
                                信息完整度达到100%的组织数
                            </td>
                        </tr>
                        <tbody id="tbody">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- End: life time stats -->

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/serviceOrg_statistics1.js?v=1.8"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();var areaId = "${areaId}";
                var userAreaId = "${sessionScope.login_user.areaId}";
                if (userAreaId != areaId) {
                    $("#back_a").show();
                }

                ServiceOrgStatistics1.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

