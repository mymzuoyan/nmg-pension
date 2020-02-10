<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>居家养老服务组织评估</title>
        <c:choose>
            <c:when test="${method=='edit'}">
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
                    <c:choose>
                        <c:when test="${method=='edit'}">
                            <span class="caption-subject font-red-sunglo bold uppercase">居家养老服务组织评估预览</span>
                        </c:when>
                        <c:when test="${method=='add'}">
                            <span class="caption-subject font-red-sunglo bold uppercase">居家养老服务组织评估申请</span>
                        </c:when>
                    </c:choose>
                </div>
                <div class="tools">
                    <c:if test="${orgAssess.gradeDictId>=2}">
                        <c:if test="${roleId == 4 and orgAssess.standard == 2}">
                            <div style="float: right;margin-right: 15px;margin-top: 5px;margin-bottom: 5px;">
                                <div style="width:80px;float:left;display: block;padding-right: 10px;">
                                    <a class="btn btn-circle green"
                                       href="${pageContext.request.contextPath}/admin/orgAssess/edit/${orgAssess.id}"><i
                                            class="fa">修改</i></a>
                                </div>
                            </div>
                        </c:if>
                    </c:if>
                    <c:if test="${orgAssess.gradeDictId<2}">
                        <c:if test="${roleId == 4 and orgAssess.qustandard == 2}">
                            <div style="float: right;margin-right: 15px;margin-top: 5px;margin-bottom: 5px;">
                                <div style="width:80px;float:left;display: block;padding-right: 10px;">
                                    <a class="btn btn-circle green"
                                       href="${pageContext.request.contextPath}/admin/orgAssess/edit/${orgAssess.id}"><i
                                            class="fa">修改</i></a>
                                </div>
                            </div>
                        </c:if>
                    </c:if>
                </div>
            </div>
            <div class="portlet-body">
                <div class="form-horizontal">
                    <div class="form-body">
                        <div class="tab-content">
                            <!-- PERSONAL INFO TAB -->
                            <div class="tab-pane ${title1}" id="tab_details">
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
                                                    <input type="hidden" name="serviceOrgId"
                                                           value="${orgAssess.serviceOrgId}">
                                                    <input type="hidden" name="id"
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
                                                    <c:forEach items="${generalRequirements}" var="generalRequirement"
                                                               varStatus="i">
                                                        <c:forEach items="${generalRequirementthumbnails}"
                                                                   var="generalRequirementthumbnail" varStatus="j">
                                                            <c:if test="${i.index == j.index}">
                                                                <a href="${pageContext.request.contextPath}${generalRequirement}"
                                                                   target="_blank"><img
                                                                        src="${pageContext.request.contextPath}${generalRequirementthumbnail}"
                                                                        style="padding-bottom: 10px"></a>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:forEach>
                                                </td>
                                                <td style="vertical-align: middle;text-align: center;width: 5%">备注</td>
                                                <td style="vertical-align: middle;width: 20%">
                                                    <textarea type="text" class="form-control" readonly>${orgAssess.content1}</textarea>
                                                </td>
                                                <td style="vertical-align: middle;text-align: center;width: 10%"><font
                                                        color="red">*</font>评定结果
                                                </td>
                                                <td style="vertical-align: middle;text-align: center;width: 20%">
                                                    <c:if test="${roleId != 4}">
                                                        <div class="radio-list" style="padding-left: 10px">
                                                            <label class="radio-inline">
                                                                <input type="radio" value="1" name="standard1"
                                                                       <c:if test="${orgAssess.standard1 eq 1}">checked</c:if>
                                                                >合格
                                                            </label>
                                                            <label class="radio-inline">
                                                                <input type="radio" value="0" name="standard1"
                                                                       <c:if test="${orgAssess.standard1 eq 0}">checked</c:if>
                                                                >不合格
                                                            </label>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${roleId == 4}">
                                                        <input type="text" class="form-control" readonly
                                                               <c:if test="${orgAssess.standard1 eq 1}">value="合格"</c:if>
                                                               <c:if test="${orgAssess.standard1 eq 0}">value="不合格"</c:if>
                                                               <c:if test="${orgAssess.standard1 eq 2}">value="未评定"</c:if>
                                                        >
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:middle;text-align: center"><font
                                                        color="red">*</font>资质条件
                                                </td>
                                                <td style="vertical-align:middle;">
                                                    <c:forEach items="${qualifications}" var="qualification"
                                                               varStatus="i">
                                                        <c:forEach items="${qualificationthumbnails}"
                                                                   var="qualificationthumbnail" varStatus="j">
                                                            <c:if test="${i.index == j.index}">
                                                                <a href="${pageContext.request.contextPath}${qualification}"
                                                                   target="_blank"><img
                                                                        src="${pageContext.request.contextPath}${qualificationthumbnail}"
                                                                        style="padding-bottom: 10px"></a>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:forEach>
                                                </td>
                                                <td style="vertical-align: middle;text-align: center">备注</td>
                                                <td style="vertical-align: middle">
                                                    <textarea type="text" class="form-control" readonly>${orgAssess.content2}</textarea>

                                                </td>
                                                <td style="vertical-align: middle;text-align: center"><font
                                                        color="red">*</font>评定结果
                                                </td>
                                                <td style="vertical-align: middle;text-align: center">
                                                    <c:if test="${roleId != 4}">
                                                        <div class="radio-list" style="padding-left: 10px">
                                                            <label class="radio-inline">
                                                                <input type="radio" value="1" name="standard2"
                                                                       <c:if test="${orgAssess.standard2 eq 1}">checked</c:if>
                                                                >合格
                                                            </label>
                                                            <label class="radio-inline">
                                                                <input type="radio" value="0" name="standard2"
                                                                       <c:if test="${orgAssess.standard2 eq 0}">checked</c:if>
                                                                >不合格
                                                            </label>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${roleId == 4}">
                                                        <input type="text" class="form-control" readonly
                                                               <c:if test="${orgAssess.standard2 eq 1}">value="合格"</c:if>
                                                               <c:if test="${orgAssess.standard2 eq 0}">value="不合格"</c:if>
                                                               <c:if test="${orgAssess.standard2 eq 2}">value="未评定"</c:if>
                                                        >
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:middle;text-align: center"><font
                                                        color="red">*</font>基本职能
                                                </td>
                                                <td style="vertical-align:middle;">
                                                    <c:forEach items="${basicFunctions}" var="basicFunction"
                                                               varStatus="i">
                                                        <c:forEach items="${basicFunctionthumbnails}"
                                                                   var="basicFunctionthumbnail" varStatus="j">
                                                            <c:if test="${i.index == j.index}">
                                                                <a href="${pageContext.request.contextPath}${basicFunction}"
                                                                   target="_blank"><img
                                                                        src="${pageContext.request.contextPath}${basicFunctionthumbnail}"
                                                                        style="padding-bottom: 10px"></a>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:forEach>
                                                </td>
                                                <td style="vertical-align: middle;text-align: center">备注</td>
                                                <td style="vertical-align: middle">
                                                    <textarea type="text" class="form-control" readonly>${orgAssess.content3}</textarea>

                                                </td>
                                                <td style="vertical-align: middle;text-align: center"><font
                                                        color="red">*</font>评定结果
                                                </td>
                                                <td style="vertical-align: middle;text-align: center">
                                                    <c:if test="${roleId != 4}">
                                                        <div class="radio-list" style="padding-left: 10px">
                                                            <label class="radio-inline">
                                                                <input type="radio" value="1" name="standard3"
                                                                       <c:if test="${orgAssess.standard3 eq 1}">checked</c:if>
                                                                >合格
                                                            </label>
                                                            <label class="radio-inline">
                                                                <input type="radio" value="0" name="standard3"
                                                                       <c:if test="${orgAssess.standard3 eq 0}">checked</c:if>
                                                                >不合格
                                                            </label>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${roleId == 4}">
                                                        <input type="text" class="form-control" readonly
                                                               <c:if test="${orgAssess.standard3 eq 1}">value="合格"</c:if>
                                                               <c:if test="${orgAssess.standard3 eq 0}">value="不合格"</c:if>
                                                               <c:if test="${orgAssess.standard3 eq 2}">value="未评定"</c:if>
                                                        >
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:middle;text-align: center"><font
                                                        color="red">*</font>服务项目
                                                </td>
                                                <td style="vertical-align:middle;">
                                                    <c:forEach items="${projectAndScales}" var="projectAndScale"
                                                               varStatus="i">
                                                        <c:forEach items="${projectAndScalethumbnails}"
                                                                   var="projectAndScalethumbnail" varStatus="j">
                                                            <c:if test="${i.index == j.index}">
                                                                <a href="${pageContext.request.contextPath}${projectAndScale}"
                                                                   target="_blank"><img
                                                                        src="${pageContext.request.contextPath}${projectAndScalethumbnail}"
                                                                        style="padding-bottom: 10px"></a>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:forEach>
                                                </td>
                                                <td style="vertical-align: middle;text-align: center">备注</td>
                                                <td style="vertical-align: middle">
                                                    <textarea type="text" class="form-control" readonly>${orgAssess.content4}</textarea>

                                                </td>
                                                <td style="vertical-align: middle;text-align: center"><font
                                                        color="red">*</font>评定结果
                                                </td>
                                                <td style="vertical-align: middle;text-align: center">
                                                    <c:if test="${roleId != 4}">
                                                        <div class="radio-list" style="padding-left: 10px">
                                                            <label class="radio-inline">
                                                                <input type="radio" value="1" name="standard4"
                                                                       <c:if test="${orgAssess.standard4 eq 1}">checked</c:if>
                                                                >合格
                                                            </label>
                                                            <label class="radio-inline">
                                                                <input type="radio" value="0" name="standard4"
                                                                       <c:if test="${orgAssess.standard4 eq 0}">checked</c:if>
                                                                >不合格
                                                            </label>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${roleId == 4}">
                                                        <input type="text" class="form-control" readonly
                                                               <c:if test="${orgAssess.standard4 eq 1}">value="合格"</c:if>
                                                               <c:if test="${orgAssess.standard4 eq 0}">value="不合格"</c:if>
                                                               <c:if test="${orgAssess.standard4 eq 2}">value="未评定"</c:if>
                                                        >
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:middle;text-align: center"><font
                                                        color="red">*</font>服务绩效
                                                </td>
                                                <td style="vertical-align:middle;">
                                                    <c:forEach items="${servicePerformances}" var="servicePerformance"
                                                               varStatus="i">
                                                        <c:forEach items="${servicePerformancethumbnails}"
                                                                   var="servicePerformancethumbnail" varStatus="j">
                                                            <c:if test="${i.index == j.index}">
                                                                <a href="${pageContext.request.contextPath}${servicePerformance}"
                                                                   target="_blank"><img
                                                                        src="${pageContext.request.contextPath}${servicePerformancethumbnail}"
                                                                        style="padding-bottom: 10px"></a>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:forEach>
                                                </td>
                                                <td style="vertical-align: middle;text-align: center">备注</td>
                                                <td style="vertical-align: middle">
                                                    <textarea type="text" class="form-control" readonly>${orgAssess.content9}</textarea>

                                                </td>
                                                <td style="vertical-align: middle;text-align: center"><font
                                                        color="red">*</font>评定结果
                                                </td>
                                                <td style="vertical-align: middle;text-align: center">
                                                    <c:if test="${roleId != 4}">
                                                        <div class="radio-list" style="padding-left: 10px">
                                                            <label class="radio-inline">
                                                                <input type="radio" value="1" name="standard9"
                                                                       <c:if test="${orgAssess.standard9 eq 1}">checked</c:if>
                                                                >合格
                                                            </label>
                                                            <label class="radio-inline">
                                                                <input type="radio" value="0" name="standard9"
                                                                       <c:if test="${orgAssess.standard9 eq 0}">checked</c:if>
                                                                >不合格
                                                            </label>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${roleId == 4}">
                                                        <input type="text" class="form-control" readonly
                                                               <c:if test="${orgAssess.standard9 eq 1}">value="合格"</c:if>
                                                               <c:if test="${orgAssess.standard9 eq 0}">value="不合格"</c:if>
                                                               <c:if test="${orgAssess.standard9 eq 2}">value="未评定"</c:if>
                                                        >
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:middle;text-align: center"><font
                                                        color="red">*</font>安全保障
                                                </td>
                                                <td style="vertical-align:middle;">
                                                    <c:forEach items="${securityAssurances}" var="securityAssurance"
                                                               varStatus="i">
                                                        <c:forEach items="${securityAssurancethumbnails}"
                                                                   var="securityAssurancethumbnail" varStatus="j">
                                                            <c:if test="${i.index == j.index}">
                                                                <a href="${pageContext.request.contextPath}${securityAssurance}"
                                                                   target="_blank"><img
                                                                        src="${pageContext.request.contextPath}${securityAssurancethumbnail}"
                                                                        style="padding-bottom: 10px"></a>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:forEach>
                                                </td>
                                                <td style="vertical-align: middle;text-align: center">备注</td>
                                                <td style="vertical-align: middle">
                                                    <textarea type="text" class="form-control" readonly>${orgAssess.content5}</textarea>

                                                </td>
                                                <td style="vertical-align: middle;text-align: center"><font
                                                        color="red">*</font>评定结果
                                                </td>
                                                <td style="vertical-align: middle;text-align: center">
                                                    <c:if test="${roleId != 4}">
                                                        <div class="radio-list" style="padding-left: 10px">
                                                            <label class="radio-inline">
                                                                <input type="radio" value="1" name="standard5"
                                                                       <c:if test="${orgAssess.standard5 eq 1}">checked</c:if>
                                                                >合格
                                                            </label>
                                                            <label class="radio-inline">
                                                                <input type="radio" value="0" name="standard5"
                                                                       <c:if test="${orgAssess.standard5 eq 0}">checked</c:if>
                                                                >不合格
                                                            </label>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${roleId == 4}">
                                                        <input type="text" class="form-control" readonly
                                                               <c:if test="${orgAssess.standard5 eq 1}">value="合格"</c:if>
                                                               <c:if test="${orgAssess.standard5 eq 0}">value="不合格"</c:if>
                                                               <c:if test="${orgAssess.standard5 eq 2}">value="未评定"</c:if>
                                                        >
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:middle;text-align: center"><font
                                                        color="red">*</font>基础设施
                                                </td>
                                                <td style="vertical-align:middle;">
                                                    <c:forEach items="${infrastructures}" var="infrastructure"
                                                               varStatus="i">
                                                        <c:forEach items="${infrastructurethumbnails}"
                                                                   var="infrastructurethumbnail" varStatus="j">
                                                            <c:if test="${i.index == j.index}">
                                                                <a href="${pageContext.request.contextPath}${infrastructure}"
                                                                   target="_blank"><img
                                                                        src="${pageContext.request.contextPath}${infrastructurethumbnail}"
                                                                        style="padding-bottom: 10px"></a>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:forEach>
                                                </td>
                                                <td style="vertical-align: middle;text-align: center">备注</td>
                                                <td style="vertical-align: middle">
                                                    <textarea type="text" class="form-control" readonly>${orgAssess.content6}</textarea>

                                                </td>
                                                <td style="vertical-align: middle;text-align: center"><font
                                                        color="red">*</font>评定结果
                                                </td>
                                                <td style="vertical-align: middle;text-align: center">
                                                    <c:if test="${roleId != 4}">
                                                        <div class="radio-list" style="padding-left: 10px">
                                                            <label class="radio-inline">
                                                                <input type="radio" value="1" name="standard6"
                                                                       <c:if test="${orgAssess.standard6 eq 1}">checked</c:if>
                                                                >合格
                                                            </label>
                                                            <label class="radio-inline">
                                                                <input type="radio" value="0" name="standard6"
                                                                       <c:if test="${orgAssess.standard6 eq 0}">checked</c:if>
                                                                >不合格
                                                            </label>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${roleId == 4}">
                                                        <input type="text" class="form-control" readonly
                                                               <c:if test="${orgAssess.standard6 eq 1}">value="合格"</c:if>
                                                               <c:if test="${orgAssess.standard6 eq 0}">value="不合格"</c:if>
                                                               <c:if test="${orgAssess.standard6 eq 2}">value="未评定"</c:if>
                                                        >
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:middle;text-align: center"><font
                                                        color="red">*</font>人员配备
                                                </td>
                                                <td style="vertical-align:middle;">
                                                    <c:forEach items="${personnelAllocations}" var="personnelAllocation"
                                                               varStatus="i">
                                                        <c:forEach items="${personnelAllocationthumbnails}"
                                                                   var="personnelAllocationthumbnail" varStatus="j">
                                                            <c:if test="${i.index == j.index}">
                                                                <a href="${pageContext.request.contextPath}${personnelAllocation}"
                                                                   target="_blank"><img
                                                                        src="${pageContext.request.contextPath}${personnelAllocationthumbnail}"
                                                                        style="padding-bottom: 10px"></a>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:forEach>
                                                </td>
                                                <td style="vertical-align: middle;text-align: center">备注</td>
                                                <td style="vertical-align: middle">
                                                    <textarea type="text" class="form-control" readonly>${orgAssess.content6}</textarea>

                                                </td>
                                                <td style="vertical-align: middle;text-align: center"><font
                                                        color="red">*</font>评定结果
                                                </td>
                                                <td style="vertical-align: middle;text-align: center">
                                                    <c:if test="${roleId != 4}">
                                                        <div class="radio-list" style="padding-left: 10px">
                                                            <label class="radio-inline">
                                                                <input type="radio" value="1" name="standard7"
                                                                       <c:if test="${orgAssess.standard7 eq 1}">checked</c:if>
                                                                >合格
                                                            </label>
                                                            <label class="radio-inline">
                                                                <input type="radio" value="0" name="standard7"
                                                                       <c:if test="${orgAssess.standard7 eq 0}">checked</c:if>
                                                                >不合格
                                                            </label>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${roleId == 4}">
                                                        <input type="text" class="form-control" readonly
                                                               <c:if test="${orgAssess.standard7 eq 1}">value="合格"</c:if>
                                                               <c:if test="${orgAssess.standard7 eq 0}">value="不合格"</c:if>
                                                               <c:if test="${orgAssess.standard7 eq 2}">value="未评定"</c:if>
                                                        >
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:middle;text-align: center"><font
                                                        color="red">*</font>规章制度
                                                </td>
                                                <td style="vertical-align:middle;">
                                                    <c:forEach items="${regulatoryFrameworks}" var="regulatoryFramework"
                                                               varStatus="i">
                                                        <c:forEach items="${regulatoryFrameworkthumbnails}"
                                                                   var="regulatoryFrameworkthumbnail" varStatus="j">
                                                            <c:if test="${i.index == j.index}">
                                                                <a href="${pageContext.request.contextPath}${regulatoryFramework}"
                                                                   target="_blank"><img
                                                                        src="${pageContext.request.contextPath}${regulatoryFrameworkthumbnail}"
                                                                        style="padding-bottom: 10px"></a>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:forEach>
                                                </td>
                                                <td style="vertical-align: middle;text-align: center">备注</td>
                                                <td style="vertical-align: middle">
                                                    <textarea type="text" class="form-control" readonly>${orgAssess.content8}</textarea>

                                                </td>
                                                <td style="vertical-align: middle;text-align: center"><font
                                                        color="red">*</font>评定结果
                                                </td>
                                                <td style="vertical-align: middle;text-align: center">
                                                    <c:if test="${roleId != 4}">
                                                        <div class="radio-list" style="padding-left: 10px">
                                                            <label class="radio-inline">
                                                                <input type="radio" value="1" name="standard8"
                                                                       <c:if test="${orgAssess.standard8 eq 1}">checked</c:if>
                                                                >合格
                                                            </label>
                                                            <label class="radio-inline">
                                                                <input type="radio" value="0" name="standard8"
                                                                       <c:if test="${orgAssess.standard8 eq 0}">checked</c:if>
                                                                >不合格
                                                            </label>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${roleId == 4}">
                                                        <input type="text" class="form-control" readonly
                                                               <c:if test="${orgAssess.standard8 eq 1}">value="合格"</c:if>
                                                               <c:if test="${orgAssess.standard8 eq 0}">value="不合格"</c:if>
                                                               <c:if test="${orgAssess.standard8 eq 2}">value="未评定"</c:if>
                                                        >
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:middle;text-align: center"><font
                                                        color="red">*</font>监督管理
                                                </td>
                                                <td style="vertical-align:middle;">
                                                    <c:forEach items="${supervisions}" var="supervision"
                                                               varStatus="i">
                                                        <c:forEach items="${supervisionthumbnails}"
                                                                   var="supervisionthumbnail" varStatus="j">
                                                            <c:if test="${i.index == j.index}">
                                                                <a href="${pageContext.request.contextPath}${supervision}"
                                                                   target="_blank"><img
                                                                        src="${pageContext.request.contextPath}${supervisionthumbnail}"
                                                                        style="padding-bottom: 10px"></a>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:forEach>
                                                </td>
                                                <td style="vertical-align: middle;text-align: center">备注</td>
                                                <td style="vertical-align: middle">
                                                    <textarea type="text" class="form-control" readonly>${orgAssess.content10}</textarea>

                                                </td>
                                                <td style="vertical-align: middle;text-align: center"><font
                                                        color="red">*</font>评定结果
                                                </td>
                                                <td style="vertical-align: middle;text-align: center">
                                                    <c:if test="${roleId != 4}">
                                                        <div class="radio-list" style="padding-left: 10px">
                                                            <label class="radio-inline">
                                                                <input type="radio" value="1" name="standard10"
                                                                       <c:if test="${orgAssess.standard10 eq 1}">checked</c:if>
                                                                >合格
                                                            </label>
                                                            <label class="radio-inline">
                                                                <input type="radio" value="0" name="standard10"
                                                                       <c:if test="${orgAssess.standard10 eq 0}">checked</c:if>
                                                                >不合格
                                                            </label>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${roleId == 4}">
                                                        <input type="text" class="form-control" readonly
                                                               <c:if test="${orgAssess.standard10 eq 1}">value="合格"</c:if>
                                                               <c:if test="${orgAssess.standard10 eq 0}">value="不合格"</c:if>
                                                               <c:if test="${orgAssess.standard10 eq 2}">value="未评定"</c:if>
                                                        >
                                                    </c:if>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td style="vertical-align: middle;text-align: center"><font
                                                        color="red">*</font>
                                                    <c:if test="${orgAssess.gradeDictId>=2}">
                                                        初审结果
                                                    </c:if>
                                                    <c:if test="${orgAssess.gradeDictId<2}">
                                                        评估结果
                                                    </c:if>

                                                </td>
                                                <td style="vertical-align: middle;text-align: center" colspan="2">
                                                    <c:if test="${roleId ==3 }">
                                                        <lb:select value="${orgAssess.qustandard}" name="qustandard"
                                                                   id="qustandard" cssClass="form-control">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="1">通过</lb:option>
                                                            <lb:option value="0">不通过</lb:option>
                                                        </lb:select>
                                                    </c:if>
                                                    <c:if test="${roleId!=3}">
                                                        <input type="text" class="form-control" readonly
                                                               <c:if test="${orgAssess.qustandard eq 1}">value="通过" </c:if>
                                                               <c:if test="${orgAssess.qustandard eq 0}">value="不通过" </c:if>
                                                               <c:if test="${orgAssess.qustandard eq 2}">value="未评估" </c:if>
                                                        >
                                                    </c:if>
                                                </td>
                                                <td style="vertical-align: middle;text-align: center">备注<span
                                                        style="color: red;display: none" id="qushow">*</span></td>
                                                <td style="vertical-align: middle" colspan="2">
                                                    <c:if test="${roleId ==3 }">
                                                        <input type="text" class="form-control" name="qucontent"
                                                               id="qucontent"
                                                               value="${orgAssess.qucontent}">
                                                    </c:if>
                                                    <c:if test="${roleId!=3}">
                                                        <input type="text" class="form-control"
                                                               value="${orgAssess.qucontent}" readonly>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <c:if test="${orgAssess.gradeDictId>=2}">
                                                <tr>
                                                    <td style="vertical-align: middle;text-align: center"><font
                                                            color="red">*</font>评估结果
                                                    </td>
                                                    <td style="vertical-align: middle;text-align: center" colspan="2">
                                                        <c:if test="${roleId ==1 or roleId ==2 }">
                                                            <lb:select value="${orgAssess.standard}" name="standard"
                                                                       id="standard" cssClass="form-control">
                                                                <lb:option value="">--请选择--</lb:option>
                                                                <lb:option value="1">通过</lb:option>
                                                                <lb:option value="0">不通过</lb:option>
                                                            </lb:select>
                                                        </c:if>
                                                        <c:if test="${roleId !=1 and roleId!=2 }">
                                                            <input type="text" class="form-control" readonly
                                                                   <c:if test="${orgAssess.standard eq 1}">value="通过" </c:if>
                                                                   <c:if test="${orgAssess.standard eq 0}">value="不通过" </c:if>
                                                                   <c:if test="${orgAssess.standard eq 2}">value="未评估" </c:if>
                                                            >
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align: middle;text-align: center">备注<span
                                                            style="color: red;display: none" id="show">*</span></td>
                                                    <td style="vertical-align: middle" colspan="2">
                                                        <c:if test="${roleId ==1 or roleId ==2 }">
                                                            <input type="text" class="form-control" name="content"
                                                                   id="content"
                                                                   value="${orgAssess.content}">
                                                        </c:if>
                                                        <c:if test="${roleId !=1 and roleId!=2 }">
                                                            <input type="text" class="form-control"
                                                                   value="${orgAssess.content}" readonly>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </table>
                                    <div class="form-actions">
                                        <div class="row">
                                            <c:if test="${approve==1}">
                                                <c:if test="${roleId==3}">
                                                    <c:if test="${orgAssess.qustandard==2}">
                                                        <div class="col-md-offset-8" style="float: left">
                                                            <button data-loading-text="提交中..."
                                                                    type="button" class="btn btn-circle green"
                                                                    onclick="OrgAssessDetail.submitEdit()">
                                                                完成审核
                                                            </button>
                                                            <span id="labelmsg1" class="label"></span>
                                                        </div>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${roleId!=3}">
                                                    <c:if test="${orgAssess.standard==2}">
                                                        <div class="col-md-offset-8" style="float: left">
                                                            <button data-loading-text="提交中..."
                                                                    type="button" class="btn btn-circle green"
                                                                    onclick="OrgAssessDetail.submitEdit()">
                                                                完成审核
                                                            </button>
                                                            <span id="labelmsg1" class="label"></span>
                                                        </div>
                                                    </c:if>
                                                </c:if>
                                            </c:if>
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
                            <div class="tab-pane ${title2}" id="tab_add">
                                <form id="orgAssessAddForm">
                                    <table border="1"
                                           class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                           align="center" style="border-collapse: collapse;">
                                        <tr>
                                            <td colspan="4" style="color: red;">
                                                <p style="font-size: 17px">申请须知：</p>
                                                <p style="margin-left:30px;font-size: 16px">请下载<a class="fileDown"
                                                                                                  href="${pageContext.request.contextPath }/file/excel/download/serviceOrg/南京市社区居家养老服务中心等级评定填写说明.xls">《内蒙古市社区居家养老服务中心等级评定填写说明》</a>，并按照说明内容上传相应图片材料，提交申请后将在3个工作日内审核完毕，并将审核结果以站内信形式发送至本帐号，请注意查收。
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: middle;text-align: center;font-size: 18px"
                                                colspan="4">组织信息
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 20%; vertical-align:middle;text-align: center"><font
                                                    color="red">*</font>评估组织名称
                                            </td>
                                            <td style="width: 80%; vertical-align:middle;" colspan="3">
                                                <input type="text" class="form-control" id="institutionName"
                                                       name="institutionName" readonly
                                                       value="${serviceOrg.institutionName}"
                                                    <%--style="width:60%;display:inline-block;padding-right: 50px"--%>>
                                                    <%--<button type="button" class="btn btn-block green"
                                                            style="width: 20%;display:inline-block;"
                                                            onclick="OrgAssessDetail.showSelectServiceOrgModel()">
                                                        选择组织
                                                    </button>--%>
                                                <input type="hidden" id="serviceOrgId" name="serviceOrgId"
                                                       value="${serviceOrg.id}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align:middle;text-align: center"><font
                                                    color="red">*</font>申报等级
                                            </td>
                                            <td style="text-align:center;vertical-align:middle;">
                                                <lb:select id="gradeDictId" name="gradeDictId" cssClass="form-control"
                                                           value="${orgAssess.gradeDictId}">
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
                                            <td style="vertical-align:middle;text-align: center;font-size: 18px"
                                                colspan="4">评估资料
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align:middle;text-align: center;width: 10%"><font
                                                    color="red">*</font>总体要求
                                            </td>
                                            <td style="vertical-align:middle;width: 50%">
                                                <input type="hidden" name="generalRequirement">
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
                                                     style="padding-left: 5px;padding-top: 5px"></div>
                                            </td>
                                            <td style="vertical-align:middle;text-align: center;width: 10%">备注</td>
                                            <td style="vertical-align: middle;text-align: center;width: 30%">
                                                <input type="text" class="form-control" name="content1" id="content1"
                                                       value="${orgAssess.content1}">
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
                                                <input type="hidden" name="qualification">
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
                                                     style="padding-left: 5px;padding-top: 5px"></div>
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
                                                <input type="hidden" name="basicFunction">
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
                                                     style="padding-left: 5px;padding-top: 5px"></div>
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
                                                <input type="hidden" name="projectAndScale">
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
                                                     style="padding-left: 5px;padding-top: 5px"></div>
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
                                                <input type="hidden" name="servicePerformance">
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
                                                     style="padding-left: 5px;padding-top: 5px"></div>
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
                                                <input type="hidden" name="securityAssurance">
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
                                                     style="padding-left: 5px;padding-top: 5px"></div>
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
                                                <input type="hidden" name="infrastructure">
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
                                                     style="padding-left: 5px;padding-top: 5px"></div>
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
                                                <input type="hidden" name="personnelAllocation">
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
                                                     style="padding-left: 5px;padding-top: 5px"></div>
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
                                                <input type="hidden" name="regulatoryFramework">
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
                                                     style="padding-left: 5px;padding-top: 5px"></div>
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
                                                <input type="hidden" name="supervision">
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
                                                     style="padding-left: 5px;padding-top: 5px"></div>
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
                                            <div style="text-align: right;width: 40%; margin-right: 71px; display: inline-block;">
                                                <button id="submitAdd" data-loading-text="提交中..."
                                                        type="button" class="btn btn-circle green"
                                                        onclick="OrgAssessDetail.submitAdd()">
                                                    提交
                                                </button>
                                                <span id="labelmsg" class="label"></span>
                                            </div>
                                            <div style="width: 40%;display: inline-block">
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
                        <button type="button" class="btn blue add" onclick="OrgAssessDetail.selectServiceOrg()">确定
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
                OrgAssessDetail.init();
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


