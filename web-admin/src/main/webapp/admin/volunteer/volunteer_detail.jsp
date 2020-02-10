<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>社区志愿者</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
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
                    <a href="#">社区志愿者</a>
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
                            <span class="caption-subject font-red-sunglo bold uppercase">志愿者详情</span>

                        </div>
                        <div class="tools">
                            <shiro:hasPermission name="volunteer-update">
                                <c:choose>
                                    <c:when test="${method=='edit'}">
                                        <div style="float: right;margin-right: 15px;margin-top: 5px;margin-bottom: 5px;">
                                            <div style="width:80px;float:left;display: block;padding-right: 10px;">
                                                <a class="btn btn-circle green"
                                                   onclick="VolunteerDetail.allowEdit()"><i
                                                        class="fa">修改</i></a>
                                            </div>
                                        </div>
                                    </c:when>
                                </c:choose>
                            </shiro:hasPermission>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="form-horizontal">
                            <div class="form-body">
                                <div class="tab-content form">
                                    <div class="form-horizontal form-bordered">
                                        <form id="volunteerEditForm">
                                            <div class="form-body">
                                                <input type="hidden" id="id" value="${volunteer.id}">
                                                <input type="hidden" id="province" value="0">
                                                <input type="hidden" id="city" value="1">
                                                <input type="hidden" id="areaId" value="${volunteer.areaId}">
                                                <div class="form-group">
                                                    <label class="control-label col-md-2"><span
                                                            class="required">*</span>所属区域: </label>
                                                    <div class="col-md-4">
                                                        <select name="area" class="form-control" id="county"
                                                                onChange="EographicArea.changeCounty();"
                                                                readonly="readonly">
                                                            <option value="">行政区，市，县</option>
                                                        </select>
                                                    </div>
                                                    <label class="control-label col-md-2"><span
                                                            class="required">*</span>所属街道: </label>
                                                    <div class="col-md-4">
                                                        <select name="street" class="form-control" id="town"
                                                                onChange="EographicArea.changeTown();"
                                                                readonly="readonly">
                                                            <option value="">街道，乡，镇</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-2">所属社区: </label>
                                                    <div class="col-md-4">
                                                        <select name="community" class="form-control" id="village"
                                                                onChange="EographicArea.changeVillage();"

                                                                readonly="readonly">
                                                            <option value="0">社区，村</option>
                                                        </select>
                                                    </div>
                                                    <label class="control-label col-md-2"><span
                                                            class="required">*</span>姓名: </label>
                                                    <div class="col-md-4">
                                                        <input type="text" class="form-control"
                                                               id="volunteerName" value="${volunteer.volunteerName}"
                                                               name="volunteerName"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label"><span
                                                            class="required">*</span>身份证号码: </label>
                                                    <div class="col-md-4">
                                                        <input name="idcardno" id="idcardno" type="text"
                                                               class="form-control " value="${volunteer.idcardno}"
                                                               onblur="VolunteerAdd.validateIdCard();">
                                                        <span class="required" style="color: red;"
                                                              id="errorIdCard"></span>
                                                    </div>
                                                    <label class="col-md-2 control-label">联系电话: </label>
                                                    <div class="col-md-4">
                                                        <input class="form-control" type="text"
                                                               id="homeTel" name="homeTel" value="${volunteer.homeTel}"
                                                        >
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">年龄: </label>
                                                    <div class="col-md-4">
                                                        <input class="form-control" type="text"
                                                               value="${volunteer.age}"
                                                               name="age" id="age"
                                                        >
                                                    </div>
                                                    <label class="col-md-2 control-label">性别: </label>
                                                    <div class="col-md-4">
                                                        <input class="form-control" type="text"
                                                               value="${volunteer.sexDictId==1?'男':'女'}" name="sexDictId"
                                                               id="sexDictId"
                                                        >
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">手机: </label>
                                                    <div class="col-md-4">
                                                        <input class="form-control" type="text"
                                                               value="${volunteer.mobile}"
                                                               name="mobile"
                                                        >
                                                    </div>
                                                    <label class="col-md-2 control-label">QQ: </label>
                                                    <div class="col-md-4">
                                                        <input class="form-control" type="text"
                                                               value="${volunteer.qq}" name="qq"
                                                        >
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">户籍所在地: </label>
                                                    <div class="col-md-10">
                                                        <input class="form-control" type="text"
                                                               value="${volunteer.registrationPlace}"
                                                               name="registrationPlace">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">实际居住地: </label>
                                                    <div class="col-md-10">
                                                        <input type="text" class="form-control"
                                                               name="realLiveAddress"
                                                               value="${volunteer.realLiveAddress}"
                                                        >
                                                    </div>
                                                </div>
                                                <div class="form-actions">
                                                    <div class="row">
                                                        <shiro:hasPermission name="volunteer-update">
                                                            <div class="col-md-offset-8 " style="float:left;">
                                                                <button data-loading-text="提交中..."
                                                                        type="button" class="btn btn-circle green"
                                                                        onclick="VolunteerDetail.submitEdit()"
                                                                        name="editVolunteer">
                                                                    提交
                                                                </button>
                                                                <span id="labelmsg1" class="label"></span>
                                                            </div>
                                                        </shiro:hasPermission>
                                                        <div class="col-md-offset-11">
                                                            <button onclick="window.parent.closeTab('tab-volunteer-info')"
                                                                    class="btn btn-circle green"><i
                                                                    class="fa">返回</i>
                                                            </button>
                                                        </div>
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
        </div>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js?v=1"></script>

        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/volunteer/volunteer_detail.js"
                type="text/javascript"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                EographicArea.initWith("${volunteer.areaName}");
                EographicArea.changeCity();
                VolunteerDetail.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });

            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>


