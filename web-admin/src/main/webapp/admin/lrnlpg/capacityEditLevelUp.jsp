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

            td.selected {
                background-color: #f6d48a;
            }

            .enlarge:hover {
                font-size: 22px;
                color: #2F84C8;
            }
        </style>
        <style>
            label {
                font-weight: normal;
            }

            #attachDiv img {
                width: 200px;
            }

            #attachDiv a {
                line-height: 35px;
                font-size: 20px;
            }

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
        <div class="col-md-12">
            <!-- Begin: life time stats -->
            <div class="portlet " style="padding-top: 0px !important;">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-equalizer font-purple-plum hide"></i>
                        <span class="caption-subject font-red-sunglo bold uppercase">老人能力评估信息修改</span>
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
                                <input name="id" value="${m.id}" class="form-control input-sm" type="hidden">
                                <tr>
                                    <td colspan="12">一、基本情况</td>
                                </tr>
                                <tr>

                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:9%;">
                                        身份证号 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:24%;">
                                        <input type="text" class="form-control" id="idCard" name="idCard"
                                               value="${m.idCard}">
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
                                        <input type="text" class="form-control" id="phone1" name="phone1"
                                               value="${m.phone1}">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        手机 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        <input type="text" class="form-control" id="phone2" name="phone2"
                                               value="${m.phone2}">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: left;vertical-align: middle;width: 9%">
                                        老人照片 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: left;vertical-align: middle;width: 24%">
                                        <input id="oldmanPhoto" name="oldmanPhoto" type="hidden" class="form-control"
                                               value="${m.oldmanPhoto}">
                                        <c:if test="${m.photoFlag == 2}">
                                            <c:forEach items="${oldmanPhotos}" var="oldmanPhoto"
                                                       varStatus="i">
                                                <c:forEach items="${oldmanPhotothumbnails}"
                                                           var="oldmanPhotothumbnail" varStatus="j">
                                                    <c:if test="${i.index == j.index}">
                                                        <a href="${pageContext.request.contextPath}${oldmanPhotothumbnail}"
                                                           target="_blank">
                                                            <div class="file-div">
                                                                <img
                                                                        src="${pageContext.request.contextPath}${oldmanPhoto}"
                                                                        style="padding-bottom: 10px">
                                                                <a style="text-decoration: none; display: inherit;top: 1px"
                                                                   data="${oldmanPhoto}"
                                                                   class="removeImg" name="oldmanPhoto"></a>
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
                                                            style="padding-bottom: 10px;width: 80px;height: 80px;">
                                                    <a style="text-decoration: none; display: inherit;top: 1px"
                                                       data="${m.oldmanPhoto}"
                                                       class="removeImg" name="oldmanPhoto"></a>
                                                </div>
                                            </a>
                                        </c:if>
                                        <div class="file-box-list attachInput"
                                             style="display: inline-block;margin: 0px"></div>
                                        <div style="display: none" class="file-box" id="oldmanPhotoDiv">
                                            <input type="file" name="files" id="attachInput"
                                                   onchange="UploadFileService('serviceOrg/subsidy/apply/attach','attachInput','oldmanPhoto')"
                                                   style="opacity: 0;">
                                        </div>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        文化程度 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width: 24%">
                                        <lb:select id="degreeOfEducation" name="degreeOfEducation"
                                                   cssClass="form-control" value="${m.degreeOfEducation}">
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
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width: 24%">
                                        <lb:select name="conservationTime" cssClass="form-control" id="conservationTime"
                                                   value="${m.conservationTime}">
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
                                        <input id="domicileAddress" type="text" class="form-control"
                                               name="domicileAddress"
                                               value="${m.domicileAddress}">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 17%">
                                        现居地址 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width: 33%">
                                        <input id="nowAddress" type="text" class="form-control" name="nowAddress"
                                               value="${m.nowAddress}">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人1姓名 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input id="emergencyContact1" name="emergencyContact1" type="text"
                                               class="form-control"
                                               value="${m.emergencyContact1}">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人1与老人关系 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input id="emergencyContact1Relatives" type="text" class="form-control"
                                               name="emergencyContact1Relatives"
                                               value="${m.emergencyContact1Relatives}">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人1联系方式 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input id="emergencyContact1Tel" type="text" class="form-control"
                                               name="emergencyContact1Tel"
                                               value="${m.emergencyContact1Tel}">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人1是否有老人钥匙 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 14%">
                                        <lb:select name="isKey1" cssClass="form-control" id="isKey1"
                                                   value="${m.isKey1}">
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
                                        <input id="emergencyContact2" name="emergencyContact2" type="text"
                                               class="form-control"
                                               value="${m.emergencyContact2}">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人2与老人关系 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input id="emergencyContact2Relatives" type="text" class="form-control"
                                               name="emergencyContact2Relatives"
                                               value="${m.emergencyContact2Relatives}">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人2联系方式 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input id="emergencyContact2Tel" type="text" class="form-control"
                                               name="emergencyContact2Tel"
                                               value="${m.emergencyContact2Tel}">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人2是否有老人钥匙 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 14%">
                                        <lb:select name="isKey2" cssClass="form-control" id="isKey2"
                                                   value="${m.isKey2}">
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
                                        <input id="emergencyContact3" name="emergencyContact3" type="text"
                                               class="form-control"
                                               value="${m.emergencyContact3}">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人3与老人关系 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input id="emergencyContact3Relatives" type="text" class="form-control"
                                               name="emergencyContact3Relatives"
                                               value="${m.emergencyContact3Relatives}">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人3联系方式 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input id="emergencyContact3Tel" type="text" class="form-control"
                                               name="emergencyContact3Tel"
                                               value="${m.emergencyContact3Tel}">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人3是否有老人钥匙 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 14%">
                                        <lb:select name="isKey3" cssClass="form-control" id="isKey3"
                                                   value="${m.isKey3}">
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
                                        <lb:select name="oldmanZy" cssClass="form-control" id="oldmanZy"
                                                   value="${m.oldmanZy}">
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
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        人员类别 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select name="oldmanCategory" cssClass="form-control" id="oldmanCategory"
                                                   value="${m.oldmanCategory}">
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
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select name="specialObject" cssClass="form-control" id="specialObject"
                                                   value="${m.specialObject}">
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
                                        <lb:select name="sourcesOfIncome" cssClass="form-control" id="sourcesOfIncome"
                                                   value="${m.sourcesOfIncome}">
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
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        子女状况 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select name="statusOfChildren" cssClass="form-control" id="statusOfChildren"
                                                   value="${m.statusOfChildren}">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">有子女</lb:option>
                                            <lb:option value="2">无子女</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:10%;">
                                        医疗类别 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select name="medicalCategory" cssClass="form-control" id="medicalCategory"
                                                   value="${m.medicalCategory}">
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
                                        <lb:select name="residentialStatus" cssClass="form-control"
                                                   id="residentialStatus" value="${m.residentialStatus}">
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
                                        <lb:select name="housingNature" cssClass="form-control" id="housingNature"
                                                   value="${m.housingNature}">
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
                                        <lb:select name="habitableRoom" cssClass="form-control" id="habitableRoom"
                                                   value="${m.habitableRoom}">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">一居</lb:option>
                                            <lb:option value="2">二居</lb:option>
                                            <lb:option value="3">三居</lb:option>
                                            <lb:option value="4">其他：</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        楼层电梯 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select name="floorLift" cssClass="form-control" id="floorLift"
                                                   value="${m.floorLift}">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">有</lb:option>
                                            <lb:option value="2">无</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:10%;">
                                        居住楼层（楼层无电梯） <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select name="residentialFloor" cssClass="form-control" id="residentialFloor"
                                                   value="${m.residentialFloor}">
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
                                        <lb:select name="indoorToilet" cssClass="form-control" id="indoorToilet"
                                                   value="${m.indoorToilet}">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">有</lb:option>
                                            <lb:option value="2">无</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 17%">
                                        室内洗浴设备 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width: 33%">
                                        <lb:select name="indoorBathEquipment" cssClass="form-control"
                                                   id="indoorBathEquipment" value="${m.indoorBathEquipment}">
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
                                        <lb:select name="careSituation" cssClass="form-control" id="careSituation"
                                                   value="${m.careSituation}">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">自我照料</lb:option>
                                            <lb:option value="2">配偶照料</lb:option>
                                            <lb:option value="3">子女照顾</lb:option>
                                            <lb:option value="4">自购家政服务</lb:option>
                                            <lb:option value="5">送餐服务</lb:option>
                                            <lb:option value="6">互助门铃</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        政府购买居家养老服务 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select name="governmentPurchase" cssClass="form-control"
                                                   id="governmentPurchase" value="${m.governmentPurchase}">
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
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select name="servicesRequested" cssClass="form-control"
                                                   id="servicesRequested" value="${m.servicesRequested}">
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
                                        <lb:select name="physiclalHealthStatus" cssClass="form-control"
                                                   id="physiclalHealthStatus" value="${m.physiclalHealthStatus}">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">身体健康</lb:option>
                                            <lb:option value="2">身体不健康</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        重病 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:16%;">
                                        <lb:select name="physiclalIllnessStatus" cssClass="form-control"
                                                   id="physiclalIllnessStatus" value="${m.physiclalIllnessStatus}">
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
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:16%;">
                                        <lb:select name="physiclalChronicStatus" cssClass="form-control"
                                                   id="physiclalChronicStatus" value="${m.physiclalChronicStatus}">
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
                                        <lb:select name="psychologicStatus" cssClass="form-control"
                                                   id="psychologicStatus" value="${m.psychologicStatus}">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">正常</lb:option>
                                            <lb:option value="2">偶尔有孤独感</lb:option>
                                            <lb:option value="3">经常觉得很孤独</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        社会活动情况 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select name="socialActivities" cssClass="form-control" id="socialActivities"
                                                   value="${m.socialActivities}">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">经常</lb:option>
                                            <lb:option value="2">偶尔</lb:option>
                                            <lb:option value="3">从不</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:10%;">
                                        社会活动类型<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <lb:select name="socialActivitiesType" cssClass="form-control"
                                                   id="socialActivitiesType" value="${m.socialActivitiesType}">
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
                                                   name="dayActivity1" value="${m.dayActivity1}">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">正常</lb:option>
                                            <lb:option value="2">轻丧失</lb:option>
                                            <lb:option value="3">中丧失</lb:option>
                                            <lb:option value="4">完全丧失</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        穿衣(完成取衣、穿衣、系带、扣扣子等) <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="dayActivity2" cssClass="form-control"
                                                   name="dayActivity2" value="${m.dayActivity2}">
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
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="dayActivity3" cssClass="form-control"
                                                   name="dayActivity3" value="${m.dayActivity3}">
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
                                                   name="dayActivity4" value="${m.dayActivity4}">
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
                                        室内走动(外出、上下楼正常)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="dayActivity5" cssClass="form-control"
                                                   name="dayActivity5" value="${m.dayActivity5}">
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
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="dayActivity6" cssClass="form-control"
                                                   name="dayActivity6" value="${m.dayActivity6}">
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
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="dayActivity7" cssClass="form-control"
                                                   name="dayActivity7" value="${m.dayActivity7}">
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
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        近期记忆(能回想近期发生的事情)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="cognitiveAbility1" cssClass="form-control"
                                                   name="cognitiveAbility1" value="${m.cognitiveAbility1}">
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
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="cognitiveAbility2" cssClass="form-control"
                                                   name="cognitiveAbility2" value="${m.cognitiveAbility2}">
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
                                        定向记忆(外出、回家不迷路)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="cognitiveAbility3" cssClass="form-control"
                                                   name="cognitiveAbility3" value="${m.cognitiveAbility3}">
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
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="cognitiveAbility4" cssClass="form-control"
                                                   name="cognitiveAbility4" value="${m.cognitiveAbility4}">
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
                                        <lb:select name="moodAction1" cssClass="form-control" id="moodAction1"
                                                   value="${m.moodAction1}">
                                            <lb:option value="0">请选择</lb:option>
                                            <lb:option value="1">正常</lb:option>
                                            <lb:option value="2">轻丧失</lb:option>
                                            <lb:option value="3">中丧失</lb:option>
                                            <lb:option value="4">完全丧失</lb:option>
                                        </lb:select>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:23%;">
                                        行为(动作行为表现是否异常) <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        <lb:select name="moodAction2" cssClass="form-control" id="moodAction2"
                                                   value="${m.moodAction2}">
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
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:16%;">
                                        <lb:select name="moodAction3" cssClass="form-control" id="moodAction3"
                                                   value="${m.moodAction3}">
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
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        视觉(能正常看电视、读报等)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="audiovisual1" cssClass="form-control"
                                                   name="audiovisual1" value="${m.audiovisual1}">
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
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <lb:select id="audiovisual2" cssClass="form-control"
                                                   name="audiovisual2" value="${m.audiovisual2}">
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
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:33%;">
                                        区域<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input type="text" class="form-control" id="areaName" name="areaName"
                                               value="${m.areaName}">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:33%;">
                                        社区<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input type="text" class="form-control" id="community" name="community"
                                               value="${m.community}">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:33%;">
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
                                                    <a style="text-decoration: none; display: inherit;top: 1px"
                                                       data="${m.sign}"
                                                       class="  removeImg" name="sign"></a>
                                                </div>
                                            </a>
                                        </c:if>
                                        <div class="file-box-list signInput"
                                             style="display: inline-block;margin: 0px"></div>
                                        <div style="display: none" class="file-box" id="signDiv">
                                            <input type="file" name="files" id="signInput"
                                                   onchange="UploadFileService('serviceOrg/subsidy/apply/attach','signInput','sign')"
                                                   style="opacity: 0;">
                                        </div>
                                        <input type="hidden" class="form-control" id="sign" name="sign"
                                               value="${m.sign}">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:33%;">
                                        评估员签字<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: left;vertical-align: middle;width:17%;">
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
                                        <div class="file-box-list judgeSignInput"
                                             style="display: inline-block;margin: 0px"></div>
                                        <div style="display: none" class="file-box" id="judgeSignDiv">
                                            <input type="file" name="files" id="judgeSignInput"
                                                   onchange="UploadFileService('serviceOrg/subsidy/apply/attach','judgeSignInput','judgeSign')"
                                                   style="opacity: 0;">
                                        </div>
                                        <input type="hidden" class="form-control" id="judgeSign" name="judgeSign"
                                               value="${m.judgeSign}">
                                    </td>
                                </tr>
                            </table>
                            <div class="form-actions">
                                <div class="col-md-12">
                                    <div class="col-md-offset-4" style="margin-left: 48%;">
                                        <button data-loading-text="提交中..."
                                                type="button" class="btn btn-circle green"
                                                onclick="save()">
                                            保存
                                        </button>
                                        <span id="labelmsg" class="label"></span>
                                    </div>
                                        <%-- <div class="col-md-offset-4">
                                             <button onclick="window.parent.closeTab('tab_institution_add')"
                                                     class="btn btn-circle green"><i
                                                     class="fa">返回</i>
                                             </button>
                                         </div>--%>
                                </div>
                            </div>
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
        <script>
            var fullScore = {
                oldman_name: 0,
                id_card: 0,
                oldman_preferential_card: 0,
                phone1: 0,
                phone2: 0,
                oldman_photo: 0,
                degree_of_education: 0,
                conservation_time: 0,
                domicile_address: 0,
                now_address: 0,
                emergency_contact1: 0,
                emergency_contact1_relatives: 0,
                emergency_contact1_tel: 0,
                is_key1: 0,
                emergency_contact2: 0,
                emergency_contact2_relatives: 0,
                emergency_contact2_tel: 0,
                is_key2: 0,
                emergency_contact3: 0,
                emergency_contact3_relatives: 0,
                emergency_contact3_tel: 0,
                is_key3: 0,
                oldman_zy: 0,
                oldman_category: 0,
                special_object: 0,
                sources_of_income: 0,
                status_of_children: 0,
                medical_category: 0,
                residential_status: 0,
                housing_nature: 0,
                habitable_room: 0,
                floor_lift: 0,
                residential_floor: 0,
                indoor_toilet: 0,
                indoor_bath_equipment: 0,
                care_situation: 0,
                government_purchase: 0,
                services_requested: 0,
                physiclal_health_status: 0,
                physiclal_illness_status: 0,
                physiclal_chronic_status: 0,
                psychologic_status: 0,
                social_activities: 0,
                social_activities_type: 0,
                day_activity1: 0,
                day_activity2: 0,
                day_activity3: 0,
                day_activity4: 0,
                day_activity5: 0,
                day_activity6: 0,
                day_activity7: 0,
                cognitive_ability1: 0,
                cognitive_ability2: 0,
                cognitive_ability3: 0,
                cognitive_ability4: 0,
                mood_action1: 0,
                mood_action2: 0,
                mood_action3: 0,
                audiovisual1: 0,
                audiovisual2: 0,
                areaId: 0,
                community: 0,
                sign: 0,
                judge_sign: 0
            }

            var bilityScore = {
                cfNormal: 0,
                cfLightloss: 0,
                cfMiddleloss: 0,
                cfCompletelyloss: 0,
                cyNormal: 0,
                cyLightloss: 0,
                cyMiddleloss: 0,
                cyCompletelyloss: 0,
                rcNormal: 0,
                rcLightloss: 0,
                rcMiddleloss: 0,
                rcCompletelyloss: 0,
                snzdNormal: 0,
                snzdLightloss: 0,
                snzdMiddleloss: 0,
                snzdCompletelyloss: 0,
                xzNormal: 0,
                xzLightloss: 0,
                xzMiddleloss: 0,
                xzCompletelyloss: 0,
                dxbNormal: 0,
                dxbLightloss: 0,
                dxbMiddleloss: 0,
                dxbCompletelyloss: 0,
                jqjyNormal: 0,
                jqjyLightloss: 0,
                jqjyMiddleloss: 0,
                jqjyCompletelyloss: 0,
                cxjyNormal: 0,
                cxjyLightloss: 0,
                cxjyMiddleloss: 0,
                cxjyCompletelyloss: 0,
                dxjyNormal: 0,
                dxjyLightloss: 0,
                dxjyMiddleloss: 0,
                dxjyCompletelyloss: 0,
                pdnlNormal: 0,
                pdnlLightloss: 0,
                pdnlMiddleloss: 0,
                pdnlCompletelyloss: 0,
                qxNormal: 0,
                qxLightloss: 0,
                qxMiddleloss: 0,
                qxCompletelyloss: 0,
                xwNormal: 0,
                xwLightloss: 0,
                xwMiddleloss: 0,
                xwCompletelyloss: 0,
                gtNormal: 0,
                gtLightloss: 0,
                gtMiddleloss: 0,
                gtCompletelyloss: 0,
                sjNormal: 0,
                sjLightloss: 0,
                sjMiddleloss: 0,
                sjCompletelyloss: 0,
                tjNormal: 0,
                tjLightloss: 0,
                tjMiddleloss: 0,
                tjCompletelyloss: 0
            }

            function setScore() {
                $.post(window.apppath + "/admin/api/power/wcdfzsz/checkAbility", {}, function (res) {
                    if (res.success) {
                        var data = res.data;
                        bilityScore.cfNormal = data.cfNormal;
                        bilityScore.cfLightloss = data.cfLightloss;
                        bilityScore.cfMiddleloss = data.cfMiddleloss;
                        bilityScore.cfCompletelyloss = data.cfCompletelyloss;
                        bilityScore.cyNormal = data.cyNormal;
                        bilityScore.cyLightloss = data.cyLightloss;
                        bilityScore.cyMiddleloss = data.cyMiddleloss;
                        bilityScore.cyCompletelyloss = data.cyCompletelyloss;
                        bilityScore.rcNormal = data.rcNormal;
                        bilityScore.rcLightloss = data.rcLightloss;
                        bilityScore.rcMiddleloss = data.rcMiddleloss;
                        bilityScore.rcCompletelyloss = data.rcCompletelyloss;
                        bilityScore.snzdNormal = data.snzdNormal;
                        bilityScore.snzdLightloss = data.snzdLightloss;
                        bilityScore.snzdMiddleloss = data.snzdMiddleloss;
                        bilityScore.snzdCompletelyloss = data.snzdCompletelyloss;
                        bilityScore.xzNormal = data.xzNormal;
                        bilityScore.xzLightloss = data.xzLightloss;
                        bilityScore.xzMiddleloss = data.xzMiddleloss;
                        bilityScore.xzCompletelyloss = data.xzCompletelyloss;
                        bilityScore.dxbNormal = data.dxbNormal;
                        bilityScore.dxbLightloss = data.dxbLightloss;
                        bilityScore.dxbMiddleloss = data.dxbMiddleloss;
                        bilityScore.dxbCompletelyloss = data.dxbCompletelyloss;
                        bilityScore.jqjyNormal = data.jqjyNormal;
                        bilityScore.jqjyLightloss = data.jqjyLightloss;
                        bilityScore.jqjyMiddleloss = data.jqjyMiddleloss;
                        bilityScore.jqjyCompletelyloss = data.jqjyCompletelyloss;
                        bilityScore.cxjyNormal = data.cxjyNormal;
                        bilityScore.cxjyLightloss = data.cxjyLightloss;
                        bilityScore.cxjyMiddleloss = data.cxjyMiddleloss;
                        bilityScore.cxjyCompletelyloss = data.cxjyCompletelyloss;
                        bilityScore.dxjyNormal = data.dxjyNormal;
                        bilityScore.dxjyLightloss = data.dxjyLightloss;
                        bilityScore.dxjyMiddleloss = data.dxjyMiddleloss;
                        bilityScore.dxjyCompletelyloss = data.dxjyCompletelyloss;
                        bilityScore.pdnlNormal = data.pdnlNormal;
                        bilityScore.pdnlLightloss = data.pdnlLightloss;
                        bilityScore.pdnlMiddleloss = data.pdnlMiddleloss;
                        bilityScore.pdnlCompletelyloss = data.pdnlCompletelyloss;
                        bilityScore.qxNormal = data.qxNormal;
                        bilityScore.qxLightloss = data.qxLightloss;
                        bilityScore.qxMiddleloss = data.qxMiddleloss;
                        bilityScore.qxCompletelyloss = data.qxCompletelyloss;
                        bilityScore.xwNormal = data.xwNormal;
                        bilityScore.xwLightloss = data.xwLightloss;
                        bilityScore.xwMiddleloss = data.xwMiddleloss;
                        bilityScore.xwCompletelyloss = data.xwCompletelyloss;
                        bilityScore.gtNormal = data.gtNormal;
                        bilityScore.gtLightloss = data.gtLightloss;
                        bilityScore.gtMiddleloss = data.gtMiddleloss;
                        bilityScore.gtCompletelyloss = data.gtCompletelyloss;
                        bilityScore.sjNormal = data.sjNormal;
                        bilityScore.sjLightloss = data.sjLightloss;
                        bilityScore.sjMiddleloss = data.sjMiddleloss;
                        bilityScore.sjCompletelyloss = data.sjCompletelyloss;
                        bilityScore.tjNormal = data.tjNormal;
                        bilityScore.tjLightloss = data.tjLightloss;
                        bilityScore.tjMiddleloss = data.tjMiddleloss;
                        bilityScore.tjCompletelyloss = data.tjCompletelyloss;
                    } else {
                    }
                }, "json");
                $.post(window.apppath + "/admin/api/power/wcdfzsz/checkFull", {}, function (res) {
                    if (res.success) {
                        var data = res.data;
                        fullScore.oldman_name = data.oldman_name;
                        fullScore.id_card = data.id_card;
                        fullScore.oldman_preferential_card = data.oldman_preferential_card;
                        fullScore.phone1 = data.phone1;
                        fullScore.phone2 = data.phone2;
                        fullScore.oldman_photo = data.oldman_photo;
                        fullScore.degree_of_education = data.degree_of_education;
                        fullScore.conservation_time = data.conservation_time;
                        fullScore.domicile_address = data.domicile_address;
                        fullScore.now_address = data.now_address;
                        fullScore.emergency_contact1 = data.emergency_contact1;
                        fullScore.emergency_contact1_relatives = data.emergency_contact1_relatives;
                        fullScore.emergency_contact1_tel = data.emergency_contact1_tel;
                        fullScore.is_key1 = data.is_key1;
                        fullScore.emergency_contact2 = data.emergency_contact2;
                        fullScore.emergency_contact2_relatives = data.emergency_contact2_relatives;
                        fullScore.emergency_contact2_tel = data.emergency_contact2_tel;
                        fullScore.is_key2 = data.is_key2;
                        fullScore.emergency_contact3 = data.emergency_contact3;
                        fullScore.emergency_contact3_relatives = data.emergency_contact3_relatives;
                        fullScore.emergency_contact3_tel = data.emergency_contact3_tel;
                        fullScore.is_key3 = data.is_key3;
                        fullScore.oldman_zy = data.oldman_zy;
                        fullScore.oldman_category = data.oldman_category;
                        fullScore.special_object = data.special_object;
                        fullScore.sources_of_income = data.sources_of_income;
                        fullScore.status_of_children = data.status_of_children;
                        fullScore.medical_category = data.medical_category;
                        fullScore.residential_status = data.residential_status;
                        fullScore.housing_nature = data.housing_nature;
                        fullScore.habitable_room = data.habitable_room;
                        fullScore.floor_lift = data.floor_lift;
                        fullScore.residential_floor = data.residential_floor;
                        fullScore.indoor_toilet = data.indoor_toilet;
                        fullScore.indoor_bath_equipment = data.indoor_bath_equipment;
                        fullScore.care_situation = data.care_situation;
                        fullScore.government_purchase = data.government_purchase;
                        fullScore.services_requested = data.services_requested;
                        fullScore.physiclal_health_status = data.physiclal_health_status;
                        fullScore.physiclal_illness_status = data.physiclal_illness_status;
                        fullScore.physiclal_chronic_status = data.physiclal_chronic_status;
                        fullScore.psychologic_status = data.psychologic_status;
                        fullScore.social_activities = data.social_activities;
                        fullScore.social_activities_type = data.social_activities_type;
                        fullScore.day_activity1 = data.day_activity1;
                        fullScore.day_activity2 = data.day_activity2;
                        fullScore.day_activity3 = data.day_activity3;
                        fullScore.day_activity4 = data.day_activity4;
                        fullScore.day_activity5 = data.day_activity5;
                        fullScore.day_activity6 = data.day_activity6;
                        fullScore.day_activity7 = data.day_activity7;
                        fullScore.cognitive_ability1 = data.cognitive_ability1;
                        fullScore.cognitive_ability2 = data.cognitive_ability2;
                        fullScore.cognitive_ability3 = data.cognitive_ability3;
                        fullScore.cognitive_ability4 = data.cognitive_ability4;
                        fullScore.mood_action1 = data.mood_action1;
                        fullScore.mood_action2 = data.mood_action2;
                        fullScore.mood_action3 = data.mood_action3;
                        fullScore.audiovisual1 = data.audiovisual1;
                        fullScore.audiovisual2 = data.audiovisual2;
                        fullScore.areaId = data.areaId;
                        fullScore.community = data.community;
                        fullScore.sign = data.sign;
                        fullScore.judge_sign = data.judge_sign;

                    } else {
                    }
                }, "json");
            }


            jQuery(document).ready(function () {
                window.apppath = "${pageContext.request.contextPath }";
                Metronic.init();
                Layout.init();
                setScore();
                if ($("#oldmanPhoto").val() == null || $("#oldmanPhoto").val() == "") {
                    $("#oldmanPhotoDiv").show();
                } else {
                    $("#oldmanPhotoDiv").hide();
                }
                if ($("#sign").val() == null || $("#sign").val() == "") {
                    $("#signDiv").css("display", "inline-block");
                } else {
                    $("#signDiv").hide();
                }
                if ($("#judgeSign").val() == null || $("#judgeSign").val() == "") {
                    $("#judgeSignDiv").css("display", "inline-block");
                } else {
                    $("#judgeSignDiv").hide();
                }
            });
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


            $("#serviceOrgAddForm .search").click(function () {
                var cardNo = $("input[name=idCard]").val();
                if (cardNo != null & cardNo != "") {
                    validateIdCard();
                }
                else {
                    alert("请输入身份证号码");
                }
            });

            function validateIdCard() {
                var idnum = $("input[name=idCard]").val();
                if (idnum.trim() != "") {
                    $.ajax({
                        url: window.apppath + '/admin/api/power/oldmancard/find',
                        data: {idNumber: idnum.trim()},
                        type: 'post',
                        dataType: 'json',
                        success: function (data) {
                            var result = data.success;
                            if (!result) {
                                $("#oldmanId").val("");
                                $("#oldmanName").val("");
                                alert(data.message);
                            } else {
                                alert(data.message);
                                $("#oldmanId").val(data.data.id);
                                $("#oldmanName").val(data.data.elderName);
                                $("#phone1").val(data.data.homeTel);
                                $("#phone2").val(data.data.mobile);
                                $("#oldmanPhoto").val(data.data.photo);
                                $("#oldmanPhotoimg").attr("src", data.data.photo);
                                // $("#conservationTime").val(data.data.elderName);
                                $("#domicileAddress").val(data.data.regPlace);
                                $("#nowAddress").val(data.data.realAddress);
                                $("#elderId").val(data.data.id);
                            }
                        }
                    })

                }
            }

            function save() {
                var cardNo = $("input[name=idCard]").val();
                if (cardNo == null || cardNo == "") {
                    alert("请输入身份证号码");
                    return;
                }
                // var oldmanId = $("input[name=oldmanId]").val();
                // if (oldmanId == null ||oldmanId == "") {
                //     alert("老人不存在！");
                //     return;
                // }

                var fuscore = 0;
                var biliscore = 0;

                if ($("input[name=oldmanName]").val().trim() != "") {
                    fuscore += fullScore.oldman_name;
                }
                if ($("input[name=idCard]").val().trim() != "") {
                    fuscore += fullScore.id_card;
                }
                if ($("input[name=phone1]").val().trim() != "") {
                    fuscore += fullScore.phone1;
                }
                if ($("input[name=phone2]").val().trim() != "") {
                    fuscore += fullScore.phone2;
                }
                if ($("input[name=oldmanPhoto]").val().trim() != "") {
                    fuscore += fullScore.oldman_photo;
                }
                if ($("#degreeOfEducation").val() != "0") {
                    fuscore += fullScore.degree_of_education;
                }
                if ($("#conservationTime").val() != "0") {
                    fuscore += fullScore.conservation_time;
                }
                if ($("input[name=domicileAddress]").val().trim() != "") {
                    fuscore += fullScore.domicile_address;
                }
                if ($("input[name=nowAddress]").val().trim() != "") {
                    fuscore += fullScore.now_address;
                }
                if ($("input[name=emergencyContact1]").val().trim() != "0") {
                    fuscore += fullScore.emergency_contact1;
                }
                if ($("input[name=emergencyContact1Relatives]").val().trim() != "0") {
                    fuscore += fullScore.emergency_contact1_relatives;
                }
                if ($("input[name=emergencyContact1Tel]").val().trim() != "0") {
                    fuscore += fullScore.emergency_contact1_tel;
                }
                if ($("#isKey1").val() != "0") {
                    fuscore += fullScore.is_key1;
                }
                if ($("input[name=emergencyContact2]").val().trim() != "0") {
                    fuscore += fullScore.emergency_contact2;
                }
                if ($("input[name=emergencyContact2Relatives]").val().trim() != "0") {
                    fuscore += fullScore.emergency_contact2_relatives;
                }
                if ($("input[name=emergencyContact2Tel]").val().trim() != "0") {
                    fuscore += fullScore.emergency_contact2_tel;
                }
                if ($("#isKey2").val() != "0") {
                    fuscore += fullScore.is_key2;
                }
                if ($("input[name=emergencyContact3]").val().trim() != "0") {
                    fuscore += fullScore.emergency_contact3;
                }
                if ($("input[name=emergencyContact3Relatives]").val().trim() != "0") {
                    fuscore += fullScore.emergency_contact3_relatives;
                }
                if ($("input[name=emergencyContact3Tel]").val().trim() != "0") {
                    fuscore += fullScore.emergency_contact3_tel;
                }
                if ($("#isKey3").val() != "0") {
                    fuscore += fullScore.is_key3;
                }
                if ($("#oldmanZy").val() != "0") {
                    fuscore += fullScore.oldman_zy;
                }
                if ($("#oldmanCategory").val() != "0") {
                    fuscore += fullScore.oldman_category;
                }
                if ($("#specialObject").val() != "0") {
                    fuscore += fullScore.special_object;
                }
                if ($("#sourcesOfIncome").val() != "0") {
                    fuscore += fullScore.sources_of_income;
                }
                if ($("#statusOfChildren").val() != "0") {
                    fuscore += fullScore.status_of_children;
                }
                if ($("#medicalCategory").val() != "0") {
                    fuscore += fullScore.medical_category;
                }
                if ($("#residentialStatus").val() != "0") {
                    fuscore += fullScore.residential_status;
                }
                if ($("#housingNature").val() != "0") {
                    fuscore += fullScore.housing_nature;
                }
                if ($("#habitableRoom").val() != "0") {
                    fuscore += fullScore.habitable_room;
                }
                if ($("#floorLift").val() != "0") {
                    fuscore += fullScore.floor_lift;
                }
                if ($("#residentialFloor").val() != "0") {
                    fuscore += fullScore.residential_floor;
                }
                if ($("#indoorToilet").val() != "0") {
                    fuscore += fullScore.indoor_toilet;
                }
                if ($("#indoorBathEquipment").val() != "0") {
                    fuscore += fullScore.indoor_bath_equipment;
                }
                if ($("#careSituation").val() != "0") {
                    fuscore += fullScore.care_situation;
                }
                if ($("#governmentPurchase").val() != "0") {
                    fuscore += fullScore.government_purchase;
                }
                if ($("#servicesRequested").val() != "0") {
                    fuscore += fullScore.services_requested;
                }
                if ($("#physiclalHealthStatus").val() != "0") {
                    fuscore += fullScore.physiclal_health_status;
                }
                if ($("#physiclalIllnessStatus").val() != "0") {
                    fuscore += fullScore.physiclal_illness_status;
                }
                if ($("#physiclalChronicStatus").val() != "0") {
                    fuscore += fullScore.physiclal_chronic_status;
                }
                if ($("#psychologicStatus").val() != "0") {
                    fuscore += fullScore.psychologic_status;
                }
                if ($("#socialActivities").val() != "0") {
                    fuscore += fullScore.social_activities;
                }
                if ($("#socialActivitiesType").val() != "0") {
                    fuscore += fullScore.social_activities_type;
                }
                if ($("#dayActivity1").val() != "0") {
                    fuscore += fullScore.day_activity1;
                }
                if ($("#dayActivity2").val() != "0") {
                    fuscore += fullScore.day_activity2;
                }
                if ($("#dayActivity3").val() != "0") {
                    fuscore += fullScore.day_activity3;
                }
                if ($("#dayActivity4").val() != "0") {
                    fuscore += fullScore.day_activity4;
                }
                if ($("#dayActivity5").val() != "0") {
                    fuscore += fullScore.day_activity5;
                }
                if ($("#dayActivity6").val() != "0") {
                    fuscore += fullScore.day_activity6;
                }
                if ($("#dayActivity7").val() != "0") {
                    fuscore += fullScore.day_activity7;
                }
                if ($("#cognitiveAbility1").val() != "0") {
                    fuscore += fullScore.cognitive_ability1;
                }
                if ($("#cognitiveAbility2").val() != "0") {
                    fuscore += fullScore.cognitive_ability2;
                }
                if ($("#cognitiveAbility3").val() != "0") {
                    fuscore += fullScore.cognitive_ability3;
                }
                if ($("#cognitiveAbility4").val() != "0") {
                    fuscore += fullScore.cognitive_ability4;
                }
                if ($("#moodAction1").val() != "0") {
                    fuscore += fullScore.mood_action1;
                }
                if ($("#moodAction2").val() != "0") {
                    fuscore += fullScore.mood_action2;
                }
                if ($("#moodAction3").val() != "0") {
                    fuscore += fullScore.mood_action3;
                }
                if ($("#audiovisual1").val() != "0") {
                    fuscore += fullScore.audiovisual1;
                }
                if ($("#audiovisual2").val() != "0") {
                    fuscore += fullScore.audiovisual2;
                }
                if ($("input[name=areaName]").val().trim() != "") {
                    fuscore += fullScore.areaId;
                }
                if ($("input[name=community]").val().trim() != "") {
                    fuscore += fullScore.community;
                }
                if ($("input[name=sign]").val().trim() != "") {
                    fuscore += fullScore.sign;
                }
                if ($("input[name=judgeSign]").val().trim() != "") {
                    fuscore += fullScore.judge_sign;
                }

                var cf = $("#dayActivity1").val();
                if (cf == "1") {
                    biliscore += bilityScore.cfNormal;
                } else if (cf == "2") {
                    biliscore += bilityScore.cfLightloss
                } else if (cf == "3") {
                    biliscore += bilityScore.cfMiddleloss;
                } else if (cf == "4") {
                    biliscore += bilityScore.cfCompletelyloss;
                } else {
                    biliscore = biliscore;
                }
                var cy = $("#dayActivity2").val();
                if (cy == "1") {
                    biliscore += bilityScore.cyNormal;
                } else if (cy == "2") {
                    biliscore += bilityScore.cyLightloss
                } else if (cy == "3") {
                    biliscore += bilityScore.cyMiddleloss;
                } else if (cy == "4") {
                    biliscore += bilityScore.cyCompletelyloss;
                } else {
                    biliscore = biliscore;
                }
                //待增
                // var  sxc=$("#dayActivity3").val();
                // if(sxc=="1"){
                //     biliscore+=bilityScore.sxcNormal;
                // }else if(sxc=="2"){
                //     biliscore+=bilityScore.sxcLightloss
                // }else if(sxc=="3"){
                //     biliscore+=bilityScore.sxcMiddleloss;
                // }else if(sxc=="4"){
                //     biliscore+=bilityScore.sxcCompletelyloss;
                // }else{
                //     biliscore=biliscore;
                // }
                var rc = $("#dayActivity4").val();
                if (rc == "1") {
                    biliscore += bilityScore.rcNormal;
                } else if (rc == "2") {
                    biliscore += bilityScore.rcLightloss
                } else if (rc == "3") {
                    biliscore += bilityScore.rcMiddleloss;
                } else if (rc == "4") {
                    biliscore += bilityScore.rcCompletelyloss;
                } else {
                    biliscore = biliscore;
                }
                var snzd = $("#dayActivity5").val();
                if (snzd == "1") {
                    biliscore += bilityScore.snzdNormal;
                } else if (snzd == "2") {
                    biliscore += bilityScore.snzdLightloss
                } else if (snzd == "3") {
                    biliscore += bilityScore.snzdMiddleloss;
                } else if (snzd == "4") {
                    biliscore += bilityScore.snzdCompletelyloss;
                } else {
                    biliscore = biliscore;
                }
                var xz = $("#dayActivity6").val();
                if (xz == "1") {
                    biliscore += bilityScore.xzNormal;
                } else if (xz == "2") {
                    biliscore += bilityScore.xzLightloss
                } else if (xz == "3") {
                    biliscore += bilityScore.xzMiddleloss;
                } else if (xz == "4") {
                    biliscore += bilityScore.xzCompletelyloss;
                } else {
                    biliscore = biliscore;
                }
                var dxb = $("#dayActivity7").val();
                if (dxb == "1") {
                    biliscore += bilityScore.dxbNormal;
                } else if (dxb == "2") {
                    biliscore += bilityScore.dxbLightloss
                } else if (dxb == "3") {
                    biliscore += bilityScore.dxbMiddleloss;
                } else if (dxb == "4") {
                    biliscore += bilityScore.dxbCompletelyloss;
                } else {
                    biliscore = biliscore;
                }
                var dxb = $("#dayActivity7").val();
                if (dxb == "1") {
                    biliscore += bilityScore.dxbNormal;
                } else if (dxb == "2") {
                    biliscore += bilityScore.dxbLightloss
                } else if (dxb == "3") {
                    biliscore += bilityScore.dxbMiddleloss;
                } else if (dxb == "4") {
                    biliscore += bilityScore.dxbCompletelyloss;
                } else {
                    biliscore = biliscore;
                }
                var jqjy = $("#cognitiveAbility1").val();
                if (jqjy == "1") {
                    biliscore += bilityScore.jqjyNormal;
                } else if (jqjy == "2") {
                    biliscore += bilityScore.jqjyLightloss
                } else if (jqjy == "3") {
                    biliscore += bilityScore.jqjyMiddleloss;
                } else if (jqjy == "4") {
                    biliscore += bilityScore.jqjyCompletelyloss;
                } else {
                    biliscore = biliscore;
                }
                var cxjy = $("#cognitiveAbility2").val();
                if (cxjy == "1") {
                    biliscore += bilityScore.cxjyNormal;
                } else if (cxjy == "2") {
                    biliscore += bilityScore.cxjyLightloss
                } else if (cxjy == "3") {
                    biliscore += bilityScore.cxjyMiddleloss;
                } else if (cxjy == "4") {
                    biliscore += bilityScore.cxjyCompletelyloss;
                } else {
                    biliscore = biliscore;
                }
                var dxjy = $("#cognitiveAbility3").val();
                if (dxjy == "1") {
                    biliscore += bilityScore.dxjyNormal;
                } else if (dxjy == "2") {
                    biliscore += bilityScore.dxjyLightloss
                } else if (dxjy == "3") {
                    biliscore += bilityScore.dxjyMiddleloss;
                } else if (dxjy == "4") {
                    biliscore += bilityScore.dxjyCompletelyloss;
                } else {
                    biliscore = biliscore;
                }
                var pdnl = $("#cognitiveAbility4").val();
                if (pdnl == "1") {
                    biliscore += bilityScore.pdnlNormal;
                } else if (pdnl == "2") {
                    biliscore += bilityScore.pdnlLightloss
                } else if (pdnl == "3") {
                    biliscore += bilityScore.pdnlMiddleloss;
                } else if (pdnl == "4") {
                    biliscore += bilityScore.pdnlCompletelyloss;
                } else {
                    biliscore = biliscore;
                }
                var qx = $("#moodAction1").val();
                if (qx == "1") {
                    biliscore += bilityScore.qxNormal;
                } else if (qx == "2") {
                    biliscore += bilityScore.qxLightloss
                } else if (qx == "3") {
                    biliscore += bilityScore.qxMiddleloss;
                } else if (qx == "4") {
                    biliscore += bilityScore.qxCompletelyloss;
                } else {
                    biliscore = biliscore;
                }
                var xw = $("#moodAction2").val();
                if (xw == "1") {
                    biliscore += bilityScore.xwNormal;
                } else if (xw == "2") {
                    biliscore += bilityScore.xwLightloss
                } else if (xw == "3") {
                    biliscore += bilityScore.xwMiddleloss;
                } else if (xw == "4") {
                    biliscore += bilityScore.xwCompletelyloss;
                } else {
                    biliscore = biliscore;
                }
                var gt = $("#moodAction3").val();
                if (gt == "1") {
                    biliscore += bilityScore.gtNormal;
                } else if (gt == "2") {
                    biliscore += bilityScore.gtLightloss
                } else if (gt == "3") {
                    biliscore += bilityScore.gtMiddleloss;
                } else if (gt == "4") {
                    biliscore += bilityScore.gtCompletelyloss;
                } else {
                    biliscore = biliscore;
                }
                var sj = $("#audiovisual1").val();
                if (sj == "1") {
                    biliscore += bilityScore.sjNormal;
                } else if (sj == "2") {
                    biliscore += bilityScore.sjLightloss
                } else if (sj == "3") {
                    biliscore += bilityScore.sjMiddleloss;
                } else if (sj == "4") {
                    biliscore += bilityScore.sjCompletelyloss;
                } else {
                    biliscore = biliscore;
                }
                var tj = $("#audiovisual2").val();
                if (tj == "1") {
                    biliscore += bilityScore.tjNormal;
                } else if (tj == "2") {
                    biliscore += bilityScore.tjLightloss
                } else if (tj == "3") {
                    biliscore += bilityScore.tjMiddleloss;
                } else if (tj == "4") {
                    biliscore += bilityScore.tjCompletelyloss;
                } else {
                    biliscore = biliscore;
                }
                var oldmanPhoto = $.trim($("input[name=oldmanPhoto]").val());
                $.post(window.apppath + "/admin/api/power/wcdfzsz/ElderCapacityAdd", {
                    id: $.trim($("input[name=id]").val()),
                    oldmanId: $.trim($("input[name=oldmanId]").val()),
                    oldmanName: $.trim($("input[name=oldmanName]").val()),
                    idCard: $.trim($("input[name=idCard]").val()),
                    phone1: $.trim($("input[name=phone1]").val()),
                    phone2: $.trim($("input[name=phone2]").val()),
                    oldmanPhoto: oldmanPhoto,
                    degreeOfEducation: $.trim($("select[name=degreeOfEducation]").val()),
                    conservationTime: $.trim($("select[name=conservationTime]").val()),
                    domicileAddress: $.trim($("input[name=domicileAddress]").val()),
                    nowAddress: $.trim($("input[name=nowAddress]").val()),
                    emergencyContact1: $.trim($("input[name=emergencyContact1]").val()),
                    emergencyContact1Relatives: $.trim($("input[name=emergencyContact1Relatives]").val()),
                    emergencyContact1Tel: $.trim($("input[name=emergencyContact1Tel]").val()),
                    isKey1: $.trim($("select[name=isKey1]").val()),
                    emergencyContact2: $.trim($("input[name=emergencyContact2]").val()),
                    emergencyContact2Relatives: $.trim($("input[name=emergencyContact2Relatives]").val()),
                    emergencyContact2Tel: $.trim($("input[name=emergencyContact2Tel]").val()),
                    isKey2: $.trim($("select[name=isKey2]").val()),
                    emergencyContact3: $.trim($("input[name=emergencyContact3]").val()),
                    emergencyContact3Relatives: $.trim($("input[name=emergencyContact3Relatives]").val()),
                    emergencyContact3Tel: $.trim($("input[name=emergencyContact3Tel]").val()),
                    isKey3: $.trim($("select[name=isKey3]").val()),
                    oldmanZy: $.trim($("select[name=oldmanZy]").val()),
                    oldmanCategory: $.trim($("select[name=oldmanCategory]").val()),
                    specialObject: $.trim($("select[name=specialObject]").val()),
                    sourcesOfIncome: $.trim($("select[name=sourcesOfIncome]").val()),
                    statusOfChildren: $.trim($("select[name=statusOfChildren]").val()),
                    medicalCategory: $.trim($("select[name=medicalCategory]").val()),
                    residentialStatus: $.trim($("select[name=residentialStatus]").val()),
                    housingNature: $.trim($("select[name=housingNature]").val()),
                    habitableRoom: $.trim($("select[name=habitableRoom]").val()),
                    floorLift: $.trim($("select[name=floorLift]").val()),
                    residentialFloor: $.trim($("select[name=residentialFloor]").val()),
                    indoorToilet: $.trim($("select[name=indoorToilet]").val()),
                    indoorBathEquipment: $.trim($("select[name=indoorBathEquipment]").val()),
                    careSituation: $.trim($("select[name=careSituation]").val()),
                    governmentPurchase: $.trim($("select[name=governmentPurchase]").val()),
                    servicesRequested: $.trim($("select[name=servicesRequested]").val()),
                    physiclalHealthStatus: $.trim($("select[name=physiclalHealthStatus]").val()),
                    physiclalIllnessStatus: $.trim($("select[name=physiclalIllnessStatus]").val()),
                    physiclalChronicStatus: $.trim($("select[name=physiclalChronicStatus]").val()),
                    psychologicStatus: $.trim($("select[name=psychologicStatus]").val()),
                    socialActivities: $.trim($("select[name=socialActivities]").val()),
                    socialActivitiesType: $.trim($("select[name=socialActivitiesType]").val()),
                    dayActivity1: $.trim($("select[name=dayActivity1]").val()),
                    dayActivity2: $.trim($("select[name=dayActivity2]").val()),
                    dayActivity3: $.trim($("select[name=dayActivity3]").val()),
                    dayActivity4: $.trim($("select[name=dayActivity4]").val()),
                    dayActivity5: $.trim($("select[name=dayActivity5]").val()),
                    dayActivity6: $.trim($("select[name=dayActivity6]").val()),
                    dayActivity7: $.trim($("select[name=dayActivity7]").val()),
                    cognitiveAbility1: $.trim($("select[name=cognitiveAbility1]").val()),
                    cognitiveAbility2: $.trim($("select[name=cognitiveAbility2]").val()),
                    cognitiveAbility3: $.trim($("select[name=cognitiveAbility3]").val()),
                    cognitiveAbility4: $.trim($("select[name=cognitiveAbility4]").val()),
                    moodAction1: $.trim($("select[name=moodAction1]").val()),
                    moodAction2: $.trim($("select[name=moodAction2]").val()),
                    moodAction3: $.trim($("select[name=moodAction3]").val()),
                    audiovisual1: $.trim($("select[name=audiovisual1]").val()),
                    audiovisual2: $.trim($("select[name=audiovisual2]").val()),
                    areaName: $.trim($("input[name=areaName]").val()),
                    community: $.trim($("input[name=community]").val()),
                    sign: $.trim($("input[name=sign]").val()),
                    judgeSign: $.trim($("input[name=judgeSign]").val()),
                    infoIntegrity: fuscore,
                    bilityCount: biliscore,
                    elderId: $("#elderId").val()
                }, function (res) {
                    if (res.success) {
                        $("#labelmsg").text(res.message).addClass("label-success");
                        setTimeout(function () {
                            window.location.reload();
                            window.parent.updateTab('lrpggl-nlpglb');
                        }, 1000);
                    } else {
                        $("#labelmsg").text(res.message).addClass("label-danger");
                    }
                }, "json");
            }

            function UploadFileService(path, id, name) {
                var fileName = $("#" + id).val();
                if (fileName == null || fileName == "") {
                    return false;
                }
                $.ajaxFileUpload({
                    url: window.apppath + "/file/uploadFiles?path=" + path + "&createThumbnail=true&thumbnailWidth=60&thumbnailHeight=60",
                    secureuri: false,
                    fileElementId: id,//file控件id
                    dataType: 'json',
                    success: function (data, status) {
                        if (data.error == 0) {
                            $("#toggleDiv").hide();
                            fileName = fileName.substr(fileName.lastIndexOf("\\") + 1, fileName.length - 1);
                            var html = "";
                            if (!(/\.(jpe?g|gif|png|ico)$/i).test(fileName)) {
                                html = "<label class='uploadFile' style='margin: 0px;    vertical-align: top'>" + fileName + "<a style='text-decoration: none,display: none' data='" + data.url + "' class='remove removeFile'>&times;</a></label>"
                            }
                            else {
                                var path = data.url.substr(0, data.url.lastIndexOf(".")) + "_60_60" + data.url.substr(data.url.lastIndexOf("."))
                                html = "<div class='file-div''><img class='uploadImg' src='" + window.apppath + path + "'><a style='text-decoration: none;display: none' data='" + data.url + "' class=' remove removeImg'></a></div>"
                            }
                            $("." + id + "").html(html);
                            $(".remove").click(function () {
                                var url = $(this).attr("data");
                                $(this).parent().remove();
                                var urls = $("#" + name).val();
                                urls = urls.replace(url + ",", "")
                                $("#" + name).val(urls);
                                $("#toggleDiv").show();
                            });
                            $(".uploadImg").hover(function () {
                                $(this).parent().find(".remove").css("display", "inherit");
                            })
                            $(".uploadFile").hover(function () {
                                $(this).parent().find(".remove").css("display", "inherit");
                            })
                            $(".remove").hover(function () {
                            }, function () {
                                $(this).hide();
                            })
                            $("#" + id).val("");
                            $("#" + name).val(path);
                        }
                    }
                });
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

