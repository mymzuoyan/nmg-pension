<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>建档内容</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/viewer/viewer.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/view/css/alertStyle.css"/>
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

        <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
        <div class="modal fade" id="areaModal" tabindex="-1"
             role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal"
                                aria-hidden="true"></button>
                        <h4 class="modal-title"
                            id="myModalLabel">请选择所属区域</h4>
                    </div>
                    <div class="modal-body">
                        <div id="areaTree"
                             class="tree-demo"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn blue"
                                onclick="ServiceOrgDetail.getAreaName()">
                            确定
                        </button>
                        <button type="button"
                                class="btn default"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        <div class="row">
            <div class="col-md-12">
                <!-- Begin: life time stats -->
                <div class="portlet " style="padding-top: 0px !important;">
                    <div class="portlet-title">
                        <div class="caption tabbable-line" style="padding: 0px">
                            <ul class="nav nav-tabs">
                                <li>
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/serviceOrgDetail/${id}'"
                                       data-toggle="tab" aria-expanded="false">养老组织信息</a>
                                </li>
                                <li class="active">
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/serviceOrg/putOnRecord/${id}'"
                                       data-toggle="tab" aria-expanded="true">建档内容</a>
                                </li>
                                <li class="">
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/serviceOrgDetailMap/${id}'"
                                       data-toggle="tab" aria-expanded="true">养老组织定位
                                    </a>
                                </li>
                                <li class="">
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/serviceOrg/price/${m.id}'"
                                       data-toggle="tab" aria-expanded="true">服务项目价格体系</a>
                                </li>
                            </ul>
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">
                               建档内容
                            </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <table border="1"
                               class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                               align="center" style="border-collapse: collapse;">
                            <tr>
                                <td style="vertical-align:middle;text-align: center" colspan="6">
                                    建档档案材料
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>建档机构名称
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <input type="text" class="form-control"
                                           name="institutionName" value="${m.institutionName}"
                                           readonly>
                                    <input type="hidden" name="serviceOrgId" id="serviceOrgId"
                                           value="${m.id}">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>档案材料
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    内蒙古市社区居家养老服务设施基本信息表
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>上传
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <input id="homeBase" name="homeBase" type="hidden" class="form-control"
                                           value="${s.homeBaseAttach}">
                                    <c:forEach items="${homeBaseAttachs}" var="homeBase"
                                               varStatus="i">
                                        <c:forEach items="${homeBaseAttachthumbnails}"
                                                   var="homeBaseAttachthumbnail" varStatus="j">
                                            <c:if test="${i.index == j.index}">
                                                <div class="file-div">
                                                    <img class="viewer"
                                                         data-original="${pageContext.request.contextPath}${homeBase}"
                                                         src="${pageContext.request.contextPath}${homeBaseAttachthumbnail}"
                                                         style="padding-bottom: 10px">
                                                    <a style="text-decoration: none; display: inherit;top: 1px"
                                                       data="${homeBase}"
                                                       class="removeImg" name="homeBase"></a>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                    <div class="file-box-list homeBaseAttachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <div style="display: inline-block" class="file-box">
                                        <input type="file" name="files" id="homeBaseAttachInput"
                                               onchange="UploadFile('homeBaseAttachInput','homeBaseAttach')"
                                               style="opacity: 0;">
                                        <input type="hidden" id="homeBaseAttach" name="homeBaseAttach"
                                               value="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>档案材料
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    企业法人营业执照或民办非企业单位登记证书复印件
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>上传
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <input id="qiYe" name="qiYe" type="hidden" class="form-control"
                                           value="${s.qiYeAttach}">
                                    <c:forEach items="${qiYeAttachs}" var="qiYe"
                                               varStatus="i">
                                        <c:forEach items="${qiYeAttachthumbnails}"
                                                   var="qiYeAttachthumbnail" varStatus="j">
                                            <c:if test="${i.index == j.index}">
                                                <div class="file-div">
                                                    <img class="viewer"
                                                         data-original="${pageContext.request.contextPath}${qiYe}"
                                                         src="${pageContext.request.contextPath}${qiYeAttachthumbnail}"
                                                         style="padding-bottom: 10px">
                                                    <a style="text-decoration: none; display: inherit;top: 1px"
                                                       data="${qiYe}"
                                                       class="removeImg" name="qiYe"></a>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                    <div class="file-box-list qiYeAttachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <div style="display: inline-block" class="file-box">
                                        <input type="file" name="files" id="qiYeAttachInput"
                                               onchange="UploadFile('qiYeAttachInput','qiYeAttach')"
                                               style="opacity: 0;">
                                        <input type="hidden" id="qiYeAttach" name="qiYeAttach"
                                               value="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>档案材料
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    房产证明复印件
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>上传
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <input id="fangChan" name="fangChan" type="hidden" class="form-control"
                                           value="${s.fangChanAttach}">
                                    <c:forEach items="${fangChanAttachs}" var="fangChan"
                                               varStatus="i">
                                        <c:forEach items="${fangChanAttachthumbnails}"
                                                   var="fangChanAttachthumbnail" varStatus="j">
                                            <c:if test="${i.index == j.index}">
                                                <div class="file-div">
                                                    <img class="viewer"
                                                         data-original="${pageContext.request.contextPath}${fangChan}"
                                                         src="${pageContext.request.contextPath}${fangChanAttachthumbnail}"
                                                         style="padding-bottom: 10px">
                                                    <a style="text-decoration: none; display: inherit;top: 1px"
                                                       data="${fangChan}"
                                                       class="removeImg" name="fangChan"></a>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                    <div class="file-box-list fangChanAttachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <div style="display: inline-block" class="file-box">
                                        <input type="file" name="files" id="fangChanAttachInput"
                                               onchange="UploadFile('fangChanAttachInput','fangChanAttach')"
                                               style="opacity: 0;">
                                        <input type="hidden" id="fangChanAttach" name="fangChanAttach"
                                               value="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>档案材料
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    由政府无偿提供房产的，需有区、县（市）民政局或街道办事处与运营方签署的双方协议复印件
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>上传
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <input id="zF" name="zF" type="hidden" class="form-control"
                                           value="${s.zFAttach}">
                                    <c:forEach items="${zFAttachs}" var="zF"
                                               varStatus="i">
                                        <c:forEach items="${zFAttachthumbnails}"
                                                   var="zFAttachthumbnail" varStatus="j">
                                            <c:if test="${i.index == j.index}">
                                                <div class="file-div">
                                                    <img class="viewer"
                                                         data-original="${pageContext.request.contextPath}${zF}"
                                                         src="${pageContext.request.contextPath}${zFAttachthumbnail}"
                                                         style="padding-bottom: 10px">
                                                    <a style="text-decoration: none; display: inherit;top: 1px"
                                                       data="${zF}"
                                                       class="removeImg" name="zF"></a>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                    <div class="file-box-list zFAttachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <div style="display: inline-block" class="file-box">
                                        <input type="file" name="files" id="zFAttachInput"
                                               onchange="UploadFile('zFAttachInput','zFAttach')"
                                               style="opacity: 0;">
                                        <input type="hidden" id="zFAttach" name="zFAttach"
                                               value="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>档案材料
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    消防安全相关资料
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>上传
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <input id="xF" name="xF" type="hidden" class="form-control"
                                           value="${s.xFAttach}">
                                    <c:forEach items="${xFAttachs}" var="xF"
                                               varStatus="i">
                                        <c:forEach items="${xFAttachthumbnails}"
                                                   var="xFAttachthumbnail" varStatus="j">
                                            <c:if test="${i.index == j.index}">
                                                <div class="file-div">
                                                    <img class="viewer"
                                                         data-original="${pageContext.request.contextPath}${xF}"
                                                         src="${pageContext.request.contextPath}${xFAttachthumbnail}"
                                                         style="padding-bottom: 10px">
                                                    <a style="text-decoration: none; display: inherit;top: 1px"
                                                       data="${xF}"
                                                       class="removeImg" name="xF"></a>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                    <div class="file-box-list xFAttachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <div style="display: inline-block" class="file-box">
                                        <input type="file" name="files" id="xFAttachInput"
                                               onchange="UploadFile('xFAttachInput','xFAttach')"
                                               style="opacity: 0;">
                                        <input type="hidden" id="xFAttach" name="xFAttach"
                                               value="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>档案材料
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    社区居家养老服务设施平面图
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>上传
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <input id="sQ" name="sQ" type="hidden" class="form-control"
                                           value="${s.sQAttach}">
                                    <c:forEach items="${sQAttachs}" var="sQ"
                                               varStatus="i">
                                        <c:forEach items="${sQAttachthumbnails}"
                                                   var="sQAttachthumbnail" varStatus="j">
                                            <c:if test="${i.index == j.index}">
                                                <div class="file-div">
                                                    <img class="viewer"
                                                         data-original="${pageContext.request.contextPath}${sQ}"
                                                         src="${pageContext.request.contextPath}${sQAttachthumbnail}"
                                                         style="padding-bottom: 10px">
                                                    <a style="text-decoration: none; display: inherit;top: 1px"
                                                       data="${sQ}"
                                                       class="removeImg" name="sQ"></a>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                    <div class="file-box-list sQAttachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <div style="display: inline-block" class="file-box">
                                        <input type="file" name="files" id="sQAttachInput"
                                               onchange="UploadFile('sQAttachInput','sQAttach')"
                                               style="opacity: 0;">
                                        <input type="hidden" id="sQAttach" name="sQAttach"
                                               value="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>档案材料
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    设置医疗卫生机构的，需有医疗机构执业许可证复印件
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>上传
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <input id="wS" name="wS" type="hidden" class="form-control"
                                           value="${s.wSAttach}">
                                    <c:forEach items="${wSAttachs}" var="wS"
                                               varStatus="i">
                                        <c:forEach items="${wSAttachthumbnails}"
                                                   var="wSAttachthumbnail" varStatus="j">
                                            <c:if test="${i.index == j.index}">
                                                <div class="file-div">
                                                    <img class="viewer"
                                                         data-original="${pageContext.request.contextPath}${wS}"
                                                         src="${pageContext.request.contextPath}${wSAttachthumbnail}"
                                                         style="padding-bottom: 10px">
                                                    <a style="text-decoration: none; display: inherit;top: 1px"
                                                       data="${wS}"
                                                       class="removeImg" name="wS"></a>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                    <div class="file-box-list wSAttachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <div style="display: inline-block" class="file-box">
                                        <input type="file" name="files" id="wSAttachInput"
                                               onchange="UploadFile('wSAttachInput','wSAttach')"
                                               style="opacity: 0;">
                                        <input type="hidden" id="wSAttach" name="wSAttach"
                                               value="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>档案材料
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    人员的健康证复印件
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>上传
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <input id="people" name="people" type="hidden" class="form-control"
                                           value="${s.peopleAttach}">
                                    <c:forEach items="${peopleAttachs}" var="people"
                                               varStatus="i">
                                        <c:forEach items="${peopleAttachthumbnails}"
                                                   var="peopleAttachthumbnail" varStatus="j">
                                            <c:if test="${i.index == j.index}">
                                                <div class="file-div">
                                                    <img class="viewer"
                                                         data-original="${pageContext.request.contextPath}${people}"
                                                         src="${pageContext.request.contextPath}${peopleAttachthumbnail}"
                                                         style="padding-bottom: 10px">
                                                    <a style="text-decoration: none; display: inherit;top: 1px"
                                                       data="${people}"
                                                       class="removeImg" name="people"></a>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                    <div class="file-box-list peopleAttachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <div style="display: inline-block" class="file-box">
                                        <input type="file" name="files" id="peopleAttachInput"
                                               onchange="UploadFile('peopleAttachInput','peopleAttach')"
                                               style="opacity: 0;">
                                        <input type="hidden" id="peopleAttach" name="peopleAttach"
                                               value="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>档案材料
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    服务记录台账复印件
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>上传
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <input id="fw" name="fw" type="hidden" class="form-control"
                                           value="${s.fwAttach}">
                                    <c:forEach items="${fwAttachs}" var="fw"
                                               varStatus="i">
                                        <c:forEach items="${fwAttachthumbnails}"
                                                   var="fwAttachthumbnail" varStatus="j">
                                            <c:if test="${i.index == j.index}">
                                                <div class="file-div">
                                                    <img class="viewer"
                                                         data-original="${pageContext.request.contextPath}${fw}"
                                                         src="${pageContext.request.contextPath}${fwAttachthumbnail}"
                                                         style="padding-bottom: 10px">
                                                    <a style="text-decoration: none; display: inherit;top: 1px"
                                                       data="${fw}"
                                                       class="removeImg" name="fw"></a>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                    <div class="file-box-list fwAttachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <div style="display: inline-block" class="file-box">
                                        <input type="file" name="files" id="fwAttachInput"
                                               onchange="UploadFile('fwAttachInput','fwAttach')"
                                               style="opacity: 0;">
                                        <input type="hidden" id="fwAttach" name="fwAttach"
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
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/viewer/viewer.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/viewer/jquery-viewer.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();

                $(".removeImg").on("click", function () {
                    var url = $(this).attr("data");
                    $(this).parent().remove();
                    var name = $(this).attr("name");
                    var urls = $("#" + name).val();
                    urls = urls.replace(url, "");
                    $("#" + name).val(urls);
                    console.log(name);
                    $("#" + name + "Div").css("display", "inline-block");
                });

                $(".viewer").viewer({url: 'data-original'});
                $("#applyBtn").click(function () {
                    if(checkSave()){
                        $.post(window.apppath + "/admin/api/serviceOrgRecord/apply", {
                            serviceOrgId: $("#serviceOrgId").val(),
                            homeBaseAttach: $("#homeBaseAttach").val()+$("#homeBase").val(),
                            qiYeAttach: $("#qiYeAttach").val()+$("#qiYe").val(),
                            fangChanAttach: $("#fangChanAttach").val()+$("#fangChan").val(),
                            zFAttach: $("#zFAttach").val()+$("#zF").val(),
                            xFAttach: $("#xFAttach").val()+$("#xF").val(),
                            sQAttach: $("#sQAttach").val()+$("#sQ").val(),
                            wSAttach: $("#wSAttach").val()+$("#wS").val(),
                            peopleAttach: $("#peopleAttach").val()+$("#people").val(),
                            fwAttach: $("#fwAttach").val()+$("#fw").val()
                        }, function (res) {
                            if (res.success) {
                                alert("建档成功", function () {
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
                if($("#homeBaseAttach").val() + $("#homeBase").val() == null ||$("#homeBaseAttach").val() + $("#homeBase").val() == ""){
                    alert("请上传内蒙古市社区居家养老服务设施基本信息表");
                    return false;
                }
                if($("#qiYe").val() + $("#qiYeAttach").val() == null || $("#qiYe").val() + $("#qiYeAttach").val() == ""){
                    alert("请上传企业法人营业执照或民办非企业单位登记证书复印件");
                    return false;
                }
                if($("#fangChan").val() + $("#fangChanAttach").val() == null || $("#fangChan").val() + $("#fangChanAttach").val() == ""){
                    alert("请上传房产证明复印件");
                    return false;
                }
                if($("#zF").val() + $("#zFAttach").val() == null || $("#zF").val() + $("#zFAttach").val() == ""){
                    alert("请上传由政府无偿提供房产的，需有区、县（市）民政局或街道办事处与运营方签署的双方协议复印件");
                    return false;
                }
                if($("#xF").val() + $("#xFAttach").val() == null || $("#xF").val() + $("#xFAttach").val() == ""){
                    alert("请上传消防安全相关资料");
                    return false;
                }
                if($("#sQ").val() + $("#sqAttach").val() == null || $("#sQ").val() + $("#sqAttach").val() == ""){
                    alert("请上传社区居家养老服务设施平面图");
                    return false;
                }
                if($("#wS").val() + $("#wSAttach").val() == null || $("#wS").val() + $("#wSAttach").val() == ""){
                    alert("请上传设置医疗卫生机构的，需有医疗机构执业许可证复印件");
                    return false;
                }
                if($("#people").val() + $("#peopleAttach").val() == null || $("#people").val() + $("#peopleAttach").val() == ""){
                    alert("请上传人员的健康证复印件");
                    return false;
                }
                if($("#fw").val() + $("#fwAttach").val() == null || $("#fw").val() + $("#fwAttach").val() == ""){
                    alert("请上传服务记录台账复印件");
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
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>


