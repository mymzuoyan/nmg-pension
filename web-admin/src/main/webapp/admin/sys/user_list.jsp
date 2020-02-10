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
        <title>用户列表</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
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
                    <a href="#">用户管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">用户列表</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <!-- Begin: life time stats -->
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-list"></i>用户列表
                        </div>
                        <div class="tools">
                            <a href="" class="expand" style="" aria-describedby="hidden">
                            </a>
                        </div>
                    </div>
                    <div id="searchDiv" class="portlet-body form" style="display: none">
                        <table class="table table-bordered table-hover table-condensed table-responsive">
                            <tr>
                                <td width="13%" style="text-align:center;vertical-align:middle;">昵称：</td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input name="nick_name" class="form-control"
                                           type="text"/>
                                </td>
                                <td width="13%" style="text-align:center;vertical-align:middle;">账号：</td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input name="login_name" class="form-control"
                                           type="text"/>
                                </td>
                            </tr>
                        </table>
                        <div style="text-align: right">
                            <a id="search" class="btn btn-circle  green">
                                查询 </i>
                            </a>
                        </div>
                    </div>
                    <div class="portlet">
                        <div class="portlet-body">
                            <ul class="nav nav-tabs" id="roleUl">
                                <shiro:hasPermission name="system-user-create-suadmin">
                                    <li>
                                        <a href="javascript:void(0)" data="1">
                                            超级管理员 </a>
                                    </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="system-user-create-muadmin">
                                    <li>
                                        <a href="javascript:void(0)" data="2">
                                            市级管理员 </a>
                                    </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="system-user-create-readmin">
                                    <li>
                                        <a href="javascript:void(0)" data="3">
                                            区级管理员 </a>
                                    </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="system-user-create-stadmin">
                                    <li>
                                        <a href="javascript:void(0)" data="4">
                                            街道管理员 </a>
                                    </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="system-user-create-coadmin">
                                    <li>
                                        <a href="javascript:void(0)" data="5">
                                            社区管理员 </a>
                                    </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="system-user-create-zuadmin">
                                    <li>
                                        <a href="javascript:void(0)" data="6">
                                            组织管理员 </a>
                                    </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="system-user-create-jgadmin">
                                    <li>
                                        <a href="javascript:void(0)" data="12">
                                            机构管理员 </a>
                                    </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="system-user-create-serviceuser">
                                    <li>
                                        <a href="javascript:void(0)" data="9">
                                            服务人员 </a>
                                    </li>
                                </shiro:hasPermission>
                                <shiro:hasRole name="suadmin">
                                    <li>
                                        <a href="javascript:void(0)" data="">
                                            所有人员 </a>
                                    </li>
                                </shiro:hasRole>
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade active in">
                                <div class="table-container">
                                    <table class="table table-striped table-bordered table-hover"
                                           id="datatable_user_list">
                                        <thead>
                                        <tr role="row" class="heading">
                                            <th width="15%">
                                                账号
                                            </th>
                                            <th width="15%">
                                                昵称
                                            </th>
                                            <th width="15%">
                                                角色
                                            </th>
                                            <th width="25%">
                                                所属区域/组织
                                            </th>
                                            <th width="15%">
                                                用户状态
                                            </th>
                                            <th width="15%">
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
                                                    onclick="UserList.goToPage()" title="GO">GO
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End: life time stats -->

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
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
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/sys/user_list.js?v=2.5"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                UserList.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

