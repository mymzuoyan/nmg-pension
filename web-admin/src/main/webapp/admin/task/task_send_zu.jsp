<%--<%@ page import="com.lb.common.enums.RoleType" %>--%>
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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>发送工单</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
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
                    <a href="#">派单系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">发送工单</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            发送工单
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal form-bordered  ">
                            <!-- PERSONAL INFO TAB -->
                            <div class="form-body">
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">发送方式
                                        </label>
                                        <div class="col-md-10">
                                            <div class="radio-list">
                                                <label class="radio-inline">
                                                    <input type="radio" name="type" value="1" checked> 强制接受 </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="type" value="0"> 非强制接受 </label>
                                            </div>
                                        </div>
                                    </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">标题
                                    </label>
                                    <div class="col-md-10">
                                        <input name="id" type="hidden" class="form-control "
                                               value="${task.id}">
                                        <input name="title" type="text" class="form-control "
                                               value="新的工单">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">服务老人
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-8">
                                        <input name="elderName" type="text" class="form-control "
                                               value="${task.elderName}" readonly placeholder="--请选择--">
                                    </div>
                                    <c:if test="${empty task}">
                                        <div class="col-md-2">
                                            <button style="" onclick="TaskSend.showSelectElderModel();"
                                                    type="button" class="btn green  ">选择老人
                                            </button>
                                        </div>
                                    </c:if>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">接收人
                                        <span class="required">*</span>
                                    </label>
                                    <div id="receiverId1Div" class="col-md-10">
                                        <select id="receiverId1" class="form-control select2me">
                                            <option value="">--请选择-- </option>
                                            <c:if test="${not empty serviceUsers}">
                                                <c:forEach items="${serviceUsers}" var="serviceUser">
                                                    <option value="${serviceUser.uid}">${serviceUser.name}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                    <div  id="receiverId2Div" class="col-md-10" style="display: none" >
                                        <select id="receiverId2"   style="width: 100%" class="form-control select2me" multiple="multiple">
                                            <option value="">--请选择-- </option>
                                            <c:if test="${not empty serviceUsers}">
                                                <c:forEach items="${serviceUsers}" var="serviceUser">
                                                    <option value="${serviceUser.uid}">${serviceUser.name}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">服务时间
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <div class="input-group">
                                            <input name="date" class="form-control date-picker" data-date-start-date="+0d"
                                                   style="float: left;width: 65%; margin-right: 5px" type="text"
                                                   value="<fmt:formatDate value="${task.serviceTime}" pattern="yyyy-MM-dd"></fmt:formatDate>" readonly/>
                                            <input name="time" type="text"
                                                   class="form-control timepicker timepicker-24"
                                                   style="width: 30%;float: right;" value="<fmt:formatDate value="${task.serviceTime}" pattern="HH:mm"></fmt:formatDate>" readonly>
                                            <span class="input-group-btn">
                                            <button class="btn default" type="button"><i
                                                    class="fa fa-clock-o"></i></button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">服务项目
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <select id="serviceName" name="serviceName" type="text" class="form-control ">
                                            <c:if test="${not empty task}">
                                                <option value="${task.serviceType}" selected>${task.serviceName}</option>
                                            </c:if>
                                        </select>

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">备注
                                    </label>
                                    <div class="col-md-10">
                                        <textarea name="content" value="${task.content}" class="form-control " rows="5">${task.content}</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions" style="padding: 50px">
                        <div class="row">
                            <div class="col-md-offset-4 col-md-8">
                                <button id="btnPublish" type="submit" class="btn green"
                                        data-loading-text="发送中...">发送
                                </button>
                                <span id="labelmsg" class="label "></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--selectElder--%>
        <div class="modal" id="selectElder" tabindex="-1" role="basic" aria-hidden="true">
            <div class="modal-dialog" style="width: 900px">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">选择老人</h4>
                    </div>
                    <div class="modal-body">
                        <div class="portlet">
                            <div class="portlet-body" style="padding-top: 0px !important;">
                                <form id="elder-form" name="elder-form">
                                    <table class="table table-bordered table-hover table-condensed table-responsive">
                                        <tr>
                                            <td colspan="4" style="text-align: center;font-size: 15px">
                                                <span class="caption-helper">基本信息</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="20%" style="text-align:center;vertical-align:middle;">所属区域</td>
                                            <td style="text-align:center;vertical-align:middle;"
                                                >
                                                <input name="areaName" id="areaName" onclick="TaskSend.selectArea();"
                                                       style=" width: 100%;"
                                                       type="text"
                                                       <%--value="${sessionScope.login_user.areaName}"--%>
                                                       readonly/>
                                                <input type="hidden" name="areaId" id="areaId" style=" width: 100%;"/>
                                            </td>
                                            <td width="20%" style="text-align:center;vertical-align:middle;">
                                                姓&nbsp;&nbsp;名
                                            </td>
                                            <td width="30%" style="text-align:center;vertical-align:middle;">
                                                <input name="elderName" style=" width: 100%;" />
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                                <div class="right" style="text-align: right">
                                    <div class="right" style="text-align: right">
                                        <a class="table-group-action-submit btn btn-circle btn-import"><i class="fa">查询</i></a>
                                        <a class="reload table-group-action-reload btn btn-circle btn-black"><i class="fa">重置</i></a>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="portlet" style="">
                            <div class="table-container">
                                <table class="table table-striped table-bordered table-hover" id="datatable_event_list">
                                    <thead>
                                    <tr role="row" class="heading">
                                        <th width="20%">
                                            选择
                                        </th>
                                        <th width="30%">
                                            姓名
                                        </th>
                                        <th width="10%">
                                            年龄
                                        </th>
                                        <th width="40%">
                                            居住地址
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn blue add" onclick="TaskSend.selectElder()">确定</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- 地区模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;</button>
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
                                onclick="TaskSend.getAreaValue(AreaTree.getAllAreaName(AreaTree.getSelectArea()),AreaTree.getSelectArea());">
                            确定
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/task/task_send_zu.js?v=1.0"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: 'yyyy-mm-dd'
                });
                $('.timepicker-24').timepicker({
                    autoclose: true,
                    minuteStep: 5,
                    showSeconds: false,
                    showMeridian: false
                });
                $('.timepicker').parent('.input-group').on('click', '.input-group-btn', function (e) {
                    e.preventDefault();
                    $(this).parent('.input-group').find('.timepicker').timepicker('showWidget');
                });
                Metronic.init();
                Layout.init();
                TaskSend.init();
                <c:if test="${not empty task}">
                    TaskSend.setElderName("${task.elderName}");
                </c:if>
                AreaTree.init2();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

