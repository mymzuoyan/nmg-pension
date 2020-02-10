<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>资格补贴申请统计表</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <style>
            #selectIcon img {
                width: 30px;
                height: 30px;
                margin: 2.5px;
                padding: 2.5px;
            }

            #selectIcon img:hover {
                background-color: #ccc;
                cursor: pointer;
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
                    <a href="#">资格补贴审批</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">资格补贴申请统计表</a>
                </li>
            </ul>
        </div>
        <div class="row">
        <div class="col-md-12">
            <div class="portlet">
                <div class="portlet-body">
                    <table class="table table-striped table-bordered"
                           id="qualification_subsidy_statistics">
                        <thead>
                        <input type="hidden" id="areaById" value="${value}">
                        <tr>
                            <input type="hidden" id="level" name="level" value="1">
                            <input type="hidden" id="areaId" name="areaId" value="1">
                            <input type="hidden" id="areaName" name="areaName" value="内蒙古市">
                            <td colspan="8">
                                <a id="showList" class="btn btn-circle  btn-black showList"
                                   style="float: left;background-color: rgb(21,134,237)"
                                    >查看列表</a>
                                <a onclick="window.location.reload()" class="btn btn-circle green" style="float: left">
                                    刷新
                                </a>
                                <a id="back_a" style="float: right;margin-bottom: 5px"
                                   class="btn btn-default btn-circle green "
                                   onclick="window.history.back()">返回</a>
                                <h1 style="text-align: center" id="tableTitle">
                                    资格补贴申请统计表
                                </h1>
                            </td>
                        </tr>
                        <tr role="row" class="heading">
                            <td  style="text-align: center;vertical-align: middle">
                                序号
                            </td>
                            <td  style="text-align: center;vertical-align: middle">
                                区域
                            </td>
                            <td style="text-align: center;">
                                未审核
                            </td>
                            <td style="text-align: center;">
                                审核通过
                            </td>
                            <td style="text-align: center;">
                                审核未通过
                            </td>
                            <td style="text-align: center;vertical-align: middle">
                                总申请数
                            </td>
                        </tr>
                        </thead>
                        <tbody id="tbody">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- End: life time stats -->
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatableToStatistics.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/qual_subsidy_staticstic.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js?v=1.2"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                StatisticsList.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

