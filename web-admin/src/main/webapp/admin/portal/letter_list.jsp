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
        <title>信件列表</title>
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
                    <a href="#">信箱管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">信件列表</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption">
                            信件查询
                        </div>
                        <div class="tools">
                            <a href="" class="expand">
                            </a>
                        </div>
                    </div>
                    <div class="portlet-body form" style="display: none">
                        <table class="table table-bordered table-hover table-condensed table-responsive">
                            <tr>
                                <td width="13%" style="text-align:center;vertical-align:middle;">信件标题：</td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input name="letterTitle" class="form-control"
                                           type="text"/>
                                </td>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    信件类型：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <select name="letterType" class="form-control">
                                        <option value="">--请选择--</option>
                                        <option value="1">意见</option>
                                        <option value="2">咨询</option>
                                        <option value="3">投诉</option>
                                        <option value="4">其他</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <div style="text-align: right">
                            <a class="table-group-action-submit btn btn-circle  green">
                                查询 </i>
                            </a>
                            <a class="table-group-action-reload btn btn-circle green"><i class="fa">重置</i></a>
                        </div>
                    </div>
                </div>
                <shiro:hasPermission name="elderServiceWebsite-letter-list-list">
                    <input type="hidden" id="elderServiceLetterList" value="1"/>
                </shiro:hasPermission>
                <div class="portlet">
                    <div class="portlet-body">
                        <div class="table-container">
                            <table class="table table-striped table-bordered table-hover"
                                   id="datatable_letter_list">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="10%">
                                        信件类型
                                    </th>
                                    <th width="20%">
                                        信件标题
                                    </th>
                                    <th width="25%">
                                        信件内容
                                    </th>
                                    <th width="25%">
                                        发布时间
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
                                            onclick="LetterList.goToPage()" title="GO">GO
                                    </button>
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
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/portal/letter_list.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                LetterList.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

