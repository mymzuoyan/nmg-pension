<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>看护对象信息</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
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
                    <a href="#">智能看护</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">看护对象信息</a>
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
                            <span class="caption-subject font-red-sunglo bold uppercase">
                                看护对象信息列表
                            </span>
                        </div>
                    </div>
                    <shior:hasPermission name="nurse-manager-system-nurse">
                        <input type="hidden" id="nurseManagerSysNurse" value="1"/>
                    </shior:hasPermission>
                    <div class="portlet-body" style="padding-top: 0px !important;">
                        <form id="elder-form" name="elder-form">
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td colspan="8"  class="tr-title">
                                        <span class="caption-helper">基本信息</span>
                                    </td>
                                </tr>
                                <tbody id="tbody1" style="border-bottom:0px solid #eee;">
                                <tr>
                                    <%--<td width="10%" style="text-align:center;vertical-align:middle;">所属区域</td>--%>
                                    <%--<td width="15%" style="text-align:center;vertical-align:middle;">--%>
                                        <%--<input class="form-control" name="areaName" id="areaName"--%>
                                               <%--onclick="ServiceOrgNurseElderlyList.selectArea();"--%>
                                                <%--<c:if test="${sessionScope.login_user.areaId>1}">--%>
                                                    <%--<c:if test="${not empty sessionScope.login_user.areaName}">--%>
                                                        <%--value="${sessionScope.login_user.areaName}"--%>
                                                    <%--</c:if>--%>
                                                <%--</c:if>--%>
                                                <%--<c:if test="${sessionScope.login_user.areaId==1}">--%>
                                                    <%--<c:if test="${not empty areaName}">--%>
                                                        <%--value="${areaName}"--%>
                                                    <%--</c:if>--%>
                                                <%--</c:if>--%>
                                               <%--type="text"/>--%>
                                        <%--<input type="hidden" name="areaId" id="areaId"/>--%>
                                    <%--</td>--%>
                                    <td  style="text-align:center;vertical-align:middle;">组织名称</td>
                                    <td  style="text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="serviceOrgName" id="serviceOrgName"
                                               type="text"/>
                                        <input type="hidden" name="serviceOrgId" id="serviceOrgId"/>
                                    </td>
                                    <td  style="text-align:center;vertical-align:middle;">
                                        姓&nbsp;&nbsp;名
                                    </td>
                                    <td  style="text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="elderName" id="elderName"/>
                                    </td>
                                        <td style="text-align:center;vertical-align:middle;">
                                            设备信息
                                        </td>
                                        <td style="text-align:center;vertical-align:middle;">
                                            <input class="form-control" name="deviceName" id="deviceName"/>
                                        </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        设备号&nbsp;&nbsp;
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="deviceNumber" id="deviceNumber"/>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        身份证
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;" colspan="3">
                                        <input class="form-control" name="idcardno" id="idcardno"/>
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                        </form>
                        <div class="right" style="text-align: right">
                            <a class="table-group-action-submit btn btn-circle btn-import"><i class="fa">查询</i></a>
                            <a class="reload table-group-action-reload btn btn-circle btn-black"><i
                                    class="fa">重置</i></a>
                        </div>
                    </div>
                    <div class="portlet">
                        <div class="portlet-body">
                            <div class="table-container">
                                <div class="table-group-actions-wrapper">
                                </div>
                                <table class="table table-striped table-bordered table-hover"
                                       id="datatable_serviceOrg_nurse_elderly_List">
                                    <thead>
                                    <tr role="row" class="heading">
                                        <th width="1%">
                                            <input type="checkbox" class="group-checkable">
                                        </th>
                                        <th width="8%">
                                            所属区域
                                        </th>
                                        <th width="15%">
                                            组织名称
                                        </th>
                                        <th width="8%">
                                            老人名称
                                        </th>
                                        <th width="10%">
                                            年龄
                                        </th>
                                        <th width="12%">
                                            性别
                                        </th>
                                        <th width="5%">
                                            设备信息
                                        </th>
                                        <th width="5%">
                                            床位信息
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
                                                onclick="ServiceOrgNurseElderlyList.goToPage()" title="GO">GO
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 地区模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">请选择...</h4>
                    </div>
                    <div class="modal-body">
                        <!-- BEGIN PAGE CONTENT-->
                        <div id="areaTree" class="tree-demo"></div>
                        <!-- END PAGE CONTENT-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary"
                                onclick="ServiceOrgNurseElderlyList.getAreaValue(AreaTree.getAllAreaName(AreaTree.getSelectArea()),AreaTree.getSelectArea());">
                            确定
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/nurse/serviceOrg_nurse_elderly_list.js?v=1.9"
                type="text/javascript"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                AreaTree.init();
                ServiceOrgNurseElderlyList.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

