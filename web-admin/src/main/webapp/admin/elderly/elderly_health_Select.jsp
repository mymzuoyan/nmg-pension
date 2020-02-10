<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>健康数据条件查询</title>
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
                    <a href="#">健康管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">健康数据信息</a>
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
                            <span class="caption-subject font-red-sunglo bold uppercase">健康数据信息列表</span>
                        </div>
                        <div class="tools">
                         <%--   <shior:hasPermission name="bill-create">
                                <div style="float: left">
                                    <a data="${pageContext.request.contextPath}/admin/api/power/socialDonation/communityDonationListAdd"
                                       class=" table-group-action-add btn btn-circle btn-add"><i class="fa">新增</i></a>
                                </div>
                            </shior:hasPermission>--%>
                            <a href="" class="collapse"></a>
                        </div>
                    </div>
                    <div class="portlet-body" style="padding-top: 0px !important;display: block">
                        <form id="serviceOrg-form" name="serviceOrg-form">
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td colspan="8">
                                        <span class="caption-helper">基本信息</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        老人身份证
                                    </td>
                                    <td style="width:20%;text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="idcardno" placeholder="请输入老人身份证"
                                               style="width: 100%">
                                    </td>
                                    <td  style="width:10%;text-align:center;vertical-align:middle;">
                                        监测类别
                                    </td>
                                    <td  style="width:20%;text-align:center;vertical-align:middle;">
                                        <select id="testType" class="form-control" name="type">
                                            <option value=''>请选择</option>
                                            <option value='1'>血压</option>
                                            <option value='2'>血糖</option>
                                            <option value='3'>体重</option>
                                            <option value='4'>运动</option>
                                            <option value='5'>睡眠</option>
                                            <option value='6'>身体指数</option>
                                            <option value='7'>血脂</option>
                                            <option value='8'>血尿酸</option>
                                            <option value='9'>血氧</option>
                                            <option value='10'>心电</option>
                                            <option value='11'>呼吸率</option>
                                            <option value='12'>精神指数</option>
                                            <option value='13'>皮肤指数</option>
                                            <option value='14'>体温</option>
                                        </select>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        监测时间
                                    </td>
                                    <td style="width:50%;text-align:center;vertical-align:middle;">
                                        <input class="form-control date-picker" name="time" placeholder="请输入活动时间"
                                               style="width: 100%">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        来源采集方式
                                    </td>
                                    <td  style="width:20%;text-align:center;vertical-align:middle;">
                                        <select id="testcollectType" class="form-control" name="collectType">
                                            <option value=''>请选择</option>
                                            <option value='1'>APP</option>
                                            <option value='2'>微信</option>
                                            <option value='3'>会员网站端</option>

                                        </select>
                                    </td>


                                    <td style="text-align:center;vertical-align:middle;">
                                        来源采集平台
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="collectSys" placeholder="请输入来源采集平台"
                                               style="width: 100%">
                                    </td>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        结果
                                    </td>
                                    <td style="width:20%;text-align:center;vertical-align:middle;" colspan="3">
                                        <input class="form-control" name="result" placeholder="请输入结果"
                                               style="width: 100%">
                                    </td>
                                </tr>
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
                                       id="datatable_bill_List">
                                    <thead>
                                    <tr role="row" class="heading">
                                        <th width="1%">
                                            <input type="checkbox" class="group-checkable">
                                        </th>
                                        <th width="10%">
                                            老人姓名
                                        </th>
                                        <th width="20%">
                                            老人身份证
                                        </th>
                                        <th width="10%">
                                            监测类别
                                        </th>
                                        <th width="20%">
                                            监测时间
                                        </th>
                                        <th width="10%">
                                            来源采集方式
                                        </th>
                                        <th width="40%">
                                            结果
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
                                                onclick="ElderlyHealth.goToPage()" title="GO">GO
                                        </button>
                                    </div>
                                </div>
                                <shior:hasPermission name="bill-export">
                                    <a id="excel" class="btn btn-circle  btn-black excel"
                                       style="float: left;display: none"><i class="fa">导出excel</i></a>
                                </shior:hasPermission>
                                <shiro:hasPermission name="bill-delete">
                                    <div class=" right" style="text-align: right;margin-top: 10px;"
                                         id="serviceOrg-delete">
                                        <button id="btnDeleteServiceOrg" class="btn btn-circle red"><i
                                                class="fa fa-times"> 删除</i>
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
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/elderly/elderHealth_list.js?v=2.8"
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
                ElderlyHealth.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

