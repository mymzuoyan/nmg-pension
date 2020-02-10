<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>公益志愿者组织</title>
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
                    <a href="#">公益志愿者组织</a>
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
                                <c:when test="${method=='add'}">
                                    <c:choose>
                                        <c:when test="${storeOrDraw=='store'}">
                                            <span class="caption-subject font-red-sunglo bold uppercase">新增存入信息</span>
                                        </c:when>
                                        <c:when test="${storeOrDraw=='draw'}">
                                            <span class="caption-subject font-red-sunglo bold uppercase">新增支取信息</span>
                                        </c:when>
                                    </c:choose>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="form-horizontal">
                            <div class="tab-content">
                                <!-- PERSONAL INFO TAB -->
                                <div class="form-horizontal form-bordered">
                                    <form id="volStoreOrDrawEditForm">
                                        <div class="form-group">
                                            <label class="control-label col-md-2"><span
                                                    class="required">*</span>服务人员: </label>
                                            <div class="col-md-4">
                                                <input type="text" class="form-control"
                                                       value="${volStoreOrDraw.serviceName}"
                                                       id="serviceName1"
                                                       readonly/>
                                            </div>
                                            <label class="control-label col-md-2"><span
                                                    class="required">*</span>服务对象: </label>
                                            <div class="col-md-4">
                                                <input type="text" class="form-control"
                                                       value="${volStoreOrDraw.targetName}" id="targetName1"
                                                       readonly/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-2"><span
                                                    class="required">*</span>服务人员: </label>
                                            <div class="col-md-4">
                                                <input type="text" class="form-control"
                                                       value="${volStoreOrDraw.serviceName}"
                                                       id="serviceName1"
                                                       readonly/>
                                            </div>
                                            <label class="control-label col-md-2"><span
                                                    class="required">*</span>时间: </label>
                                            <div class="col-md-4">
                                                <input type="text" class="form-control  date-picker"
                                                       value="${serviceTimeString}"
                                                       readonly/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">积分: </label>
                                            <div class="col-md-4">
                                                <input class="form-control" type="text"
                                                       value="${volStoreOrDraw.score}" readonly>
                                            </div>
                                            <label class="col-md-2 control-label">服务内容: </label>
                                            <div class="col-md-4">
                                                <input class="form-control" type="text"
                                                       value="${volStoreOrDraw.serviceInfo}"
                                                       readonly>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="tab-pane ${title2}" id="tab_add">
                                    <form id="volStoreOrDrawAddForm">
                                        <div class="form-group">
                                            <label class="control-label col-md-2"><span
                                                    class="required">*</span>服务对象: </label>
                                            <input type="hidden" name="volunteerId" id="volunteerId"
                                                   value="${volunteer.id}">
                                            <div class="col-md-10">
                                                <c:choose>
                                                    <c:when test="${storeOrDraw=='store'}">
                                                        <input type="text" class="form-control"
                                                               value=""
                                                               name="targetName" id="targetName"/>
                                                        <input type="hidden" name="serviceType"
                                                               value="0">
                                                    </c:when>
                                                    <c:when test="${storeOrDraw=='draw'}">
                                                        <input type="text" class="form-control"
                                                               name="targetName" id="targetName"
                                                               value="${volunteer.volunteerName}"
                                                               readonly/>
                                                        <input type="hidden" name="serviceType"
                                                               value="1">
                                                    </c:when>
                                                </c:choose>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-2"><span
                                                    class="required">*</span>服务人员: </label>
                                            <div class="col-md-4">
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
                                            <label class="control-label col-md-2"><span
                                                    class="required">*</span>时间: </label>
                                            <div class="col-md-4">
                                                <input type="text" class="form-control  date-picker"
                                                       name="serviceTimeString"
                                                       data-date-format="yyyy-mm-dd" value=""
                                                       readonly id="serviceTimeString"
                                                >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">积分: </label>
                                            <div class="col-md-4">
                                                <input class="form-control" type="text"
                                                       value="" name="score">
                                            </div>
                                            <label class="col-md-2 control-label">服务内容: </label>
                                            <div class="col-md-4">
                                                <input class="form-control" type="text"
                                                       value="" name="serviceInfo">
                                            </div>
                                        </div>

                                        <div class="form-actions">
                                            <div class="row">
                                                <div class="col-md-offset-8" style="float: left">
                                                    <button data-loading-text="提交中..."
                                                            type="button" class="btn btn-circle green"
                                                            onclick="VolStoreOrDrawDetail.submitAdd()">
                                                        提交
                                                    </button>
                                                    <span id="labelmsg" class="label"></span>
                                                </div>
                                                <div class="col-md-offset-11">
                                                    <button onclick="javascript:window.history.back(-1)"
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
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();

                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });

            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>


