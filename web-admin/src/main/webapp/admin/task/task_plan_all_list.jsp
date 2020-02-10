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
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>工单列表</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
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
                    <a href="#">工单记录</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">工单记录</span>
                        </div>
                        <div class="tools">
                            <a href="" class="collapse">
                            </a>
                        </div>
                    </div>
                    <div id="searchDiv" class="portlet-body form">
                        <input type="hidden" value="0" id="province">
                        <input type="hidden" value="1" id="city">
                        <form id="serviceOrg-form" name="serviceOrg-form">
                        <table class="table table-bordered table-hover table-condensed table-responsive">
                            <tr>
                                <td width="10%" style="text-align:center;vertical-align:middle;">工单编号：</td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input name="number" class="form-control"
                                           type="text"/>
                                </td>
                                <td width="10%" style="text-align:center;vertical-align:middle;">
                                    服务对象名称：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input name="elderName" class="form-control"
                                           type="text"/>
                                </td>
                                <td width="10%" style="text-align:center;vertical-align:middle;">
                                    服务对象身份证号：
                                </td>
                                <td width="30%" style="text-align:center;vertical-align:middle;">
                                    <input name="idCardNo" class="form-control"
                                           type="text" value="${elderlyMsg.idcardno}"/>
                                    <input type="hidden" id="elderId" name="elderId" value="${elderlyMsg.id}">
                                </td>
                            </tr>
                            <tr>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    服务项目：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <lb:select name="serviceType" cssClass="form-control" id="serviceType" value="${taskPlan.serviceType}">
                                        <lb:option value="">所有项目</lb:option>
                                        <lb:option value="助餐">助餐</lb:option>
                                        <lb:option value="助浴">助浴</lb:option>
                                        <lb:option value="助洁">助洁</lb:option>
                                        <lb:option value="助医">助医</lb:option>
                                        <lb:option value="助急">助急</lb:option>
                                        <lb:option value="助行">助行</lb:option>
                                        <lb:option value="助购">助购</lb:option>
                                        <lb:option value="其他">其他</lb:option>
                                    </lb:select>
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
                                    服务区：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input type="hidden" value="0" id="province">
                                    <input type="hidden" value="1" id="city">
                                    <input type="hidden" value="${taskPlan.serviceAreaName}" id="serviceAreaName">
                                    <select name="county" class="form-control" id="county"
                                            onChange="EographicArea.changeCounty();">
                                        <option value="">行政区</option>
                                    </select>
                                </td>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    服务街道：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <select name="street" class="form-control" id="town"
                                            onChange="EographicArea.changeTown();">
                                        <option value="">街道</option>
                                    </select>
                                </td>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    服务社区：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <select name="village" class="form-control" id="village"
                                            onChange="EographicArea.changeVillage();">
                                        <option value="">社区</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    服务时间：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input style="display: inline-block" type="text"
                                           class="form-control date-picker" name="startTime"
                                           data-date-format="yyyy-mm-dd">
                                </td>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    至
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input style="display: inline-block" type="text"
                                           class="form-control date-picker" name="endTime"
                                           data-date-format="yyyy-mm-dd">
                                </td>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    服务地址：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input name="serviceAddress" class="form-control"
                                           type="text"/>
                                </td>
                            </tr>
                            <tr>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    服务状态：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;" colspan="5">
                                    <select name="status" class="form-control" id="status">
                                        <option value="">所有状态</option>
                                        <option value="0">未完成</option>
                                        <option value="1">已完成</option>
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
                                   id="datatable_task_list">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="10%">
                                        工单编号
                                    </th>
                                    <th width="5%">
                                        服务对象名称
                                    </th>
                                    <th width="5%">
                                        服务项目
                                    </th>
                                    <th width="10%">
                                        服务时间
                                    </th>
                                    <th width="5%">
                                        服务人员
                                    </th>
                                    <th width="15%">
                                        服务组织
                                    </th>
                                    <th width="15%">
                                        服务地址
                                    </th>

                                    <th width="5%">
                                        工单来源
                                    </th>
                                    <th width="5%">
                                        服务状态
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                            <shiro:hasPermission name="dispatch_system_list_delete">
                                <input type="hidden" name="canDelete" value="1">
                            </shiro:hasPermission>
                            <shiro:hasPermission name="dispatch_system_list_dispatch">
                                <input type="hidden" name="canDispath" value="1">
                            </shiro:hasPermission>
                            <div class="table-actions-check-wrapper">
                                <div class="pagination-panel"> 页数 <input type="text" id="page"
                                                                         class="pagination-panel-input form-control input-mini input-inline input-sm"
                                                                         maxlenght="5"
                                                                         style="text-align:center; margin: 0 5px;">
                                    <button
                                            href="" id="goPage" class="btn btn-sm default "
                                            onclick="TaskPLanAllList.goToPage()" title="GO">GO
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
                                aria-hidden="true">&times;
                        </button>
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
                src="${pageContext.request.contextPath }/assets/global/scripts/arrayValue.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/task/task_plan_all_list.js?v=1.8"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js?v=1.1"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                EographicArea.initWith("${sessionScope.login_user.areaName}");
                if(${taskPlan.serviceAreaName!=null and taskPlan.serviceAreaName!=''}){
                    EographicArea.initWith("内蒙古市,${taskPlan.serviceAreaName}");
                }
                EographicArea.changeProvince();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
                $(".table-group-action-reload").click(function () {
                    $("#serviceOrg-form").find("input:text").val("");//找到form表单下的所有input标签并清空
                    $("#serviceOrg-form").find("input:hidden").val("");//找到form表单下的所有input标签并清空
                    $("#serviceOrg-form").find("select").val("");//找到form表单下的所有select标签并清空
                    $("#serviceOrg-form").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
                });
                TaskPLanAllList.init();

            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

