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
        <title>服务人员列表</title>
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
                    <a href="#">服务人员</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">服务人员列表</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <!-- Begin: life time stats -->
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">服务人员列表</span>
                        </div>
                    </div>
                    <div id="searchDiv" class="portlet-body form" style="display: none">
                        <input type="hidden" name="serviceOrgId" value="${user.serviceOrgId}">
                        <input type="hidden" name="areaName" value="${user.areaName}">
                        <table class="table table-bordered table-hover table-condensed table-responsive">
                            <tr>
                                <td colspan="1" style="text-align:center;vertical-align:middle;">姓名</td>
                                <td colspan="2" style="text-align:center;vertical-align:middle;">
                                    <input name="name" class="form-control"
                                           type="text"/>
                                </td>
                                <td colspan="1" style="text-align:center;vertical-align:middle;">身份证号</td>
                                <td colspan="2" style="text-align:center;vertical-align:middle;">
                                    <input name="idcardno" class="form-control"
                                           type="text"/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="1" style="text-align:center;vertical-align:middle;">组织名称</td>
                                <td colspan="5" style="text-align:center;vertical-align:middle;">
                                    <input name="serviceOrgName" class="form-control"
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
                </div>
                <div class="portlet">
                    <div class="portlet-body">
                        <div class="table-container">
                            <table class="table table-striped table-bordered table-hover" id="datatable_userfuwu_record_list">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="10%">
                                        姓名
                                    </th>
                                    <th width="15%">
                                        所属组织
                                    </th>
                                    <th width="10%">
                                        身份证号
                                    </th>
                                    <th width="10%">
                                        联系方式
                                    </th>
                                    <th width="10%">
                                        市场工单量
                                    </th>
                                    <th width="10%">
                                        计划工单量
                                    </th>
                                    <th width="10%">
                                        总工单量
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
                                            onclick="UserFuwuRecord.goToPage()" title="GO">GO
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
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/arrayValue.js?v=1"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/userfuwu_record_list.js?v=1.5"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                UserFuwuRecord.init("${serviceOrgType}");

            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

