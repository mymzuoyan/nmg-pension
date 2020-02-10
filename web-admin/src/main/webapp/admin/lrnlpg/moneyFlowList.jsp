<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>资金流水列表</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <style>
            #selectIcon img {
                width: 30px;
                height: 30px;
                margin: 2.5px;
                padding: 2.5px;
            }

            #selectIcon img:hover {
                background-color: #ccc;
                cursor: pointer;
            }
        </style>
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
                    <a href="#">助老卡刷卡系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">资金充值</a>
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
                            <span class="caption-subject font-red-sunglo bold uppercase">资金流水列表</span>
                        </div>
                        <div class="tools">
                            <shior:hasPermission name="lrpggl-nlpglb-create">
                                <div style="float: left">
                                    <a data="${pageContext.request.contextPath}/admin/api/power/oldmancard/topup"
                                       class=" table-group-action-add btn btn-circle btn-add"><i class="fa">充值</i></a>
                                    <%--<a class="table-group-action-import btn btn-circle btn-import"><i--%>
                                            <%--class="fa">导入</i></a>--%>
                                </div>
                            </shior:hasPermission>
                            <a href="" class="collapse"></a>
                        </div>
                    </div>
                    <div class="portlet-body" style="padding-top: 0px !important;display: block">
                        <form id="serviceOrg-form" name="serviceOrg-form">
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        老人姓名
                                    </td>
                                    <td style="width:25%;text-align:center;vertical-align:middle;" >
                                        <input class="form-control" name="elderName" placeholder="请输入老人姓名"
                                               style="width: 100%">
                                    </td>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        卡号
                                    </td>
                                    <td style="width:25%;text-align:center;vertical-align:middle;" >
                                        <input class="form-control" name="cardId" placeholder="请输入卡号"
                                               style="width: 100%">
                                    </td>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        流水号
                                    </td>
                                    <td style="width:20%;text-align:center;vertical-align:middle;" >
                                        <input class="form-control" name="serverNum" placeholder="请输入流水号"
                                               style="width: 100%">
                                    </td>
                                </tr>
                                <tr>

                                    <td style="text-align:center;vertical-align:middle;">
                                        时间
                                    </td>
                                    <td style="" colspan="3">
                                        <input style="width:45%;display: inline-block" type="text"
                                               class="form-control date-picker" name="startCreateDate" id="startCreateDate"
                                               data-date-format="yyyy-mm-dd">
                                        至
                                        <input style="width:45%;display: inline-block" type="text"
                                               class="form-control date-picker" name="endCreateDate" id="endCreateDate"
                                               data-date-format="yyyy-mm-dd">
                                    </td>

                                </tr>
                            </table>
                        </form>
                        <div class="right" style="text-align: right">
                            <a class="table-group-action-submit btn btn-circle btn-import"><i class="fa">查询</i></a>
                            <a class="reload table-group-action-reload btn btn-circle btn-black"><i
                                    class="fa">重置</i></a>
                        </div>
                    </div>
                    <div class="portlet">
                        <div class="portlet-body">
                            <div class="table-container">
                                <table class="table table-striped table-bordered table-hover"
                                       id="datatable_moneyFlow_List">
                                    <thead>
                                    <tr role="row" class="heading">
                                        <th width="1%">
                                            <input type="checkbox" class="group-checkable">
                                        </th>
                                        <th width="5%">
                                            姓名
                                        </th>
                                        <th width="15%">
                                            卡号
                                        </th>
                                        <th width="8%">
                                            流水号
                                        </th>
                                        <th width="10%">
                                             地址
                                        </th>
                                        <th width="10%">
                                            金额
                                        </th>
                                        <th width="12%">
                                            时间
                                        </th>
                                        <%--<th width="12%">--%>
                                            <%--操作--%>
                                        <%--</th>--%>
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
                                                onclick="InstitutionList.goToPage()" title="GO">GO
                                        </button>
                                    </div>
                                </div>
                                <shior:hasAnyRoles name="suadmin,muadmin">
                                    <a id="excel" class="btn btn-circle  btn-black excel"
                                       style="float: left;display: none"><i class="fa">导出excel</i></a>
                                </shior:hasAnyRoles>
                                <%--<shiro:hasPermission name="lrpggl-nlpglb-delete">--%>
                                    <%--<input type="hidden" id="serviceOrg-deleteInput" value="1">--%>
                                    <%--<div class=" right" style="text-align: right;margin-top: 10px;"--%>
                                         <%--id="serviceOrg-delete">--%>
                                        <%--<button id="btnDeleteServiceOrg" class="btn btn-circle red"><i--%>
                                                <%--class="fa fa-times"> 删除</i>--%>
                                        <%--</button>--%>
                                    <%--</div>--%>
                                <%--</shiro:hasPermission>--%>
                                <shior:hasPermission name="lrpggl-nlpglb-list">
                                    <input type="hidden" id="pimll" value="1"/>
                                </shior:hasPermission>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/capacity/moneyflow_list.js?v=2.6"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js?v=1.2"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                AreaTree.init();
                InstitutionList.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

