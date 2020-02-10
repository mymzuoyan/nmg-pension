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
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <tiles:putAttribute name="page_title">
        <title>服务人员详情</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jquery-multi-select/css/multi-select.css?v=1.1"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <style>
            .remove {
                color: red;
                font-size: 17px;
                cursor: pointer;
                line-height: 12px;
                margin: 0px 10px;
                text-decoration: none;
            }

            .removeImg {
                z-index: 2;
                position: absolute;
                right: 0px;
                color: red;
                font-size: 25px;
            }

            .file-box {
                position: relative;
                width: 77px;
                height: 77px;
                border: 1px solid #D9D9D9;
                background-image: url("${pageContext.request.contextPath }/assets/admin/pages/img/add.png");
            }

            .file-div {
                width: 77px;
                height: 77px;
                display: inline-block;
                position: relative;
                vertical-align: text-bottom;
            }

            .file-box input {
                position: absolute;
                z-index: 1;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                opacity: 0;
            }

            .file-box-list {

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
                    <a href="#">服务人员</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">服务人员详情</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption tabbable-line" style="padding: 0px">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a
                                            data-toggle="tab" aria-expanded="false"><span
                                            class="caption-subject font-red-sunglo bold uppercase"
                                            style="border-bottom: hidden">基本信息</span></a>
                                </li>
                            </ul>
                        </div>
                        <div class="tools" style="padding: 12px 0 8px 0;">
                            <div style="float: right;margin-right: 15px;margin-top: 5px;margin-bottom: 5px;">
                                <div style="width:80px;float:left;display: block;padding-right: 10px;">
                                    <a class="btn btn-circle green"
                                       onclick="UserFuwuInfo.allowEdit()"><i
                                            class="fa">修改</i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal form-bordered">
                            <form id="editForm">
                                <input type="hidden" id="id" name="id" value="${userFuWu.id}">
                                <!-- PERSONAL INFO TAB -->
                                <div class="form-body">
                                    <div class="form-group">
                                        <label class="col-md-2 control-label" style="padding-left: 0px">姓名
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input name="name" type="text" class="form-control "
                                                   value="${userFuWu.name}" disabled id="name">
                                        </div>
                                        <label class="col-md-2 control-label" id="area-zuzhi-label"
                                               style="padding-left: 0px">所在区域
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input name="areaName" type="text" class="form-control "
                                                   value="${userFuWu.areaName}" disabled>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label" style="padding-left: 0px">所在组织
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input type="hidden" name="serviceOrgId" class="form-control "
                                                   value="${userFuWu.serviceOrgId}" id="serviceOrgId">
                                            <input type="text" class="form-control " id="serviceOrgName"
                                                   onclick="UserFuwuInfo.showSelectServiceOrgModel('edit')"
                                                   name="serviceOrgName" value="${userFuWu.serviceOrgName}" disabled>
                                        </div>
                                        <label class="col-md-2 control-label" style="padding-left: 0px">身份证号
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <div style="float: left">
                                                <input name="idcardno" id="idcardno" type="text"
                                                       class="form-control " value="${userFuWu.idcardno}"
                                                       onchange="UserFuwuInfo.validateIdCard();" disabled>
                                            </div>
                                            <div>
                                            <span class="required" style="color: red;margin-left: 10px;"
                                                  id="errorIdCard"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label" style="padding-left: 0px">性别
                                        </label>
                                        <div class="col-md-4">
                                            <input name="gender" type="text" class="form-control "
                                                   value="${userFuWu.gender}" readonly id="gender">
                                        </div>
                                        <label class="col-md-2 control-label" style="padding-left: 0px">年龄
                                        </label>
                                        <div class="col-md-4">
                                            <input name="age" type="text" class="form-control "
                                                   value="${userFuWu.age}" readonly id="age">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label" style="padding-left: 0px">联系方式
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input name="mobile" type="text" class="form-control "
                                                   value="${userFuWu.mobile}" id="mobile" disabled>
                                        </div>
                                        <label class="col-md-2 control-label" style="padding-left: 0px">QQ
                                        </label>
                                        <div class="col-md-4">
                                            <input name="QQ" type="text" class="form-control "
                                                   value="${userFuWu.QQ}" id="QQ" disabled>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label" style="padding-left: 0px">户籍所在地
                                        </label>
                                        <div class="col-md-4">
                                            <input name="cityAddress" type="text" class="form-control "
                                                   value="${userFuWu.cityAddress}" disabled>
                                        </div>
                                        <label class="col-md-2 control-label" style="padding-left: 0px">实际居住地
                                        </label>
                                        <div class="col-md-4">
                                            <input name="realAddress" type="text" class="form-control "
                                                   value="${userFuWu.realAddress}" disabled>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 control-label">入职时间
                                        </label>
                                        <div class="col-md-4">
                                            <input name="entryTime" type="text"
                                                   class="form-control  date-picker"
                                                   disabled
                                                   value="<fmt:formatDate pattern="yyyy-MM-dd" value="${userFuWu.entryTime}"></fmt:formatDate>"
                                            >
                                        </div>
                                        <label class="col-md-2 control-label">社保时间
                                        </label>
                                        <div class="col-md-4">
                                            <input name="socialTime" type="text"
                                                   class="form-control  date-picker"
                                                   disabled
                                                   value="<fmt:formatDate pattern="yyyy-MM-dd" value="${userFuWu.socialTime}"></fmt:formatDate>"
                                            >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">证书时间
                                        </label>
                                        <div class="col-md-4">
                                            <input name="certificateTime" type="text"
                                                   class="form-control  date-picker"
                                                   disabled
                                                   value="<fmt:formatDate pattern="yyyy-MM-dd" value="${userFuWu.certificateTime}"></fmt:formatDate>"
                                            >
                                        </div>
                                        <label class="col-md-2 control-label">毕业时间
                                        </label>
                                        <div class="col-md-4">
                                            <input name="educationTime" type="text"
                                                   class="form-control  date-picker"
                                                   disabled
                                                   value="<fmt:formatDate pattern="yyyy-MM-dd" value="${userFuWu.educationTime}"></fmt:formatDate>"
                                            >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label"
                                               style="padding-left: 0px;padding-top: 50px">服务类型
                                        </label>
                                        <div class="col-md-4">
                                            <select multiple="multiple" class="multi-select"
                                                    id="serviceType" name="serviceType">
                                            </select>
                                        </div>
                                        <label class="col-md-2 control-label"
                                               style="padding-left: 0px;padding-top: 50px">服务项目
                                        </label>
                                        <div class="col-md-4" style="padding-top: 50px">
                                            <input name="serviceProject" type="text" class="form-control "
                                                   value="${userFuWu.serviceProject}" disabled>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">人员类型
                                        </label>
                                        <div class="col-md-4">
                                            <select id="userType" name="userType" class="form-control">
                                                <option value="">
                                                    --请选择--
                                                </option>
                                                <option value="1" <c:if test="${userFuWu.userType==1}">selected</c:if>>
                                                    养老护理员
                                                </option>
                                                <option value="2" <c:if test="${userFuWu.userType==2}">selected</c:if>>
                                                    营养师
                                                </option>
                                                <option value="3" <c:if test="${userFuWu.userType==3}">selected</c:if>>
                                                    心理学咨询师
                                                </option>
                                                <option value="4" <c:if test="${userFuWu.userType==4}">selected</c:if>>
                                                    医生
                                                </option>
                                                <option value="5" <c:if test="${userFuWu.userType==5}">selected</c:if>>
                                                    护士
                                                </option>
                                                <option value="6" <c:if test="${userFuWu.userType==6}">selected</c:if>>
                                                    康复师
                                                </option>
                                                <option value="7" <c:if test="${userFuWu.userType==7}">selected</c:if>>
                                                    管理人员
                                                </option>
                                                <option value="8" <c:if test="${userFuWu.userType==8}">selected</c:if>>
                                                    服务人员
                                                </option>
                                                <option value="9" <c:if test="${userFuWu.userType==9}">selected</c:if>>
                                                    其他人员
                                                </option>
                                            </select>
                                        </div>
                                        <label class="col-md-2 control-label">人员等级
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <div class="radio-list">
                                                <label class="radio-inline">
                                                    <input type="radio" name="userLevel" value="1" <c:if test="${userFuWu.userLevel==1}">checked</c:if>>初级 </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="userLevel" value="2" <c:if test="${userFuWu.userLevel==2}">checked</c:if>>中极 </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="userLevel" value="3" <c:if test="${userFuWu.userLevel==3}">checked</c:if>>高级 </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label"
                                        >工作类型
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <div class="radio-list">
                                                <select id="workType" name="workType" class="form-control" disabled>
                                                    <option value="">
                                                        --请选择--
                                                    </option>
                                                    <option value="1"
                                                            <c:if test="${userFuWu.workType==1}">selected</c:if> >
                                                        专职
                                                    </option>
                                                    <option value="2"
                                                            <c:if test="${userFuWu.workType==2}">selected</c:if>>
                                                        兼职
                                                    </option>
                                                    <option value="3"
                                                            <c:if test="${userFuWu.workType==3}">selected</c:if>>
                                                        时间银行志愿者
                                                    </option>
                                                    <option value="4"
                                                            <c:if test="${userFuWu.workType==4}">selected</c:if>>
                                                        其他类型志愿者
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <label class="col-md-2 control-label">服务星级
                                        </label>
                                        <div class="col-md-4">
                                            <input name="startLevel" type="text" class="form-control "
                                                   value="${userFuWu.startLevel}" disabled>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">志愿者
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <div class="radio-list">
                                                <label class="radio-inline">
                                                    <input type="radio" name="volFlag" value="是"
                                                           <c:if test="${userFuWu.volFlag=='是'}">checked</c:if>>是
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="volFlag" value="否"
                                                           <c:if test="${userFuWu.volFlag=='否'}">checked</c:if>>否
                                                </label>
                                            </div>
                                        </div>
                                        <label class="col-md-2 control-label"
                                        >是否有证书
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <div class="radio-list">
                                                <label class="radio-inline">
                                                    <input type="radio" name="certificate" value="1"
                                                           <c:if test="${userFuWu.certificate==1}">checked</c:if>>是
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="certificate" value="2"
                                                           <c:if test="${userFuWu.certificate==2}">checked</c:if>>否
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-1 control-label"
                                               style="padding-left: 0px;padding-top: 40px">证件照1
                                        </label>
                                        <div class="col-md-2">
                                            <input id="idPhotos1" type="hidden" value="${userFuWu.idPhotos}">
                                            <div id="attachList" class="file-box-list idPhotos"
                                                 style="display: inline-block;margin: 0px"></div>
                                            <div style="display: inline-block" class="file-box">
                                                <input type="file" name="idPhotos" id="idPhotos"
                                                       onchange="UploadFile('')"
                                                       style="opacity: 0;" disabled>
                                            </div>
                                        </div>
                                      <%--  <label class="col-md-1 control-label"
                                               style="padding-left: 0px;padding-top: 40px">证件照2
                                        </label>
                                        <div class="col-md-2">
                                            <div id="attachList2" class="file-box-list2 idPhotos2"
                                                 style="display: inline-block;margin: 0px"></div>
                                            <div style="display: inline-block" class="file-box">
                                                <input type="file" name="idPhotos2" id="idPhotos2"
                                                       onchange="UploadFile(2)"
                                                       style="opacity: 0;">
                                            </div>
                                        </div>
                                        <label class="col-md-1 control-label"
                                               style="padding-left: 0px;padding-top: 40px">证件照3
                                        </label>
                                        <div class="col-md-2">
                                            <div id="attachList3" class="file-box-list3 idPhotos3"
                                                 style="display: inline-block;margin: 0px"></div>
                                            <div style="display: inline-block" class="file-box">
                                                <input type="file" name="idPhotos3" id="idPhotos3"
                                                       onchange="UploadFile(3)"
                                                       style="opacity: 0;">
                                            </div>
                                        </div>
                                        <label class="col-md-1 control-label"
                                               style="padding-left: 0px;padding-top: 40px">证件照4
                                        </label>
                                        <div class="col-md-2">
                                            <div id="attachList4" class="file-box-list4 idPhotos4"
                                                 style="display: inline-block;margin: 0px"></div>
                                            <div style="display: inline-block" class="file-box">
                                                <input type="file" name="idPhotos4" id="idPhotos4"
                                                       onchange="UploadFile(4)"
                                                       style="opacity: 0;">
                                            </div>
                                        </div>--%>
                                    </div>
                                    <div class="form-actions">
                                        <div class="row">
                                            <shiro:hasPermission name="person-institution-manager-staffManager-update">
                                                <div class="col-md-offset-5" style="float: left">
                                                    <button id="btnPublish" type="button" class="btn btn-circle green"
                                                            data-loading-text="提交中..." name="btnPublish"
                                                            onclick="UserFuwuInfo.submitEditForm()" disabled>提交
                                                    </button>
                                                    <span id="labelmsg" class="label "></span>
                                                </div>
                                                <div class="col-md-offset-7">
                                                    <button onclick="window.parent.closeTab('user-fuwu-detail')"
                                                            class="btn btn-circle green"><i
                                                            class="fa">返回</i>
                                                    </button>
                                                </div>
                                            </shiro:hasPermission>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <%--selectServiceOrg--%>
        <div class="modal" id="selectServiceOrg" tabindex="-1" role="basic" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">选择组织</h4>
                    </div>
                    <div class="modal-body">
                        <div class="portlet">
                            <div class="portlet-body" style="padding-top: 0px !important;">
                                <form id="selectOrg-form" name="selectOrg-form">
                                    <table class="table table-bordered table-hover table-condensed table-responsive">
                                        <tr>
                                            <td colspan="2">
                                                <span class="caption-helper">基本信息</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:center;vertical-align:middle;">
                                                组织名称：
                                            </td>
                                            <td style="text-align:center;vertical-align:middle;">
                                                <input id="orgName" name="orgName" style=" width: 100%;"/>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                                <div class="right" style="text-align: right">
                                    <a class="table-group-action-submit btn btn-circle green"><i class="fa">查询</i></a>
                                    <a class="table-group-action-reload btn btn-circle green"><i
                                            class="fa">重置</i></a>
                                </div>
                            </div>

                        </div>
                        <div class="portlet" style="">
                            <div class="table-container">
                                <table class="table table-striped table-bordered table-hover"
                                       id="datatable_selectOrg_list">
                                    <thead>
                                    <tr role="row" class="heading">
                                        <th width="1%">
                                                <%-- <input type="radio" class="group-checkable">--%>
                                        </th>
                                        <th width="50%">
                                            所在区域
                                        </th>
                                        <th width="49%">
                                            组织名称
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
                        <button type="button" class="btn blue add" onclick="UserFuwuInfo.selectServiceOrg()">确定
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/userfuwu_info.js?v=1.3"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>
        <!--fileUpload-->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();

                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: 'yyyy-mm-dd'
                });

                UserFuwuInfo.init();
                if ("${userFuWu.serviceType}" != "") {
                    UserFuwuInfo.setServiceType("${userFuWu.serviceType}");
                }
                var idPhotos = $("#idPhotos1").val();
                if (idPhotos != null && idPhotos != "") {
                    var idPhoto = idPhotos.split(",");
                    var fileName = '';
                    for (var i = 0; i < idPhotos.split(",").length; i++) {
                        fileName = idPhoto[i].substr(idPhoto[i].lastIndexOf("\\") + 1, idPhoto[i].length);
                        var html = "";
                        if (!(/\.(jpe?g|gif|png|ico)$/i).test(fileName)) {
                            html = "<label style='margin: 0px;    vertical-align: top'>" + fileName + "<a data='" + idPhoto[i] + "' class='remove'>&times;</a></label>"
                        }
                        else {
                            var path = idPhoto[i].substr(0, idPhoto[i].lastIndexOf(".")) + "_77_77" + idPhoto[i].substr(idPhoto[i].lastIndexOf("."));
                            html = "<div class='file-div'><img src='" + window.apppath + path + "'><a data='" + idPhoto[i] + "' class=' remove removeImg'>&times;</a></div>"

                        }
                        $("#attachList").append(html);
                        $(".remove").click(function () {
                            $(this).parent().remove();
                        })
                    }
                }
            });

            function UploadFile(id) {
                var fileName = $("#idPhotos" + id).val();
                if (fileName == null || fileName == "")
                    return false;
                $.ajaxFileUpload({
                    url: window.apppath + "/admin/api/user/fuwu/upload?path=serviceUser&createThumbnail=true&thumbnailWidth=77&thumbnailHeight=77",
                    secureuri: false,
                    fileElementId: "idPhotos" + id,//file控件id
                    dataType: 'json',
                    success: function (data, status) {
                        if (data.error == 0) {
                            fileName = fileName.substr(fileName.lastIndexOf("\\") + 1, fileName.length - 1);
                            var html = "";
                            if (!(/\.(jpe?g|gif|png|ico)$/i).test(fileName)) {
                                html = "<label style='margin: 0px;    vertical-align: top'>" + fileName + "<a data='" + data.url + "' class='remove'>&times;</a></label>"
                            }
                            else {
                                var path = data.url.substr(0, data.url.lastIndexOf(".")) + "_77_77" + data.url.substr(data.url.lastIndexOf("."));
                                html = "<div class='file-div'><img src='" + window.apppath + path + "'><a data='" + data.url + "' class=' remove removeImg'>&times;</a></div>"

                            }
                            $("#attachList"+ id).append(html);
                            $(".remove").click(function () {
                                $(this).parent().remove();
                            })
                        }
                    }
                });
            }

        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

