<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>养老服务组织</title>
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
                    <a href="#">居家养老服务组织评估</a>
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
                            <span class="caption-subject font-red-sunglo bold uppercase">居家养老服务组织评估列表</span>
                            <input type="hidden" id="roleId" value="${roleId}">
                            <input type="hidden" name="serviceOrgId" value="${user.serviceOrgId}">
                        </div>
                        <div class="tools">
                            <%--<shior:hasRole name="zuadmin">--%>
                           <%-- <shior:hasPermission name="serviceOrgSup-orgAssess-orgAssessShow-create">--%>
                                <div style="float: left">
                                    <a class="btn btn-circle btn-add"
                                       href="${pageContext.request.contextPath}/admin/orgAssessAdd?method=add&serviceOrgId=${user.serviceOrgId}"><i
                                            class="fa">申请</i></a>
                                </div>
                          <%--  </shior:hasPermission>--%>
                            <%--</shior:hasRole>--%>
                            <a href="" class="collapse"></a>
                        </div>
                    </div>
                    <c:if test="${roleId != 4}">
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
                                            组织名称
                                        </td>
                                        <td style="width:15%;text-align:center;vertical-align:middle;">
                                            <input name="institutionName" placeholder="请输入组织名称" style="width: 100%"
                                                   class="form-control">
                                        </td>
                                        <td style="width:10%;text-align:center;vertical-align:middle;">
                                            评估时间
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
                                            申报等级
                                        </td>
                                        <td style="text-align:center;vertical-align:middle;" colspan="2">
                                            <c:if test="${empty gradeDictId}">

                                                <c:choose>
                                                    <c:when test="${roleId == 1 or roleId==3}">
                                                        <select id="gradeDictId" name="gradeDictId"
                                                                class="form-control">
                                                            <option value=''>--全部--</option>
                                                            <option value='0'>A级</option>
                                                            <option value='1'>AA级</option>
                                                            <option value='2'>AAA级</option>
                                                            <option value='3'>AAAA级</option>
                                                            <option value='4'>AAAAA级</option>
                                                        </select>
                                                    </c:when>
                                                    <c:when test="${roleId == 2}">
                                                        <select id="gradeDictId" name="gradeDictId"
                                                                class="form-control">
                                                            <option value=''>--全部--</option>
                                                            <option value='2'>AAA级</option>
                                                            <option value='3'>AAAA级</option>
                                                            <option value='4'>AAAAA级</option>
                                                        </select>
                                                    </c:when>
                                                </c:choose>
                                            </c:if>
                                            <c:if test="${not empty gradeDictId}">
                                                <select id="gradeDictId" name="gradeDictId"
                                                        class="form-control" readonly>
                                                    <option value='12'
                                                            <c:if test="${gradeDictId==12}">selected</c:if> >AAA级以下
                                                    </option>
                                                    <option value='2'
                                                            <c:if test="${gradeDictId==2}">selected</c:if> >AAA级
                                                    </option>
                                                    <option value='3' <c:if test="${gradeDictId==3}">selected</c:if>>
                                                        AAAA级
                                                    </option>
                                                    <option value='4' <c:if test="${gradeDictId==4}">selected</c:if>>
                                                        AAAAA级
                                                    </option>
                                                </select>
                                            </c:if>
                                        </td>
                                        <c:if test="${roleId==3}">
                                            <td style="text-align:center;vertical-align:middle;">
                                                初审结果
                                            </td>
                                            <td style="text-align:center;vertical-align:middle;" colspan="2">
                                                <div class="radio-list">
                                                    <label class="radio-inline">
                                                        <input type="radio" value="1" name="qustandard"
                                                               <c:if test="${qustandard==1}">checked</c:if> >通过
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" value="0" name="qustandard"
                                                               <c:if test="${qustandard==0}">checked</c:if>>不通过
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" value="2" name="qustandard"
                                                               <c:if test="${qustandard==2}">checked</c:if>>未评估
                                                    </label>
                                                </div>
                                            </td>
                                        </c:if>
                                        <c:if test="${roleId!=3}">
                                            <input type="hidden" value="1" name="qustandard" id="qustandard">
                                            <td style="text-align:center;vertical-align:middle;">
                                                评估结果
                                            </td>
                                            <td style="text-align:center;vertical-align:middle;" colspan="2">
                                                <div class="radio-list">
                                                    <label class="radio-inline">
                                                        <input type="radio" value="1" name="standard"
                                                               <c:if test="${standard==1}">checked</c:if>>通过
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" value="0" name="standard"
                                                               <c:if test="${standard==0}">checked</c:if>>不通过
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" value="2" name="standard"
                                                               <c:if test="${standard==2}">checked</c:if>>未评估
                                                    </label>
                                                </div>
                                            </td>
                                        </c:if>
                                    </tr>
                                </table>
                            </form>
                            <div class="right" style="text-align: right">
                                <a class="table-group-action-submit btn btn-circle btn-import"><i class="fa">查询</i></a>
                                <a class="reload table-group-action-reload btn btn-circle btn-black"><i
                                        class="fa">重置</i></a>
                            </div>
                        </div>
                    </c:if>
                    <shior:hasPermission name="serviceOrgSup-orgAssess-orgAssessShow-list">
                        <input type="hidden" id="serviceOrgSupOrgAssOrgAssList" value="1"/>
                    </shior:hasPermission>
                    <div class="portlet">
                        <div class="portlet-body">
                            <div class="table-container">
                                <table class="table table-striped table-bordered table-hover"
                                       id="datatable_serviceOrgAssess_List">
                                    <thead>
                                    <tr role="row" class="heading">
                                            <%--<th width="1%">
                                                <input type="checkbox" class="group-checkable">
                                            </th>--%>
                                        <th width="15%" style="text-align:center;vertical-align:middle;">
                                            所属区域
                                        </th>
                                        <th width="20%" style="text-align:center;vertical-align:middle;">
                                            机构名称
                                        </th>
                                        <th width="10%" style="text-align:center;vertical-align:middle;">
                                            申报等级
                                        </th>
                                        <th width="15%" style="text-align:center;vertical-align:middle;">
                                            申请时间
                                        </th>
                                        <th width="15%" style="text-align:center;vertical-align:middle;">
                                            评估时间
                                        </th>
                                        <th width="15%" style="text-align:center;vertical-align:middle;">
                                            评估状态
                                        </th>
                                        <th width="10%" style="text-align:center;vertical-align:middle;">
                                            维护
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
                                                onclick="ServiceOrgAssess.goToPage()" title="GO">GO
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
                                onclick="ServiceOrgAssess.getAreaName()">
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
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/serviceOrg_assess.js?v=2.0"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <!--timer-->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <!--area-->
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
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
                ServiceOrgAssess.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

