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
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>工单监管</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <style>
            ol, ul {
                list-style: none;
            }

            .MapLocation .MapLocation_con_list img {
                vertical-align: top;
                height: 16px;
                margin-top: 2px;
            }

            .MapLocation .MapLocation_con_list p {
                display: inline-block;
                margin-left: 8px;
            }

            .MapLocation .MapLocation_con_list strong {
                font-weight: 400;
                color: #333333;
            }

            .about4_main ul li {
                padding-left: 25px;
                font-size: 14px;
                color: #333333;
                line-height: 30px;
                margin-bottom: 5px;
                background: url(${pageContext.request.contextPath}/assets/admin/pages/img/about4_icon.png) left center no-repeat;
            }

            .about4_main ul li:last-child {
                margin-bottom: 0px;
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
                    <a href="#">工单管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">工单监管</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">工单监管</span>
                        </div>
                    </div>
                </div>
                <!-- Begin: life time stats -->
                <div class="portlet ">
                    <div class="portlet-body">
                        <ul class="nav nav-tabs">
                            <%--<shiro:hasPermission name="task-call-manager-taskSupervise-list">--%>
                            <li class="active">
                                <a href="javascript:void(0)" data="-1">
                                    未服务 </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)" data="6">
                                    服务中 </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)" data="8">
                                    待付款 </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)" data="9">
                                    已付款 </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)" data="">
                                    全部 </a>
                            </li>
                            <%--</shiro:hasPermission>--%>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade active in">
                            <div class="table-container">
                                <table class="table table-striped table-bordered table-hover"
                                       id="datatable_task_list">
                                    <thead>
                                    <tr role="row" class="heading">
                                        <th width="20%">
                                            工单编号
                                        </th>
                                        <th width="10%">
                                            需求发布人
                                        </th>
                                        <th width="10%">
                                            服务对象
                                        </th>
                                        <th width="10%">
                                            需求
                                        </th>
                                        <th width="10%">
                                            服务组织
                                        </th>
                                        <th width="10%">
                                            服务人员
                                        </th>
                                        <th width="10%">
                                            工单状态
                                        </th>
                                        <th width="10%">
                                            评价
                                        </th>
                                        <th width="10%">
                                            查看
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                                <shiro:hasRole name="zuadmin">
                                    <input type="hidden" name="canDispath" value="1">
                                </shiro:hasRole>
                                <shiro:hasPermission name="task-call-manager-taskSupervise-list">
                                    <input type="hidden" id="taskSupList" value="1">
                                </shiro:hasPermission>
                                <shiro:hasPermission name="task-call-manager-taskSupervise-delete">
                                    <input type="hidden" id="taskSupDel" value="1">
                                </shiro:hasPermission>
                                <div class="table-actions-check-wrapper">
                                    <div class="pagination-panel"> 页数 <input type="text" id="page"
                                                                             class="pagination-panel-input form-control input-mini input-inline input-sm"
                                                                             maxlenght="5"
                                                                             style="text-align:center; margin: 0 5px;">
                                        <button
                                                href="" id="goPage" class="btn btn-sm default "
                                                onclick="TaskSupervise.goToPage()" title="GO">GO
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End: life time stats -->
            </div>
        </div>
        <!-- 地区模态框（Modal） -->
        <div class="modal" id="taskInfo" tabindex="" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" style="width: 900px">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">工单详情</h4>
                    </div>
                    <div class="modal-body">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary"
                                data-dismiss="modal">确定
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/task/task_supervise.js?v=1.3"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                TaskSupervise.init();

            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

