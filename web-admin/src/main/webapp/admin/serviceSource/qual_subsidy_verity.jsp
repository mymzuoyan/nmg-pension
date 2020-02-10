<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>补贴申请审核</title>
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
                                   资格补贴审核
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>申请组织名称
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <input type="text" class="form-control"
                                           name="institutionName" value="${qualificationSubsidy.institutionName}"
                                           readonly>
                                    <input type="hidden" name="id" id="id"
                                           value="${qualificationSubsidy.id}">
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
                                    <div class="file-box-list attachInput"
                                         style="display: inline-block;margin: 0px">
                                    </div>
                                    <c:forEach items="${qualificationAttachs}" var="qualificationAttach"
                                               varStatus="i">
                                        <c:forEach items="${qualificationAttachthumbnails}"
                                                   var="qualificationAttachthumbnail" varStatus="j">
                                            <c:if test="${i.index == j.index}">
                                                <a href="${pageContext.request.contextPath}${qualificationAttach}"
                                                   target="_blank"><img
                                                        src="${pageContext.request.contextPath}${qualificationAttachthumbnail}"
                                                        style="padding-bottom: 10px"></a>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
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
                                    <div class="file-box-list xlAttachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <c:forEach items="${healthAttachs}" var="healthAttach"
                                               varStatus="i">
                                        <c:forEach items="${healthAttachthumbnails}"
                                                   var="healthAttachthumbnail" varStatus="j">
                                            <c:if test="${i.index == j.index}">
                                                <a href="${pageContext.request.contextPath}${healthAttach}"
                                                   target="_blank"><img
                                                        src="${pageContext.request.contextPath}${healthAttachthumbnail}"
                                                        style="padding-bottom: 10px"></a>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
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
                                    <div class="file-box-list ldhtAttachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <c:forEach items="${idcardAttachs}" var="idcardAttach"
                                               varStatus="i">
                                        <c:forEach items="${idcardAttachthumbnails}"
                                                   var="idcardAttachthumbnail" varStatus="j">
                                            <c:if test="${i.index == j.index}">
                                                <a href="${pageContext.request.contextPath}${idcardAttach}"
                                                   target="_blank"><img
                                                        src="${pageContext.request.contextPath}${idcardAttachthumbnail}"
                                                        style="padding-bottom: 10px"></a>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
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
                                    <div class="file-box-list sbAttachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <c:forEach items="${liveAttachs}" var="liveAttach"
                                               varStatus="i">
                                        <c:forEach items="${liveAttachthumbnails}"
                                                   var="liveAttachthumbnail" varStatus="j">
                                            <c:if test="${i.index == j.index}">
                                                <a href="${pageContext.request.contextPath}${liveAttach}"
                                                   target="_blank"><img
                                                        src="${pageContext.request.contextPath}${liveAttachthumbnail}"
                                                        style="padding-bottom: 10px"></a>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
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
                                    <div class="file-box-list gwzmAttachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <c:forEach items="${sbAttachs}" var="sbAttach"
                                               varStatus="i">
                                        <c:forEach items="${sbAttachthumbnails}"
                                                   var="sbAttachthumbnail" varStatus="j">
                                            <c:if test="${i.index == j.index}">
                                                <a href="${pageContext.request.contextPath}${sbAttach}"
                                                   target="_blank"><img
                                                        src="${pageContext.request.contextPath}${sbAttachthumbnail}"
                                                        style="padding-bottom: 10px"></a>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
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
                                    <div class="file-box-list zgzsAttachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <c:forEach items="${applyAttachs}" var="applyAttach"
                                               varStatus="i">
                                        <c:forEach items="${applyAttachthumbnails}"
                                                   var="applyAttachthumbnail" varStatus="j">
                                            <c:if test="${i.index == j.index}">
                                                <a href="${pageContext.request.contextPath}${applyAttach}"
                                                   target="_blank"><img
                                                        src="${pageContext.request.contextPath}${applyAttachthumbnail}"
                                                        style="padding-bottom: 10px"></a>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;">
                                    <font color="red">*</font>申请状态
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <lb:select name="status" id="status"  cssClass="form-control" value="${qualificationSubsidy.verityStatus}">
                                        <lb:option value=" ">--全部--</lb:option>
                                        <lb:option value="0">--未审核--</lb:option>
                                        <lb:option value="1">--审核通过--</lb:option>
                                        <lb:option value="2">--审核不通过--</lb:option>
                                    </lb:select>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;">
                                    <font color="red"></font>备注
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <input type="text" id="remark" name="remark" class="form-control" value="${qualificationSubsidy.remark}">
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
                        $.post(window.apppath + "/admin/api/qualification/verity", {
                            id: $("#id").val(),
                            verityStatus: $("#status").val(),
                            remark:$("#remark").val()
                        }, function (res) {
                            if (res.success) {
                                alert("审核成功", function () {
                                    window.parent.closeTab("tab_qual_subsidy");
                                    window.parent.updateTab("home-pro-qualifications-applyList");
                                    window.location.reload(true);
                                })
                            } else {
                                alert(res.message);
                            }
                        }, 'json');
                })
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

