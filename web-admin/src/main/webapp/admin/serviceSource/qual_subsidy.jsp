<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>补贴申请</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <style>

            .remove {
                color: red;
                font-size: 17px;
                cursor: pointer;
                text-decoration: none;
            }

            .removeImg {
                z-index: 2;
                width: 10px;
                height: 10px;
                position: absolute;
                right: 0px;
                background-image: url("${pageContext.request.contextPath }/assets/global/img/delete.png");
                background-position: 50% 50%;
            }

            .file-box {
                position: relative;
                width: 80px;
                height: 80px;
                border: 1px solid #D9D9D9;
                background-image: url("${pageContext.request.contextPath }/assets/admin/pages/img/add.png");
            }

            .file-div {
                width: 80px;
                height: 80px;
                margin-right: 10px;
                display: inline-block;
                position: relative;
                vertical-align: text-bottom;
            }

            .file-div img {
                width: 100%;
                height: 100%;
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
                vertical-align: top;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">
        <input type="hidden" value="njytfzh" id="login_name">
        <div class="row">
            <div class="col-md-12">
                <!-- Begin: life time stats -->
                <div class="portlet " style="padding-top: 0px !important;">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">
                               资格补贴
                            </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <table border="1"
                               class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                               align="center" style="border-collapse: collapse;">
                            <tr>
                                <td style="vertical-align:middle;text-align: center" colspan="6">
                                    资格补贴申请
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>申请组织名称
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <input type="text" class="form-control"
                                           name="institutionName" value="${sessionScope.login_user.serviceOrgName}"
                                           readonly>
                                    <input type="hidden" name="serviceOrgId" id="serviceOrgId"
                                           value="${sessionScope.login_user.serviceOrgId}">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>申报材料
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    资格证书复印件
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>上传
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <div class="file-box-list qualificationAttachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <div style="display: inline-block" class="file-box">
                                        <input type="file" name="files" id="qualificationAttachInput"
                                               onchange="UploadFile('qualificationAttachInput','qualificationAttach')"
                                               style="opacity: 0;">
                                        <input type="hidden" id="qualificationAttach" name="qualificationAttach"
                                               value="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>申报材料
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    当年健康证明复印件
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>上传
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <div class="file-box-list healthAttachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <div style="display: inline-block" class="file-box">
                                        <input type="file" name="files" id="healthAttachInput"
                                               onchange="UploadFile('healthAttachInput','healthAttach')"
                                               style="opacity: 0;">
                                        <input type="hidden" id="healthAttach" name="healthAttach"
                                               value="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>申报材料
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    身份证复印件
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>上传
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <div class="file-box-list idcardAttachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <div style="display: inline-block" class="file-box">
                                        <input type="file" name="files" id="idcardAttachInput"
                                               onchange="UploadFile('idcardAttachInput','idcardAttach')"
                                               style="opacity: 0;">
                                        <input type="hidden" id="idcardAttach" name="idcardAttach"
                                               value="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>申报材料
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    居住证复印件（外地户籍）
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>上传
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <div class="file-box-list liveAttachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <div style="display: inline-block" class="file-box">
                                        <input type="file" name="files" id="liveAttachInput"
                                               onchange="UploadFile('liveAttachInput','liveAttach')"
                                               style="opacity: 0;">
                                        <input type="hidden" id="liveAttach" name="liveAttach"
                                               value="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>申报材料
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    从业两年以上证明（由机构出具）及社保缴纳证明
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>上传
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <div class="file-box-list sbAttachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <div style="display: inline-block" class="file-box">
                                        <input type="file" name="files" id="sbAttachInput"
                                               onchange="UploadFile('sbAttachInput','sbAttach')"
                                               style="opacity: 0;">
                                        <input type="hidden" id="sbAttach" name="sbAttach"
                                               value="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>申报材料
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    养老服务人员资格补贴申请表
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>上传
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <div class="file-box-list applyAttachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <div style="display: inline-block" class="file-box">
                                        <input type="file" name="files" id="applyAttachInput"
                                               onchange="UploadFile('applyAttachInput','applyAttach')"
                                               style="opacity: 0;">
                                        <input type="hidden" id="applyAttach" name="applyAttach"
                                               value="">
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-offset-4" style="float: left">
                                    <button data-loading-text="提交中..." id="applyBtn"
                                            type="button" class="btn btn-circle green"
                                    >
                                        提交
                                    </button>
                                    <span id="labelmsg1" class="label"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"
                type="text/javascript"></script>

        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                $("#applyBtn").click(function () {
                    if(checkSave()){
                        $.post(window.apppath + "/admin/api/qualification/apply", {
                            serviceOrgId: $("#serviceOrgId").val(),
                            qualificationAttach: $("#qualificationAttach").val(),
                            healthAttach: $("#healthAttach").val(),
                            idcardAttach: $("#idcardAttach").val(),
                            liveAttach: $("#liveAttach").val(),
                            sbAttach: $("#sbAttach").val(),
                            applyAttach: $("#applyAttach").val(),
                        }, function (res) {
                            if (res.success) {
                                alert("申请成功", function () {
                                    window.location.reload();
                                })
                            } else {
                                alert(res.message);
                            }
                        }, 'json');
                    }
                })
            });
            /*=====================判空=======================*/
            function checkSave() {
                if($("#qualificationAttach").val() == null ||$("#qualificationAttach").val() == ""){
                    alert("请上传资格证书复印件");
                    return false;
                }
                if($("#healthAttach").val() == null || $("#healthAttach").val() == ""){
                    alert("请上传当年健康证明复印件");
                    return false;
                }
                if($("#idcardAttach").val() == null || $("#idcardAttach").val() == ""){
                    alert("请上传身份证复印件");
                    return false;
                }
                if($("#liveAttach").val() == null || $("#liveAttach").val() == ""){
                    alert("请上传居住证复印件（外地户籍）");
                    return false;
                }
                if($("#sbAttach").val() == null || $("#sbAttach").val() == ""){
                    alert("请上传从业两年以上证明（由机构出具）及社保缴纳证明");
                    return false;
                }
                if($("#applyAttach").val() == null || $("#applyAttach").val() == ""){
                    alert("请上传养老服务人员资格补贴申请表");
                    return false;
                }
                return true;
            }
            /*=====================文件上传 返回真实路径=======================*/
            function UploadFile(id, name) {
                var fileName = $("#" + id).val();
                if (fileName == null || fileName == "") {
                    return false;
                }
                if (!(/\.(jpe?g|gif|png|ico)$/i).test(fileName)) {
                    alert("请上传图片");
                    $("#" + id).val("");
                    return false;
                }
                $.ajaxFileUpload({
                    url: window.apppath + "/file/uploadFiles?path=attach&createThumbnail=true&thumbnailWidth=80&thumbnailHeight=80",
                    secureuri: false,
                    fileElementId: id,//file控件id
                    dataType: 'json',
                    success: function (data, status) {
                        if (data.error == 0) {
                            fileName = fileName.substr(fileName.lastIndexOf("\\") + 1, fileName.length - 1);
                            var html = "";
                            if (!(/\.(jpe?g|gif|png|ico)$/i).test(fileName)) {
                                html = "<label style='margin: 0px;    vertical-align: top'>" + fileName + "<a style='text-decoration: none' data='" + data.url + "' class='remove'>&times;</a></label>"
                            }
                            else {
                                var path = data.url.substr(0, data.url.lastIndexOf(".")) + "_80_80" + data.url.substr(data.url.lastIndexOf("."))
                                html = "<div class='file-div''><a target='_blank' href='" + window.apppath + data.url + "'><img class='uploadImg' src='" + window.apppath + path + "'></a><a style='text-decoration: none;display: none' data='" + data.url + "' class=' remove removeImg'></a></div>"
                            }
                            $("." + id + "").append(html);
                            $(".remove").click(function () {
                                var url = $(this).attr("data");
                                $(this).parent().remove();
                                var urls = $("input[name=" + name + "]").val();
                                urls = urls.replace(url + ",", "")
                                $("input[name=" + name + "]").val(urls);
                            });
                            $(".uploadImg").hover(function () {
                                $(this).parent().parent().find(".remove").css("display", "inherit");
                            })
                            $(".remove").hover(function () {
                            }, function () {
                                $(this).hide();
                            })
                            $("#" + id).val("");
                            $("input[name=" + name + "]").val($("input[name=" + name + "]").val() + data.url + ",");
                        }
                    }
                });
            }
            /*=================================================================================*/
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

