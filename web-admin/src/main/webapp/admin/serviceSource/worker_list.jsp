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
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>养老从业人员列表</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
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
                    <a href="#">服务人员</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">养老从业人员列表</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <!-- Begin: life time stats -->
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption">
                            养老从业人员列表
                        </div>
                        <div class="tools">
                            <shiro:hasPermission name="user-worker-manager-create">
                            <div style="float: left">
                                <a class="btn btn-circle btn-add"
                                   data="${pageContext.request.contextPath}/admin/user/fuwu/add?serviceOrgType=${serviceOrgType}&type=2"><i
                                        class="fa">新增人员</i></a>
                            </div>
                            </shiro:hasPermission>
                            <a href="" class="expand"></a>
                        </div>
                    </div>
                    <div id="searchDiv" class="portlet-body form" style="">
                        <input type="hidden" name="serviceOrgId" value="${user.serviceOrgId}">
                        <input type="hidden" name="areaName" value="${user.areaName}">
                        <table class="table table-bordered table-hover table-condensed table-responsive">
                            <tr>
                                <td style="text-align:center;vertical-align:middle;">所属区域</td>
                                <td style="text-align:center;vertical-align:middle;">
                                    <input class="form-control" name="areaName" id="areaName"
                                           onclick="WorkerList.selectArea();"
                                            <c:if test="${sessionScope.login_user.areaId>1}">
                                                <c:if test="${not empty sessionScope.login_user.areaName}">
                                                    value="${sessionScope.login_user.areaName}"
                                                </c:if>
                                            </c:if>
                                            <c:if test="${sessionScope.login_user.areaId==1}">
                                                <c:if test="${not empty areaName}">
                                                    value="${areaName}"
                                                </c:if>
                                            </c:if>
                                           type="text"/>
                                    <input type="hidden" name="areaId" id="areaId"/>
                                </td>
                                <td width="10%" style="text-align:center;vertical-align:middle;">所属组织</td>
                                <td width="40%" style="text-align:center;vertical-align:middle;">
                                    <input name="serviceOrgName" class="form-control" id="serviceOrgName"
                                           type="text"/>
                                </td>
                            </tr>
                            <tr>
                                <td width="10%" style="text-align:center;vertical-align:middle;">姓名</td>
                                <td width="40%" style="text-align:center;vertical-align:middle;">
                                    <input name="name" class="form-control"
                                           type="text"/>
                                </td>
                                <td width="10%" style="text-align:center;vertical-align:middle;">身份证号</td>
                                <td width="40%" style="text-align:center;vertical-align:middle;">
                                    <input name="idcardno" class="form-control"
                                           type="text"/>
                                </td>
                            </tr>
                        </table>
                        <div style="text-align: right">
                            <a id="search" class="btn btn-circle  green">
                                查询 </i>
                            </a>
                            <a id="reload" class="reload table-group-action-reload btn btn-circle btn-black"><i
                                    class="fa">重置</i></a>
                        </div>
                    </div>
                </div>
                <div class="portlet">
                    <div class="portlet-body">
                        <div class="table-container">
                            <table class="table table-striped table-bordered table-hover" id="datatable_worker_list">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="1%">
                                        <input type="checkbox" class="group-checkable">
                                    </th>
                                    <th width="10%">
                                        姓名
                                    </th>
                                    <th width="15%">
                                        所属组织
                                    </th>
                                    <th width="5%">
                                        性别
                                    </th>
                                    <th width="5%">
                                        年龄
                                    </th>
                                    <th width="10%">
                                        身份证号
                                    </th>
                                    <th width="8%">
                                        联系方式
                                    </th>
                                    <th width="10%">
                                        职位类型
                                    </th>
                                    <th width="10%">
                                        历史服务次数
                                    </th>
                                    <th width="10%">
                                        服务星级
                                    </th>
                                    <th width="10%">
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
                                            onclick="UserFuwu.goToPage()" title="GO">GO
                                    </button>
                                </div>
                                <shiro:hasPermission name="user-worker-manager-delete">
                                    <div class="right" style="text-align: right;margin-top: 10px"
                                         id="serviceUser_delete">
                                        <span></span>
                                        <button id="btnDeleteServiceUser" class="btn btn-circle red"><i
                                                class="fa fa-times"> 删除</i>
                                        </button>
                                    </div>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="user-worker-manager-list">
                                    <input type="hidden" id="userWorkerList" value="1"/>
                                </shiro:hasPermission>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End: life time stats -->
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
                                onclick="WorkerList.getAreaValue(AreaTree.getAllAreaName(AreaTree.getSelectArea()),AreaTree.getSelectArea());">
                            确定
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
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
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/worker_list.js?v=2.2"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                AreaTree.init();
                WorkerList.init();

            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

