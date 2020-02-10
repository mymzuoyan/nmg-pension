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
<%@ taglib prefix="shoir" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>养老机构入住老人</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/view/css/alertStyle.css"/>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">

        <div class="row" style="height: 100% !important;">
            <div class="col-md-12" style="height: 100% !important;">
                <div class="portlet " style="height: 90% !important;">
                    <div class="portlet-title">
                        <div class="caption tabbable-line" style="padding: 0px">
                            <ul class="nav nav-tabs">
                                <li class="">
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/institution/detail/${id}'"
                                       data-toggle="tab" aria-expanded="false">养老机构信息</a>
                                </li>
                                <li class="">
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/institution/putOnRecord/${id}'"
                                       data-toggle="tab" aria-expanded="true">建档内容</a>
                                </li>
                                <li class="">
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/institution/map/${id}'"
                                       data-toggle="tab" aria-expanded="true">养老机构定位
                                    </a>
                                </li>
                                <li class="active">
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/institution/${id}/elderly/list'"
                                       data-toggle="tab" aria-expanded="true">入住老人管理</a>
                                </li>

                            </ul>
                        </div>
                    </div>
                    <div class="portlet">
                        <div class="portlet-title">
                            <div class="tools">
                                <div style="float: left">
                                    <a class="btn btn-circle btn-add" id="addTab1"
                                       data="${pageContext.request.contextPath}/admin/institution/elderly/detailAddIn/${id}"><i
                                            class="fa">新增入院</i></a>
                                    <a class="btn btn-circle btn-add" id="addTab2"
                                       data="${pageContext.request.contextPath}/admin/institution/elderly/detailAddOut/${id}"><i
                                            class="fa">新增出院</i></a>
                                </div>
                                <a href="" class="collapse">
                                </a>
                            </div>
                        </div>
                        <div id="searchDiv" class="portlet-body form" style="">
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td style="vertical-align: middle">
                                        单位名称
                                    </td>
                                    <td>
                                        <input name="institutionName" id="institutionName"
                                               class="form-control">  </input>
                                    </td>
                                    <td style="vertical-align: middle">
                                        老人姓名
                                    </td>
                                    <td>
                                        <input name="elderName" id="elderName"
                                               class="form-control">  </input>
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
                    <div class="portlet-body" style="height: 100% !important;">
                        <div class="table-container">
                            <table class="table table-striped table-bordered table-hover"
                                   id="datatable_list">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="1%">
                                        <input type="checkbox" class="group-checkable">
                                    </th>
                                    <th width="9%">
                                        入院编号
                                    </th>
                                    <th width="10%">
                                        姓名
                                    </th>
                                    <th width="10%">
                                        性别
                                    </th>
                                    <th width="10%">
                                        年龄
                                    </th>
                                    <th width="10%">
                                        入院时间
                                    </th>
                                    <th width="10%">
                                        出院时间
                                    </th>
                                    <th width="10%">
                                        床位信息
                                    </th>
                                    <th width="10%">
                                        入院状态
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
                                            onclick="InstitutionElderlyList.goToPage()" title="GO">GO
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/institution_detail_elderly_list.js?v=1.6"></script>

        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();

                $("#addTab1").click(function () {
                    var href = $(this).attr("data");
                    window.parent.addTab("institution_detail_elderly_detailAddIn", "入院新增", href);
                });
                $("#addTab2").click(function () {
                    var href = $(this).attr("data");
                    window.parent.addTab("institution_detail_elderly_detailAddOut", "出院新增", href);
                });
                InstitutionDetailElderlyList.init("${id}");
            });

        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

