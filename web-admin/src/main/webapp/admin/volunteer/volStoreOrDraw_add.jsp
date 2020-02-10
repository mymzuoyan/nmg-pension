<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
    <title>社区志愿者</title>
    <c:choose>
        <c:when test="${method=='show'}">
            <c:set var="title1" value="active"></c:set>
        </c:when>
        <c:when test="${method=='add'}">
            <c:set var="title2" value="active"></c:set>
        </c:when>
    </c:choose>
</tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
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
                    <a href="#">服务资源管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">社区志愿者积存操作</a>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <!-- Begin: life time stats -->
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <c:choose>
                                <c:when test="${storeOrDraw=='store'}">
                                    <span class="caption-subject font-red-sunglo bold uppercase">新增存入信息</span>
                                </c:when>
                                <c:when test="${storeOrDraw=='draw'}">
                                    <span class="caption-subject font-red-sunglo bold uppercase">新增支取信息</span>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="form-horizontal">
                            <div class="tab-content form">
                                <!-- PERSONAL INFO TAB -->
                                <div class="form-horizontal form-bordered">
                                    <form id="volStoreOrDrawAddForm">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label"> <span class="required">*</span>接收组织机构
                                            </label>
                                            <div class="col-md-2">
                                                <c:if test="${sessionScope.login_user.areaId>1}">
                                                    <input type="hidden" id="areaName0"
                                                           value="${sessionScope.login_user.areaName}">
                                                </c:if>
                                                <select id="province" class="form-control"
                                                        onChange="EographicArea.changeProvince();" style="display: none">
                                                    <option value="0" selected>江苏省</option>
                                                </select>
                                                <select name="city" class="form-control" id="city"
                                                        onChange="EographicArea.changeCity();"
                                                        <c:if test="${sessionScope.login_user.areaId>1}">disabled</c:if>
                                                >
                                                    <option value="">直辖市，地级市</option>
                                                    <option value="1">南京市</option>
                                                    <option value="2000">非南京户籍</option>
                                                </select>
                                            </div>
                                            <div class="col-md-2">
                                                <select name="area" class="form-control" id="county"
                                                        onChange="TaskSend.changeCounty();"
                                                        readonly="readonly"
                                                        <c:if test="${sessionScope.login_user.areaId>1}">disabled</c:if>
                                                >
                                                    <option value="">行政区，市，县</option>
                                                </select>
                                            </div>
                                            <div class="col-md-2">
                                                <select id="receiverId" class="form-control"
                                                        onChange="TaskSend.changeServiceOrg();">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-2"><span
                                                    class="required">*</span>服务人员: </label>
                                            <div class="col-md-6">
                                                <c:choose>
                                                    <c:when test="${storeOrDraw=='store'}">
                                                        <input type="text" class="form-control"
                                                               value="${volunteer.volunteerName}"
                                                               name="serviceName" id="serviceName"
                                                               readonly/>
                                                    </c:when>
                                                    <c:when test="${storeOrDraw=='draw'}">
                                                        <input type="text" class="form-control"
                                                               value=""
                                                               name="serviceName" id="serviceName"
                                                        />
                                                    </c:when>
                                                </c:choose>

                                            </div>
                                        </div>
                                        <div class="form-group">

                                        <label class="control-label col-md-2"><span
                                                    class="required">*</span>服务对象: </label>
                                            <input type="hidden" name="volunteerId" id="volunteerId"
                                                   value="${volunteer.id}">
                                            <div class="col-md-6">
                                                <c:choose>
                                                    <c:when test="${storeOrDraw=='store'}">
                                                        <input type="text" class="form-control"
                                                               value=""
                                                               name="targetName" id="targetName"/>
                                                        <input type="hidden" name="type"
                                                               value="0">
                                                    </c:when>
                                                    <c:when test="${storeOrDraw=='draw'}">
                                                        <input type="text" class="form-control"
                                                               name="targetName" id="targetName"
                                                               value="${volunteer.volunteerName}"
                                                               readonly/>
                                                        <input type="hidden" name="type"
                                                               value="1">
                                                    </c:when>
                                                </c:choose>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-2"><span
                                                    class="required">*</span>时间: </label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control  date-picker"
                                                       name="serviceTimeString"
                                                       data-date-format="yyyy-mm-dd" value=""
                                                       readonly id="serviceTimeString"
                                                >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">积分: </label>
                                            <div class="col-md-6">
                                                <input class="form-control" type="text"
                                                       value="" name="score">
                                            </div>
                                        </div>
                                        <div class="form-group">

                                        <label class="col-md-2 control-label">服务内容: </label>
                                            <div class="col-md-6">
                                                <input class="form-control" type="text"
                                                       value="" name="serviceInfo">
                                            </div>
                                        </div>

                                        <div class="form-actions">
                                            <div class="row">
                                                <div class="col-md-offset-4" style="float: left">
                                                    <button data-loading-text="提交中..."
                                                            type="button" class="btn btn-circle green"
                                                            onclick="VolStoreOrDrawDetail.submitAdd()">
                                                        提交
                                                    </button><input type="reset" value="重置" id="cz" style="display: none;"/>
                                                    <span id="labelmsg" class="label"></span>
                                                </div>
                                                <div class="col-md-offset-6">
                                                    <button style="width: 75px;height: 35px;" onclick="window.parent.closeTab('tab-volStoreOrDraw-add')"
                                                            class="btn btn-circle green"><i
                                                            class="fa">返回</i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>

        <!--timer-->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/volunteer/volStoreOrDraw_detail.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/task/task_send.js?v=1.1"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js?v="></script>
        <script type="text/javascript"
                src="http://api.map.baidu.com/api?v=2.0&ak=UtTMI5ofPulxrOYjzLcEWHGXRlyAEfUB"></script>
        <script type="text/javascript"
                src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();

                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
                EographicArea.initWith("${sessionScope.login_user.areaName}");
                EographicArea.changeProvince();
                TaskSend.init();
                <c:if test="${not empty task}">
                TaskSend.setElderName("${task.elderName}");
                </c:if>
                AreaTree.init2();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>


