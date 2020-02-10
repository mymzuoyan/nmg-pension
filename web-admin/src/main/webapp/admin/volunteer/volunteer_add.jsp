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
                            <span class="caption-subject font-red-sunglo bold uppercase">志愿者新增</span>
                        </div>
                        <div class="tools">
                            <shiro:hasPermission name="timeBank-addVolunteer-update">
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
                                        <form id="volunteerAddForm">
                                            <input type="hidden" id="province" value="0">
                                            <input type="hidden" id="city" value="1">
                                            <div class="form-body">
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
                                                               id="volunteerName"
                                                               name="volunteerName"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label"><span
                                                            class="required">*</span>身份证号码: </label>
                                                    <div class="col-md-4">
                                                        <input name="idcardno" id="idcardno" type="text"
                                                               class="form-control "
                                                               onblur="VolunteerAdd.validateIdCard();">
                                                        <input type="hidden" value="" name="age" id="age">
                                                        <input type="hidden" value="" name="sexDictId" id="sexDictId">
                                                        <span class="required" style="color: red;"
                                                              id="errorIdCard"></span>
                                                    </div>
                                                    <label class="col-md-2 control-label">联系电话: </label>
                                                    <div class="col-md-4">
                                                        <input class="form-control" type="text"
                                                               id="homeTel" name="homeTel"
                                                        >
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">手机: </label>
                                                    <div class="col-md-4">
                                                        <input class="form-control" type="text"
                                                               id="mobile"
                                                               name="mobile"
                                                        >
                                                    </div>
                                                    <label class="col-md-2 control-label">QQ: </label>
                                                    <div class="col-md-4">
                                                        <input class="form-control" type="text"
                                                               id="qq" name="qq"
                                                        >
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">户籍所在地: </label>
                                                    <div class="col-md-10">
                                                        <input class="form-control" type="text"
                                                               id="registrationPlace"
                                                               name="registrationPlace">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">实际居住地: </label>
                                                    <div class="col-md-10">
                                                        <input type="text" class="form-control"
                                                               name="realLiveAddress"
                                                               id="realLiveAddress"
                                                        >
                                                    </div>
                                                </div>
                                                <div class="form-actions">
                                                    <div class="row">
                                                        <div class="col-md-offset-6" >
                                                            <span id="labelmsg" class="label"></span>
                                                            <button data-loading-text="提交中..."
                                                                    type="button" class="btn btn-circle green"
                                                                    onclick="VolunteerAdd.submitAdd()">
                                                                提交
                                                            </button>
                                                            <button onclick="window.parent.closeTab('side-volunteer-add')"
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
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/volunteer/volunteer_list.js?v=1.5"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/volunteer/volunteer_add.js?v=1.2"
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
                EographicArea.init();
                EographicArea.changeCity();
                VolunteerAdd.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>


