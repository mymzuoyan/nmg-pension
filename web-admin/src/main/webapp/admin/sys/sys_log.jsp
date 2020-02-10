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
        <title>系统日志</title>
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
                    <a href="#">系统管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">系统日志</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption">
                            系统日志查询
                        </div>
                        <div class="tools">
                            <a href="" class="expand">
                            </a>
                        </div>
                    </div>
                    <div id="searchDiv" class="portlet-body form" style="display: none">
                        <table class="table table-bordered table-hover table-condensed table-responsive">
                            <tr>
                                <td width="13%" style="text-align:center;vertical-align:middle;">人员名称：</td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input name="name" class="form-control"
                                           type="text"/>
                                </td>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    人员角色：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <select class="form-control input-xlarge" id="role">
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <div style="text-align: right">
                            <a id="search" class="btn btn-circle  green">
                                查询 </i>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="portlet">
                    <div class="portlet-body">
                        <div class="table-container">
                            <table class="table table-striped table-bordered table-hover"
                                   id="datatable_log_list">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="20%">
                                        序号
                                    </th>
                                    <th width="20%">
                                        操作
                                    </th>
                                    <th width="20%">
                                        操作人
                                    </th>
                                    <th width="20%">
                                        操作时间
                                    </th>
                                    <th width="20%">
                                        请求IP
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
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
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/sys/log_list.js?v=1"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                LogList.init();
                $.post(window.apppath + "/admin/api/sysrole/getList", {
                    orderField:"level",
                    orderDir:"ASC"
                }, function (res) {
                    if (res.recordsFiltered > 0) {
                        var optionHtml = '<option value="">请选择</option>';
                        for (var i = 0; i < res.data.length ; i++) {
                                optionHtml += '<option  value="' + res.data[i].id + '">' + res.data[i].name + '</option>';
                        }
                        $('#role').html(optionHtml);
                    }
                }, 'json');
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

