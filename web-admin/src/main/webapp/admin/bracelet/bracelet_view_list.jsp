<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>手环视图列表</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
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
                                看护告警信息列表
                            </span>
                        </div>
                        <div class="tools">
                            <a href="" class="collapse"></a>
                        </div>
                    </div>
                    <div class="portlet-body" style="padding-top: 0px !important;">
                        <form id="braceletWarningInfo">
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td colspan="6" class="tr-title">
                                        <span class="caption-helper">过滤条件</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        设备号
                                    </td>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        <input type="text" name="number" class="form-control">
                                    </td>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        老人姓名
                                    </td>
                                    <td style="width:20%;text-align:center;vertical-align:middle;">
                                        <input style="display: inline-block" type="text"
                                               class="form-control" name="elderName">
                                    </td>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        位置
                                    </td>
                                    <td style="width:30%;text-align:center;vertical-align:middle;">
                                        <input style="display: inline-block" type="text"
                                               class="form-control" name="building">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        联系方式
                                    </td>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        <input type="text" name="floor" class="form-control">
                                    </td>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        监护人姓名
                                    </td>
                                    <td style="width:20%;text-align:center;vertical-align:middle;">
                                        <input style="display: inline-block" type="text"
                                               class="form-control" name="jhrXm">
                                    </td>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        监护人电话
                                    </td>
                                    <td style="width:30%;text-align:center;vertical-align:middle;">
                                        <input style="display: inline-block" type="text"
                                               class="form-control" name="jhrPhone">
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <div class="right" style="text-align: right">
                            <a id="search" class="table-group-action-submit btn btn-circle btn-import"><i
                                    class="fa">查询</i></a>
                            <a class="reload table-group-action-reload btn btn-circle btn-black"><i
                                    class="fa">重置</i></a>
                        </div>
                    </div>
                    <div class="portlet">
                        <div class="portlet-body">
                            <ul class="nav nav-tabs">
                                <li>
                                    <a href="javascript:void(0)" data="体征告警">体征告警 </a>
                                </li>
                            </ul>
                        </div>
                        <div class="table-container">
                            <div class="table-group-actions-wrapper">
                            </div>
                            <table class="table table-striped table-bordered table-hover"
                                   id="datatable_nurse_alarm_list">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="10%">
                                        设备号
                                    </th>
                                    <th width="10%">
                                        老人姓名
                                    </th>
                                    <th width="10%">
                                        联系方式
                                    </th>
                                    <th width="10%">
                                        监护人
                                    </th>
                                    <th width="10%">
                                        监护人电话
                                    </th>
                                    <th width="10%">
                                        关系
                                    </th>
                                    <th width="10%">
                                        心率
                                    </th>
                                    <th width="25%">
                                        位置
                                    </th>
                                    <th width="5%">
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
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/bracelet/bracelet_view_list.js?v=2.2"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                BraceletViewList.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

