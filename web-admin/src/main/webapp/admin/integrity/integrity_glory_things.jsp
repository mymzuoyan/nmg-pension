<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>光荣榜事迹</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
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
                    <a href="#">光荣榜</a>
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
                            <span class="caption-subject font-red-sunglo bold uppercase">光荣榜</span>
                                <%--<input type="hidden" id="roleId" value="${roleId}">--%>
                                <%--<input type="hidden" name="serviceOrgId" value="${user.serviceOrgId}">--%>
                        </div>
                        <div class="tools">
                            <%--<div style="float: left">--%>
                                <%--<a class="btn btn-circle green"--%>
                                   <%--href="${pageContext.request.contextPath}/admin/serviceOrg/add"><i--%>
                                        <%--class="fa">新增</i></a>--%>
                            <%--</div>--%>
                            <a href="" class="expand"></a>
                        </div>
                    </div>
                        <%--<c:if test="${roleId != 4}">--%>
                    <div class="portlet-body" style="padding-top: 0px !important;display: none">
                        <form id="exposureSystemForm">
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td colspan="6" class="tr-title">
                                        <span class="caption-helper">基本信息</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        组织名称
                                    </td>
                                    <td style="width:20%;text-align:center;vertical-align:middle;">
                                        <input name="institutionName" placeholder="请输入组织名称" style="width: 100%"
                                               class="form-control">
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        标题
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="title" placeholder="请输入标题"
                                               style="width: 100%">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        分数
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="startScore" placeholder="请输入起始分数"
                                               style="width: 100%">
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        至
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="endScore" placeholder="请输入结束分数"
                                               style="width: 100%">
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <div class="right" style="text-align: right">
                            <a id="search" class="btn btn-circle  green">
                                <i>查询 </i>
                            </a>
                            <a class="reload table-group-action-reload btn btn-circle btn-black"><i
                                    class="fa">重置</i></a>
                        </div>
                    </div>
                    <shior:hasPermission name="glory-showList-delete">
                        <input type="hidden" id="gloryDelete" value="1"/>
                    </shior:hasPermission>
                        <%--</c:if>--%>
                    <div class="portlet">
                        <div class="portlet-body">
                            <div class="table-container">
                                <table class="table table-striped table-bordered table-hover"
                                       id="datatable_exposure_List">
                                    <thead>
                                    <tr role="row" class="heading">
                                        <th width="1%">
                                            <input type="checkbox" class="group-checkable">
                                        </th>
                                        <th width="8%">
                                            组织名称
                                        </th>
                                        <th width="21%">
                                            标题
                                        </th>
                                        <th width="8%">
                                            创建人
                                        </th>
                                        <th width="8%">
                                            创建时间
                                        </th>
                                        <th width="10%">
                                            分数
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
                                                onclick="CardSystemList.goToPage()" title="GO">GO
                                        </button>
                                    </div>
                                </div>
                                <div class="right" style="text-align: right;display: block;">
                                    <button id="deleteSomeMsg" class="btn btn-circle red"
                                            onclick="deleteSomeMsg(this,'/admin/api/Integrity/deleteSome')"
                                            data-loading-text="删除中..."><i class="fa fa-times"> 批量删除</i>
                                    </button>
                                </div>
                                    <%--<div class="right" style="text-align: right;" id="elderInfo-delete">
                                        <span></span>
                                        <button id="checkall" class="btn btn-circle red"><i class="fa icon-note"></i>一键审核</button>
                                    </div>--%>
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
                                onclick="CardSystemList.getAreaName()">
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
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/integrity/integrity_glory_things.js?v=1.0"></script>
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
                IntegrityGloryThings.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

