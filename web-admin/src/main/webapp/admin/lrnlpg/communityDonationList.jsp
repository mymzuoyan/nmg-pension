<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>社会捐赠信息管理</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
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
                    <a href="#">居家养老信息管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">社会捐赠信息管理</a>
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
                            <span class="caption-subject font-red-sunglo bold uppercase">社会捐赠信息管理列表</span>
                        </div>
                        <div class="tools">
                            <shior:hasPermission name="community-donation-add">
                                <div style="float: left">
                                    <a data="${pageContext.request.contextPath}/admin/api/power/socialDonation/communityDonationListAdd"
                                       class=" table-group-action-add btn btn-circle btn-add"><i class="fa">新增</i></a>
                                </div>
                            </shior:hasPermission>
                            <a href="" class="collapse"></a>
                        </div>
                    </div>
                    <div class="portlet-body" style="padding-top: 0px !important;display: block">
                        <form id="serviceOrg-form" name="serviceOrg-form">
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <%--<td style="width:10%;text-align:center;vertical-align:middle;">
                                        活动名称
                                    </td>
                                    <td style="width:20%;text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="activityName" placeholder="请输入活动名称"
                                               style="width: 100%">
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        活动时间
                                    </td>
                                    <td style="width:20%;text-align:center;vertical-align:middle;">
                                        <input class="form-control date-picker" name="beginTime" placeholder="请输入活动时间"
                                               style="width: 100%">
                                    </td>--%>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        捐赠人
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;" >
                                        <input class="form-control" name="donorName" placeholder="请输入捐款人姓名"
                                               style="width: 100%">
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        捐赠金额（或物品折合价值）
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;" >
                                        <input class="form-control" name="money" placeholder="请输入捐款金额"
                                               style="width: 100%">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        捐赠人联系方式
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;" >
                                        <input class="form-control" name="phone" placeholder="请输入捐赠人联系方式"
                                               style="width: 100%">
                                    </td>
                                   <%-- <td style="text-align:center;vertical-align:middle;">
                                        捐赠类型（资金、物品）
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;" >
                                        <input class="form-control" name="donor_type" placeholder="请选择捐赠类型（资金、物品）"
                                               style="width: 100%">
                                    </td>--%>

                                    <td style="text-align:center;vertical-align:middle;">
                                        捐赠类型（资金、物品）
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select   name="donorType"
                                                  class="form-control">
                                            <option value=''>-全部-</option>
                                            <option value='1'>资金</option>
                                            <option value='2'>物品</option>
                                        </select>
                                    </td>
                                </tr>
                                </tr>
                                <%--<tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        捐款人姓名
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;" >
                                        <input class="form-control" name="donorName" placeholder="请输入捐款人姓名"
                                               style="width: 100%">
                                    </td>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        活动负责人
                                    </td>
                                    <td style="width:20%;text-align:center;vertical-align:middle;" colspan="3">
                                        <input class="form-control" name="activityLeader" placeholder="请输入活动负责人"
                                               style="width: 100%">
                                    </td>
                                </tr>--%>
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
                                       id="datatable_bill_List">
                                    <thead>
                                    <tr role="row" class="heading">
                                        <th width="1%">
                                            <input type="checkbox" class="group-checkable">
                                        </th>
                                       <%-- <th width="20%">
                                            活动名称
                                        </th>
                                        <th width="20%">
                                            活动描述
                                        </th>
                                        <th width="10%">
                                            活动负责人
                                        </th>
                                        <th width="20%">
                                            开始时间
                                        </th>
                                        <th width="20%">
                                            结束时间
                                        </th>--%>
                                        <th width="10%">
                                            组织名称
                                        </th>
                                        <th width="10%">
                                            捐赠人
                                        </th>

                                        <th width="10%">
                                            捐赠对象
                                        </th>
                                        <th width="10%">
                                            捐赠金额（或物品折合价值）
                                        </th>

                                        <th width="30%">
                                            地址
                                        </th>
                                        <th width="10%">
                                            城市
                                        </th>
                                        <th width="10%">
                                            省/自治区
                                        </th>
                                        <th width="15%">
                                            捐赠人联系方式
                                        </th>
                                        <th width="15%">
                                            捐赠人照片
                                        </th>
                                        <th width="5%">
                                            捐赠类型（资金、物品）
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
                                                onclick="SocialDonationList.goToPage()" title="GO">GO
                                        </button>
                                    </div>
                                </div>
                              <%--  <shior:hasPermission name="bill-export">
                                    <a id="excel" class="btn btn-circle  btn-black excel"
                                       style="float: left;display: none"><i class="fa">导出excel</i></a>
                                </shior:hasPermission>--%>
                                <shiro:hasPermission name="bill-delete">
                                    <div class=" right" style="text-align: right;margin-top: 10px;"
                                         id="serviceOrg-delete">
                                        <button id="btnDeleteServiceOrg" class="btn btn-circle red"><i
                                                class="fa fa-times"> 批量删除</i>
                                        </button>
                                    </div>
                                </shiro:hasPermission>
                                <shior:hasPermission name="bill-list">
                                    <input type="hidden" id="pimll" value="1"/>
                                </shior:hasPermission>
                                <shior:hasPermission name="bill-invalid">
                                    <input type="hidden" id="invalid" value="1"/>
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
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/lrnlpg/communityDonation_list.js?v=2.7"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js?v=1.2"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    format: 'yyyy-mm-dd',
                    autoclose: true
                });
                AreaTree.init();
                CommunityDonationList.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

