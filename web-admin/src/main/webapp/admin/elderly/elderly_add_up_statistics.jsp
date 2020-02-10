<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>用户统计</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/extensions/TableTools/css/dataTables.tableTools.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <style>
            .more-content {
                display: none;
            }

            #addTable tr td {
                text-align: center;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">

        <!-- BEGIN PAGE HEADER-->
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">高龄补贴信息管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">用户统计</a>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
        <div class="col-md-12">
            <div class="portlet" style="padding-top: 0px !important;padding-bottom: 0px !important;">
                <div class="portlet-body">
                    <table class="table table-striped table-bordered" id="addTable">
                        <tr>
                            <td colspan="5">
                                <h1 style="text-align: center">
                                    南京市高龄补贴用户新增及提档情况
                                </h1>
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="2" style="text-align: center;vertical-align: middle">
                                序号
                            </td>
                            <td rowspan="2" style="text-align: center;vertical-align: middle">
                                区域
                            </td>
                            <td style="text-align: center">
                                系统用户新增
                            </td>
                            <td colspan="2" style="text-align: center">
                                系统用户提档
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                80岁档
                            </td>
                            <td style="text-align: center">
                                80岁档提90岁档
                            </td>
                            <td style="text-align: center">
                                90岁档提100岁档
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <!-- END PAGE CONTENT-->
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/elderly/elderly_add_up_statistics.js?v=3.6"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                ElderAddAndUpStatistics.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
