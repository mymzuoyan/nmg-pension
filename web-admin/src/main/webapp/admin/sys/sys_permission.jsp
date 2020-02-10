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
        <title>权限管理</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/themes/default/style.min.css"/>

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
                    <a href="#">系统管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">权限管理</a>
                </li>
            </ul>
        </div>
        <div class="row" id="uiContainer">
            <div class="col-md-4">
                <!-- Begin: life time stats -->
                <div class="portlet ">
                    <div class="portlet-body">
                        <div id="jstree_demo" class="demo" style="margin-top:1em; min-height:200px;"></div>
                        <div class="clearfix">
                            <button type="button" class="btn green addPermission"><i class="fa icon-plus "></i>
                                </a>添加
                            </button>
                            <button type="button" class="btn red deletePermission"><i class="fa fa-times "></i>
                                </a>删除
                            </button>
                        </div>
                    </div>
                </div>
                <!-- End: life time stats -->
            </div>
            <div class="col-md-8">
                <div class="portlet ">
                    <div class="portlet-body">
                        <form id="formUpdate">
                            <div class="form-group input-xlarge">
                                <label class="control-label">权限名称(<span class="required">*</span>)</label>
                                <input name="perName" type="text" class="form-control">
                            </div>
                            <div class="form-group input-xlarge">
                                <label class="control-label">权限值(<span class="required">*</span>)</label>
                                <input name="perValue" type="text" class="form-control">
                            </div>
                            <div class="form-group input-xlarge">
                                <label class="control-label">排序</label>
                                <input name="perSort" type="text" class="form-control">
                            </div>
                            <button id="btnSave" type="submit" class="btn btn-success">保存</button>
                            <label id="btnSaveMsg" class="label label-default"></label>
                        </form>

                        <form id="formAdd" class="display-hide">
                            <input id="newParentId" type="hidden" value=""/>
                            <div class="form-group input-xlarge">
                                <label class="control-label">父节点</label>
                                <input id="newParentName" type="text" class="form-control">
                            </div>
                            <div class="form-group input-xlarge">
                                <label class="control-label">权限名称(<span class="required">*</span>)</label>
                                <input id="newName" type="text" class="form-control">
                            </div>
                            <div class="form-group input-xlarge">
                                <label class="control-label">权限值(<span class="required">*</span>)</label>
                                <input id="newValue" type="text" class="form-control">
                            </div>
                            <div class="form-group input-xlarge">
                                <label class="control-label">排序</label>
                                <input id="sort" name="sort" type="text" class="form-control">
                            </div>
                            <button id="btnSaveNew" type="submit" class="btn btn-success">保存</button>
                            <label id="btnSaveNewMsg" class="label label-default"></label>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/jstree.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/sys/sys_permission.js?v=1.2"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init(); // init metronic core components
                Layout.init();
                SystemPermission.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

