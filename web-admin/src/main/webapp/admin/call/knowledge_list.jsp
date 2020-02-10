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
        <title>知识库列表</title>
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
                    <a href="#">知识库管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">知识库列表</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <!-- Begin: life time stats -->
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption">
                            知识库列表
                        </div>
                        <div class="tools">
                            <div style="float: left">
                                <shiro:hasPermission name="ylzwgzpt-zcfg-manage-create">
                                    <a class="table-group-action-add btn btn-circle btn-add"><i class="fa">新增</i></a>
                                </shiro:hasPermission>
                            </div>
                            <a href="" class="expand">
                            </a>
                        </div>
                    </div>
                    <div id="searchDiv" class="portlet-body form" style="display: none">
                        <table class="table table-bordered table-hover table-condensed table-responsive">
                            <tr>
                                <td width="13%" style="text-align:center;vertical-align:middle;">标题：</td>
                                <td width="20%" style="text-align:center;vertical-align:middle;" colspan="3">
                                    <input name="title" class="form-control"
                                           type="text"/>
                                </td>
                            </tr>
                            <tr>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    知识库类型：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <select name="typeId" class="form-control" id="typeId">
                                        <option Value="">--请选择--</option>
                                        <c:if test="${!empty knowledgeTypes}">
                                            <c:forEach var="type" items="${knowledgeTypes}">
                                                <option Value="${type.id}">${type.name}</option>
                                            </c:forEach>
                                        </c:if>
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
                            <table class="table table-striped table-bordered table-hover" id="datatable_knowledge_list">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="25%">
                                        标题
                                    </th>
                                    <th width="15%">
                                        类型
                                    </th>
                                    <th width="15%">
                                        发布时间
                                    </th>
                                    <th width="10%">
                                        状态
                                    </th>
                                    <th width="20%">
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
                                            onclick="KnowledgeList.goToPage()" title="GO">GO
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End: life time stats -->
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
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/call/knowledge_list.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                KnowledgeList.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

