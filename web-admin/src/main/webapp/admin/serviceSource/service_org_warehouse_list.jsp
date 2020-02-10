<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>仓库管理</title>
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
                    <a href="#">入职补贴审批</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">入职补贴查询列表</a>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <!-- Begin: life time stats -->
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption">
                            仓库列表
                        </div>
                        <div class="tools">
                                <div style="float: left">
                                    <a class="btn btn-circle btn-add" onclick="ServiceOrgWarehouse.showAddModal()"><i
                                            class="fa">新增</i></a>
                                </div>
                            <a href="" class="expand"></a>
                        </div>
                    </div>
                    <div id="searchDiv" class="portlet-body form" style="">
                        <table class="table table-bordered table-hover table-condensed table-responsive">
                            <tr>
                                <td style="vertical-align: middle">
                                    类型
                                </td>
                                <td style="text-align:center;vertical-align:middle;">
                                    <select name="type" id="type" class="form-control">
                                        <option value="">--全部--</option>
                                        <option value="1">入库</option>
                                        <option value="2">出库</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <div style="text-align: right">
                            <a id="refresh" class="btn btn-circle  green">
                                <i> 刷新 </i>
                            </a>
                            <a id="search" class="btn btn-circle  green">
                                <i> 查询 </i>
                            </a>
                            <a id="reload" class="reload table-group-action-reload btn btn-circle btn-black"><i
                                    class="fa">重置</i></a>
                        </div>
                    </div>
                </div>
                <div class="portlet">
                    <div class="portlet-body">
                        <div class="table-container">
                            <table class="table table-striped table-bordered table-hover"
                                   id="datatable_list">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="5%">
                                        <input type="checkbox" class="group-checkable">
                                    </th>
                                    <th width="20%">
                                        机构名称
                                    </th>
                                    <th width="20%">
                                        出入库
                                    </th>
                                    <th width="20%">
                                        商品名称
                                    </th>
                                    <th width="10%">
                                        商品数量
                                    </th>
                                    <th width="20%">
                                        时间
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
                                            onclick="ServiceOrgWarehouse.goToPage()" title="GO">GO
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End: life time stats -->
        </div>

        <!-- 导入模态框（Modal） -->
        <div class="modal fade" id="addModal" tabindex="-1"
             role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal"
                                aria-hidden="true"></button>
                        <h4 class="modal-title"
                            id="addModalLabel">出入库</h4>
                    </div>
                    <div class="modal-body">
                        <form id="addForm">
                            <table class="table table-striped table-bordered table-cover" id="addPriceTable">
                                <tr>
                                    <td width="15%">
                                        组织名称:
                                    </td>
                                    <td width="35%">
                                        <input type="text" class="form-control"
                                               name="institutionName" value="${sessionScope.login_user.serviceOrgName}"
                                               readonly>
                                        <input type="hidden" name="serviceOrg.id" id="serviceOrgId"
                                               value="${sessionScope.login_user.serviceOrgId}">
                                    </td>
                                </tr>
                                <tr>
                                    <td width="15%">
                                        出入库:
                                    </td>
                                    <td width="35%">
                                        <select id="typeSelect" class="form-control"
                                                name="type">
                                            <option value="" >--请选择--</option>
                                            <option value="1">入库</option>
                                            <option value="2">出库</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="15%">
                                        商品名称:
                                    </td>
                                    <td width="35%">
                                        <input name="name" type="text" class="form-control"
                                               value="" style="width: 90%;float: left"><span style="float: left;margin-top: 10px"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="15%">
                                        数量:
                                    </td>
                                    <td width="35%">
                                        <input name="number" type="text" class="form-control"
                                               value="">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn blue" data-loading-text="保存中..."
                                onclick="ServiceOrgWarehouse.save()">
                            保存
                        </button>
                        <span id="labelmsg" class="label"></span>

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
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/service_org_warehouse_list.js?v=2.2"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js?v=1.2"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                ServiceOrgWarehouse.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

