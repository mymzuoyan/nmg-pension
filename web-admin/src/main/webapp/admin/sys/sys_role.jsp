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
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>角色管理</title>
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
                    <a href="#">角色管理</a>
                </li>
            </ul>
        </div>
        <div class="row" id="divContainer">

            <div class="col-md-4">
                <div class="portlet ">
                    <div class="portlet-body">
                        <p><br/><br/><br/><br/><br/><br/></p>
                        <div class="form">
                            <div class="form-group">
                                <select id="selectRoles" class="form-control input-small"></select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <!-- Begin: life time stats -->
                <div class="portlet ">
                    <div class="portlet-body">
                        <div class="form">
                            <div class="form-body">
                                <div class="form-group">
                                    <div id="permission">
                                        <div id="jstree_demo" class="demo"
                                             style="margin-top:1em; min-height:130px;"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button id="btnSave" data-loading-text="保存中..." type="button"
                                            class="btn green">
                                        保存
                                    </button>
                                    <label class="label label-default" id="btnSaveMsg"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End: life time stats -->
            </div>
        </div>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/jstree.min.js"></script>

        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/sys/sys_role.js?v=1.1"></script>

        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                SystemRole.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

