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
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>坐席组</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>

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
                    <a href="#">坐席管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">坐席组</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-body">
                        <div class="tabbable-line">
                            <ul class="nav nav-tabs ">
                                <li class="active">
                                    <a id="tab_listA" href="#tab_list" data-toggle="tab">
                                        坐席组 </a>
                                </li>
                                <shior:hasPermission name="monitor-group-add">
                                    <li>
                                        <a id="tab_addA" href="#tab_add" data-toggle="tab">
                                            添加坐席组 </a>
                                    </li>
                                </shior:hasPermission>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab_list">
                                    <div class="table-container">
                                        <table class="table table-striped table-bordered table-hover"
                                               id="datatable_monitor_group">
                                            <thead>
                                            <tr role="row" class="heading">
                                                <th width="20%">
                                                    id
                                                </th>
                                                <th width="50%">
                                                    坐席组名称
                                                </th>
                                                <th width="30%">
                                                    操作
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane from" id="tab_add">
                                    <div class="form-horizontal">
                                        <div class="form-body">
                                            <div class="form-group">
                                                <input name="groupId" type="hidden"
                                                       class="form-control input-xlarge"
                                                       value="">
                                                <label class="col-md-2 control-label">坐席组名称
                                                    <span class="required">	* </span>
                                                </label>
                                                <div class="col-md-10">
                                                    <input name="name" type="text"
                                                           class="form-control input-xlarge"
                                                           value="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-actions">
                                            <div class="row">
                                                <div class="col-md-offset-4 col-md-8">
                                                    <button id="btnPublish" type="submit" class="btn green"
                                                            data-loading-text="添加中...">添加
                                                    </button>
                                                    <span id="labelmsg" class="label "></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 弹出框 -->
        <div id="updateModal" class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" style="margin-top:150px; width: 800px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title">
                            更新坐席群组
                        </h4>
                    </div>
                    <div class="modal-body form-horizontal from">
                        <div class="form-body">
                            <div class="form-group">
                                <input name="groupId" type="hidden"
                                       value="">
                                <label class="col-md-2 control-label">坐席组名称
                                    <span class="required">	* </span>
                                </label>
                                <div class="col-md-10">
                                    <input name="name" type="text"
                                           class="form-control input-xlarge"
                                           value="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <shior:hasPermission name="monitor-group-update">
                            <button type="button" class="btn blue btnUpdate">更新</button>
                        </shior:hasPermission>
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.弹出框 -->
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/call/monitorGroup_list.js"></script>

        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                MonitorGroupList.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

