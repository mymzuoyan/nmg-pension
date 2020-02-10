<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>从业人员健康记录信息管理</title>
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
                    <a href="#">从业人员健康记录信息管理</a>
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
                            <span class="caption-subject font-red-sunglo bold uppercase">从业人员健康记录管理列表</span>
                        </div>
                        <div class="tools">
                            <shior:hasPermission name="health-records-add">
                                <div style="float: left">
                                    <a data="${pageContext.request.contextPath}/admin/org/healthRecords/healthRecordsAdd"
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
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        姓 名
                                    </td>
                                    <td style="width:20%;text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="name" placeholder="请输入姓名"
                                               style="width: 100%">
                                    </td>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        记录时间
                                    </td>
                                    <td style="width:20%;text-align:center;vertical-align:middle;">
                                    <input name="clock" placeholder="请选择记录时间" value=""
                                           class="form-control date-picker"
                                           style="width: 100%">
                                </td>
                                </tr>
                                <tr>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        年&nbsp;&nbsp;龄
                                    </td>
                                    <td style="width:20%;text-align:center;vertical-align:middle;">
                                        <input class="form-control" style="width: 48%;display: inline-block" type="text"
                                               id="startAge" name="startAge" maxlength="3" size="5"/>
                                        至&nbsp;<input type="text" style="width: 48%;display: inline-block"
                                                      class="form-control" id="endAge" name="endAge" maxlength="3"
                                                      size="5"/>
                                    </td>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        性&nbsp;&nbsp;别
                                    </td>
                                    <td style="width:20%;text-align:center;vertical-align:middle;">
                                        <select   name="gender"
                                                class="form-control">
                                            <option value=''>-全部-</option>
                                            <option value='1'>男</option>
                                            <option value='2'>女</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:10%;height:50px;text-align:center;vertical-align:middle;">
                                        体 征
                                    </td>
                                    <td style="width:20%;height:50px;text-align: left" colspan="7">
                                        <label class="checkbox-inline" style="padding-top: 10px">
                                            <input type="checkbox" name="sign" value="1"/>皮肤</label>
                                        <label class="checkbox-inline" style="padding-top: 10px">
                                            <input type="checkbox" name="sign" value="2"/>手癣</label>
                                            <label class="checkbox-inline" style="padding-top: 10px">
                                                <input type="checkbox" name="sign" value="3"/>银屑（或鳞屑）病</label>
                                                <label class="checkbox-inline" style="padding-top: 10px">
                                                    <input type="checkbox" name="sign" value="4"/>渗出性皮肤病</label>
                                                    <label class="checkbox-inline" style="padding-top: 10px">
                                                        <input type="checkbox" name="sign" value="5"/>化脓性皮肤病</label>
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
                                       id="datatable_bill_List">
                                    <thead>
                                    <tr role="row" class="heading">
                                        <th width="1%">
                                            <input type="checkbox" class="group-checkable">
                                        </th>
                                        <th width="6%">
                                            姓名
                                        </th>
                                        <th width="3%">
                                            年龄
                                        </th>
                                        <th width="3%">
                                            性别
                                        </th>
                                        <th width="8%">
                                            记录时间
                                        </th>
                                        <th width="8%">
                                            肝炎患病时间
                                        </th>
                                        <th width="8%">
                                            痢疾患病时间
                                        </th>
                                        <th width="8%">
                                            伤寒患病时间
                                        </th>
                                        <th width="8%">
                                            肺结核患病时间
                                        </th>
                                        <th width="8%">
                                            皮肤病患病时间
                                        </th>
                                        <th width="4%">
                                            心功能
                                        </th>
                                        <th width="4%">
                                            肝功能
                                        </th>
                                        <th width="4%">
                                            脾功能
                                        </th>
                                        <th width="4%">
                                            肺功能
                                        </th>
                                        <th width="20%">
                                            体征
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
                                                onclick="HealthRecordsList.goToPage()" title="GO">GO
                                        </button>
                                    </div>
                                </div>
                       <%--         <shior:hasPermission name="bill-export">
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
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/health_records_list.js?v=2.6"
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
                HealthRecordsList.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

