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
        <title>客户列表</title>
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
                    <a href="#">呼叫客户管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">客户列表</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption">
                            客户查询
                        </div>
                        <div class="tools">
                            <div style="float: left">
                                <shiro:hasPermission name="check-item-statistics">
                                    <a href="${pageContext.request.contextPath}/file/excel/download/call/呼叫客户导入模板.xls"/>&nbsp;导入Excel模板下载&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                    <%--<a class="btn btn-circle btn-add" id="addTab"
                                       data="${pageContext.request.contextPath}/admin/elderNurse/add"><i
                                            class="fa">新增</i></a>--%>
                                    <a class="table-group-action-import btn btn-circle btn-import"><i
                                            class="fa">导入</i></a>
                                </shiro:hasPermission>
                            </div>
                            <a href="" class="expand">
                            </a>
                        </div>
                    </div>
                    <div id="searchDiv" class="portlet-body form" style="display: none">
                        <table class="table table-bordered table-hover table-condensed table-responsive">
                            <tr>
                                <td width="13%" style="text-align:center;vertical-align:middle;">呼叫号码：</td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input name="callNum" class="form-control"
                                           type="text"/>
                                </td>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    客户名称：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input name="name" class="form-control"/>
                                </td>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    客户性别：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <div class="radio-list">
                                        <label class="radio-inline">
                                            <input type="radio" name="gender" value=""> 不限</label>
                                        <label class="radio-inline">
                                            <input type="radio" name="gender" value="1"> 男</label>
                                        <label class="radio-inline">
                                            <input type="radio" name="gender" value="2"> 女 </label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="13%" style="text-align:center;vertical-align:middle;">身份证：</td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input name="cardId" class="form-control"
                                           type="text"/>
                                </td>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    客户群组：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <select id="groupId" class="form-control">

                                    </select>
                                </td>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    客户年龄：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input type="text" id="startAge" name="startAge" maxlength="3" size="5"/>
                                    至&nbsp;<input type="text" id="endAge" name="endAge" maxlength="3" size="5"/>
                                </td>
                            </tr>
                            <shiro:hasAnyRoles name="suadmin,muadmin">
                                <tr>
                                    <td colspan="6">
                                        <span class="caption-helper">按地域范围查询</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        行政区：
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input type="hidden" value="0" id="province">
                                        <input type="hidden" value="1" id="city">
                                        <select name="area" class="form-control" id="county"
                                                onChange="EographicArea.changeCounty();"
                                                readonly="readonly">
                                            <option value="">行政区，市，县</option>
                                        </select>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">街道：</td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="street" class="form-control" id="town"
                                                onChange="EographicArea.changeTown();"
                                                readonly="readonly">
                                            <option value="">街道，乡，镇</option>
                                        </select>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        社区:
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="community" class="form-control" id="village"
                                                onChange="EographicArea.changeVillage();"
                                                readonly="readonly">
                                            <option value="">社区，村</option>
                                        </select>
                                    </td>
                                </tr>
                            </shiro:hasAnyRoles>
                        </table>
                        <div style="text-align: right">
                            <a id="search" class="btn btn-circle  green">
                                查询 </i>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="table-container">
                    <table class="table table-striped table-bordered table-hover"
                           id="datatable_customer_list">
                        <thead>
                        <tr role="row" class="heading">
                            <th width="10%">
                                姓名
                            </th>
                            <th width="10%">
                                性别
                            </th>
                            <th width="20%">
                                呼叫器名称
                            </th>
                                <%--<th width="15%">
                                    呼叫器号码
                                </th>--%>
                            <th width="20%">
                                呼叫器状态
                            </th>
                            <th width="20%">
                                行政区划
                            </th>
                            <th width="20%">
                                操作
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


        <!-- 导入模态框（Modal） -->
        <div class="modal fade" id="impModal" tabindex="" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="impModalLabel">请选择...</h4>
                    </div>
                    <div class="modal-body">
                        <!-- BEGIN PAGE CONTENT-->
                        <form id="fileUpload" name="fileUpload" action="" method="POST"
                              enctype="multipart/form-data" target="impResult">
                            <table class="table-container">
                                <tr>
                                    <td width="20%">
                                        导入文件：
                                    </td>
                                    <td style="text-align:center;width: 20%">
                                        <input type="file" id="file" name="file" size="30"/>
                                    </td>
                                    <td width="15%">
                                        <a href="#" class="btn btn-icon-only green"
                                           onclick="importExcel('file','/admin/call/api/customer/import')">
                                            <i class="fa fa-upload"></i>
                                        </a>
                                    </td>
                                    <td width="25%">
                                        <span id="msg" class="label"></span>
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <!-- END PAGE CONTENT-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>

        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/call/customer_list.js?v=1.1"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js?v=1.34"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                EographicArea.initWith("${sessionScope.login_user.areaName}");
                EographicArea.changeProvince();
                CustomerList.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

