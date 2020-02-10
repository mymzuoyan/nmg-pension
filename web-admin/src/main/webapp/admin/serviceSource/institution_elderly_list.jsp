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
        <title>入住老人管理</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/extensions/TableTools/css/dataTables.tableTools.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/view/css/alertStyle.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <style>
            a, a:hover {
                text-decoration: none;
            }

            table tr td {
                text-align: center;
                vertical-align: middle;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">

        <div class="row" style="">
            <div class="col-md-12" style="height: 100% !important;">
                <div class="portlet " style="height: 90% !important;">
                    <div class="portlet">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-equalizer font-purple-plum hide"></i>
                                <span class="caption-subject font-red-sunglo bold uppercase">入住老人列表</span>
                            </div>
                            <div class="tools">
                                <div style="float: left">
                                    <shoir:hasPermission name="import-of-in-service-personnel">
                                        <a href="${pageContext.request.contextPath}/file/excel/download/institution/入住老人导入模板.xlsx"/>&nbsp;导入Excel模板下载&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                        <a class="table-group-action-import btn btn-circle btn-import" data-toggle="modal"
                                            data-target="#impModal"><i
                                            class="fa">导入</i></a>
                                    </shoir:hasPermission>
                                    <shoir:hasPermission name="new-admission-new-discharge">
                                    <a class="btn btn-circle btn-add" id="addTab1"
                                       data="${pageContext.request.contextPath}/admin/institution/elderly/add1"><i
                                            class="fa">新增入院</i></a>
                                    <a class="btn btn-circle btn-add" id="addTab2"
                                        data="${pageContext.request.contextPath}/admin/institution/elderly/add2"><i
                                            class="fa">新增出院</i></a>
                                    </shoir:hasPermission>
                                </div>
                                <shoir:hasPermission name="institution-elderly-list-advanced-query">
                                <a href="" class="collapse">
                                </a>
                                </shoir:hasPermission>
                            </div>
                        </div>
                        <div id="searchDiv" class="portlet-body form" style="">
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td style="vertical-align: middle;width: 10%">
                                        单位名称
                                    </td>
                                    <td width="20%">
                                  <%--      <input name="institutionName" id="institutionName" value="${sessionScope.login_user.serviceOrgName}" disabled
                                               class="form-control">  </input>--%>

                                        <c:if test="${empty serviceOrgId}">
                                            <input name="organizationName" id="organizationName" placeholder="请输入单位名称" style="width: 100%"
                                                   class="form-control">
                                        </c:if>
                                        <c:if test="${not empty serviceOrgId}">
                                            <input type="hidden" value="${serviceOrgId}" id="serviceOrgId">
                                            <input name="organizationName" placeholder="请输入单位名称" style="width: 100%" readonly
                                                   class="form-control" value="${sessionScope.login_user.serviceOrgName}">
                                        </c:if>

                                    </td>
                                    <td style="vertical-align: middle;width: 10%">
                                        老人姓名
                                    </td>
                                    <td width="25%">
                                        <input name="elderName" id="elderName"
                                               class="form-control">  </input>
                                    </td>
                                    <td style="vertical-align: middle;width: 10%">
                                        入院状态
                                    </td>
                                    <td width="25%">
                                        <select id="status" class="form-control"
                                                name="status">
                                            <option value="">--全部--</option>
                                            <option value="1">登记中</option>
                                            <option value="2">待缴费</option>
                                            <option value="3">已住院</option>
                                            <option value="4">外出</option>
                                            <option value="4">待结算</option>
                                            <option value="6">已退住</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: middle">
                                        入院编号
                                    </td>
                                    <td >
                                        <input type="text" id="number" name="number" value=""
                                               class="form-control"/>
                                    </td>
                                    <td style="vertical-align: middle">
                                       入院时间
                                    </td>
                                    <td>
                                        <input style="width:40%;display: inline-block" type="text"
                                               class="form-control date-picker" name="startCheckInTimeStr" id="startCheckInTimeStr"
                                               data-date-format="yyyy-mm-dd">
                                        至
                                        <input style="width:40%;display: inline-block" type="text"
                                               class="form-control date-picker" name="endCheckInTimeStr" id="endCheckInTimeStr"
                                               data-date-format="yyyy-mm-dd">
                                    </td>
                                    <td style="vertical-align: middle">
                                        出院时间
                                    </td>
                                    <td>
                                        <input style="width:40%;display: inline-block" type="text"
                                               class="form-control date-picker" name="startCheckOutTimeStr" id="startCheckOutTimeStr"
                                               data-date-format="yyyy-mm-dd">
                                        至
                                        <input style="width:40%;display: inline-block" type="text"
                                               class="form-control date-picker" name="endCheckOutTimeStr" id="endCheckOutTimeStr"
                                               data-date-format="yyyy-mm-dd">
                                    </td>
                                </tr>
                            </table>
                                <%--<shiro:hasAnyRoles name="suadmin,readmin,muadmin">--%>
                                <%--<a id="excel" class="btn btn-circle  btn-black excel"
                                   style="float: left;display: none;background-color: rgb(255, 70, 14)"><i class="fa">导出excel</i></a>--%>
                                <%-- </shiro:hasAnyRoles>--%>
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
                                   <%-- <th width="10%">
                                        入院机构
                                    </th>--%>
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
                                        单位名称
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
                          <%--  <div class="right" style="text-align: right;display: block;">
                                <button id="deleteSomeMsg" class="btn btn-circle red"
                                        onclick="deleteSomeMsg(this,'/admin/api/institution/elderly/deleteSome')"
                                        data-loading-text="删除中..."><i class="fa fa-times"> 批量删除</i>
                                </button>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 导入模态框（Modal） -->
        <div class="modal fade" id="impModal" tabindex="" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;
                        </button>
                        <h4 class="modal-title" id="impModalLabel">请选择...</h4>
                    </div>
                    <div class="modal-body">
                        <!-- BEGIN PAGE CONTENT-->
                        <form id="fileUpload" name="fileUpload" action="" method="POST" enctype="multipart/form-data"
                              target="impResult">
                            <table class="table-container">
                                <tr>
                                    <td width="20%">
                                        导入文件：
                                    </td>
                                    <td style="text-align:center;width: 20%">
                                        <input type="file" id="file" name="file" size="30"/>
                                    </td>
                                    <td width="10%">
                                        <a href="#" class="btn btn-icon-only green"
                                           onclick="importExcel('file','/admin/api/institution/orgElderlyImport')">
                                            <i class="fa fa-upload"></i>
                                        </a>
                                    </td>
                                    <td width="25%">
                                        <span id="msg" class="label"></span>
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <!-- END PAGE CONTENT-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/institution_elderly_list.js?v=2.1"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/assets/global/scripts/arrayValue.js"></script>
        <!--timer-->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();

                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });

                $("#addTab1").click(function () {
                    var href = $(this).attr("data");
                    window.parent.addTab("institution_elderly_add1", "入院新增", href);
                });
                $("#addTab2").click(function () {
                    var href = $(this).attr("data");
                    window.parent.addTab("institution_elderly_add2", "出院新增", href);
                });
                InstitutionElderlyList.init();
            });

        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

