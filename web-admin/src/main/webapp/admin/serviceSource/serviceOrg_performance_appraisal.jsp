<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>组织绩效考核</title>
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
                    <a href="#">服务资源管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">组织绩效考核</a>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <div class="portlet " style="padding-top: 0px !important;padding-bottom: 0px !important;">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">组织绩效考核</span>
                        </div>
                    </div>
                    <div class="portlet-body" style="padding-top: 0px !important;display: block">
                        <form id="serviceOrg-form" name="serviceOrg-form">
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td colspan="6" class="tr-title">
                                        <span class="caption-helper">基本信息</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        所属区域
                                    </td>
                                    <td style="width:20%;text-align:center;vertical-align:middle;">
                                        <input class="form-control" type="text" id="areaName" name="areaName"
                                               data-toggle="modal"
                                               data-target="#areaModal" placeholder="请选择所属区域"
                                        <c:if test="${empty areaName}">
                                               value="${sessionScope.login_user.areaName}"
                                        </c:if>
                                               onclick="ServiceOrgDetail.selectMethod('add');" style="width: 100%">
                                        <input type="hidden" id="areaId" name="areaId">

                                    </td>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        单位名称
                                    </td>
                                    <td style="width:20%;text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="institutionName" placeholder="请输入单位名称"
                                               style="width: 100%">
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        联系人
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="applyName" placeholder="请输入联系人姓名"
                                               style="width: 100%">
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <div style="text-align: right">
                            <a id="search" class="btn btn-circle  green">
                                <i class="fa"> 查询 </i>
                            </a>
                            <a id="reload" class="reload table-group-action-reload btn btn-circle btn-black"><i
                                    class="fa">重置</i></a>
                        </div>
                    </div>
                    <shior:hasPermission name="serviceOrgSup-performanceAppraisal-list">
                        <input type="hidden" id="serviceOrgSupPerformanceAppList" value="1"/>
                    </shior:hasPermission>
                    <div class="portlet">
                        <div class="portlet-body">
                            <div class="table-container">
                                <table class="table table-striped table-bordered table-hover"
                                       id="datatable_list">
                                    <thead>
                                    <tr role="row" class="heading">
                                        <th width="1%">
                                            <input type="checkbox" class="group-checkable">
                                        </th>
                                        <th width="8%">
                                            所属区域
                                        </th>
                                        <th width="21%">
                                            组织名称
                                        </th>
                                        <th width="10%">
                                            联系人
                                        </th>
                                        <th width="12%">
                                            联系电话
                                        </th>
                                        <th width="12%">
                                            好评率
                                        </th>
                                        <th width="12%">
                                            操作
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
                                                onclick="PerformanceAppraisal.goToPage()" title="GO">GO
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 导入模态框（Modal） -->
        <div class="modal fade" id="areaModal" tabindex="-1"
             role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal"
                                aria-hidden="true"></button>
                        <h4 class="modal-title"
                            id="myModalLabel">请选择所属区域</h4>
                    </div>
                    <div class="modal-body">
                        <div id="areaTree"
                             class="tree-demo"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn blue"
                                onclick="PerformanceAppraisal.getAreaName()">
                            确定
                        </button>
                        <button type="button"
                                class="btn default"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
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
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/serviceOrg_performance_appraisal.js?v=1.53"
                type="text/javascript"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                AreaTree.init();
                PerformanceAppraisal.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

