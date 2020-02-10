<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<title>老人能力评估</title>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>老人能力评估</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <!-- The styles -->
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" Stype="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <!-- The fav icon -->
        <style type="text/css">

            td.selected{
                background-color:#f6d48a;
            }

            .enlarge:hover{
                font-size: 22px;
                color: #2F84C8;
            }
        </style>
        <style>
            label{
                font-weight: normal;
            }
        </style>

    </tiles:putAttribute>

    <tiles:putAttribute name="page_content">
        <div class="col-md-12">
            <!-- Begin: life time stats -->
            <div class="portlet " style="padding-top: 0px !important;">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-equalizer font-purple-plum hide"></i>
                        <span class="caption-subject font-red-sunglo bold uppercase">老人能力评估信息详情</span>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="tabbable-line">
                        <form id="serviceOrgAddForm">
                            <table border="1"
                                   class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                   align="center" style="border-collapse: collapse;">
                                <input type="hidden" id="province" value="0">
                                <input type="hidden" id="type" value="2">
                                <input name="id" value="${m.id}" class="form-control input-sm"  type="hidden">
                                <tr>
                                    <td colspan="12">一、基本情况</td>
                                </tr>
                                <tr>

                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:9%;">
                                        身份证号 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:24%;">
                                        <input type="text" class="form-control" id="idCard" name="idCard"
                                               value="${m.idCard}" readonly>
                                        <input type="hidden" id="elderId" name="elderId" value="${elderlyMsg.id}">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:9%;">
                                        姓名 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:24%;">
                                        <input type="hidden" class="form-control" id="oldmanId" name="oldmanId"
                                               value="">
                                        <input type="text" class="form-control" id="oldmanName" name="oldmanName"
                                               value="${m.oldmanName}" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        固话 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        <input  type="text" class="form-control" id="phone1" name="phone1"
                                                value="${m.phone1}" readonly>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        手机 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        <input type="text" class="form-control" id="phone2" name="phone2"
                                               value="${m.phone2}" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        老人照片 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: left;vertical-align: middle;width: 24%">
                                        <input  id="oldmanPhoto" name="oldmanPhoto" type="hidden" class="form-control"
                                                value="">
                                        <c:if test="${m.photoFlag == 2}">
                                            <c:forEach items="${oldManPhotos}" var="oldManPhoto"
                                                       varStatus="i">
                                                <c:forEach items="${oldManPhotothumbnails}"
                                                           var="oldManPhotothumbnail" varStatus="j">
                                                    <c:if test="${i.index == j.index}">
                                                        <a href="${pageContext.request.contextPath}${oldManPhotothumbnail}"
                                                           target="_blank">
                                                            <div class="file-div">
                                                                <img src="${pageContext.request.contextPath}${oldManPhoto}"
                                                                        style="padding-bottom: 10px">
                                                            </div>
                                                        </a>
                                                    </c:if>
                                                </c:forEach>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${m.photoFlag == 1}">
                                            <a href="${pageContext.request.contextPath }${m.oldmanPhoto}"
                                               target="_blank">
                                                <div class="file-div">
                                                    <img
                                                            src="${pageContext.request.contextPath }${m.oldmanPhoto}"
                                                            style="padding-bottom: 10px;width: 60px;height: 60px;">
                                                </div>
                                            </a>
                                        </c:if>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        文化程度 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width: 24%">
                                        <lb:select id="degreeOfEducation" name="degreeOfEducation" cssClass="form-control" value="${m.degreeOfEducation}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">文盲</lb:option>
                                            <lb:option value="2">半文盲</lb:option>
                                            <lb:option value="3">小学</lb:option>
                                            <lb:option value="4">初中</lb:option>
                                            <lb:option value="5">高中</lb:option>
                                            <lb:option value="6">大专</lb:option>
                                            <option value="7">本科</option>
                                        </lb:select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        常住时间 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width: 24%" >
                                        <lb:select  name="conservationTime" cssClass="form-control" id="conservationTime" value="${m.conservationTime}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">1年以下</lb:option>
                                            <lb:option value="2">1到3年</lb:option>
                                            <lb:option value="3">3年以上</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 17%">
                                        户籍地址 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width: 33%">
                                        <input  id="domicileAddress" type="text" class="form-control" name="domicileAddress"
                                                value="${m.domicileAddress}" readonly>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 17%">
                                        现居地址 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width: 33%">
                                        <input id="nowAddress" type="text" class="form-control" name="nowAddress"
                                               value="${m.nowAddress}" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人1姓名 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input  id="emergencyContact1" name="emergencyContact1" type="text" class="form-control"
                                                value="${m.emergencyContact1}" readonly>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人1与老人关系 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input id="emergencyContact1Relatives" type="text" class="form-control" name="emergencyContact1Relatives"
                                               value="${m.emergencyContact1Relatives}" readonly>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人1联系方式 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input  id="emergencyContact1Tel" type="text" class="form-control" name="emergencyContact1Tel"
                                                value="${m.emergencyContact1Tel}" readonly>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人1是否有老人钥匙 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 14%">
                                        <lb:select  name="isKey1" cssClass="form-control" id="isKey1" value="${m.isKey1}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">有</lb:option>
                                            <lb:option value="2">没有</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人2姓名 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input  id="emergencyContact2" name="emergencyContact2" type="text" class="form-control"
                                                value="${m.emergencyContact2}" readonly>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人2与老人关系 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input id="emergencyContact2Relatives" type="text" class="form-control" name="emergencyContact2Relatives"
                                               value="${m.emergencyContact2Relatives}" readonly>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人2联系方式 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input  id="emergencyContact2Tel" type="text" class="form-control" name="emergencyContact2Tel"
                                                value="${m.emergencyContact2Tel}" readonly>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人2是否有老人钥匙 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 14%">
                                        <lb:select  name="isKey2" cssClass="form-control" id="isKey2" value="${m.isKey2}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">有</lb:option>
                                            <lb:option value="2">没有</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人3姓名 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input  id="emergencyContact3" name="emergencyContact3" type="text" class="form-control"
                                                value="${m.emergencyContact3}" readonly>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人3与老人关系 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input id="emergencyContact3Relatives" type="text" class="form-control" name="emergencyContact3Relatives"
                                               value="${m.emergencyContact3Relatives}" readonly>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人3联系方式 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input  id="emergencyContact3Tel" type="text" class="form-control" name="emergencyContact3Tel"
                                                value="${m.emergencyContact3Tel}" readonly>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人3是否有老人钥匙 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 14%">
                                        <lb:select  name="isKey3" cssClass="form-control" id="isKey3" value="${m.isKey3}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">有</lb:option>
                                            <lb:option value="2">没有</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="12">二、社会生活环境参数</td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        原职业 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select  name="oldmanZy" cssClass="form-control" id="oldmanZy" value="${m.oldmanZy}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">公务员</lb:option>
                                            <lb:option value="2">教师</lb:option>
                                            <lb:option value="3">军人</lb:option>
                                            <lb:option value="4">事业职工</lb:option>
                                            <lb:option value="5">企业职工</lb:option>
                                            <lb:option value="6">农民</lb:option>
                                            <lb:option value="7">商人</lb:option>
                                            <lb:option value="8">无固定职业</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="1"style="text-align: center;vertical-align: middle;width:9%;">
                                        人员类别 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select  name="oldmanCategory" cssClass="form-control" id="oldmanCategory"  value="${m.oldmanCategory}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">离休</lb:option>
                                            <lb:option value="2">退休</lb:option>
                                            <lb:option value="3">低保户</lb:option>
                                            <lb:option value="4">低保边缘户</lb:option>
                                            <lb:option value="5">城市三无</lb:option>
                                            <lb:option value="6">农村五保</lb:option>
                                            <lb:option value="7">供养人员</lb:option>
                                            <lb:option value="8">其他：</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:10%;">
                                        特殊对象 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3"style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select  name="specialObject" cssClass="form-control" id="specialObject"  value="${m.specialObject}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">是</lb:option>
                                            <lb:option value="2">否</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        收入来源 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select  name="sourcesOfIncome" cssClass="form-control" id="sourcesOfIncome"  value="${m.sourcesOfIncome}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">离休金/退休金</lb:option>
                                            <lb:option value="2">养老保险</lb:option>
                                            <lb:option value="3">子女补贴</lb:option>
                                            <lb:option value="4">亲友资助</lb:option>
                                            <lb:option value="5">低保金</lb:option>
                                            <lb:option value="6">供养人员补贴</lb:option>
                                            <lb:option value="7">拆迁补助</lb:option>
                                            <lb:option value="8">失地农民补助</lb:option>
                                            <lb:option value="9">其他：</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="1"style="text-align: center;vertical-align: middle;width:9%;">
                                        子女状况 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select  name="statusOfChildren" cssClass="form-control" id="statusOfChildren" value="${m.statusOfChildren}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">有子女</lb:option>
                                            <lb:option value="2">无子女</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:10%;">
                                        医疗类别 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3"style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select  name="medicalCategory" cssClass="form-control" id="medicalCategory" value="${m.medicalCategory}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">公费</lb:option>
                                            <lb:option value="2">职工医保</lb:option>
                                            <lb:option value="3">居民医保</lb:option>
                                            <lb:option value="4">新农合</lb:option>
                                            <lb:option value="5">自费</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 17%">
                                        居住状况 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width: 33%">
                                        <lb:select  name="residentialStatus" cssClass="form-control" id="residentialStatus" value="${m.residentialStatus}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">独居</lb:option>
                                            <lb:option value="2">空巢</lb:option>
                                            <lb:option value="3">与配偶/伴侣居住</lb:option>
                                            <lb:option value="4">与子女居住</lb:option>
                                            <lb:option value="5">与其他亲属居住</lb:option>
                                            <lb:option value="6">与非亲属关系的人居住</lb:option>
                                            <lb:option value="7">养老机构</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 17%">
                                        住房性质 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width: 33%">
                                        <lb:select  name="housingNature" cssClass="form-control" id="housingNature"  value="${m.housingNature}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">自主产权房</lb:option>
                                            <lb:option value="2">租房</lb:option>
                                            <lb:option value="3">政府安置房</lb:option>
                                            <lb:option value="4">其他：</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        居室 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select  name="habitableRoom" cssClass="form-control" id="habitableRoom" value="${m.habitableRoom}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">一居</lb:option>
                                            <lb:option value="2">二居</lb:option>
                                            <lb:option value="3">三居</lb:option>
                                            <lb:option value="4">其他：</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="1"style="text-align: center;vertical-align: middle;width:9%;">
                                        楼层电梯 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select  name="floorLift" cssClass="form-control" id="floorLift" value="${m.floorLift}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">有</lb:option>
                                            <lb:option value="2">无</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:10%;">
                                        居住楼层（楼层无电梯） <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3"style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select  name="residentialFloor" cssClass="form-control" id="residentialFloor" value="${m.residentialFloor}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">一层</lb:option>
                                            <lb:option value="2">二层</lb:option>
                                            <lb:option value="3">三层以上</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 17%">
                                        室内厕所 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width: 33%">
                                        <lb:select  name="indoorToilet" cssClass="form-control" id="indoorToilet" value="${m.indoorToilet}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">有</lb:option>
                                            <lb:option value="2">无</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 17%">
                                        室内洗浴设备 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width: 33%">
                                        <lb:select  name="indoorBathEquipment" cssClass="form-control" id="indoorBathEquipment" value="${m.indoorBathEquipment}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">有</lb:option>
                                            <lb:option value="2">无</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        愿照料情况 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select  name="careSituation" cssClass="form-control" id="careSituation" value="${m.careSituation}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">自我照料</lb:option>
                                            <lb:option value="2">配偶照料</lb:option>
                                            <lb:option value="3">子女照顾</lb:option>
                                            <lb:option value="4">自购家政服务</lb:option>
                                            <lb:option value="5">送餐服务</lb:option>
                                            <lb:option value="6">互助门铃</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="1"style="text-align: center;vertical-align: middle;width:9%;">
                                        政府购买居家养老服务 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select  name="governmentPurchase" cssClass="form-control" id="governmentPurchase" value="${m.governmentPurchase}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">居家照料</lb:option>
                                            <lb:option value="2">紧急呼叫终端</lb:option>
                                            <lb:option value="3">老年人意外伤害保险</lb:option>
                                            <lb:option value="4">其他：</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:10%;">
                                        服务要求 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3"style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select  name="servicesRequested" cssClass="form-control" id="servicesRequested" value="${m.servicesRequested}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">家务料理</lb:option>
                                            <lb:option value="2">代购物品</lb:option>
                                            <lb:option value="3">康复保健</lb:option>
                                            <lb:option value="4">紧急呼叫</lb:option>
                                            <lb:option value="5">心理关爱</lb:option>
                                            <lb:option value="6">法律援助</lb:option>
                                            <lb:option value="7">文化娱乐</lb:option>
                                            <lb:option value="8">助餐</lb:option>
                                            <lb:option value="9">送餐</lb:option>
                                            <lb:option value="10">陪聊</lb:option>
                                            <lb:option value="11">陪住</lb:option>
                                            <lb:option value="12">陪外出</lb:option>
                                            <lb:option value="13">陪旅游</lb:option>
                                            <lb:option value="14">日托</lb:option>
                                            <lb:option value="15">入住老年人福利机构</lb:option>
                                            <lb:option value="16">其他：</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        身体状况<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:16%;">
                                        <lb:select  name="physiclalHealthStatus" cssClass="form-control" id="physiclalHealthStatus"  value="${m.physiclalHealthStatus}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">身体健康</lb:option>
                                            <lb:option value="2">身体不健康</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="1"style="text-align: center;vertical-align: middle;width:9%;">
                                        重病 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:16%;">
                                        <lb:select  name="physiclalIllnessStatus" cssClass="form-control" id="physiclalIllnessStatus" value="${m.physiclalIllnessStatus}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">恶性肿瘤</lb:option>
                                            <lb:option value="2">尿毒性透析</lb:option>
                                            <lb:option value="3">器官移植（含手术后的抗排异治疗）</lb:option>
                                            <lb:option value="4">白血病</lb:option>
                                            <lb:option value="5">急性心肌梗塞</lb:option>
                                            <lb:option value="6">脑中风</lb:option>
                                            <lb:option value="7">急性坏死性胰腺炎</lb:option>
                                            <lb:option value="8">脑外伤</lb:option>
                                            <lb:option value="9">主动脉手术</lb:option>
                                            <lb:option value="10">冠状动脉旁路手术</lb:option>
                                            <lb:option value="11">慢性肾功能性衰竭</lb:option>
                                            <lb:option value="12">急慢性重症肝炎</lb:option>
                                            <lb:option value="13">危及生命的良性脑瘤</lb:option>
                                            <lb:option value="14">重症糖尿病</lb:option>
                                            <lb:option value="15">消化道出血</lb:option>
                                            <lb:option value="16">系统性红斑狼疮</lb:option>
                                            <lb:option value="17">慢性再生障碍性贫血</lb:option>
                                            <lb:option value="18">血友病</lb:option>
                                            <lb:option value="19">重症精神病</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        慢性病<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:16%;">
                                        <lb:select  name="physiclalChronicStatus" cssClass="form-control" id="physiclalChronicStatus" value="${m.physiclalChronicStatus}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">高血压</lb:option>
                                            <lb:option value="2">冠心病</lb:option>
                                            <lb:option value="3">前列腺增生</lb:option>
                                            <lb:option value="4">糖尿病</lb:option>
                                        </lb:select>
                                    </td>
                                        <%--<td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">--%>
                                        <%--其他：<span style="color:red"> *</span>--%>
                                        <%--</td>--%>
                                        <%--<td colspan="2"style="text-align: center;vertical-align: middle;width:16%;">--%>
                                        <%--<select  name="qtjkwt" class="form-control" id="qtjkwt"readonly="readonly">--%>
                                        <%--<option value="0">因摔伤导致行动不便</option>--%>
                                        <%--</select>--%>
                                        <%--</td>--%>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        心理状况 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select  name="psychologicStatus" cssClass="form-control" id="psychologicStatus" value="${m.psychologicStatus}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">正常</lb:option>
                                            <lb:option value="2">偶尔有孤独感</lb:option>
                                            <lb:option value="3">经常觉得很孤独</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="1"style="text-align: center;vertical-align: middle;width:9%;">
                                        社会活动情况 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select  name="socialActivities" cssClass="form-control" id="socialActivities" value="${m.socialActivities}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">经常</lb:option>
                                            <lb:option value="2">偶尔</lb:option>
                                            <lb:option value="3">从不</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:10%;">
                                        社会活动类型<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3"style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select  name="socialActivitiesType" cssClass="form-control" id="socialActivitiesType" value="${m.socialActivitiesType}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">文艺类</lb:option>
                                            <lb:option value="2">教育类</lb:option>
                                            <lb:option value="3">健身类</lb:option>
                                            <lb:option value="4">慈善类</lb:option>
                                            <lb:option value="5">经济类</lb:option>
                                            <lb:option value="6">宗教类</lb:option>
                                            <lb:option value="7">其他：无</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="12">三、日常生活活动</td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        吃饭(能完成入口、咀嚼、吞咽等步骤)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="dayActivity1" cssClass="form-control"
                                                   name="dayActivity1" value="${m.dayActivity1}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">正常</lb:option>
                                            <lb:option value="2">轻丧失</lb:option>
                                            <lb:option value="3">中丧失</lb:option>
                                            <lb:option value="4">完全丧失</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        穿衣(完成取衣、穿衣、系带、扣扣子等) <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="dayActivity2" cssClass="form-control"
                                                   name="dayActivity2" value="${m.dayActivity2}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">正常</lb:option>
                                            <lb:option value="2">轻丧失</lb:option>
                                            <lb:option value="3">中丧失</lb:option>
                                            <lb:option value="4">完全丧失</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        上下床(能完成洗脚、洗脸、上下床等步骤)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="dayActivity3" cssClass="form-control"
                                                   name="dayActivity3" value="${m.dayActivity3}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">正常</lb:option>
                                            <lb:option value="2">轻丧失</lb:option>
                                            <lb:option value="3">中丧失</lb:option>
                                            <lb:option value="4">完全丧失</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        如厕(如厕、便后能自理及整理衣裤)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="dayActivity4" cssClass="form-control"
                                                   name="dayActivity4" value="${m.dayActivity4}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">正常</lb:option>
                                            <lb:option value="2">轻丧失</lb:option>
                                            <lb:option value="3">中丧失</lb:option>
                                            <lb:option value="4">完全丧失</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        室内走动(外出、上下楼正常)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="dayActivity5" cssClass="form-control"
                                                   name="dayActivity5" value="${m.dayActivity5}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">正常</lb:option>
                                            <lb:option value="2">轻丧失</lb:option>
                                            <lb:option value="3">中丧失</lb:option>
                                            <lb:option value="4">完全丧失</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        洗澡(能完成洗澡的全部过程)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="dayActivity6" cssClass="form-control"
                                                   name="dayActivity6" value="${m.dayActivity6}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">正常</lb:option>
                                            <lb:option value="2">轻丧失</lb:option>
                                            <lb:option value="3">中丧失</lb:option>
                                            <lb:option value="4">完全丧失</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        控制大小便(能控制大小便)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="dayActivity7" cssClass="form-control"
                                                   name="dayActivity7" value="${m.dayActivity7}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">正常</lb:option>
                                            <lb:option value="2">轻丧失</lb:option>
                                            <lb:option value="3">中丧失</lb:option>
                                            <lb:option value="4">完全丧失</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="6" style="text-align: center;vertical-align: middle;width:50%;"></td>
                                </tr>

                                <tr>
                                    <td colspan="12">四、认知能力</td>
                                </tr>
                                <tr>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        近期记忆(能回想近期发生的事情)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="cognitiveAbility1" cssClass="form-control"
                                                   name="cognitiveAbility1" value="${m.cognitiveAbility1}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">正常</lb:option>
                                            <lb:option value="2">轻丧失</lb:option>
                                            <lb:option value="3">中丧失</lb:option>
                                            <lb:option value="4">完全丧失</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        程序记忆(完成洗衣、做饭、做菜等)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="cognitiveAbility2" cssClass="form-control"
                                                   name="cognitiveAbility2" value="${m.cognitiveAbility2}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">正常</lb:option>
                                            <lb:option value="2">轻丧失</lb:option>
                                            <lb:option value="3">中丧失</lb:option>
                                            <lb:option value="4">完全丧失</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        定向记忆(外出、回家不迷路)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="cognitiveAbility3" cssClass="form-control"
                                                   name="cognitiveAbility3" value="${m.cognitiveAbility3}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">正常</lb:option>
                                            <lb:option value="2">轻丧失</lb:option>
                                            <lb:option value="3">中丧失</lb:option>
                                            <lb:option value="4">完全丧失</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        判断能力(对日常事物的判断不违背常理)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="cognitiveAbility4" cssClass="form-control"
                                                   name="cognitiveAbility4" value="${m.cognitiveAbility4}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">正常</lb:option>
                                            <lb:option value="2">轻丧失</lb:option>
                                            <lb:option value="3">中丧失</lb:option>
                                            <lb:option value="4">完全丧失</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="12">五、情绪行为</td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:23%;">
                                        情绪(与人和睦相处，不偏激) <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        <lb:select  name="moodAction1" cssClass="form-control" id="moodAction1" value="${m.moodAction1}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">正常</lb:option>
                                            <lb:option value="2">轻丧失</lb:option>
                                            <lb:option value="3">中丧失</lb:option>
                                            <lb:option value="4">完全丧失</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="3"style="text-align: center;vertical-align: middle;width:23%;">
                                        行为(动作行为表现是否异常) <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        <lb:select  name="moodAction2" cssClass="form-control" id="moodAction2" value="${m.moodAction2}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">正常</lb:option>
                                            <lb:option value="2">轻丧失</lb:option>
                                            <lb:option value="3">中丧失</lb:option>
                                            <lb:option value="4">完全丧失</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        沟通(在交流中能否互相理解)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:16%;">
                                        <lb:select  name="moodAction3" cssClass="form-control" id="moodAction3" value="${m.moodAction3}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">正常</lb:option>
                                            <lb:option value="2">轻丧失</lb:option>
                                            <lb:option value="3">中丧失</lb:option>
                                            <lb:option value="4">完全丧失</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="12">六、视、听觉</td>
                                </tr>
                                <tr>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        视觉(能正常看电视、读报等)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="audiovisual1" cssClass="form-control"
                                                   name="audiovisual1" value="${m.audiovisual1}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">正常</lb:option>
                                            <lb:option value="2">轻丧失</lb:option>
                                            <lb:option value="3">中丧失</lb:option>
                                            <lb:option value="4">完全丧失</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        听觉(能正常接听电话、交谈)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="audiovisual2" cssClass="form-control"
                                                   name="audiovisual2" value="${m.audiovisual2}" disabled="true">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">正常</lb:option>
                                            <lb:option value="2">轻丧失</lb:option>
                                            <lb:option value="3">中丧失</lb:option>
                                            <lb:option value="4">完全丧失</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="12">七、其他</td>
                                </tr>
                                <tr>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:33%;">
                                        区域<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input type="text" class="form-control" id="areaName" name="areaName"
                                               value="${m.areaName}" disabled="true">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:33%;">
                                        社区<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input type="text" class="form-control" id="community" name="community"
                                               value="${m.community}" disabled="true">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:33%;">
                                        本人(或家属)签字<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: left;vertical-align: middle;width:17%;">
                                        <c:if test="${m.sign!=null and m.sign!='' }">

                                            <a href="${pageContext.request.contextPath }${m.sign}"
                                               target="_blank">
                                                <div class="file-div">
                                                    <img
                                                            src="${pageContext.request.contextPath }${m.sign}"
                                                            style="padding-bottom: 10px;width: 80px;height: 80px;">
                                                </div>
                                            </a>
                                        </c:if>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:33%;">
                                        评估员签字<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4"style="text-align: left;vertical-align: middle;width:17%;">
                                        <c:if test="${m.judgeSign!=null and m.judgeSign!='' }">

                                            <a href="${pageContext.request.contextPath }${m.judgeSign}"
                                               target="_blank">
                                                <div class="file-div">
                                                    <img
                                                            src="${pageContext.request.contextPath }${m.judgeSign}"
                                                            style="padding-bottom: 10px;width: 80px;height: 80px;">
                                                    <a style="text-decoration: none; display: inherit;top: 1px"
                                                       data="${m.judgeSign}"
                                                       class="  removeImg" name="judgeSign"></a>
                                                </div>
                                            </a>
                                        </c:if>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"></script>
    </tiles:putAttribute>
</tiles:insertDefinition>

