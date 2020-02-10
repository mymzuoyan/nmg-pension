<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>高龄补贴用户审批</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/extensions/TableTools/css/dataTables.tableTools.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <style>
            .more-content {
                display: none;
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
                    <a href="#">高龄补贴信息管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">用户审批</a>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <div class="portlet" style="padding-top: 0px !important;padding-bottom: 0px !important;">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">南京市高龄补贴用户新增及提档老人</span>
                        </div>
                    </div>
                </div>
                <div class="portlet " style="padding-top: 0px !important;">
                    <div class="table-container">
                        <table class="table table-striped table-bordered table-hover" id="datatable_event_list">
                            <thead>
                            <tr role="row" class="heading">
                                <th width="1%">
                                    <input id="checkAll" type="checkbox" class="group-checkable">
                                </th>
                                <th width="10%">
                                    所在区域
                                </th>
                                <th width="8%">
                                    姓名
                                </th>
                                <th width="15%">
                                    身份证号
                                </th>
                                <th width="5%">
                                    年龄
                                </th>
                                <th width="5%">
                                    性别
                                </th>
                                <th width="15%">
                                    人员类别
                                </th>
                                <th width="11%">
                                    移动电话
                                </th>
                                <th width="19%">
                                    高龄补贴发放金额
                                </th>
                                <th width="16%">
                                    操作
                                </th>
                            </tr>
                            </thead>
                            <tbody id="tbody">
                            </tbody>
                        </table>
                        <shiro:hasAnyRoles name="suadmin,muadmin">
                            <a id="excel" class="btn btn-circle  btn-black excel" style="float: left;display: block"><i
                                    class="fa">导出excel</i></a>
                        </shiro:hasAnyRoles>
                            <%--<a id="excel" class="btn btn-circle  red excel" style="float: right;display: block"><i--%>
                            <%--class="fa">通过</i></a>--%>
                    </div>
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
                                        onclick="ElderMsgNeedNotice.getAreaValue(AreaTree.getAllAreaName(AreaTree.getSelectArea()),AreaTree.getSelectArea());">
                                    确定
                                </button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
            </div>
        </div>
        <!-- END PAGE CONTENT-->
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/elderly/elderly_add_up_notify.js?v=1.0"></script>
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
                ElderMsgAddAndUpNotify.init("${areaName}", ${age});
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
