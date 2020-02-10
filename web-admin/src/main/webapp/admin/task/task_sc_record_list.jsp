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
        <title>市场工单服务记录</title>
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
                    <a href="#">历史服务记录</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet">
                    <div class="portlet-title">

                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase"></span>
                        </div>

                        <div class="caption tabbable-line" style="padding: 0px">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a onclick="if(!$(this).parent().hasClass('active'))
                                        window.location.href='${pageContext.request.contextPath}/admin/task/sc_record_list?receiverId=${receiverId}'"
                                       data-toggle="tab" aria-expanded="false"><span
                                            class="caption-subject font-red-sunglo bold uppercase"
                                            style="border-bottom: hidden">市场工单记录</span></a>
                                </li>

                                <li class="">
                                    <a onclick="if(!$(this).parent().hasClass('active'))
                                        window.location.href='${pageContext.request.contextPath }/admin/task/jh_record_list?receiverId=${receiverId}'"
                                       data-toggle="tab" aria-expanded="true"><span
                                            class="caption-subject font-red-sunglo bold uppercase"
                                            style="border-bottom: hidden">计划工单记录</span></a>
                                </li>
                            </ul>
                        </div>
                        <div class="tools">
                            <a href="" class="expand">
                            </a>
                        </div>

                    </div>
                    <div id="searchDiv" class="portlet-body form">
                        <form id="serviceOrg-form" name="serviceOrg-form">
                        <table class="table table-bordered table-hover table-condensed table-responsive">
                            <tr>
                                <td width="13%" style="text-align:center;vertical-align:middle;">工单编号：</td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input name="number" class="form-control"
                                           type="text"/>
                                </td>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    需求发布人：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input name="creatorName" class="form-control"
                                           type="text"/>
                                </td>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    服务对象：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input name="elderName" class="form-control"
                                           type="text"/>
                                </td>
                            </tr>
                            <tr>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    服务项目：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <select name="serviceType" class="form-control" id="serviceType">
                                        <option value="">所有项目</option>
                                        <option value="助餐">助餐</option>
                                        <option value="助浴">助浴</option>
                                        <option value="助洁">助洁</option>
                                        <option value="助医">助医</option>
                                        <option value="助急">助急</option>
                                        <option value="助行">助行</option>
                                        <option value="助购">助购</option>
                                        <option value="其他">其他</option>
                                    </select>
                                </td>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    服务组织：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input name="receiverServiceOrg" class="form-control"
                                           type="text"/>
                                </td>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    服务人员：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input name="receiverName" class="form-control"
                                           type="text"/>
                                </td>
                            </tr>
                            <tr>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    状态：
                                </td>
                                <td width="40%" colspan="2" style="text-align:center;vertical-align:middle;">
                                    <select name="status" class="form-control" id="status">
                                        <option value="">所有状态</option>
                                        <option value="1">待响应</option>
                                        <option value="2">组织已响应</option>
                                        <option value="5">服务人员已接单</option>
                                        <option value="6">服务人员已上门</option>
                                        <option value="8">待付款</option>
                                        <option value="9">已完成</option>
                                        <option value="10">已评价</option>
                                    </select>
                                </td>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    评论星级：
                                </td>
                                <td width="40%"  colspan="2" style="text-align:center;vertical-align:middle;">
                                    <select name="level" class="form-control" id="level">
                                        <option value="">所有星级</option>
                                        <option value="1">1星</option>
                                        <option value="2">2星</option>
                                        <option value="3">3星</option>
                                        <option value="4">4星</option>
                                        <option value="5">5星</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        </form>
                        <div style="text-align: right">
                            <a id="search" class="btn btn-circle  green">
                                查询 </i>
                            </a>
                            <a class="reload table-group-action-reload btn btn-circle btn-black"><i
                                    class="fa">重置</i></a>
                        </div>
                    </div>
                </div>
                <!-- Begin: life time stats -->
                <div class="portlet ">
                    <div class="portlet-body">
                        <div class="table-container">
                            <table class="table table-striped table-bordered table-hover"
                                   id="datatable_task_sc_record_list">
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
                                        操作
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                            <shiro:hasPermission name="task-call-manager-appList-list">
                                <input type="hidden" id="taskCallManagerAppList" value="1"/>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="task-call-manager-appList-delete">
                                <input type="hidden" name="canDelete" value="1">
                            </shiro:hasPermission>
                            <shiro:hasPermission name="task-call-manager-appList-dispatch">
                                <input type="hidden" name="canDispath" value="1">
                            </shiro:hasPermission>
                            <div class="table-actions-check-wrapper">
                                <div class="pagination-panel"> 页数 <input type="text" id="page"
                                                                         class="pagination-panel-input form-control input-mini input-inline input-sm"
                                                                         maxlenght="5"
                                                                         style="text-align:center; margin: 0 5px;">
                                    <button
                                            href="" id="goPage" class="btn btn-sm default "
                                            onclick="Task_Sc_Record_List.goToPage()" title="GO">GO
                                    </button>
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
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/task/task_sc_record_list.js?v=3.31"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                var receiverId = '${receiverId}';
                $(".table-group-action-reload").click(function () {
                    $("#serviceOrg-form").find("input:text").val("");//找到form表单下的所有input标签并清空
                    $("#serviceOrg-form").find("input:hidden").val("");//找到form表单下的所有input标签并清空
                    $("#serviceOrg-form").find("select").val("");//找到form表单下的所有select标签并清空
                    $("#serviceOrg-form").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
                });
                Task_Sc_Record_List.init(receiverId);

            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

