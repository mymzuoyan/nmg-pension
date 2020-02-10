<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>居家养老服务组织评估</title>
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
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
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

        </style>
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
                    <a href="#">居家养老服务组织评估</a>
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
                    <span class="caption-subject font-red-sunglo bold uppercase">居家养老服务组织评估修改</span>
                </div>
            </div>
            <div class="portlet-body">
                <div class="form-horizontal">
                    <div class="form-body">
                        <div class="tab-content">
                            <!-- PERSONAL INFO TAB -->
                            <form id="orgAssessShowForm">
                                <input type="hidden" id="roleId" name="roleId" value="${roleId}">
                                <table border="1"
                                       class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                       align="center" style="border-collapse: collapse;">
                                    <tr>
                                        <td style="vertical-align:middle;text-align: center" colspan="6">组织信息
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%; vertical-align:middle;"><font
                                                color="red">*</font>评估组织名称
                                        </td>
                                        <td style="width: 90%; vertical-align:middle;" colspan="5">
                                            <input type="text" class="form-control"
                                                   name="institutionName" value="${orgAssess.institutionName}"
                                                   readonly>
                                            <input type="hidden" name="serviceOrgId" id="serviceOrgId"
                                                   value="${orgAssess.serviceOrgId}">
                                            <input type="hidden" name="id" id="id"
                                                   value="${orgAssess.id}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align:middle;"><font
                                                color="red">*</font>申报等级
                                        </td>
                                        <td style="text-align:center;vertical-align:middle;" colspan="5">
                                            <lb:select name="gradeDictId" cssClass="form-control"
                                                       value="${orgAssess.gradeDictId}" readOnly="true">
                                                <lb:option value=''>--全部--</lb:option>
                                                <lb:option value='0'>A级</lb:option>
                                                <lb:option value='1'>AA级</lb:option>
                                                <lb:option value='2'>AAA级</lb:option>
                                                <lb:option value='3'>AAAA级</lb:option>
                                                <lb:option value='4'>AAAAA级</lb:option>
                                            </lb:select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">评估资料</td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align:middle;text-align: center;width: 10%"><font
                                                color="red">*</font>总体要求
                                        </td>
                                        <td style="vertical-align:middle;width: 40%">
                                            <input type="hidden" name="generalRequirement"
                                                   value="${orgAssess.generalRequirement}">
                                            <form id="fileUpload1" name="fileUpload" action="" method="POST"
                                                  enctype="multipart/form-data" target="impResult">
                                                <table class="table-container">
                                                    <tr>
                                                        <td style="text-align:center;width: 80%">
                                                            <input type="file" id="generalRequirement"
                                                                   name="files" size="30" multiple
                                                                   style="padding-left: 5px"
                                                                   onchange="OrgAssessDetail.import('generalRequirement','msg1')"/>
                                                        </td>
                                                        <td width="20%">
                                                                <span id="msg1" class="label"
                                                                      style="display: none"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </form>
                                            <div class="generalRequirement"
                                                 style="padding-left: 5px;padding-top: 5px">
                                                <c:forEach items="${generalRequirements}" var="generalRequirement"
                                                           varStatus="i">
                                                    <c:forEach items="${generalRequirementthumbnails}"
                                                               var="generalRequirementthumbnail" varStatus="j">
                                                        <c:if test="${i.index == j.index}">
                                                            <div style="float: left"><a
                                                                    href="${pageContext.request.contextPath}${generalRequirement}"
                                                                    target="_blank"><img
                                                                    src="${pageContext.request.contextPath}${generalRequirementthumbnail}"
                                                                    style="width: 150px;height: 100px;float: left;">
                                                                <a data="${pageContext.request.contextPath}${generalRequirement}"
                                                                   class=" remove removeImg"
                                                                   style="position: initial;margin-left: -15px;">&times;</a>
                                                            </a></div>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </div>
                                        </td>
                                        <td style="vertical-align: middle;text-align: center;width: 5%">备注</td>
                                        <td style="vertical-align: middle;width: 20%">
                                            <input type="text" class="form-control" name="content1"
                                                   value="${orgAssess.content1}" readonly>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="vertical-align: middle;color: red;font-size: 15px">
                                            <p>
                                                将房产证、租赁合同或使用协议原件拍照或扫描上传至网站，要求公章清晰可见，可以看清建筑面积，图片格式为jpg或png，单张图片不大于1Mb。
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align:middle;text-align: center"><font
                                                color="red">*</font>资质条件
                                        </td>
                                        <td style="vertical-align:middle;">
                                            <input type="hidden" name="qualification"
                                                   value="${orgAssess.qualification}">
                                            <form id="fileUpload2" name="fileUpload" action="" method="POST"
                                                  enctype="multipart/form-data" target="impResult">
                                                <table class="table-container">
                                                    <tr>
                                                        <td style="text-align:center;width: 80%">
                                                            <input type="file" id="qualification"
                                                                   name="files" size="30" multiple
                                                                   style="padding-left: 5px"
                                                                   onchange="OrgAssessDetail.import('qualification','msg2')"/>
                                                        </td>
                                                        <td width="20%">
                                                                <span id="msg2" class="label"
                                                                      style="display: none"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </form>
                                            <div class="qualification"
                                                 style="padding-left: 5px;padding-top: 5px">
                                                <c:forEach items="${qualifications}" var="qualification"
                                                           varStatus="i">
                                                    <c:forEach items="${qualificationthumbnails}"
                                                               var="qualificationthumbnail" varStatus="j">
                                                        <c:if test="${i.index == j.index}">
                                                            <div style="float: left">
                                                                <a href="${pageContext.request.contextPath}${qualification}"
                                                                   target="_blank"><img
                                                                        src="${pageContext.request.contextPath}${qualificationthumbnail}"
                                                                        style="width: 150px;height: 100px;float: left;">
                                                                    <a data="${pageContext.request.contextPath}${qualification}"
                                                                       class=" remove removeImg"
                                                                       style="position: initial;margin-left: -15px;">&times;</a>
                                                                </a></div>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </div>
                                        </td>
                                        <td style="vertical-align: middle;text-align: center">备注</td>
                                        <td style="vertical-align: middle;text-align: center">
                                            <input type="text" class="form-control" name="content2" id="content2"
                                                   value="${orgAssess.content2}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="vertical-align: middle;color: red;font-size: 15px">
                                            <p>
                                                将注册证书原件拍照或扫描上传至网站，要求证书名字与民政部门登记名字相同，公章清晰可见，图片格式为jpg或png，单张图片不大于1Mb。
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align:middle;text-align: center"><font
                                                color="red">*</font>基本职能
                                        </td>
                                        <td style="vertical-align:middle;">
                                            <input type="hidden" name="basicFunction" value="${orgAssess.basicFunction}">
                                            <form id="fileUpload3" name="fileUpload" action="" method="POST"
                                                  enctype="multipart/form-data" target="impResult">
                                                <table class="table-container">
                                                    <tr>
                                                        <td style="text-align:center;width: 80%">
                                                            <input type="file" id="basicFunction"
                                                                   name="files" size="30" multiple
                                                                   style="padding-left: 5px"
                                                                   onchange="OrgAssessDetail.import('basicFunction','msg3')"/>
                                                        </td>
                                                        <td width="20%">
                                                                <span id="msg3" class="label"
                                                                      style="display: none"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </form>
                                            <div class="basicFunction"
                                                 style="padding-left: 5px;padding-top: 5px">
                                                <c:forEach items="${basicFunctions}" var="basicFunction"
                                                           varStatus="i">
                                                    <c:forEach items="${basicFunctionthumbnails}"
                                                               var="basicFunctionthumbnail" varStatus="j">
                                                        <c:if test="${i.index == j.index}">
                                                            <div style="float: left">
                                                                <a href="${pageContext.request.contextPath}${basicFunction}"
                                                                   target="_blank"><img
                                                                        src="${pageContext.request.contextPath}${basicFunctionthumbnail}"
                                                                        style="width: 150px;height: 100px;float: left;"></a>
                                                                <a data="${pageContext.request.contextPath}${basicFunction}"
                                                                   class=" remove removeImg"
                                                                   style="position: initial;margin-left: -15px;">&times;
                                                                </a>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </div>
                                        </td>
                                        <td style="vertical-align: middle;text-align: center">备注</td>
                                        <td style="vertical-align: middle;text-align: center">
                                            <input type="text" class="form-control" name="content3" id="content3"
                                                   value="${orgAssess.content3}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="vertical-align: middle;color: red;font-size: 15px">
                                            <p>
                                                现场照片要求图片格式为jpg或png，单张图片不大于200Kb。
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align:middle;text-align: center"><font
                                                color="red">*</font>服务项目
                                        </td>
                                        <td style="vertical-align:middle;">
                                            <input type="hidden" name="projectAndScale" value="${orgAssess.projectAndScale}">
                                            <form id="fileUpload4" name="fileUpload" action="" method="POST"
                                                  enctype="multipart/form-data" target="impResult">
                                                <table class="table-container">
                                                    <tr>
                                                        <td style="text-align:center;width: 80%">
                                                            <input type="file" id="projectAndScale"
                                                                   name="files" size="30" multiple
                                                                   style="padding-left: 5px"
                                                                   onchange="OrgAssessDetail.import('projectAndScale','msg4')"/>
                                                        </td>
                                                        <td width="20%">
                                                                <span id="msg4" class="label"
                                                                      style="display: none;"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </form>
                                            <div class="projectAndScale"
                                                 style="padding-left: 5px;padding-top: 5px">
                                                <c:forEach items="${projectAndScales}" var="projectAndScale"
                                                           varStatus="i">
                                                    <c:forEach items="${projectAndScalethumbnails}"
                                                               var="projectAndScalethumbnail" varStatus="j">
                                                        <c:if test="${i.index == j.index}">
                                                            <div style="float: left;">
                                                                <a href="${pageContext.request.contextPath}${projectAndScale}"
                                                                   target="_blank"><img
                                                                        src="${pageContext.request.contextPath}${projectAndScalethumbnail}"
                                                                        style="width: 150px;height: 100px;float: left;"></a>
                                                                <a data="${pageContext.request.contextPath}${projectAndScale}"
                                                                   class=" remove removeImg"
                                                                   style="position: initial;margin-left: -15px;">&times;
                                                                </a>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </div>
                                        </td>
                                        <td style="vertical-align: middle;text-align: center">备注</td>
                                        <td style="vertical-align: middle;text-align: center">
                                            <input type="text" class="form-control" name="content4" id="content4"
                                                   value="${orgAssess.content4}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="vertical-align: middle;color: red;font-size: 15px">
                                            <p>
                                                将本组织在刷卡系统上的服务统计截图上传至网站，要求截取全屏（能看见登录用户名），图片格式为jpg或png，单张图片不大于200Kb。
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align:middle;text-align: center"><font
                                                color="red">*</font>服务绩效
                                        </td>
                                        <td style="vertical-align:middle;">
                                            <input type="hidden" name="servicePerformance" value="${orgAssess.servicePerformance}">
                                            <form id="fileUpload9" name="fileUpload" action="" method="POST"
                                                  enctype="multipart/form-data" target="impResult">
                                                <table class="table-container">
                                                    <tr>
                                                        <td style="text-align:center;width: 80%">
                                                            <input type="file" id="servicePerformance"
                                                                   name="files" size="30" multiple
                                                                   style="padding-left: 5px"
                                                                   onchange="OrgAssessDetail.import('servicePerformance','msg9')"/>
                                                        </td>
                                                        <td width="20%">
                                                                <span id="msg9" class="label"
                                                                      style="display: none;"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </form>
                                            <div class="servicePerformance"
                                                 style="padding-left: 5px;padding-top: 5px">
                                                <c:forEach items="${servicePerformances}" var="servicePerformance"
                                                           varStatus="i">
                                                    <c:forEach items="${servicePerformancethumbnails}"
                                                               var="servicePerformancethumbnail" varStatus="j">
                                                        <c:if test="${i.index == j.index}">
                                                            <div style="float: left">
                                                                <a href="${pageContext.request.contextPath}${servicePerformance}"
                                                                   target="_blank"><img
                                                                        src="${pageContext.request.contextPath}${servicePerformancethumbnail}"
                                                                        style="width: 150px;height: 100px;float: left;"></a>
                                                                <a data="${pageContext.request.contextPath}${servicePerformance}"
                                                                   class=" remove removeImg"
                                                                   style="position: initial;margin-left: -15px;">&times;
                                                                </a>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </div>
                                        </td>
                                        <td style="vertical-align: middle;text-align: center">备注</td>
                                        <td style="vertical-align: middle;text-align: center">
                                            <input type="text" class="form-control" name="content9" id="content9"
                                                   value="${orgAssess.content9}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="vertical-align: middle;color: red;font-size: 15px">
                                            <p>
                                                将本组织在刷卡系统上的服务统计截图上传至网站，要求截取全屏（能看见登录用户名），图片格式为jpg或png，单张图片不大于200Kb。
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align:middle;text-align: center"><font
                                                color="red">*</font>安全保障
                                        </td>
                                        <td style="vertical-align:middle;">
                                            <input type="hidden" name="securityAssurance" value="${orgAssess.securityAssurance}">
                                            <form id="fileUpload5" name="fileUpload" action="" method="POST"
                                                  enctype="multipart/form-data" target="impResult">
                                                <table class="table-container">
                                                    <tr>
                                                        <td style="text-align:center;width: 80%">
                                                            <input type="file" id="securityAssurance"
                                                                   name="files" size="30" multiple
                                                                   style="padding-left: 5px"
                                                                   onchange="OrgAssessDetail.import('securityAssurance','msg5')"/>
                                                        </td>
                                                        <td width="20%">
                                                                <span id="msg5" class="label"
                                                                      style="display: none;"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </form>
                                            <div class="securityAssurance"
                                                 style="padding-left: 5px;padding-top: 5px">
                                                <c:forEach items="${securityAssurances}" var="securityAssurance"
                                                           varStatus="i">
                                                    <c:forEach items="${securityAssurancethumbnails}"
                                                               var="securityAssurancethumbnail" varStatus="j">
                                                        <c:if test="${i.index == j.index}">
                                                            <div style="float: left">
                                                                <a href="${pageContext.request.contextPath}${securityAssurance}"
                                                                   target="_blank"><img
                                                                        src="${pageContext.request.contextPath}${securityAssurancethumbnail}"
                                                                        style="width: 150px;height: 100px;float: left;"></a>
                                                                <a data="${pageContext.request.contextPath}${securityAssurance}"
                                                                   class=" remove removeImg"
                                                                   style="position: initial;margin-left: -15px;">&times;
                                                                </a>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </div>
                                        </td>
                                        <td style="vertical-align: middle;text-align: center">备注</td>
                                        <td style="vertical-align: middle;text-align: center">
                                            <input type="text" class="form-control" name="content5" id="content5"
                                                   value="${orgAssess.content5}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="vertical-align: middle;color: red;font-size: 15px">
                                            <p>
                                                将保单及安全制度、设施设备拍照或扫描上传至网站，要求图片格式为jpg或png，单张图片不大于200Kb。
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align:middle;text-align: center"><font
                                                color="red">*</font>基础设施
                                        </td>
                                        <td style="vertical-align:middle;">
                                            <input type="hidden" name="infrastructure" value="${orgAssess.infrastructure}">
                                            <form id="fileUpload6" name="fileUpload" action="" method="POST"
                                                  enctype="multipart/form-data" target="impResult">
                                                <table class="table-container">
                                                    <tr>
                                                        <td style="text-align:center;width: 80%">
                                                            <input type="file" id="infrastructure"
                                                                   name="files" size="30" multiple
                                                                   style="padding-left: 5px"
                                                                   onchange="OrgAssessDetail.import('infrastructure','msg6')"/>
                                                        </td>
                                                        <td width="20%">
                                                                <span id="msg6" class="label"
                                                                      style="display: none;"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </form>
                                            <div class="infrastructure"
                                                 style="padding-left: 5px;padding-top: 5px">
                                                <c:forEach items="${infrastructures}" var="infrastructure"
                                                           varStatus="i">
                                                    <c:forEach items="${infrastructurethumbnails}"
                                                               var="infrastructurethumbnail" varStatus="j">
                                                        <c:if test="${i.index == j.index}">
                                                            <div style="float: left">
                                                                <a href="${pageContext.request.contextPath}${infrastructure}"
                                                                   target="_blank"><img
                                                                        src="${pageContext.request.contextPath}${infrastructurethumbnail}"
                                                                        style="width: 150px;height: 100px;float: left;"></a>
                                                                <a data="${pageContext.request.contextPath}${infrastructure}"
                                                                   class=" remove removeImg"
                                                                   style="position: initial;margin-left: -15px;">&times;
                                                                </a>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </div>
                                        </td>
                                        <td style="vertical-align: middle;text-align: center">备注</td>
                                        <td style="vertical-align: middle;text-align: center">
                                            <input type="text" class="form-control" name="content6" id="content6"
                                                   value="${orgAssess.content6}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="vertical-align: middle;color: red;font-size: 15px">
                                            <p>
                                                将现场照片及消防验收合格意见书上传至网站，要求图片格式为jpg或png，单张图片不大于200Kb。
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align:middle;text-align: center"><font
                                                color="red">*</font>人员配备
                                        </td>
                                        <td style="vertical-align:middle;">
                                            <input type="hidden" name="personnelAllocation" value="${orgAssess.personnelAllocation}">
                                            <form id="fileUpload7" name="fileUpload" action="" method="POST"
                                                  enctype="multipart/form-data" target="impResult">
                                                <table class="table-container">
                                                    <tr>
                                                        <td style="text-align:center;width: 80%">
                                                            <input type="file" id="personnelAllocation"
                                                                   name="files" size="30" multiple
                                                                   style="padding-left: 5px"
                                                                   onchange="OrgAssessDetail.import('personnelAllocation','msg7')"/>
                                                        </td>
                                                        <td width="20%">
                                                                <span id="msg7" class="label"
                                                                      style="display: none;"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </form>
                                            <div class="personnelAllocation"
                                                 style="padding-left: 5px;padding-top: 5px">
                                                <c:forEach items="${personnelAllocations}" var="personnelAllocation"
                                                           varStatus="i">
                                                    <c:forEach items="${personnelAllocationthumbnails}"
                                                               var="personnelAllocationthumbnail" varStatus="j">
                                                        <c:if test="${i.index == j.index}">
                                                            <div style="float: left">
                                                                <a href="${pageContext.request.contextPath}${personnelAllocation}"
                                                                   target="_blank"><img
                                                                        src="${pageContext.request.contextPath}${personnelAllocationthumbnail}"
                                                                        style="width: 150px;height: 100px;float: left;"></a>
                                                                <a data="${pageContext.request.contextPath}${personnelAllocation}"
                                                                   class=" remove removeImg"
                                                                   style="position: initial;margin-left: -15px;">&times;
                                                                </a>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </div>
                                        </td>
                                        <td style="vertical-align: middle;text-align: center">备注</td>
                                        <td style="vertical-align: middle;text-align: center">
                                            <input type="text" class="form-control" name="content7" id="content7"
                                                   value="${orgAssess.content7}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="vertical-align: middle;color: red;font-size: 15px">
                                            <p>
                                                将专职人员的资质证书及社保流水扫描或拍照上传至网站，要求图片文字清晰可见，格式为jpg或png，单张图片不大于1Mb。
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align:middle;text-align: center"><font
                                                color="red">*</font>规章制度
                                        </td>
                                        <td style="vertical-align:middle;">
                                            <input type="hidden" name="regulatoryFramework" value="${orgAssess.regulatoryFramework}">
                                            <form id="fileUpload8" name="fileUpload" action="" method="POST"
                                                  enctype="multipart/form-data" target="impResult">
                                                <table class="table-container">
                                                    <tr>
                                                        <td style="text-align:center;width: 80%">
                                                            <input type="file" id="regulatoryFramework"
                                                                   name="files" size="30" multiple
                                                                   style="padding-left: 5px"
                                                                   onchange="OrgAssessDetail.import('regulatoryFramework','msg8')"/>
                                                        </td>
                                                        <td width="20%">
                                                                <span id="msg8" class="label"
                                                                      style="display: none;"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </form>
                                            <div class="regulatoryFramework"
                                                 style="padding-left: 5px;padding-top: 5px">
                                                <c:forEach items="${regulatoryFrameworks}" var="regulatoryFramework"
                                                           varStatus="i">
                                                    <c:forEach items="${regulatoryFrameworkthumbnails}"
                                                               var="regulatoryFrameworkthumbnail" varStatus="j">
                                                        <c:if test="${i.index == j.index}">
                                                            <div style="float: left">
                                                                <a href="${pageContext.request.contextPath}${regulatoryFramework}"
                                                                   target="_blank"><img
                                                                        src="${pageContext.request.contextPath}${regulatoryFrameworkthumbnail}"
                                                                        style="width: 150px;height: 100px;float: left;"></a>
                                                                <a data="${pageContext.request.contextPath}${regulatoryFramework}"
                                                                   class=" remove removeImg"
                                                                   style="position: initial;margin-left: -15px;">&times;
                                                                </a>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </div>
                                        </td>
                                        <td style="vertical-align: middle;text-align: center">备注</td>
                                        <td style="vertical-align: middle;text-align: center">
                                            <input type="text" class="form-control" name="content8" id="content8"
                                                   value="${orgAssess.content8}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="vertical-align: middle;color: red;font-size: 15px">
                                            <p>
                                                将相关规章制度拍照或扫描上传至网站，要求图片格式为jpg或png，单张图片不大于1Mb。
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align:middle;text-align: center"><font
                                                color="red">*</font>监督管理
                                        </td>
                                        <td style="vertical-align:middle;">
                                            <input type="hidden" name="supervision" value="${orgAssess.supervision}">
                                            <form id="fileUpload10" name="fileUpload" action="" method="POST"
                                                  enctype="multipart/form-data" target="impResult">
                                                <table class="table-container">
                                                    <tr>
                                                        <td style="text-align:center;width: 80%">
                                                            <input type="file" id="supervision"
                                                                   name="files" size="30" multiple
                                                                   style="padding-left: 5px"
                                                                   onchange="OrgAssessDetail.import('supervision','msg8')"/>
                                                        </td>
                                                        <td width="20%">
                                                                <span id="msg10" class="label"
                                                                      style="display: none;"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </form>
                                            <div class="supervision"
                                                 style="padding-left: 5px;padding-top: 5px">
                                                <c:forEach items="${supervisions}" var="supervision"
                                                           varStatus="i">
                                                    <c:forEach items="${supervisionthumbnails}"
                                                               var="supervisionthumbnail" varStatus="j">
                                                        <c:if test="${i.index == j.index}">
                                                            <div style="float: left">
                                                                <a href="${pageContext.request.contextPath}${supervision}"
                                                                   target="_blank"><img
                                                                        src="${pageContext.request.contextPath}${supervisionthumbnail}"
                                                                        style="width: 150px;height: 100px;float: left;"></a>
                                                                <a data="${pageContext.request.contextPath}${supervision}"
                                                                   class=" remove removeImg"
                                                                   style="position: initial;margin-left: -15px;">&times;
                                                                </a>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </div>
                                        </td>
                                        <td style="vertical-align: middle;text-align: center">备注</td>
                                        <td style="vertical-align: middle;text-align: center">
                                            <input type="text" class="form-control" name="content10" id="content10"
                                                   value="${orgAssess.content10}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="vertical-align: middle;color: red;font-size: 15px">
                                            <p>
                                                上传视频摄像头设备照片
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-offset-8" style="float: left">
                                            <button data-loading-text="提交中..."
                                                    type="button" class="btn btn-circle green"
                                                    onclick="OrgAssessDetail.OrgEdit()">
                                                提交
                                            </button>
                                            <span id="labelmsg1" class="label"></span>
                                        </div>
                                        <div class="col-md-offset-11">
                                            <button onclick="window.history.back(-1)"
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

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>

        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <!--fileUpload-->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/uploadPreview.js"
                type="text/javascript"></script>

        <!--timer-->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/orgAssess_detail.js?v=1.9"
                type="text/javascript"></script>
        <script>
            jQuery(document).ready(function () {
                window.apppath = '${pageContext.request.contextPath }';
                Metronic.init();
                Layout.init();
                $("#orgAssessShowForm").find("input[type=text]").prop("readonly", false);
                $("#orgAssessShowForm").find("input[name=institutionName]").prop("readonly", true);
                OrgAssessDetail.init();
                OrgAssessDetail.editInit();

                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });

                $(".table-group-action-import").click(function () {
                    $('#impModal').modal({
                        keyboard: true
                    });
                });

            });

        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>


