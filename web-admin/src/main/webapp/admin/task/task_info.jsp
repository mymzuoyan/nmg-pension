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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>工单详情</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
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
                    <a href="#">工单详情</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            工单详情
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal form-bordered  ">
                            <!-- PERSONAL INFO TAB -->
                            <div class="form-body">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">标题
                                    </label>
                                    <div class="col-md-10">
                                        <input name="title" type="text" class="form-control " readonly
                                               value="${task.title}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">发送人
                                    </label>
                                    <div class="col-md-10">
                                        <input name="creatorName" type="text" class="form-control " readonly
                                               value="${task.creatorName}">
                                    </div>
                                </div>
                                <c:if test="${not empty task.receiverName}">
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">接收人
                                        </label>
                                        <div class="col-md-8">
                                            <input name="receiverId" type="text" class="form-control " readonly
                                                   value="${task.receiverName}">
                                        </div>
                                    </div>
                                </c:if>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">服务老人
                                    </label>
                                    <div class="col-md-10">
                                        <input name="elderName" type="text" class="form-control " readonly
                                               value="${task.elderName}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">服务时间
                                    </label>
                                    <div class="col-md-10">
                                        <input name="serviceTime" type="text" class="form-control " readonly
                                               value="<fmt:formatDate value="${task.serviceTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">服务项目
                                    </label>
                                    <div class="col-md-10">
                                        <input name="serviceName" type="text" class="form-control " readonly
                                               value="${task.serviceType}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">备注
                                    </label>
                                    <div class="col-md-10">
                                                <textarea name="content" class="form-control " rows="5"
                                                          readonly>${task.content}
                                                </textarea>
                                    </div>
                                </div>
                                <c:if test="${not empty task.status}">
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">工单状态
                                        </label>
                                        <div class="col-md-10">
                                            <c:set var="salary" value='${["已拒绝", "待响应", "组织已响应", "组织已派遣", "组织已拒绝", "服务人员已接单", "服务人员已上门", "服务人员已拒绝", "待付款","已完成", "已评价", "已调度"][task.status]}'/>
                                            <c:choose>
                                                <c:when test="${task.status==0}">
                                                    <label class="label" style="background-color:red">${salary}</label>
                                                </c:when>
                                                <c:when test="${task.status==1||tasl.sttaus==10}">
                                                    <label class="label" style="background-color:#cda815">${salary}</label>
                                                </c:when>
                                                <c:when test="${task.status>1}">
                                                    <label class="label" style="background-color:green">${salary}</label>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                    </div>
                                </c:if>

                                <div class="form-group">
                                    <div class="col-md-offset-4 col-md-8">
                                        <c:if test="${task.creatorId!=sessionScope.login_user.uid}">
                                            <c:if test="${task.status == 2}">
                                                <button style="margin: 10px" data-id="${task.id}" type="button"
                                                        class="btn btn-default blue send">派单
                                                </button>
                                            </c:if>
                                        </c:if>
                                        <button style="margin: 10px" type="button" class="btn btn-default cancel">返回
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/task/task_send.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                $('#select2_sample2').select2({
                    placeholder: "Select a State",
                    allowClear: true
                });

                $(".send").click(function () {
                    var id = $(this).data("id");
                    window.parent.addTab("task_send", "发送工单", window.apppath + "/admin/task/send?id=" + id);
                })


                $(".cancel").click(function () {
                    window.parent.closeTab("task_info");
                    window.history.back();
                })

            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

