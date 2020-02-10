<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>看护告警信息</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">

        <!-- BEGIN PAGE HEADER-->
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">智能看护</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">看护告警信息</a>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <div class="portlet " style="padding-top: 0px !important;padding-bottom: 0px !important;">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">
                                看护告警信息
                            </span>
                        </div>
                    </div>
                    <div class="portlet">
                        <div class="portlet-body">
                            <ul class="nav nav-tabs">
                                <%--<shior:hasPermission name="nurse-manager-system-alarm-list">--%>
                                <li class="active">
                                    <a href="javascript:void(0)" data="围栏告警">
                                        围栏告警 </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)" data="SOS告警">
                                        SOS告警 </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)" data="体征告警">
                                        体征告警 </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)" data="异常告警">
                                        异常告警 </a>
                                </li>
                                <%--</shior:hasPermission>--%>
                            </ul>
                        </div>
                        <div class="table-container">
                            <div class="table-group-actions-wrapper">
                            </div>
                            <table class="table table-striped table-bordered table-hover"
                                   id="datatable_nurse_alarm_list">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="1%">
                                        id
                                    </th>
                                    <th width="8%">
                                        标签ID
                                    </th>
                                    <th width="8%">
                                        老人名称
                                    </th>
                                    <th width="10%">
                                        报警类型
                                    </th>
                                    <th width="12%">
                                        <span id="param1"> 围栏名称</span>
                                    </th>
                                    <th width="5%">
                                        <span id="param2">围栏类型</span>

                                    </th>
                                    <th width="12%">
                                        报警时间
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
                                            onclick="NurseAlarmList.goToPage()" title="GO">GO
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
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/arrayValue.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/nurse/nurse_alarm_list.js?v=2.1"
                type="text/javascript"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                NurseAlarmList.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

