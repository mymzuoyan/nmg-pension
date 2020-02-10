<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>居家固定资产</title>
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
                    <a href="#">居家固定资产</a>
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
                            <span class="caption-subject font-red-sunglo bold uppercase">居家固定资产信息列表</span>
                        </div>
                        <div class="tools">
                            <%--<shior:hasPermission name="community-donation-add">--%>
                                <div style="float: left">
                                    <a data="${pageContext.request.contextPath}/admin/api/power/socialDonation/fixedAssetsAdd"
                                       class=" table-group-action-add btn btn-circle btn-add"><i class="fa">新增</i></a>
                                </div>
                            <%--</shior:hasPermission>--%>
                            <a href="" class="collapse"></a>
                        </div>
                    </div>
                    <div class="portlet-body" style="padding-top: 0px !important;display: block">
                        <form id="serviceOrg-form" name="serviceOrg-form">
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        资产分类
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="classification"
                                                  class="form-control">
                                            <option value=''>-全部-</option>
                                            <option value='文体娱乐设施'>文体娱乐设施</option>
                                            <option value='医疗保健设施'>医疗保健设施</option>
                                            <option value='呼叫设施'>呼叫设施</option>
                                            <option value='监控设施'>监控设施</option>
                                            <option value='无障碍设施'>无障碍设施</option>
                                            <option value='餐饮设施'>餐饮设施</option>
                                            <option value='助浴设施'>助浴设施</option>
                                            <option value='家具家电'>家具家电</option>
                                            <option value='消毒设施'>消毒设施</option>
                                            <option value='电梯设施'>电梯设施</option>
                                            <option value='水暖设施'>水暖设施</option>
                                            <option value='供电设施'>供电设施</option>
                                            <option value='办公设施'>办公设施</option>
                                            <option value='消防设施'>消防设施</option>
                                            <option value='其他'>其他</option>
                                        </select>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        名称
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;" >
                                        <input class="form-control" name="name" placeholder="请输入名称"
                                               style="width: 100%">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        型号
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;" >
                                        <input class="form-control" name="model" placeholder="请输入型号"
                                               style="width: 100%">
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        备注
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;" >
                                        <input class="form-control" name="remarks" placeholder="请输入备注"
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
                                            资产分类
                                        </th>
                                        <th width="10%">
                                            名称
                                        </th>
                                        <th width="10%">
                                            单位
                                        </th>
                                        <th width="5%">
                                            数量
                                        </th>
                                        <th width="5%">
                                            型号
                                        </th>
                                        <th width="5%">
                                            金额
                                        </th>
                                        <th width="15%">
                                            实物图片
                                        </th>
                                        <th width="15%">
                                            发票图片
                                        </th>
                                        <th width="15%">
                                            备注
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
                                                onclick="FixedAssetsList.goToPage()" title="GO">GO
                                        </button>
                                    </div>
                                </div>
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
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/lrnlpg/fixedAssets_list.js?v=2.8"
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
                FixedAssetsList.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

