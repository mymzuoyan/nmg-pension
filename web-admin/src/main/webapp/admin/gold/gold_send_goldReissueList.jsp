<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/16
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>高龄补贴补发查询</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/extensions/TableTools/css/dataTables.tableTools.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <style>
            a, a:hover {
                text-decoration: none;
            }

            table tr td {
                text-align: center;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">

        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">高龄补贴发放管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">高龄补贴补发查询</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <!-- Begin: life time stats -->
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption">
                            高龄补贴补发查询
                        </div>
                        <div class="tools">
                            <div style="float: left">
                                    <%--<shiro:hasPermission name="check-item-statistics">--%>
                                    <%--<a href="${pageContext.request.contextPath}/file/excel/download/docking/床位设置管理信息导入模板.xlsx"/>&nbsp;导入Excel模板下载&nbsp;&nbsp;&nbsp;&nbsp;</a>--%>
                                    <%--<a class="btn btn-circle btn-add" id="addTab"
                                       data="${pageContext.request.contextPath}/admin/gold/forGold/add"><i
                                            class="fa">登记</i></a>
                                    <a class="table-group-action-import btn btn-circle btn-import" data-toggle="modal"
                                       data-target="#impModal"><i
                                            class="fa">导入</i></a>--%>
                                    <%--</shiro:hasPermission>--%>
                            </div>
                            <a href="" class="collapse">
                            </a>
                        </div>
                    </div>
                    <div id="searchDiv" class="portlet-body form" style="">
                        <table class="table table-bordered table-hover table-condensed table-responsive">
                            <tr>
                                <td width="10%" style="text-align:center;vertical-align:middle;">所属区域</td>
                                <td width="15%" style="text-align:center;vertical-align:middle;">
                                    <input class="form-control" name="areaName" id="areaName"
                                           onclick="GoldReissueList.selectArea();"
                                            <c:if test="${sessionScope.login_user.areaId>1}">
                                                <c:if test="${not empty sessionScope.login_user.areaName}">
                                                    value="${sessionScope.login_user.areaName}"
                                                </c:if>
                                            </c:if>
                                            <c:if test="${sessionScope.login_user.areaId==1}">
                                                <c:if test="${not empty areaName}">
                                                    value="${areaName}"
                                                </c:if>
                                            </c:if>
                                           type="text"/>
                                    <input type="hidden" name="areaId" id="areaId"/>
                                </td>
                                <td style="vertical-align: middle">
                                    身份证
                                </td>
                                <td>
                                    <input name="idcardno" id="idcardno"
                                           class="form-control">  </input>
                                </td>
                                <td style="vertical-align: middle">
                                    姓名
                                </td>
                                <td>
                                    <input name="elderName" id="elderName"
                                           class="form-control">  </input>
                                </td>
                            </tr>
                        </table>
                            <shiro:hasAnyRoles name="suadmin,readmin,muadmin">
                        <a id="excel" class="btn btn-circle  btn-black excel"
                           style="float: left;display: none;background-color: rgb(255, 70, 14)"><i class="fa">导出excel</i></a>
                           </shiro:hasAnyRoles>
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
                <div class="portlet">
                    <div class="portlet-body">
                        <div class="table-container">
                            <table class="table table-striped table-bordered table-hover"
                                   id="table">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="1%">
                                        <input type="checkbox" class="group-checkable">
                                    </th>
                                    <th width="8%">
                                        姓名
                                    </th>
                                    <th width="8%">
                                        身份证号
                                    </th>
                                    <th width="7%">
                                        所属地区
                                    </th>
                                    <th width="10%">
                                        开始时间
                                    </th>
                                    <th width="14%">
                                        结束时间
                                    </th>
                                    <th width="10%">
                                        申请类别
                                    </th>
                                    <th width="10%">
                                        标准
                                    </th>
                                    <th width="10%">
                                        月数
                                    </th>
                                    <th width="15%">
                                        补发总金额
                                    </th>
                                    <th width="15%">
                                        开户银行
                                    </th>
                                    <th width="15%">
                                        银行卡号
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
                                            onclick="GoldReissueList.goToPage()" title="GO">GO
                                    </button>
                                </div>
                            </div>
                                <%--<div class="right" style="text-align: right;display: block;">
                                    <button id="deleteSomeMsg" class="btn btn-circle red"
                                            onclick="deleteSomeMsg(this,'/admin/api/psBed/deleteSomeByIds')"
                                            data-loading-text="删除中..."><i class="fa fa-times"> 批量删除</i>
                                    </button>
                                </div>--%>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End: life time stats -->
        </div>
        <!-- 地区模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">请选择...</h4>
                    </div>
                    <div class="modal-body">
                        <!-- BEGIN PAGE CONTENT-->
                        <div id="areaTree" class="tree-demo"></div>
                        <!-- END PAGE CONTENT-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary"
                                onclick="GoldReissueList.getAreaValue(AreaTree.getAllAreaName(AreaTree.getSelectArea()),AreaTree.getSelectArea());">
                            确定
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
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
                        <form id="fileUpload" name="fileUpload" action="" method="POST"
                              enctype="multipart/form-data" target="impResult">
                            <table class="table-container">
                                <tr>
                                    <td width="20%">
                                        导入文件：
                                    </td>
                                    <td style="text-align:center;width: 20%">
                                        <input type="file" id="file" name="file" size="30"/>
                                    </td>
                                    <td width="10%">
                                        <shiro:hasPermission name="elder-glod-manager-system-reissueMoneySeach-create">
                                        <a href="#" class="btn btn-icon-only green"
                                           onclick="importExcel('file','/admin/api/gold/forGoldInfo/import')">
                                            <i class="fa fa-upload"></i>
                                        </a>
                                        </shiro:hasPermission>
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
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/gold/gold_send_goldReissueList.js?v=2.52"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
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
                GoldReissueList.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

