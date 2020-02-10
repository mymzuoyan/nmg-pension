<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>运营补贴申请列表</title>
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
                    <a href="#">运营补贴申请列表</a>
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
                            <span class="caption-subject font-red-sunglo bold uppercase">运营补贴申请列表</span>
                        </div>

                  <%--      <div class="tools">
                            <shior:hasPermission name="mechanism-create">
                                <div style="float: left">
                                    <a data="${pageContext.request.contextPath}/admin/api/serviceOrg/subsidy/mechanismAdd"
                                       class=" table-group-action-add btn btn-circle btn-add"><i class="fa">新增</i></a>
                                </div>
                            </shior:hasPermission>
                            <a href="" class="collapse"></a>
                        </div>--%>
                    </div>
                    <div class="portlet-body" style="padding-top: 0px !important;">
                        <form id="serviceOrgAssessForm">
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td colspan="8" class="tr-title">
                                        <span class="caption-helper">基本信息</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;" colspan="2">
                                        机构名称
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;" colspan="2">
                                        <c:if test="${empty serviceOrgId}">
                                            <input name="serviceOrgName" placeholder="请输入机构名称" style="width: 100%"
                                                   class="form-control">
                                        </c:if>
                                        <c:if test="${not empty serviceOrgId}">
                                            <input type="hidden" value="${serviceOrgId}" id="serviceOrgId">
                                            <input name="serviceOrgName" placeholder="请输入机构名称" style="width: 100%" readonly
                                                   class="form-control" value="${sessionScope.login_user.serviceOrgName}">
                                        </c:if>
                                    </td>
                                    <input type="hidden" value="${areaNum}" id="areaNum">
                                    <input type="hidden" value="${cityNum}" id="cityNum">
                                    <td style="text-align:center;vertical-align:middle;" colspan="2">
                                        申请年度
                                    </td>
                                  <%--  <td style="text-align:center;vertical-align:middle;" colspan="2">--%>
                                <%--        <select id="applyYear" name="applyYear" class="form-control">
                                            <option value="">
                                                -- 请选择 --
                                            </option>
                                            <option value="2017.01~2017.12">
                                                2017.01~2017.12
                                            </option>
                                            <option value="2018.01~2018.12">
                                                2018.01~2018.12
                                            </option>
                                            <option value="2019.01~2019.12">
                                                2019.01~2019.12
                                            </option>
                                            </option>
                                        </select>
                                    </td>--%>
                                    <td style="text-align:center;vertical-align:middle;" colspan="2">
                                        <input type="text" id="applyYear" name="applyYear" class="form-control faDing" placeholder="请输入申请年度" name="legalRepresentative">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;" colspan="2">
                                        法定代表人
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;" colspan="2">
                                        <input type="text" id="legalRepresentative" name="legalRepresentative" class="form-control faDing" placeholder="请输入法定代表人" name="legalRepresentative">
                                    </td>
                                <%--    <td style="text-align:center;vertical-align:middle;" colspan="2">
                                        申请类型
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;" colspan="2">
                                        <input type="hidden" id="object" value="${object}">
                                        <select id="applyObject" name="applyObject" class="form-control">
                                            <option value="">
                                                -- 请选择 --
                                            </option>
                                            <option value="1">
                                                建设补贴
                                            </option>
                                            <option value="2">
                                                运营补贴
                                            </option>
                                        </select>
                                    </td>--%>
                                    <td style="text-align:center;vertical-align:middle;" colspan="2">
                                        审核结果
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;" colspan="2">
                                        <select id="status" name="status" class="form-control">
                                            <option value="">
                                                -- 请选择 --
                                            </option>
                                            <option value="0">
                                                未审核
                                            </option>
                                            <option value="1">
                                                区级审核通过
                                            </option>
                                            <option value="2">
                                                区级审核不通过
                                            </option>
                                            <option value="3">
                                                市级审核通过
                                            </option>
                                            <option value="4">
                                                市级审核不通过
                                            </option>
                                        </select>
                                    </td>
                                </tr>
                             <%--   <tr>

                                    <td style="text-align:center;vertical-align:middle;" colspan="2">
                                        联系电话
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;" colspan="2">
                                        <input type="text" class="form-control" placeholder="请输入联系电话" name="mobile">
                                    </td>
                                </tr>--%>
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
                                <shior:hasRole name="jgadmin">
                                    <input type="hidden" id="isJg" value="1">
                                </shior:hasRole>
                                <table class="table table-striped table-bordered table-hover"
                                       id="datatable_list">
                                    <thead>
                                    <tr role="row" class="heading">
                                        <th width="10%" style="text-align:center;vertical-align:middle;">
                                            申请年度
                                        </th>
                                        <th width="15%" style="text-align:center;vertical-align:middle;">
                                            机构名称
                                        </th>
                                        <th width="15%" style="text-align:center;vertical-align:middle;">
                                            详细地址
                                        </th>
                                        <th width="10%" style="text-align:center;vertical-align:middle;">
                                            法定代表人
                                        </th>
                                        <th width="15%" style="text-align:center;vertical-align:middle;">
                                            联系电话
                                        </th>
                                        <th width="2%" style="text-align:center;vertical-align:middle;">
                                            星级
                                        </th>
                                        <th width="5%" style="text-align:center;vertical-align:middle;">
                                            申请补贴床位数
                                        </th>
                                        <c:if test="${not empty areaNum}">
                                            <th width="5%" style="text-align:center;vertical-align:middle;">
                                                区级审核状态
                                            </th>
                                        </c:if>
                                        <c:if test="${not empty cityNum}">
                                            <th width="5%" style="text-align:center;vertical-align:middle;">
                                                市级审核状态
                                            </th>
                                        </c:if>
                                        <shior:hasRole name="jgadmin">
                                            <th width="5%" style="text-align:center;vertical-align:middle;display: none">
                                                市级审核状态
                                            </th>
                                        </shior:hasRole>

                                        <th width="10%" style="text-align:center;vertical-align:middle;">
                                            提交状态
                                        </th>
                                        <th width="10%" style="text-align:center;vertical-align:middle;">
                                            审批状态
                                        </th>
                                        <th width="15%" style="text-align:center;vertical-align:middle;">
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
                                                onclick="ServiceOrgSubsidyApplyList.goToPage()" title="GO">GO
                                        </button>
                                    </div>
                                </div>

                                    <a id="excel" class="btn btn-circle  btn-black excel"
                                       style="float: left;"><i class="fa">导出excel</i></a>

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
                                onclick="ServiceOrgSubsidyApplyList.getAreaName()">
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
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/serviceOrg_subsidy_applyList.js?v=1"
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
                ServiceOrgSubsidyMechanismList.init();
            });
            //操作按钮权限控制
            function getPermission ( data, type, row,meta ) {
                var columnHtml = '';
                    <shior:hasPermission name="mechanism-detail">
                        columnHtml += '<button data="' + data + '"   class="btn default btn-xs blue-stripe info">详细</button>';
                    </shior:hasPermission>
                        columnHtml += '<button data-id="' + data + '" class="btn default btn-xs red-stripe del">删除</button>';
                    <shior:hasPermission name="mechanism-examine">
                        columnHtml += '<button data-eventid="' + data + '" class="btn btn-xs yellow-stripe invalid" >审核</button>'
                    </shior:hasPermission>

                    columnHtml += '<button data ="' + data + '" class="btn btn-xs yellow-stripe elderlyInfo" >再养老人详情</button>'

                return columnHtml;
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

