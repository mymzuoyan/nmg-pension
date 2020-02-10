<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>服务质量星级评定列表</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <style>
            a, a:hover {
                text-decoration: none;
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
                    <a href="#">星级评定列表</a>
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
                            <span class="caption-subject font-red-sunglo bold uppercase">机构星级评定列表</span>
                        </div>
                        <div class="tools">
                            <shiro:hasPermission name="person-institution-manager-subsidyList-create">
                                <div style="float: left">
                                    <a class="btn btn-circle btn-add"
                                       href="${pageContext.request.contextPath}/admin/addStarRate?method=add&serviceOrgId=${user.serviceOrgId}"><i
                                            class="fa">申请</i></a>
                                </div>
                            </shiro:hasPermission>
                            <shior:hasPermission name="person-institution-manager-subsidyList-delete">
                                <input type="hidden" id="serviceOrgSubAppDel" value="1" />
                            </shior:hasPermission>
                            <shior:hasPermission name="person-institution-manager-subsidyList-list">
                                <input type="hidden" id="serviceOrgSubAppList" value="1" />
                            </shior:hasPermission>
                            <a href="" class="collapse"></a>
                        </div>
                    </div>
                    <div class="portlet-body" style="padding-top: 0px !important;">
                        <form id="serviceOrgAssessForm">
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
                                        <c:if test="${empty areaName}">
                                            <c:choose>
                                                <c:when test="${roleId == 3}">
                                                    <input type="text" id="areaName" name="areaName"
                                                           value="${user.areaName}" style="width: 100%" readonly>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="areaName" name="areaName"
                                                           data-toggle="modal"
                                                           data-target="#areaModal" placeholder="请选择所属区域"
                                                           style="width: 100%" class="form-control">
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                        <c:if test="${not empty areaName}">
                                            <input type="text" id="areaName" name="areaName"
                                                   value="${areaName}" style="width: 100%" readonly>
                                        </c:if>
                                    </td>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        机构名称
                                    </td>
                                    <td style="width:15%;text-align:center;vertical-align:middle;">
                                        <c:if test="${empty serviceOrgId}">
                                            <input type="hidden" value="${type}" id="type">
                                            <input type="hidden" value="${sessionScope.login_user.uid}" id="userId">
                                            <input name="institutionName" placeholder="请输入机构名称" style="width: 100%"
                                                   class="form-control">
                                        </c:if>
                                        <c:if test="${not empty serviceOrgId}">
                                            <input type="hidden" value="${type}" id="type">
                                            <input type="hidden" value="${serviceOrgId}" id="serviceOrgId">
                                            <input name="institutionName" placeholder="请输入机构名称" style="width: 100%" readonly
                                                   class="form-control" value="${sessionScope.login_user.serviceOrgName}">
                                        </c:if>
                                    </td>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        评定时间
                                    </td>
                                    <td style="width:40%;text-align:center;vertical-align:middle;">
                                        <input style="width:40%;display: inline-block" type="text"
                                               class="form-control date-picker" name="startDateString"
                                               data-date-format="yyyy-mm-dd">
                                        至
                                        <input style="width:40%;display: inline-block" type="text"
                                               class="form-control date-picker" name="endDateString"
                                               data-date-format="yyyy-mm-dd">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        星级
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;" colspan="2">
                                        <input type="hidden" id="subsidyObject" value="${object}">
                                        <select id="starClass" class="form-control">
                                            <option value="">
                                                -- 请选择 --
                                            </option>
                                            <option value="1">
                                                一星级
                                            </option>
                                            <option value="2">
                                                二星级
                                            </option>
                                            <option value="3">
                                                三星级
                                            </option>
                                            <option value="4">
                                                四星级
                                            </option>
                                            <option value="5">
                                                五星级
                                            </option>
                                        </select>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;" colspan="2">
                                        等级评定总评分
                                    </td>
                                    <td>
                                        <input type="text"  name="totalScore" class="form-control" >
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <div class="right" style="text-align: right">
                            <a id="search" class="table-group-action-submit btn btn-circle btn-import"><i
                                    class="fa">查询</i></a>
                            <a class="reload table-group-action-reload btn btn-circle btn-black"><i
                                    class="fa">重置</i></a>
                        </div>
                    </div>
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
                                        <th width="15%" style="text-align:center;vertical-align:middle;">
                                            所属区域
                                        </th>
                                        <th width="20%" style="text-align:center;vertical-align:middle;">
                                            机构名称
                                        </th>
                                        <th width="10%" style="text-align:center;vertical-align:middle;">
                                            星级
                                        </th>
                                        <th width="15%" style="text-align:center;vertical-align:middle;">
                                            评定时间
                                        </th>
                                        <th width="15%" style="text-align:center;vertical-align:middle;">
                                            评定总分数
                                        </th>
                                        <th width="10%" style="text-align:center;vertical-align:middle;">
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
                                                onclick="ServiceOrgSubsidyStarList.goToPage()" title="GO">GO
                                        </button>
                                    </div>
                                </div>
                                <div class="right" style="text-align: right;display: block;">
                                    <button id="deleteSomeMsg" class="btn btn-circle red"
                                            onclick="deleteSomeMsg(this,'/admin/api/institution/org/starRate/deleteSome')"
                                            data-loading-text="删除中..."><i class="fa fa-times"> 批量删除</i>
                                    </button>
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
                                onclick="ServiceOrgSubsidyStarList.getAreaName()">
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
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/serviceOrg_subsidy_star_list.js?v=1"
                type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                AreaTree.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
                ServiceOrgSubsidyStarList.init();
            });

            function getPermission ( data, type, row,meta ) {
                var columnHtml = '';
                <shiro:hasPermission name="person-institution-manager-subsidyList-detail">
                    columnHtml += '<button data="' + data + '"   class="btn default btn-xs blue-stripe info">详情</button>';
                </shiro:hasPermission>;

                columnHtml += '<button data-id="' + data + '" class="btn default btn-xs red-stripe del">删除</button>';
                <shiro:hasPermission name="person-institution-manager-subsidyList-assess">
                    columnHtml += '<button data="' + data + '"   class="btn default btn-xs yellow-stripe assess">评估</button>';
                </shiro:hasPermission>;

                return columnHtml;

            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

