<%--
  Created by IntelliJ IDEA.
  User: guxiangyang
  Date: 2019/8/21
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
                                <span class="caption-subject font-red-sunglo bold uppercase">星级评定列表</span>
                            </div>
                            <div class="tools">
                                <shiro:hasPermission name="pension-service-manager-areaHomePensionStarsList-add">
                                <div style="float: left">
                                    <a class="btn btn-circle btn-add" id="addTab1"
                                       data="${pageContext.request.contextPath}/admin/institution/org/areaHomePensionStars/add"><i
                                            class="fa">申请</i></a>
                                </div>
                                </shiro:hasPermission>
                                <a href="" class="collapse">
                                </a>
                            </div>
                        </div>
                        <div id="searchDiv" class="portlet-body form" style="">
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        所属区域
                                    </td>
                                    <td style="width:20%;text-align:center;vertical-align:middle;">
                                        <c:if test="${empty areaName}">
                                            <c:choose>
                                                <c:when test="${roleId == 3}">
                                                    <input type="text" id="area" name="areaName"
                                                           value="${user.areaName}" style="width: 100%" readonly>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="area" name="areaName"
                                                           data-toggle="modal"
                                                           data-target="#areaModal" placeholder="请选择所属区域"
                                                           style="width: 100%" class="form-control">
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                        <c:if test="${not empty areaName}">
                                            <input type="text" id="areaName" name="areaName"
                                                   value="${areaName}" style="width: 100%" readonly>
                                        </c:if>
                                    </td>
                                    <td style="vertical-align: middle;width: 10%">
                                        机构名称
                                    </td>
                                    <td width="25%">
                                        <input name="organizationNames" id="organizationNames" placeholder="请输入机构名称"
                                               class="form-control">  </input>
                                    </td>
                                    <td style="vertical-align: middle;width: 10%">
                                        评定星级
                                    </td>
                                    <td width="25%">
                                        <select id="starRating" class="form-control"
                                                name="starRating">
                                            <option value="">--请选择星级--</option>
                                            <option value="1">一星级</option>
                                            <option value="2">二星级</option>
                                            <option value="3">三星级</option>
                                            <option value="4">四星级</option>
                                            <option value="5">五星级</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: middle;">
                                        申请时间
                                    </td>
                                    <td colspan="2">
                                        <input name="applicationTime" id="applicationTime"  class="form-control date-picker" placeholder="请选择申请时间"
                                               data-date-format="yyyy-mm-dd">  </input>
                                    </td>
                                    <td style="vertical-align: middle;">
                                        总评分
                                    </td>
                                    <td colspan="2">
                                        <input name="totalScore" id="totalScore" placeholder="请输入总评分"
                                               class="form-control">  </input>
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
                                    <th width="20%">
                                        所属区域
                                    </th>

                                    <th width="20%">
                                        机构名称
                                    </th>
                                    <th width="10%">
                                        星级评定
                                    </th>
                                    <th width="20%">
                                        申请时间
                                    </th>
                                    <th width="10%">
                                        总评分
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
                                            onclick="AreaHomePensionStarsList.goToPage()" title="GO">GO
                                    </button>
                                </div>
                            </div>
                            <div class="right" style="text-align: right;display: block;">
                                <button id="deleteSomeMsg" class="btn btn-circle red"
                                        onclick="deleteSomeMsg(this,'/admin/api/institution/org/areaHomePensionStars/deleteSome')"
                                        data-loading-text="删除中..."><i class="fa fa-times"> 批量删除</i>
                                </button>
                            </div>
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


        <!-- 导入模态框（Modal） -->
        <div class="modal fade" id="areaModal" tabindex="-1"
             role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal"
                                aria-hidden="true"></button>
                        <h4 class="modal-title"
                            id="myModalLabel">请选择所属区域</h4>
                    </div>
                    <div class="modal-body">
                        <div id="areaTree"
                             class="tree-demo"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn blue"
                                onclick="AreaHomePensionStarsList.getAreaName()">
                            确定
                        </button>
                        <button type="button"
                                class="btn default"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
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
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/area_home_pension_stars_list.js?v=2.1"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/assets/global/scripts/arrayValue.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <!--timer-->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                AreaTree.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });

                $("#addTab1").click(function () {
                    var href = $(this).attr("data");
                    window.parent.addTab("institution_elderly_add1", "社区养老服务站星级评定", href);
                });
                $("#addTab2").click(function () {
                    var href = $(this).attr("data");
                    window.parent.addTab("institution_elderly_add2", "出院新增", href);
                });
                AreaHomePensionStarsList.init();

            });

            //操作按钮权限控制
            function getPermission ( data, type, row,meta ) {
                var columnHtml = '';
                columnHtml +='<button data="' + data + '"   class="btn default btn-xs blue-stripe info">详情</button>';

                columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs red-stripe del">删除</button>';
                <shiro:hasPermission name="person-institution-manager-areaHomePensionStars-assess">
                columnHtml +='<button data="' + data + '"   class="btn default btn-xs blue-stripe assess">评估</button>';
                </shiro:hasPermission>

                return columnHtml;

            }


        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

