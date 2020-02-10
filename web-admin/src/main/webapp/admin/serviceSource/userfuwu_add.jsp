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
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>添加服务人员</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jquery-multi-select/css/multi-select.css?v=1.1"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
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
                    <a href="#">添加服务人员</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            添加<c:if test="${type==1}">管理员</c:if><c:if test="${type==2}">护理人员</c:if>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal form-bordered">
                            <form id="addForm">
                                <input type="hidden" name="adminFlag" value="${type}">
                                <!-- PERSONAL INFO TAB -->
                                <div class="form-body">
                                    <div class="form-group">
                                        <label class="col-md-2 control-label" id="area-zuzhi-label"
                                               style="padding-left: 0px">所在区域
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input name="areaName" type="text" class="form-control"
                                                   value="${user.areaName}" readonly>
                                        </div>
                                        <label class="col-md-2 control-label" style="padding-left: 0px">所在组织
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <c:if test="${user.serviceOrgId == null or user.serviceOrgId == ''}">
                                                <input type="hidden" name="serviceOrgId" class="form-control">
                                                <input type="text" class="form-control " id="serviceOrgName"
                                                       value=""
                                                       onclick="UserFuwuInfo.showSelectServiceOrgModel('add')"
                                                       name="serviceOrgName">
                                            </c:if>
                                            <c:if test="${user.serviceOrgId != null and user.serviceOrgId != ''}">
                                                <input type="hidden" name="serviceOrgId" class="form-control"
                                                       value="${user.serviceOrgId}">
                                                <input type="text" class="form-control " id="serviceOrgName"
                                                       name="serviceOrgName"
                                                       value="${user.serviceOrgName}" readonly>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label" style="padding-left: 0px">姓名
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input name="name" type="text" class="form-control "
                                                   value="">
                                        </div>
                                        <label class="col-md-2 control-label" style="padding-left: 0px">身份证号
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <div>
                                                <input name="idcardno" id="idcardno" type="text"
                                                       class="form-control "
                                                       onblur="UserFuwuInfo.validateIdCard();">
                                                <input type="hidden" value="" name="age" id="age">
                                                <input type="hidden" value="" name="gender" id="gender">
                                            </div>
                                            <div>
                                            <span class="required" style="color: red;"
                                                  id="errorIdCard"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label" style="padding-left: 0px">手机号码
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input name="mobile" type="text" class="form-control "
                                                   value="" id="mobile">
                                            <input type="text" name="identifyCode" id="identifyCode"
                                                   placeholder="验证码" style="width: 95px">
                                            <button id="sendCodeBtn" type="button" style="cursor: pointer;margin-top:10px" onclick="sendCode();">获取验证码
                                            </button>
                                    </div>
                                        <div>
                                            <span class="required" style="color: red;"
                                                  id="errorMobile"></span>
                                        </div>
                                        <label class="col-md-2 control-label" style="padding-left: 0px">QQ
                                        </label>
                                        <div class="col-md-4">
                                            <input name="QQ" type="text" class="form-control "
                                                   value="" id="QQ">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label" style="padding-left: 0px">户籍所在地
                                        </label>
                                        <div class="col-md-4">
                                            <input name="cityAddress" type="text" class="form-control "
                                                   value="">
                                        </div>
                                        <label class="col-md-2 control-label" style="padding-left: 0px">实际居住地
                                        </label>
                                        <div class="col-md-4">
                                            <input name="realAddress" type="text" class="form-control "
                                                   value="">
                                        </div>
                                    </div>
                                    <div class="form-group">

                                        <label class="col-md-2 control-label">入职时间
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input name="entryTime" type="text"
                                                   class="form-control  date-picker"
                                            >
                                        </div>
                                        <label class="col-md-2 control-label">社保时间
                                        </label>
                                        <div class="col-md-4">
                                            <input name="socialTime" type="text"
                                                   class="form-control  date-picker"
                                            >
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 control-label">证书时间
                                        </label>
                                        <div class="col-md-4">
                                            <input name="certificateTime" type="text"
                                                   class="form-control  date-picker"
                                            >
                                        </div>
                                        <label class="col-md-2 control-label">毕业时间
                                        </label>
                                        <div class="col-md-4">
                                            <input name="educationTime" type="text"
                                                   class="form-control  date-picker"
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
                                                   value="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">人员类型
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <select id="userType" name="userType" class="form-control">
                                                <option value="">
                                                    --请选择--
                                                </option>
                                                <option value="1">
                                                    养老护理员
                                                </option>
                                                <option value="2">
                                                    营养师
                                                </option>
                                                <option value="3">
                                                    心理学咨询师
                                                </option>
                                                <option value="4">
                                                    医生
                                                </option>
                                                <option value="5">
                                                    护士
                                                </option>
                                                <option value="6">
                                                    康复师
                                                </option>
                                                <option value="7">
                                                    管理人员
                                                </option>
                                                <option value="8">
                                                    服务人员
                                                </option>
                                                <option value="9">
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
                                                    <input type="radio" name="userLevel" value="1">初级 </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="userLevel" value="2">中极 </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="userLevel" value="3">高级 </label>
                                            </div>
                                        </div>
                                    </div>
                                    <c:if test="${type==2}">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label"
                                            >工作类型
                                                <span class="required">	* </span>
                                            </label>
                                            <div class="col-md-4">
                                                <div class="radio-list">
                                                    <select id="workType" name="workType" class="form-control">
                                                        <option value="">
                                                            --请选择--
                                                        </option>
                                                        <option value="1">
                                                            专职
                                                        </option>
                                                        <option value="2">
                                                            兼职
                                                        </option>
                                                        <option value="3">
                                                            时间银行志愿者
                                                        </option>
                                                        <option value="4">
                                                            其他类型志愿者
                                                        </option>
                                                    </select>
                                                </div>
                                            </div>
                                            <label class="col-md-2 control-label"
                                            >是否培训过
                                                <span class="required">	* </span>
                                            </label>
                                            <div class="col-md-4">
                                                <div class="radio-list">
                                                    <label class="radio-inline">
                                                        <input type="radio" name="train" value="1">是 </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="train" value="2">否 </label>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">志愿者
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <div class="radio-list">
                                                <label class="radio-inline">
                                                    <input type="radio" name="volFlag" value="是">是 </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="volFlag" value="否">否 </label>
                                            </div>
                                        </div>
                                        <label class="col-md-2 control-label"
                                        >是否有证书
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <div class="radio-list">
                                                <label class="radio-inline">
                                                    <input type="radio" name="certificate" value="1">是 </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="certificate" value="2">否 </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-1 control-label"
                                        >证件照1
                                        </label>
                                        <div class="col-md-2">
                                            <div id="attachList" class="file-box-list"
                                                 style="display: inline-block;margin: 0px"></div>
                                            <div style="display: inline-block" class="file-box">
                                                <input type="file" name="idPhotos" id="idPhotos"
                                                       onchange="UploadFile('idPhotos')"
                                                       style="opacity: 0;">
                                            </div>
                                        </div>
                                      <%--  <label class="col-md-1 control-label"
                                        >证件照2
                                        </label>
                                        <div class="col-md-2">
                                            <div id="attachList2" class="file-box-list"
                                                 style="display: inline-block;margin: 0px"></div>
                                            <div style="display: inline-block" class="file-box">
                                                <input type="file" name="idPhotos2" id="idPhotos2"
                                                       onchange="UploadFile2('idPhotos2')"
                                                       style="opacity: 0;">
                                            </div>
                                        </div>
                                        <label class="col-md-1 control-label"
                                        >证件照3
                                        </label>
                                        <div class="col-md-2">
                                            <div id="attachList3" class="file-box-list"
                                                 style="display: inline-block;margin: 0px"></div>
                                            <div style="display: inline-block" class="file-box">
                                                <input type="file" name="idPhotos3" id="idPhotos3"
                                                       onchange="UploadFile3('idPhotos3')"
                                                       style="opacity: 0;">
                                            </div>
                                        </div>
                                        <label class="col-md-1 control-label"
                                        >证件照4
                                        </label>
                                        <div class="col-md-2">
                                            <div id="attachList4" class="file-box-list"
                                                 style="display: inline-block;margin: 0px"></div>
                                            <div style="display: inline-block" class="file-box">
                                                <input type="file" name="idPhotos4" id="idPhotos4"
                                                       onchange="UploadFile4('idPhotos4')"
                                                       style="opacity: 0;">
                                            </div>
                                        </div>--%>
                                    </div>
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-5" style="float:left;">
                                                <button type="button" class="btn btn-circle blue"
                                                        data-loading-text="添加中..." onclick="UserFuwuInfo.submitForm();">
                                                    添加
                                                </button>
                                                <span id="labelmsg" class="label "></span>
                                            </div>
                                            <div class="col-md-offset-6">
                                                <button type="button" onclick="getback()"
                                                        class="btn btn-circle blue"><i
                                                        class="fa">返回</i>
                                                </button>
                                            </div>
                                            <%--<div class="col-md-offset-7">--%>
                                                <%--<button onclick="UserFuwuInfo.closeForm();"--%>
                                                        <%--class="btn btn-circle green"><i--%>
                                                        <%--class="fa">关闭</i>--%>
                                                <%--</button>--%>
                                            <%--</div>--%>
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
                                    <input type="hidden" id="serviceOrgType" name="serviceOrgType" value="${serviceOrgType}">
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
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>

        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>

        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>

        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>
        <!--fileUpload-->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>

        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/userfuwu_info.js?v=1.4"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                UserFuwuInfo.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: 'yyyy-mm-dd'
                });

                if ("${m.serviceType}" != "") {
                    UserFuwuInfo.setServiceType("${m.serviceType}");
                }
            });

            //11位数字，以1开头
            function isMoblie(str) {
                var reg = /^1\d{10}$/;
                return reg.test(str);
            }

            function randomString(len) {
                len = len || 32;
                var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';
                /****默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1****/
                var maxPos = $chars.length;
                var pwd = '';
                for (i = 0; i < len; i++) {
                    pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
                }
                return pwd;
            }

            function sendCode() {
                var mobile = $("#mobile").val();
                if (mobile == null || mobile == "") {
                    alert("请填写手机号码");
                    return false;
                }
                else if (mobile != null && mobile != "" && !isMoblie(mobile)) {
                    alert("请填写正确的手机号码");
                    return false;
                }
                var code = randomString(4);
                $.post(window.apppath + "/api/sendVerificationCode", {
                    phone: mobile,
                    num: code
                }, function (res) {
                    console.log(res);
                    if (res.success) {
                        document.cookie = "verificationCode=" + code;
                        $("#sendCodeBtn").attr("disabled", "disabled");
                        var n = 120;
                        var interval = setInterval(function () {
                            $("#sendCodeBtn").html(--n + "s");
                            if (n == 0) {
                                clearInterval(interval);
                                $("#sendCodeBtn").removeAttr("disabled");
                                $("#sendCodeBtn").html("获取验证码");
                            }
                        }, 1000)

                    } else {
                        alert(res.message);
                        return false;
                    }
                }, 'json');
            }

            function UploadFile(id) {
                var fileName = $("#" + id).val();
                if (fileName == null || fileName == "")
                    return false;
                $.ajaxFileUpload({
                    url: window.apppath + "/admin/api/user/fuwu/upload?path=serviceUser&createThumbnail=true&thumbnailWidth=77&thumbnailHeight=77",
                    secureuri: false,
                    fileElementId: "idPhotos",//file控件id
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
                            $("#attachList").append(html);
                            $(".remove").click(function () {
                                $(this).parent().remove();
                            })
                        }
                    }
                });
            }

            function getback() {
                window.location.href = window.apppath +"/admin/user/fuwu/list?serviceOrgType=1";
            }

            function UploadFile2(id) {
                var fileName = $("#" + id).val();
                if (fileName == null || fileName == "")
                    return false;
                $.ajaxFileUpload({
                    url: window.apppath + "/admin/api/user/fuwu/upload?path=serviceUser&createThumbnail=true&thumbnailWidth=77&thumbnailHeight=77",
                    secureuri: false,
                    fileElementId: "idPhotos2",//file控件id
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
                            $("#attachList2").append(html);
                            $(".remove").click(function () {
                                $(this).parent().remove();
                            })
                        }
                    }
                });
            }

            function UploadFile3(id) {
                var fileName = $("#" + id).val();
                if (fileName == null || fileName == "")
                    return false;
                $.ajaxFileUpload({
                    url: window.apppath + "/admin/api/user/fuwu/upload?path=serviceUser&createThumbnail=true&thumbnailWidth=77&thumbnailHeight=77",
                    secureuri: false,
                    fileElementId: "idPhotos3",//file控件id
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
                            $("#attachList3").append(html);
                            $(".remove").click(function () {
                                $(this).parent().remove();
                            })
                        }
                    }
                });
            }

            function UploadFile4(id) {
                var fileName = $("#" + id).val();
                if (fileName == null || fileName == "")
                    return false;
                $.ajaxFileUpload({
                    url: window.apppath + "/admin/api/user/fuwu/upload?path=serviceUser&createThumbnail=true&thumbnailWidth=77&thumbnailHeight=77",
                    secureuri: false,
                    fileElementId: "idPhotos4",//file控件id
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
                            $("#attachList4").append(html);
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

