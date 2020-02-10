<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb"%>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>能力评估详细信息</title>
    </tiles:putAttribute>
    <c:choose>
        <c:when test="${method=='show'}">
            <c:set var="title1" value="active"></c:set>
        </c:when>
        <c:when test="${method=='edit'}">
            <c:set var="title2" value="active"></c:set>
        </c:when>
    </c:choose>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <style type="text/css">
            .table1{
                border-top: 1px solid #000;
                border-left: 1px solid #000;
            }
            .table1 td
            {
                padding: 5px;
                border-bottom: 1px solid #000;
                border-right: 1px solid #000;
            }
            .table3
            {
                border-top: 1px solid #000;
                border-left: 1px solid #000;
            }
            .table3 td
            {
                padding: 5px;
                border-bottom: 1px solid #000;
                border-right: 1px solid #000;
            }
            .table4
            {
                border-top: 1px solid #000;
                border-left: 1px solid #000;
            }
            .table4 td
            {
                padding: 5px;
                border-bottom: 1px solid #000;
                border-right: 1px solid #000;
            }
            input
            {
                border: none;
            }
            .input
            {
                border: none;
                border-bottom: 1px solid #000;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">
        <!-- BEGIN CONTENT -->
                <!-- BEGIN PAGE HEADER-->
                <div class="page-bar">
                    <ul class="page-breadcrumb">
                        <li>
                            <i class="fa fa-home"></i>
                            <a href="#">当前位置</a>
                            <i class="fa fa-angle-right"></i>
                        </li>
                        <li>
                            <a href="#">老人信息管理系统</a>
                            <i class="fa fa-angle-right"></i>
                        </li>
                        <li>
                            <a href="#">能力评估信息</a>
                            <i class="fa fa-angle-right"></i>
                        </li>
                        <li>
                            <a href="#">能力评估详细信息</a>
                        </li>
                    </ul>
                </div>
                <!-- END PAGE HEADER-->
                <!-- BEGIN PAGE CONTENT-->
                <div class="row">
                    <div class="col-md-12">
                        <!-- BEGIN PROFILE CONTENT -->
                        <div class="profile-content">
                            <div class="row" >
                                <div class="col-md-12">
                                    <div class="portlet " style="padding-top: 0px !important;">
                                        <div class="portlet-title">
                                            <div class="caption">
                                                <i class="icon-equalizer font-purple-plum hide"></i>
                                                <c:choose>
                                                    <c:when test="${method=='show'}">
                                                        <span class="caption-subject font-red-sunglo bold uppercase">评估详细信息</span>
                                                    </c:when>
                                                    <c:when test="${method=='edit'}">
                                                        <span class="caption-subject font-red-sunglo bold uppercase">评估信息录入</span>
                                                    </c:when>
                                                </c:choose>
                                            </div>
                                            <div class="tools">
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                            <div class="tab-content">
                                                <!-- PERSONAL INFO TAB -->
                                                <div class="tab-pane ${title1}" id="tab_1_1">
                                                    <form id="assShowForm" name="assShowForm" method="post" role="form">
                                                        <div align="center">
                                                                <table width="990px" cellpadding="5" cellspacing="0">
                                                                    <tr>
                                                                        <td colspan="6" align="center">
                                                                            <font style="font-size: 25px;font-weight: bold;" >
                                                                                老年人能力评估表
                                                                            </font>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="6" align="right">
                                                                            编号：
                                                                            <input type="text" name="tid" value="${elderlyAssessment.tid}" class="input" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <table width="990px" cellpadding="0" cellspacing="0" class="table1">
                                                                    <tr>
                                                                        <td colspan="6" align="center">
                                                                            <font>一、基本情况（街道审核确认）</font>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="6" align="left">
                                                                            <input type="text" size="10" value="${elderlyMsg.region1}" class="input" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                            区
                                                                            <input type="text" size="10" value="${elderlyMsg.region2}" class="input" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                            街道（镇）
                                                                            <input type="text" size="15" value="${elderlyMsg.region3}" class="input" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                            社区（村）
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="90" rowspan="2" align="center">姓名</td>
                                                                        <td rowspan="2" width="208" >
                                                                            <input type="text" value="${elderlyMsg.elderName}" size="20" style="width: 100%; text-align:center; vertical-align:middle;background-color: #f7f7f7;" readonly="readonly" />
                                                                        </td>
                                                                        <td rowspan="2" align="center" width="156">
                                                                            身份
                                                                            <br />
                                                                            证号
                                                                        </td>
                                                                        <td width="246" rowspan="2">
                                                                            <input type="text" value="${elderlyMsg.idcardno}" style="width: 180px;;background-color: #f7f7f7;" onkeypress="queryElder(1, 1)" readonly="readonly" />
                                                                        </td>
                                                                        <td width="78" align="center">固话</td>
                                                                        <td width="210">
                                                                            <input type="text" value="${elderlyMsg.homeTel}" size="11" border="0" style="width: 100%;;background-color: #f7f7f7;" readonly="readonly" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">手机</td>
                                                                        <td>
                                                                            <input type="text" value="${elderlyMsg.mobile}" size="11" border="0" style="width: 100%;;background-color: #f7f7f7;" onkeypress="queryElder(2,1)" readonly="readonly" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">
                                                                            文化
                                                                            <br />
                                                                            程度
                                                                        </td>
                                                                        <td align="left">
                                                                            <lb:select value="${elderlyMsg.educationDictId}"
                                                                                       readOnly="true" style=";background-color: #f7f7f7;">
                                                                                <lb:option value="1">文盲</lb:option>
                                                                                <lb:option value="2">小学</lb:option>
                                                                                <lb:option value="3">初中</lb:option>
                                                                                <lb:option value="4">高中和中专</lb:option>
                                                                                <lb:option value="5">大专</lb:option>
                                                                                <lb:option value="6">本科及以上</lb:option>
                                                                                <lb:option value="0">其他</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td align="center">
                                                                            户籍
                                                                            <br />
                                                                            地址
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" value="${elderlyMsg.regPlace}" size="25" style="width: 100%;;background-color: #f7f7f7;" readonly="readonly" />
                                                                        </td>
                                                                        <td align="center">常住</td>
                                                                        <td align="left">
                                                                            <input type="radio" value="1"  <c:if test="${elderlyMsg.liveYearDictId eq 1}">checked</c:if> style=";background-color: #f7f7f7;" />
                                                                            一年以下
                                                                            <br />
                                                                            <input type="radio" value="2" <c:if test="${elderlyMsg.liveYearDictId eq 2}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            一年以上
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">住址</td>
                                                                        <td colspan="5">
                                                                            <input type="text" style="width:100%;background-color: #f7f7f7;" value="${elderlyMsg.realAddress}" readonly="readonly" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td rowspan="2" align="center">人员类别</td>
                                                                        <td rowspan="2" colspan="5" align="left">
                                                                            <input type="hidden" id="elderTypeDictIds" value="${elderlyMsg.elderTypeDictIds}">
                                                                            <input type="checkbox" name="elderTypeDictIds" value="1" disabled="disabled" style=";background-color: #f7f7f7;"/>城市特困/农村特困
                                                                            <input type="checkbox" name="elderTypeDictIds" value="2" disabled="disabled" style=";background-color: #f7f7f7;"/>低保/低保边缘
                                                                            <input type="checkbox" name="elderTypeDictIds" value="3" disabled="disabled" style=";background-color: #f7f7f7;"/>经济困难的失能/半失能老人
                                                                            <input type="checkbox" name="elderTypeDictIds" value="4" disabled="disabled" style=";background-color: #f7f7f7;"/>70周岁及以上的计生特扶老人
                                                                            <input type="checkbox" name="elderTypeDictIds" value="5" disabled="disabled" style=";background-color: #f7f7f7;"/>百岁老人
                                                                            <input type="checkbox" name="elderTypeDictIds" value="9" disabled="disabled" style=";background-color: #f7f7f7;"/>空巢
                                                                            <input type="checkbox" name="elderTypeDictIds" value="10" disabled="disabled" style=";background-color: #f7f7f7;"/>独居

                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                                <br />
                                                                <table width="990px" cellpadding="0" cellspacing="0" class="table2">
                                                                    <tr>
                                                                        <td align="left">
                                                                            街道审定人：
                                                                            <input type="text" name="audit1" value="${elderlyAssessment.audit1}" size="15" class="input" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                            日期：
                                                                            <input type="text" name="auditDate1" value="${elderlyAssessment.auditDate1}" size="10" class="input" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                                <br />
                                                                <table width="990px" border="0" class="table3" cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td colspan="8" align="center">二、社会生活环境参数（申请人填写）</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="8" align="center">联系人</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center" width="120px">对象</td>
                                                                        <td align="center" width="120px">姓名</td>
                                                                        <td colspan="2" align="center">与老人关系</td>
                                                                        <td colspan="2" align="center">联系方式</td>
                                                                        <td colspan="2" align="center">是否有老人钥匙</td>
                                                                    </tr>
                                                                    <%--<tr>--%>
                                                                        <%--<td align="center" width="120px">--%>
                                                                            <%--联系人1--%>
                                                                            <%--<br />--%>
                                                                            <%--（直系亲属）--%>
                                                                        <%--</td>--%>
                                                                        <%--<td align="center">--%>
                                                                            <%--<input type="text" value="${elderlyMsg.linkManName1}" style="width:100%;background-color: #f7f7f7;" readonly="readonly" />--%>
                                                                        <%--</td>--%>
                                                                        <%--<td colspan="2" align="center">--%>
                                                                            <%--<input type="text" value="${elderlyMsg.directRelaRelation}" style="width:100%;background-color: #f7f7f7;" readonly="readonly" />--%>
                                                                        <%--</td>--%>
                                                                        <%--<td colspan="2" align="center">--%>
                                                                            <%--<input type="text" value="${elderlyMsg.linkManMobile1}" style="width:100%;background-color: #f7f7f7;" readonly="readonly" />--%>
                                                                        <%--</td>--%>
                                                                        <%--<td colspan="2" align="center">--%>
                                                                            <%--<input type="radio" value="1" <c:if test="${elderlyMsg.linkManHavekey1 eq 1}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />--%>
                                                                            <%--有--%>
                                                                            <%--<input type="radio" value="0" <c:if test="${elderlyMsg.linkManHavekey1 eq 0}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />--%>
                                                                            <%--无--%>
                                                                        <%--</td>--%>
                                                                    <%--</tr>--%>
                                                                    <%--<tr>--%>
                                                                        <%--<td align="center">联系人2</td>--%>
                                                                        <%--<td align="center">--%>
                                                                            <%--<input type="text" value="${elderlyMsg.linkManName2}" style="width:100%;background-color: #f7f7f7;" readonly="readonly" />--%>
                                                                        <%--</td>--%>
                                                                        <%--<td colspan="2" align="center">--%>
                                                                            <%--<input type="text" value="${elderlyMsg.linkManRelation2}" style="width:100%;background-color: #f7f7f7;" readonly="readonly" />--%>
                                                                        <%--</td>--%>
                                                                        <%--<td colspan="2" align="center">--%>
                                                                            <%--<input type="text" value="${elderlyMsg.linkManMobile2}" style="width:100%;background-color: #f7f7f7;" readonly="readonly" />--%>
                                                                        <%--</td>--%>
                                                                        <%--<td colspan="2" align="center">--%>
                                                                            <%--<input type="radio" value="1" <c:if test="${elderlyMsg.linkManHavekey2 eq 1}">checked</c:if>  disabled="disabled" style=";background-color: #f7f7f7;" />--%>
                                                                            <%--有--%>
                                                                            <%--<input type="radio" value="0" <c:if test="${elderlyMsg.linkManHavekey2 eq 0}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />--%>
                                                                            <%--无--%>
                                                                        <%--</td>--%>
                                                                    <%--</tr>--%>
                                                                    <%--<tr>--%>
                                                                        <%--<td align="center">联系人3</td>--%>
                                                                        <%--<td align="center">--%>
                                                                            <%--<input type="text" value="${elderlyMsg.linkManName3}" style="width:100%;background-color: #f7f7f7;" readonly="readonly" />--%>
                                                                        <%--</td>--%>
                                                                        <%--<td colspan="2" align="center">--%>
                                                                            <%--<input type="text" value="${elderlyMsg.linkManRelation3}" style="width:100%;background-color: #f7f7f7;" readonly="readonly" />--%>
                                                                        <%--</td>--%>
                                                                        <%--<td colspan="2" align="center">--%>
                                                                            <%--<input type="text" value="${elderlyMsg.linkManMobile3}" style="width:100%;background-color: #f7f7f7;" readonly="readonly" />--%>
                                                                        <%--</td>--%>
                                                                        <%--<td colspan="2" align="center">--%>
                                                                            <%--<input type="radio" value="1" <c:if test="${elderlyMsg.linkManHavekey3 eq 1}">checked</c:if>  disabled="disabled" style=";background-color: #f7f7f7;" />--%>
                                                                            <%--有--%>
                                                                            <%--<input type="radio" value="0" <c:if test="${elderlyMsg.linkManHavekey3 eq 0}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />--%>
                                                                            <%--无--%>
                                                                        <%--</td>--%>
                                                                    <%--</tr>--%>
                                                                    <tr>
                                                                        <td align="center">原职业</td>
                                                                        <td colspan="7" align="left">
                                                                            <input type="radio" value="244" <c:if test="${elderlyMsg.jobDictId eq 244}">checked</c:if>  disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            公务员
                                                                            <input type="radio" value="242" <c:if test="${elderlyMsg.jobDictId eq 242}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            教师
                                                                            <input type="radio" value="243" <c:if test="${elderlyMsg.jobDictId eq 243}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            军人
                                                                            <input type="radio" value="245" <c:if test="${elderlyMsg.jobDictId eq 245}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            事业职工
                                                                            <input type="radio" value="246" <c:if test="${elderlyMsg.jobDictId eq 246}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            企业职工
                                                                            <input type="radio" value="247" <c:if test="${elderlyMsg.jobDictId eq 247}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            农民
                                                                            <input type="radio" value="248" <c:if test="${elderlyMsg.jobDictId eq 248}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            商人
                                                                            <input type="radio" value="249" <c:if test="${elderlyMsg.jobDictId eq 249}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            无固定职业
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">收入来源</td>
                                                                        <td colspan="7" align="left">
                                                                            <input type="checkbox" value="260" <c:if test="${elderlyMsg.incomeSource eq 260}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            机关事业单位离休金
                                                                            <input type="checkbox" value="261" <c:if test="${elderlyMsg.incomeSource eq 261}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            机关事业单位退休金
                                                                            <input type="checkbox" value="262" <c:if test="${elderlyMsg.incomeSource eq 262}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            养老金
                                                                            <input type="checkbox" value="263" <c:if test="${elderlyMsg.incomeSource eq 263}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            三无下放人员补贴
                                                                            <input type="checkbox" value="264" <c:if test="${elderlyMsg.incomeSource eq 264}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            三线老军工补贴
                                                                            <br />
                                                                            <input type="checkbox" value="265" <c:if test="${elderlyMsg.incomeSource eq 265}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            城乡居民养老保险
                                                                            <input type="checkbox" value="266" <c:if test="${elderlyMsg.incomeSource eq 266}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            供养人员补贴
                                                                            <input type="checkbox" value="267" <c:if test="${elderlyMsg.incomeSource eq 267}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            低保金
                                                                            <input type="checkbox" value="268" <c:if test="${elderlyMsg.incomeSource eq 268}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            拆迁补助（ 元/月）
                                                                            <br />
                                                                            <input type="checkbox" value="269" <c:if test="${elderlyMsg.incomeSource eq 269}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            失地农民补助
                                                                            <input type="checkbox" value="270" <c:if test="${elderlyMsg.incomeSource eq 270}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            其他
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">子女状况</td>
                                                                        <td colspan="2" align="center" width="350px">
                                                                            <input type="radio"  value="270" <c:if test="${elderlyMsg.childrenDictId eq 270}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            有子女
                                                                            <input type="radio" value="271" <c:if test="${elderlyMsg.childrenDictId eq 271}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            未生育子女
                                                                            <input type="radio" value="272" <c:if test="${elderlyMsg.childrenDictId eq 272}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            失去独生子女
                                                                        </td>
                                                                        <td colspan="2" align="center">医疗类别</td>
                                                                        <td colspan="3" align="center">
                                                                            <br />
                                                                            <input type="checkbox"value="274" <c:if test="${elderlyMsg.medicalType eq 274}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            公费
                                                                            <input type="checkbox" value="275" <c:if test="${elderlyMsg.medicalType eq 275}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            职工医保
                                                                            <input type="checkbox" value="276" <c:if test="${elderlyMsg.medicalType eq 276}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            居民医保
                                                                            <input type="checkbox" value="277" <c:if test="${elderlyMsg.medicalType eq 277}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            新农合
                                                                            <input type="checkbox" value="278" <c:if test="${elderlyMsg.medicalType eq 278}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            自费
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">居住状况</td>
                                                                        <td align="center">
                                                                            <input type="radio" value="280" <c:if test="${elderlyMsg.residenceDictId eq 1}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            独居
                                                                            <br />
                                                                            <input type="radio" value="511" <c:if test="${elderlyMsg.residenceDictId eq 2}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            空巢
                                                                        </td>
                                                                        <td align="center">住房性质</td>
                                                                        <td align="center" colspan="2">
                                                                            <input type="radio" value="1" <c:if test="${elderlyMsg.houseTypeDictId eq 1}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            有产权
                                                                            <br />
                                                                            <input type="radio" value="2" <c:if test="${elderlyMsg.houseTypeDictId eq 2}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            无产权
                                                                        </td>
                                                                        <td align="center">居室</td>
                                                                        <td colspan="2" align="center">
                                                                            <input type="radio" value="287" <c:if test="${elderlyMsg.roomTypeDictId eq 287}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            一居
                                                                            <input type="radio" value="288" <c:if test="${elderlyMsg.roomTypeDictId eq 288}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            二居
                                                                            <br />
                                                                            <input type="radio" value="289" <c:if test="${elderlyMsg.roomTypeDictId eq 289}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            三居
                                                                            <input type="radio" value="290" <c:if test="${elderlyMsg.roomTypeDictId eq 290}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            其他
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">居住条件</td>
                                                                        <td align="center" width="175px">
                                                                            楼层电梯：
                                                                            <br />
                                                                            <input type="radio" value="1" <c:if test="${elderlyMsg.hasElevator eq 1}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            有
                                                                            <input type="radio" value="2" <c:if test="${elderlyMsg.hasElevator eq 2}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            无
                                                                        </td>
                                                                        <td colspan="3" align="center">
                                                                            居住楼层（楼层无电梯的）：
                                                                            <br />
                                                                            <input type="radio" value="1" <c:if test="${elderlyMsg.floor eq 1}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            一层
                                                                            <input type="radio" value="2" <c:if test="${elderlyMsg.floor eq 2}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            二层
                                                                            <input type="radio" value="3" <c:if test="${elderlyMsg.floor eq 3}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            三层以上
                                                                        </td>
                                                                        <td colspan="2" align="center">
                                                                            室内厕所
                                                                            <br />
                                                                            <input type="radio" value="1" <c:if test="${elderlyMsg.hasToilet eq 1}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            有
                                                                            <input type="radio" value="2" <c:if test="${elderlyMsg.hasToilet eq 2}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            无
                                                                        </td>
                                                                        <td align="center">
                                                                            室内洗浴设备
                                                                            <br />
                                                                            <input type="radio" value="1" <c:if test="${elderlyMsg.hasBath eq 1}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            有
                                                                            <input type="radio" value="2" <c:if test="${elderlyMsg.hasBath eq 2}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            无
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">原照料情况</td>
                                                                        <td colspan="7" align="left">
                                                                            <input type="checkbox" value="320" <c:if test="${elderlyMsg.careCondition1 eq 320}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            自我照料
                                                                            <input type="checkbox" value="316" <c:if test="${elderlyMsg.careCondition1 eq 316}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            配偶照顾&nbsp;
                                                                            <input type="checkbox" value="317" <c:if test="${elderlyMsg.careCondition1 eq 317}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            子女照顾
                                                                            <input type="checkbox" value="318" <c:if test="${elderlyMsg.careCondition1 eq 318}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            自购家政服务
                                                                            <input type="checkbox" value="319" <c:if test="${elderlyMsg.careCondition1 eq 319}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            送餐服务
                                                                            <input type="checkbox" value="326" <c:if test="${elderlyMsg.careCondition2 eq 326}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            互助门铃
                                                                            <br />
                                                                            政府购买居家养老服务： &nbsp;
                                                                            <input type="checkbox" value="323" <c:if test="${elderlyMsg.careCondition2 eq 323}">checked</c:if> checked="checked" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            居家照料
                                                                            <input type="checkbox" value="324" <c:if test="${elderlyMsg.careCondition2 eq 324}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            紧急呼叫终端
                                                                            <input type="checkbox" value="322" <c:if test="${elderlyMsg.careCondition2 eq 322}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            老年人意外伤害保险
                                                                            <input type="checkbox" value="10" <c:if test="${elderlyMsg.careCondition1 eq 530}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            其他
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">服务需求</td>
                                                                        <td colspan="7" align="left">
                                                                            <input type="hidden" id="serviceNeed" value="${elderlyMsg.serviceNeed}"/>
                                                                            <input type="checkbox" name="serviceNeed" value="1" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            家务料理 &nbsp;
                                                                            <input type="checkbox" name="serviceNeed" value="2" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            代购物品
                                                                            <input type="checkbox" name="serviceNeed" value="3" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            康复保健&nbsp;
                                                                            <input type="checkbox" name="serviceNeed" value="4" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            紧急呼叫
                                                                            <input type="checkbox" name="serviceNeed" value="5" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            心理关爱
                                                                            <input type="checkbox" name="serviceNeed" value="6" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            法律援助
                                                                            <input type="checkbox" name="serviceNeed" value="7" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            文化娱乐
                                                                            <br />
                                                                            <input type="checkbox" name="serviceNeed" value="8" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            助餐
                                                                            <input type="checkbox" name="serviceNeed" value="9" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            送餐 &nbsp;
                                                                            <input type="checkbox" name="serviceNeed" value="10" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            陪聊
                                                                            <input type="checkbox" name="serviceNeed" value="11" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            陪住
                                                                            <input type="checkbox" name="serviceNeed" value="12" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            陪外出 &nbsp;
                                                                            <input type="checkbox" name="serviceNeed" value="13" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            陪旅游
                                                                            <input type="checkbox" name="serviceNeed" value="14" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            日托
                                                                            <input type="checkbox" name="serviceNeed" value="15" checked="checked" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            入住老年人福利机构
                                                                            <input type="checkbox" name="serviceNeed" value="15" checked="checked" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            其他
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">患病情况</td>
                                                                        <td colspan="7" align="left">
                                                                            重 病:
                                                                            <input type="checkbox" value="1"  disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            恶性肿瘤
                                                                            <input type="checkbox" value="2" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            尿毒症透析&nbsp;&nbsp;
                                                                            <input type="checkbox" value="3" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            器官移植（含手术后的抗排异治疗）&nbsp;&nbsp;
                                                                            <input type="checkbox" value="4" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            白血病
                                                                            <br />
                                                                            <input type="checkbox"  value="5" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            急性心肌梗塞
                                                                            <input type="checkbox"  value="6" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            脑中风
                                                                            <input type="checkbox"  value="7" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            急性坏死性胰腺炎&nbsp;
                                                                            <input type="checkbox"  value="8" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            脑外伤 &nbsp;
                                                                            <input type="checkbox"  value="9" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            主动脉手术
                                                                            <input type="checkbox"  value="10" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            冠状动脉旁路手术
                                                                            <br />
                                                                            <input type="checkbox"  value="11" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            慢性肾功能性衰竭
                                                                            <input type="checkbox"  value="12" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            急慢性重症肝炎
                                                                            <input type="checkbox"  value="13" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            危及生命的良性脑瘤 &nbsp;
                                                                            <input type="checkbox"  value="14" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            重症糖尿病&nbsp;
                                                                            <input type="checkbox"  value="15" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            消化道出血
                                                                            <br />
                                                                            <input type="checkbox"  value="16" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            系统性红斑狼疮
                                                                            <input type="checkbox"  value="17" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            慢性再生障碍性贫血&nbsp; &nbsp; &nbsp;&nbsp;
                                                                            <input type="checkbox"  value="18" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            血友病 &nbsp;&nbsp;
                                                                            <input type="checkbox"  value="19" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            重症精神病。
                                                                            <br />
                                                                            慢性病：
                                                                            <input type="checkbox"  value="20" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            高血压&nbsp;
                                                                            <input type="checkbox"  value="21" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            冠心病
                                                                            <input type="checkbox"  value="22" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            前列腺增生 &nbsp;
                                                                            <input type="checkbox"  value="23" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            糖尿病
                                                                            <input type="checkbox"  value="23" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            其他
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">心理状况</td>
                                                                        <td colspan="7">
                                                                            <input type="radio"  value="1" <c:if test="${elderlyMsg.psychologicDictId eq 1}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            正常
                                                                            <input type="radio"  value="2" <c:if test="${elderlyMsg.psychologicDictId eq 2}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            偶尔有孤独感
                                                                            <input type="radio"  value="3" <c:if test="${elderlyMsg.psychologicDictId eq 3}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            经常觉得孤独
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">社会活动情况</td>
                                                                        <td align="center">
                                                                            <input type="radio" nvalue="387" <c:if test="${elderlyMsg.socialActiDictId eq 387}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            经常
                                                                            <input type="radio" nvalue="388" <c:if test="${elderlyMsg.socialActiDictId eq 388}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            偶尔
                                                                            <input type="radio" nvalue="389" <c:if test="${elderlyMsg.socialActiDictId eq 389}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            从不
                                                                        </td>
                                                                        <td colspan="6">
                                                                            社会活动类型：
                                                                            <input type="checkbox" value="1" <c:if test="${elderlyMsg.saTypeDictIds eq 1}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            文艺类
                                                                            <input type="checkbox" value="2" <c:if test="${elderlyMsg.saTypeDictIds eq 2}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            教育类
                                                                            <input type="checkbox" value="3" <c:if test="${elderlyMsg.saTypeDictIds eq 3}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            健身类
                                                                            <input type="checkbox" value="4" <c:if test="${elderlyMsg.saTypeDictIds eq 4}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            慈善类
                                                                            <input type="checkbox" value="5" <c:if test="${elderlyMsg.saTypeDictIds eq 5}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            经济类
                                                                            <input type="checkbox" value="6" <c:if test="${elderlyMsg.saTypeDictIds eq 6}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            宗教类
                                                                            <input type="checkbox" value="7" <c:if test="${elderlyMsg.saTypeDictIds eq 7}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            其他
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                                <br />
                                                                <table width="990" border="0" class="table4" cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td colspan="6" align="center" rowspan="2">一、生活自理能力参数</td>
                                                                    </tr>
                                                                    <tr>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="190" align="center">项目</td>
                                                                        <td width="500" colspan="3" align="center">描述</td>
                                                                        <td width="120">&nbsp;</td>
                                                                        <td width="135">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">吃饭</td>
                                                                        <td colspan="3" align="center">能完成入口、咀嚼、吞咽等步骤</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr1" readOnly="true" value="${elderlyAssessment.attr1}" style=";background-color: #f7f7f7;">
                                                                                <lb:option  value="" >请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                            <input name="score01" readonly="readonly" value="${elderlyAssessment.score01}" style=";background-color: #f7f7f7;" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">穿衣</td>
                                                                        <td colspan="3" align="center">完成取衣、穿衣、系带、扣扣子等</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr2" readOnly="true" value="${elderlyAssessment.attr2}" style=";background-color: #f7f7f7;">
                                                                                <lb:option  value="" >请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                            <input name="score02" value="${elderlyAssessment.score02}" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">如厕</td>
                                                                        <td colspan="3" align="center">如厕、便后能自理及整理衣裤</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr3" readOnly="true"  value="${elderlyAssessment.attr3}" style=";background-color: #f7f7f7;">
                                                                                <lb:option  value="" >请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                            <input name="score03" value="${elderlyAssessment.score03}" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">室内走动</td>
                                                                        <td colspan="3" align="center">外出、上下楼正常</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr4" readOnly="true" value="${elderlyAssessment.attr4}" style=";background-color: #f7f7f7;">
                                                                                <lb:option  value="" >请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                            <input name="score04" value="${elderlyAssessment.score04}"  readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">洗澡</td>
                                                                        <td colspan="3" align="center">能完成洗澡的全部过程</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr5" readOnly="true" value="${elderlyAssessment.attr5}" style=";background-color: #f7f7f7;">
                                                                                <lb:option  value="" >请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                            <input name="score05" value="${elderlyAssessment.score05}" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">控制大小便</td>
                                                                        <td colspan="3" align="center">能控制大小便</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr6" readOnly="true" value="${elderlyAssessment.attr6}" style=";background-color: #f7f7f7;">
                                                                                <lb:option  value="" >请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                            <input name="score06" value="${elderlyAssessment.score06}" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="6" align="center">二、认知能力参数</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">项目</td>
                                                                        <td colspan="3" align="center">描述</td>
                                                                        <td>&nbsp;</td>
                                                                        <td>&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">近期记忆</td>
                                                                        <td colspan="3" align="center">能回想近期发生的事情</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr7" readOnly="true" value="${elderlyAssessment.attr7}" style=";background-color: #f7f7f7;">
                                                                                <lb:option  value="" >请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                            <input name="score07" value="${elderlyAssessment.score07}" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">程序记忆</td>
                                                                        <td colspan="3" align="center">完成洗衣、做饭、做菜等</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr8" readOnly="true" value="${elderlyAssessment.attr8}" style=";background-color: #f7f7f7;">
                                                                                <lb:option  value="" >请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                            <input name="score08" value="${elderlyAssessment.score08}" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">定向记忆</td>
                                                                        <td colspan="3" align="center">外出、回家不迷路</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr9" readOnly="true" value="${elderlyAssessment.attr9}" style=";background-color: #f7f7f7;">
                                                                                <lb:option  value="" >请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                            <input name="score09" value="${elderlyAssessment.score09}" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">判断能力</td>
                                                                        <td colspan="3" align="center">对日常事物的判断不违背常理</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr10" readOnly="true" value="${elderlyAssessment.attr10}" style=";background-color: #f7f7f7;">
                                                                                <lb:option  value="">请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2" >轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                            <input name="score10" value="${elderlyAssessment.score10}" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="6" align="center">三、情绪行为参数</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">项目</td>
                                                                        <td colspan="3" align="center">描述</td>
                                                                        <td>&nbsp;</td>
                                                                        <td>&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">情绪</td>
                                                                        <td colspan="3" align="center">与人和睦相处，不偏激</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr11" readOnly="true" value="${elderlyAssessment.attr11}" style=";background-color: #f7f7f7;">
                                                                                <lb:option  value="">请选择</lb:option>
                                                                                <lb:option  value="1" >正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                            <input name="score11" value="${elderlyAssessment.score11}" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">行为</td>
                                                                        <td colspan="3" align="center">动作行为表现是否异常</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr12" readOnly="true" value="${elderlyAssessment.attr12}" style=";background-color: #f7f7f7;">
                                                                                <lb:option  value="">请选择</lb:option>
                                                                                <lb:option  value="1" >正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                            <input name="score12" value="${elderlyAssessment.score12}" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">沟通</td>
                                                                        <td colspan="3" align="center">在交流中能否互相理解</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr13" readOnly="true" value="${elderlyAssessment.attr13}" style=";background-color: #f7f7f7;">
                                                                                <lb:option  value="">请选择</lb:option>
                                                                                <lb:option  value="1" >正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                            <input name="score13" value="${elderlyAssessment.score13}" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="6" align="center">四、视、听觉</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">项目</td>
                                                                        <td colspan="3" align="center">描述</td>
                                                                        <td>&nbsp;</td>
                                                                        <td>&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">视觉</td>
                                                                        <td colspan="3" align="center">能正常看电视、读报等</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr14" readOnly="true" value="${elderlyAssessment.attr14}" style=";background-color: #f7f7f7;">
                                                                                <lb:option  value="">请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                            <input name="score14" value="${elderlyAssessment.score14}" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">听觉</td>
                                                                        <td colspan="3" align="center">能正常接听电话、交谈</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr15" readOnly="true" value="${elderlyAssessment.attr15}" style=";background-color: #f7f7f7;">
                                                                                <lb:option  value="">请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                            <input name="score15" value="${elderlyAssessment.score15}" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                                <table width="990px" cellpadding="0" cellspacing="0" class="table2">
                                                                    <tr>
                                                                        <td align="left">
                                                                            失能分:
                                                                            <input type="text" name="resultScore" size="15" class="input" value="${elderlyAssessment.resultScore}" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                            分， 属于：
                                                                            <input type="radio" name="resultDictId" value="1" <c:if test="${elderlyAssessment.resultDictId eq 1}">checked</c:if> style=";background-color: #f7f7f7;" />
                                                                            自理
                                                                            <input type="radio" name="resultDictId" value="2" <c:if test="${elderlyAssessment.resultDictId eq 2}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            半失能
                                                                            <input type="radio" name="resultDictId" value="3" <c:if test="${elderlyAssessment.resultDictId eq 3}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            失能
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                                <br />
                                                                <table width="990px" cellpadding="0" cellspacing="0" class="table2">
                                                                    <tr>
                                                                        <td align="left">
                                                                            本人（或代理人）签字：
                                                                            <input type="text" name="familyName" size="15" class="input" value="${elderlyAssessment.familyName}" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                            日期：
                                                                            <input type="text" name="familyDate" size="10" class="input" value="${elderlyAssessment.familyDate}" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                                <br />
                                                                <table width="990px" cellpadding="0" cellspacing="0" class="table2">
                                                                    <tr>
                                                                        <td align="left">
                                                                            评估员1（签字）：
                                                                            <input type="text" name="workerName1" value="${elderlyAssessment.workerName1}" size="15" class="input" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                            ，工作证号
                                                                            <input type="text" name="workerCard1" value="${elderlyAssessment.workerCard1}" size="15" class="input" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                            ，日期
                                                                            <input type="text" name="workerDate1" value="${elderlyAssessment.workerDate1}" size="10" class="input" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                                <br />
                                                                <table width="990px" cellpadding="0" cellspacing="0" class="table2">
                                                                    <tr>
                                                                        <td align="left">
                                                                            评估员2（签字）：
                                                                            <input type="text" name="workerName2" value="${elderlyAssessment.workerName2}" size="15" class="input" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                            ，工作证号
                                                                            <input type="text" name="workerCard2" value="${elderlyAssessment.workerCard2}" size="15" class="input" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                            ，日期
                                                                            <input type="text" name="workerDate2" value="${elderlyAssessment.workerDate2}" size="10" class="input" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        <div style="float: right;margin-right: 15px;margin-top: 5px;margin-bottom: 5px;">
                                                            <div style="width:80px;float:left;">
                                                                <button onclick="window.parent.closeTab('elder_assess_details')" class="btn btn-default">返回</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <!-- END PERSONAL INFO TAB -->
                                                <!-- CHANGE AVATAR TAB -->
                                                <div class="tab-pane ${title2}" id="tab_1_2">
                                                    <form id="assEditForm" name="assEditForm" method="post" role="form">
                                                        <div align="center">
                                                                <table width="990px" cellpadding="5" cellspacing="0">
                                                                    <tr>
                                                                        <td colspan="6" align="center">
                                                                            <font style="font-size: 25px;font-weight: bold;" >
                                                                                老年人能力评估表
                                                                            </font>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="6" align="right">
                                                                            编号：
                                                                            <input type="text" name="tid" value="${tidCode}" class="input" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                            <input type="hidden" name="elderId" value="${elderlyMsg.id}"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <table width="990px" cellpadding="0" cellspacing="0" class="table1">
                                                                    <tr>
                                                                        <td colspan="6" align="center">
                                                                            <font>一、基本情况（街道审核确认）</font>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="6" align="left">
                                                                            <input type="text" size="10" value="${elderlyMsg.region1}" class="input" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                            区
                                                                            <input type="text" size="10" value="${elderlyMsg.region2}" class="input" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                            街道（镇）
                                                                            <input type="text" size="15" value="${elderlyMsg.region3}" class="input" readonly="readonly" style=";background-color: #f7f7f7;" />
                                                                            社区（村）
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="90" rowspan="2" align="center">姓名</td>
                                                                        <td rowspan="2" width="208" >
                                                                            <input type="text" value="${elderlyMsg.elderName}" size="20" style="width: 100%; text-align:center; vertical-align:middle;background-color: #f7f7f7;" readonly="readonly" />
                                                                        </td>
                                                                        <td rowspan="2" align="center" width="156">
                                                                            身份
                                                                            <br />
                                                                            证号
                                                                        </td>
                                                                        <td width="246" rowspan="2">
                                                                            <input type="text" value="${elderlyMsg.idcardno}" style="width: 180px;;background-color: #f7f7f7;" onkeypress="queryElder(1, 1)" readonly="readonly" />
                                                                        </td>
                                                                        <td width="78" align="center">固话</td>
                                                                        <td width="210">
                                                                            <input type="text" value="${elderlyMsg.homeTel}" size="11" border="0" style="width: 100%;;background-color: #f7f7f7;" readonly="readonly" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">手机</td>
                                                                        <td>
                                                                            <input type="text" value="${elderlyMsg.mobile}" size="11" border="0" style="width: 100%;;background-color: #f7f7f7;" onkeypress="queryElder(2,1)" readonly="readonly" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">
                                                                            文化
                                                                            <br />
                                                                            程度
                                                                        </td>
                                                                        <td align="left">
                                                                            <lb:select value="${elderlyMsg.educationDictId}"
                                                                                       readOnly="true" style=";background-color: #f7f7f7;">
                                                                                <lb:option value="1" >文盲</lb:option>
                                                                                <lb:option value="2">小学</lb:option>
                                                                                <lb:option value="3">初中</lb:option>
                                                                                <lb:option value="4">高中和中专</lb:option>
                                                                                <lb:option value="5">大专</lb:option>
                                                                                <lb:option value="6">本科及以上</lb:option>
                                                                                <lb:option value="0">其他</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td align="center">
                                                                            户籍
                                                                            <br />
                                                                            地址
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" value="${elderlyMsg.regPlace}" size="25" style="width: 100%;;background-color: #f7f7f7;" readonly="readonly" />
                                                                        </td>
                                                                        <td align="center">常住</td>
                                                                        <td align="left">
                                                                            <input type="radio" value="1"  <c:if test="${elderlyMsg.liveYearDictId eq 1}">checked</c:if> style=";background-color: #f7f7f7;" />
                                                                            一年以下
                                                                            <br />
                                                                            <input type="radio" value="2" <c:if test="${elderlyMsg.liveYearDictId eq 2}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            一年以上
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">住址</td>
                                                                        <td colspan="5">
                                                                            <input type="text" style="width:100%;background-color: #f7f7f7;" value="${elderlyMsg.realAddress}" readonly="readonly" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td rowspan="2" align="center">人员类别</td>
                                                                        <td rowspan="2" colspan="5" align="left">
                                                                            <input type="radio" name="elderTypeDictIds" value="1" disabled/>城市三无/农村五保
                                                                            <input type="radio" name="elderTypeDictIds" value="2" disabled/>低保/低保边缘
                                                                            <input type="radio" name="elderTypeDictIds" value="3" disabled/>经济困难的失能/半失能老人
                                                                            <input type="radio" name="elderTypeDictIds" value="4" disabled/>70周岁及以上的计生特扶老人
                                                                            <input type="radio" name="elderTypeDictIds" value="5" disabled/>百岁老人
                                                                            <input type="radio" name="elderTypeDictIds" value="9" disabled/>空巢
                                                                            <input type="radio" name="elderTypeDictIds" value="10" disabled/>独居
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                                <br />
                                                                <table width="990px" cellpadding="0" cellspacing="0" class="table2">
                                                                    <tr>
                                                                        <td align="left">
                                                                            街道审定人：
                                                                            <input type="text" name="audit1" size="15" class="input" />
                                                                            日期：
                                                                            <input type="text" name="auditDate1" size="10" readonly class="input date-picker" data-date-format="yyyy-mm-dd"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                                <br />
                                                                <table width="990px" border="0" class="table3" cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td colspan="8" align="center">二、社会生活环境参数（申请人填写）</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="8" align="center">联系人</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center" width="120px">对象</td>
                                                                        <td align="center" width="120px">姓名</td>
                                                                        <td colspan="2" align="center">与老人关系</td>
                                                                        <td colspan="2" align="center">联系方式</td>
                                                                        <td colspan="2" align="center">是否有老人钥匙</td>
                                                                    </tr>
                                                                    <%--<tr>--%>
                                                                        <%--<td align="center" width="120px">--%>
                                                                            <%--联系人1--%>
                                                                            <%--<br />--%>
                                                                            <%--（直系亲属）--%>
                                                                        <%--</td>--%>
                                                                        <%--<td align="center">--%>
                                                                            <%--<input type="text" value="${elderlyMsg.linkManName1}" style="width:100%;background-color: #f7f7f7;" readonly="readonly" />--%>
                                                                        <%--</td>--%>
                                                                        <%--<td colspan="2" align="center">--%>
                                                                            <%--<input type="text" value="${elderlyMsg.directRelaRelation}" style="width:100%;background-color: #f7f7f7;" readonly="readonly" />--%>
                                                                        <%--</td>--%>
                                                                        <%--<td colspan="2" align="center">--%>
                                                                            <%--<input type="text" value="${elderlyMsg.linkManMobile1}" style="width:100%;background-color: #f7f7f7;" readonly="readonly" />--%>
                                                                        <%--</td>--%>
                                                                        <%--<td colspan="2" align="center">--%>
                                                                            <%--<input type="radio" value="1" <c:if test="${elderlyMsg.linkManHavekey1 eq 1}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />--%>
                                                                            <%--有--%>
                                                                            <%--<input type="radio" value="0" <c:if test="${elderlyMsg.linkManHavekey1 eq 0}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />--%>
                                                                            <%--无--%>
                                                                        <%--</td>--%>
                                                                    <%--</tr>--%>
                                                                    <%--<tr>--%>
                                                                        <%--<td align="center">联系人2</td>--%>
                                                                        <%--<td align="center">--%>
                                                                            <%--<input type="text" value="${elderlyMsg.linkManName2}" style="width:100%;background-color: #f7f7f7;" readonly="readonly" />--%>
                                                                        <%--</td>--%>
                                                                        <%--<td colspan="2" align="center">--%>
                                                                            <%--<input type="text" value="${elderlyMsg.linkManRelation2}" style="width:100%;background-color: #f7f7f7;" readonly="readonly" />--%>
                                                                        <%--</td>--%>
                                                                        <%--<td colspan="2" align="center">--%>
                                                                            <%--<input type="text" value="${elderlyMsg.linkManMobile2}" style="width:100%;background-color: #f7f7f7;" readonly="readonly" />--%>
                                                                        <%--</td>--%>
                                                                        <%--<td colspan="2" align="center">--%>
                                                                            <%--<input type="radio" value="1" <c:if test="${elderlyMsg.linkManHavekey2 eq 1}">checked</c:if>  disabled="disabled" style=";background-color: #f7f7f7;" />--%>
                                                                            <%--有--%>
                                                                            <%--<input type="radio" value="0" <c:if test="${elderlyMsg.linkManHavekey2 eq 0}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />--%>
                                                                            <%--无--%>
                                                                        <%--</td>--%>
                                                                    <%--</tr>--%>
                                                                    <%--<tr>--%>
                                                                        <%--<td align="center">联系人3</td>--%>
                                                                        <%--<td align="center">--%>
                                                                            <%--<input type="text" value="${elderlyMsg.linkManName3}" style="width:100%;background-color: #f7f7f7;" readonly="readonly" />--%>
                                                                        <%--</td>--%>
                                                                        <%--<td colspan="2" align="center">--%>
                                                                            <%--<input type="text" value="${elderlyMsg.linkManRelation3}" style="width:100%;background-color: #f7f7f7;" readonly="readonly" />--%>
                                                                        <%--</td>--%>
                                                                        <%--<td colspan="2" align="center">--%>
                                                                            <%--<input type="text" value="${elderlyMsg.linkManMobile3}" style="width:100%;background-color: #f7f7f7;" readonly="readonly" />--%>
                                                                        <%--</td>--%>
                                                                        <%--<td colspan="2" align="center">--%>
                                                                            <%--<input type="radio" value="1" <c:if test="${elderlyMsg.linkManHavekey3 eq 1}">checked</c:if>  disabled="disabled" style=";background-color: #f7f7f7;" />--%>
                                                                            <%--有--%>
                                                                            <%--<input type="radio" value="0" <c:if test="${elderlyMsg.linkManHavekey3 eq 0}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />--%>
                                                                            <%--无--%>
                                                                        <%--</td>--%>
                                                                    <%--</tr>--%>
                                                                    <tr>
                                                                        <td align="center">原职业</td>
                                                                        <td colspan="7" align="left">
                                                                            <input type="radio" value="244" <c:if test="${elderlyMsg.jobDictId eq 244}">checked</c:if>  disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            公务员
                                                                            <input type="radio" value="242" <c:if test="${elderlyMsg.jobDictId eq 242}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            教师
                                                                            <input type="radio" value="243" <c:if test="${elderlyMsg.jobDictId eq 243}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            军人
                                                                            <input type="radio" value="245" <c:if test="${elderlyMsg.jobDictId eq 245}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            事业职工
                                                                            <input type="radio" value="246" <c:if test="${elderlyMsg.jobDictId eq 246}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            企业职工
                                                                            <input type="radio" value="247" <c:if test="${elderlyMsg.jobDictId eq 247}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            农民
                                                                            <input type="radio" value="248" <c:if test="${elderlyMsg.jobDictId eq 248}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            商人
                                                                            <input type="radio" value="249" <c:if test="${elderlyMsg.jobDictId eq 249}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            无固定职业
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">收入来源</td>
                                                                        <td colspan="7" align="left">
                                                                            <input type="checkbox" value="260" <c:if test="${elderlyMsg.incomeSource eq 260}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            机关事业单位离休金
                                                                            <input type="checkbox" value="261" <c:if test="${elderlyMsg.incomeSource eq 261}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            机关事业单位退休金
                                                                            <input type="checkbox" value="262" <c:if test="${elderlyMsg.incomeSource eq 262}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            养老金
                                                                            <input type="checkbox" value="263" <c:if test="${elderlyMsg.incomeSource eq 263}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            三无下放人员补贴
                                                                            <input type="checkbox" value="264" <c:if test="${elderlyMsg.incomeSource eq 264}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            三线老军工补贴
                                                                            <br />
                                                                            <input type="checkbox" value="265" <c:if test="${elderlyMsg.incomeSource eq 265}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            城乡居民养老保险
                                                                            <input type="checkbox" value="266" <c:if test="${elderlyMsg.incomeSource eq 266}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            供养人员补贴
                                                                            <input type="checkbox" value="267" <c:if test="${elderlyMsg.incomeSource eq 267}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            低保金
                                                                            <input type="checkbox" value="268" <c:if test="${elderlyMsg.incomeSource eq 268}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            拆迁补助（ 元/月）
                                                                            <br />
                                                                            <input type="checkbox" value="269" <c:if test="${elderlyMsg.incomeSource eq 269}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            失地农民补助
                                                                            <input type="checkbox" value="270" <c:if test="${elderlyMsg.incomeSource eq 270}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            其他
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">子女状况</td>
                                                                        <td colspan="2" align="center" width="350px">
                                                                            <input type="radio"  value="270" <c:if test="${elderlyMsg.childrenDictId eq 270}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            有子女
                                                                            <input type="radio" value="271" <c:if test="${elderlyMsg.childrenDictId eq 271}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            未生育子女
                                                                            <input type="radio" value="272" <c:if test="${elderlyMsg.childrenDictId eq 272}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            失去独生子女
                                                                        </td>
                                                                        <td colspan="2" align="center">医疗类别</td>
                                                                        <td colspan="3" align="center">
                                                                            <br />
                                                                            <input type="checkbox"value="274" <c:if test="${elderlyMsg.medicalType eq 274}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            公费
                                                                            <input type="checkbox" value="275" <c:if test="${elderlyMsg.medicalType eq 275}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            职工医保
                                                                            <input type="checkbox" value="276" <c:if test="${elderlyMsg.medicalType eq 276}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            居民医保
                                                                            <input type="checkbox" value="277" <c:if test="${elderlyMsg.medicalType eq 277}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            新农合
                                                                            <input type="checkbox" value="278" <c:if test="${elderlyMsg.medicalType eq 278}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            自费
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">居住状况</td>
                                                                        <td align="center">
                                                                            <input type="radio" value="280" <c:if test="${elderlyMsg.residenceDictId eq 1}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            独居
                                                                            <br />
                                                                            <input type="radio" value="511" <c:if test="${elderlyMsg.residenceDictId eq 2}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            空巢
                                                                        </td>
                                                                        <td align="center">住房性质</td>
                                                                        <td align="center" colspan="2">
                                                                            <input type="radio" value="1" <c:if test="${elderlyMsg.houseTypeDictId eq 1}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            有产权
                                                                            <br />
                                                                            <input type="radio" value="2" <c:if test="${elderlyMsg.houseTypeDictId eq 2}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            无产权
                                                                        </td>
                                                                        <td align="center">居室</td>
                                                                        <td colspan="2" align="center">
                                                                            <input type="radio" value="287" <c:if test="${elderlyMsg.roomTypeDictId eq 287}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            一居
                                                                            <input type="radio" value="288" <c:if test="${elderlyMsg.roomTypeDictId eq 288}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            二居
                                                                            <br />
                                                                            <input type="radio" value="289" <c:if test="${elderlyMsg.roomTypeDictId eq 289}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            三居
                                                                            <input type="radio" value="290" <c:if test="${elderlyMsg.roomTypeDictId eq 290}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            其他
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">居住条件</td>
                                                                        <td align="center" width="175px">
                                                                            楼层电梯：
                                                                            <br />
                                                                            <input type="radio" value="1" <c:if test="${elderlyMsg.hasElevator eq 1}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            有
                                                                            <input type="radio" value="2" <c:if test="${elderlyMsg.hasElevator eq 2}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            无
                                                                        </td>
                                                                        <td colspan="3" align="center">
                                                                            居住楼层（楼层无电梯的）：
                                                                            <br />
                                                                            <input type="radio" value="1" <c:if test="${elderlyMsg.floor eq 1}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            一层
                                                                            <input type="radio" value="2" <c:if test="${elderlyMsg.floor eq 2}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            二层
                                                                            <input type="radio" value="3" <c:if test="${elderlyMsg.floor eq 3}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            三层以上
                                                                        </td>
                                                                        <td colspan="2" align="center">
                                                                            室内厕所
                                                                            <br />
                                                                            <input type="radio" value="1" <c:if test="${elderlyMsg.hasToilet eq 1}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            有
                                                                            <input type="radio" value="2" <c:if test="${elderlyMsg.hasToilet eq 2}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            无
                                                                        </td>
                                                                        <td align="center">
                                                                            室内洗浴设备
                                                                            <br />
                                                                            <input type="radio" value="1" <c:if test="${elderlyMsg.hasBath eq 1}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            有
                                                                            <input type="radio" value="2" <c:if test="${elderlyMsg.hasBath eq 2}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            无
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">原照料情况</td>
                                                                        <td colspan="7" align="left">
                                                                            <input type="checkbox" value="320" <c:if test="${elderlyMsg.careCondition1 eq 320}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            自我照料
                                                                            <input type="checkbox" value="316" <c:if test="${elderlyMsg.careCondition1 eq 316}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            配偶照顾&nbsp;
                                                                            <input type="checkbox" value="317" <c:if test="${elderlyMsg.careCondition1 eq 317}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            子女照顾
                                                                            <input type="checkbox" value="318" <c:if test="${elderlyMsg.careCondition1 eq 318}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            自购家政服务
                                                                            <input type="checkbox" value="319" <c:if test="${elderlyMsg.careCondition1 eq 319}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            送餐服务
                                                                            <input type="checkbox" value="326" <c:if test="${elderlyMsg.careCondition2 eq 326}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            互助门铃
                                                                            <br />
                                                                            政府购买居家养老服务： &nbsp;
                                                                            <input type="checkbox" value="323" <c:if test="${elderlyMsg.careCondition2 eq 323}">checked</c:if> checked="checked" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            居家照料
                                                                            <input type="checkbox" value="324" <c:if test="${elderlyMsg.careCondition2 eq 324}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            紧急呼叫终端
                                                                            <input type="checkbox" value="322" <c:if test="${elderlyMsg.careCondition2 eq 322}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            老年人意外伤害保险
                                                                            <input type="checkbox" value="10" <c:if test="${elderlyMsg.careCondition1 eq 530}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            其他
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">服务需求</td>
                                                                        <td colspan="7" align="left">
                                                                            <input type="checkbox" name="serviceNeed" value="1" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            家务料理 &nbsp;
                                                                            <input type="checkbox" name="serviceNeed" value="2" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            代购物品
                                                                            <input type="checkbox" name="serviceNeed" value="3" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            康复保健&nbsp;
                                                                            <input type="checkbox" name="serviceNeed" value="4" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            紧急呼叫
                                                                            <input type="checkbox" name="serviceNeed" value="5" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            心理关爱
                                                                            <input type="checkbox" name="serviceNeed" value="6" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            法律援助
                                                                            <input type="checkbox" name="serviceNeed" value="7" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            文化娱乐
                                                                            <br />
                                                                            <input type="checkbox" name="serviceNeed" value="8" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            助餐
                                                                            <input type="checkbox" name="serviceNeed" value="9" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            送餐 &nbsp;
                                                                            <input type="checkbox" name="serviceNeed" value="10" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            陪聊
                                                                            <input type="checkbox" name="serviceNeed" value="11" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            陪住
                                                                            <input type="checkbox" name="serviceNeed" value="12" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            陪外出 &nbsp;
                                                                            <input type="checkbox" name="serviceNeed" value="13" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            陪旅游
                                                                            <input type="checkbox" name="serviceNeed" value="14" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            日托
                                                                            <input type="checkbox" name="serviceNeed" value="15" checked="checked" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            入住老年人福利机构
                                                                            <input type="checkbox" name="serviceNeed" value="15" checked="checked" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            其他
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">患病情况</td>
                                                                        <td colspan="7" align="left">
                                                                            重 病:
                                                                            <input type="checkbox" value="1"  disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            恶性肿瘤
                                                                            <input type="checkbox" value="2" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            尿毒症透析&nbsp;&nbsp;
                                                                            <input type="checkbox" value="3" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            器官移植（含手术后的抗排异治疗）&nbsp;&nbsp;
                                                                            <input type="checkbox" value="4" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            白血病
                                                                            <br />
                                                                            <input type="checkbox"  value="5" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            急性心肌梗塞
                                                                            <input type="checkbox"  value="6" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            脑中风
                                                                            <input type="checkbox"  value="7" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            急性坏死性胰腺炎&nbsp;
                                                                            <input type="checkbox"  value="8" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            脑外伤 &nbsp;
                                                                            <input type="checkbox"  value="9" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            主动脉手术
                                                                            <input type="checkbox"  value="10" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            冠状动脉旁路手术
                                                                            <br />
                                                                            <input type="checkbox"  value="11" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            慢性肾功能性衰竭
                                                                            <input type="checkbox"  value="12" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            急慢性重症肝炎
                                                                            <input type="checkbox"  value="13" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            危及生命的良性脑瘤 &nbsp;
                                                                            <input type="checkbox"  value="14" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            重症糖尿病&nbsp;
                                                                            <input type="checkbox"  value="15" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            消化道出血
                                                                            <br />
                                                                            <input type="checkbox"  value="16" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            系统性红斑狼疮
                                                                            <input type="checkbox"  value="17" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            慢性再生障碍性贫血&nbsp; &nbsp; &nbsp;&nbsp;
                                                                            <input type="checkbox"  value="18" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            血友病 &nbsp;&nbsp;
                                                                            <input type="checkbox"  value="19" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            重症精神病。
                                                                            <br />
                                                                            慢性病：
                                                                            <input type="checkbox"  value="20" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            高血压&nbsp;
                                                                            <input type="checkbox"  value="21" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            冠心病
                                                                            <input type="checkbox"  value="22" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            前列腺增生 &nbsp;
                                                                            <input type="checkbox"  value="23" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            糖尿病
                                                                            <input type="checkbox"  value="23" disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            其他
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">心理状况</td>
                                                                        <td colspan="7">
                                                                            <input type="radio"  value="1" <c:if test="${elderlyMsg.psychologicDictId eq 1}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            正常
                                                                            <input type="radio"  value="2" <c:if test="${elderlyMsg.psychologicDictId eq 2}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            偶尔有孤独感
                                                                            <input type="radio"  value="3" <c:if test="${elderlyMsg.psychologicDictId eq 3}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            经常觉得孤独
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">社会活动情况</td>
                                                                        <td align="center">
                                                                            <input type="radio" nvalue="387" <c:if test="${elderlyMsg.socialActiDictId eq 387}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            经常
                                                                            <input type="radio" nvalue="388" <c:if test="${elderlyMsg.socialActiDictId eq 388}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            偶尔
                                                                            <input type="radio" nvalue="389" <c:if test="${elderlyMsg.socialActiDictId eq 389}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            从不
                                                                        </td>
                                                                        <td colspan="6">
                                                                            社会活动类型：
                                                                            <input type="checkbox" value="1" <c:if test="${elderlyMsg.saTypeDictIds eq 1}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            文艺类
                                                                            <input type="checkbox" value="2" <c:if test="${elderlyMsg.saTypeDictIds eq 2}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            教育类
                                                                            <input type="checkbox" value="3" <c:if test="${elderlyMsg.saTypeDictIds eq 3}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            健身类
                                                                            <input type="checkbox" value="4" <c:if test="${elderlyMsg.saTypeDictIds eq 4}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            慈善类
                                                                            <input type="checkbox" value="5" <c:if test="${elderlyMsg.saTypeDictIds eq 5}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            经济类
                                                                            <input type="checkbox" value="6" <c:if test="${elderlyMsg.saTypeDictIds eq 6}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            宗教类
                                                                            <input type="checkbox" value="7" <c:if test="${elderlyMsg.saTypeDictIds eq 7}">checked</c:if> disabled="disabled" style=";background-color: #f7f7f7;" />
                                                                            其他
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                                <br />
                                                                <table width="990" border="0" class="table4" cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td colspan="6" align="center" rowspan="2">一、生活自理能力参数</td>
                                                                    </tr>
                                                                    <tr>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="190" align="center">项目</td>
                                                                        <td width="500" colspan="3" align="center">描述</td>
                                                                        <td width="120">&nbsp;</td>
                                                                        <td width="135">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">吃饭</td>
                                                                        <td colspan="3" align="center">能完成入口、咀嚼、吞咽等步骤</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr1">
                                                                                <lb:option  value="" >请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>
                                                                            <input name="score01" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">穿衣</td>
                                                                        <td colspan="3" align="center">完成取衣、穿衣、系带、扣扣子等</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr2">
                                                                                <lb:option  value="" >请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>
                                                                            <input name="score02" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">如厕</td>
                                                                        <td colspan="3" align="center">如厕、便后能自理及整理衣裤</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr3">
                                                                                <lb:option  value="" >请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>

                                                                            <input name="score03" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">室内走动</td>
                                                                        <td colspan="3" align="center">外出、上下楼正常</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr4">
                                                                                <lb:option  value="" >请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>

                                                                            <input name="score04" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">洗澡</td>
                                                                        <td colspan="3" align="center">能完成洗澡的全部过程</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr5">
                                                                                <lb:option  value="" >请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>

                                                                            <input name="score05" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">控制大小便</td>
                                                                        <td colspan="3" align="center">能控制大小便</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr6" >
                                                                                <lb:option  value="" >请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>

                                                                            <input name="score06" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="6" align="center">二、认知能力参数</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">项目</td>
                                                                        <td colspan="3" align="center">描述</td>
                                                                        <td>&nbsp;</td>
                                                                        <td>&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">近期记忆</td>
                                                                        <td colspan="3" align="center">能回想近期发生的事情</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr7">
                                                                                <lb:option  value="" >请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>

                                                                            <input name="score07" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">程序记忆</td>
                                                                        <td colspan="3" align="center">完成洗衣、做饭、做菜等</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr8">
                                                                                <lb:option  value="" >请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>

                                                                            <input name="score08" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">定向记忆</td>
                                                                        <td colspan="3" align="center">外出、回家不迷路</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr9">
                                                                                <lb:option  value="" >请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>

                                                                            <input name="score09" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">判断能力</td>
                                                                        <td colspan="3" align="center">对日常事物的判断不违背常理</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr10">
                                                                                <lb:option  value="">请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2" >轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>

                                                                            <input name="score10" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="6" align="center">三、情绪行为参数</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">项目</td>
                                                                        <td colspan="3" align="center">描述</td>
                                                                        <td>&nbsp;</td>
                                                                        <td>&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">情绪</td>
                                                                        <td colspan="3" align="center">与人和睦相处，不偏激</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr11">
                                                                                <lb:option  value="">请选择</lb:option>
                                                                                <lb:option  value="1" >正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>

                                                                            <input name="score11" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">行为</td>
                                                                        <td colspan="3" align="center">动作行为表现是否异常</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr12">
                                                                                <lb:option  value="">请选择</lb:option>
                                                                                <lb:option  value="1" >正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>

                                                                            <input name="score12" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">沟通</td>
                                                                        <td colspan="3" align="center">在交流中能否互相理解</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr13">
                                                                                <lb:option  value="">请选择</lb:option>
                                                                                <lb:option  value="1" >正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>

                                                                            <input name="score13" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="6" align="center">四、视、听觉</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">项目</td>
                                                                        <td colspan="3" align="center">描述</td>
                                                                        <td>&nbsp;</td>
                                                                        <td>&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">视觉</td>
                                                                        <td colspan="3" align="center">能正常看电视、读报等</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr14">
                                                                                <lb:option  value="">请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>

                                                                            <input name="score14" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">听觉</td>
                                                                        <td colspan="3" align="center">能正常接听电话、交谈</td>
                                                                        <td align="center">
                                                                            <lb:select name="attr15">
                                                                                <lb:option  value="">请选择</lb:option>
                                                                                <lb:option  value="1">正常</lb:option>
                                                                                <lb:option  value="2">轻丧失</lb:option>
                                                                                <lb:option  value="3">中丧失</lb:option>
                                                                                <lb:option  value="4">完全丧失</lb:option>
                                                                            </lb:select>
                                                                        </td>
                                                                        <td>

                                                                            <input name="score15"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                                <table width="990px" cellpadding="0" cellspacing="0" class="table2">
                                                                    <tr>
                                                                        <td align="left">
                                                                            失能分:
                                                                            <input type="text" name="resultScore" size="15" class="input" />
                                                                            分， 属于：
                                                                            <input type="radio" name="resultDictId" value="1" />
                                                                            自理
                                                                            <input type="radio" name="resultDictId" value="2"/>
                                                                            半失能
                                                                            <input type="radio" name="resultDictId" value="3"/>
                                                                            失能
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                                <br />
                                                                <table width="990px" cellpadding="0" cellspacing="0" class="table2">
                                                                    <tr>
                                                                        <td align="left">
                                                                            本人（或代理人）签字：
                                                                            <input type="text" name="familyName" size="15" class="input"/>
                                                                            ，日期：
                                                                            <input type="text" name="familyDate" readonly class="input date-picker" data-date-format="yyyy-mm-dd" size="10"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                                <br />
                                                                <table width="990px" cellpadding="0" cellspacing="0" class="table2">
                                                                    <tr>
                                                                        <td align="left">
                                                                            评估员1（签字）：
                                                                            <input type="text" name="workerName1" size="15" class="input"/>
                                                                            ，工作证号
                                                                            <input type="text" name="workerCard1" size="15" class="input"/>
                                                                            ，日期
                                                                            <input type="text" name="workerDate1" readonly class="input date-picker" data-date-format="yyyy-mm-dd" size="10"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                                <br />
                                                                <table width="990px" cellpadding="0" cellspacing="0" class="table2">
                                                                    <tr>
                                                                        <td align="left">
                                                                            评估员2（签字）：
                                                                            <input type="text" name="workerName2" size="15" class="input"/>
                                                                            ，工作证号
                                                                            <input type="text" name="workerCard2" size="15" class="input"/>
                                                                            ，日期
                                                                            <input type="text" name="workerDate2" readonly class="input date-picker" data-date-format="yyyy-mm-dd" size="10"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        <div style="float: right;margin-right: 15px;margin-top: 5px;margin-bottom: 5px;">
                                                            <div style="width:80px;float:left;display: block;padding-right: 10px;">
                                                                <button onclick="assessDetails.addSubmit();" class="btn btn-default">保存</button>
                                                            </div>
                                                            <div style="width:80px;float:left;">
                                                                <button onclick="window.parent.closeTab('elder_assess_details')" class="btn btn-default">返回</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <!-- END CHANGE AVATAR TAB -->
                                                <!-- 模态框（Modal） -->
                                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                <h4 class="modal-title" id="myModalLabel">请选择...</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <!-- BEGIN PAGE CONTENT-->
                                                                <div id="areaTree" class="tree-demo"></div>
                                                                <!-- END PAGE CONTENT-->
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default"
                                                                        data-dismiss="modal">关闭
                                                                </button>
                                                                <button type="button" class="btn btn-primary" onclick="ElderInfoAll.getAreaValue(AreaTree.getAllAreaName(AreaTree.getSelectArea()),AreaTree.getSelectArea());">
                                                                    确定
                                                                </button>
                                                            </div>
                                                        </div><!-- /.modal-content -->
                                                    </div><!-- /.modal -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END PROFILE CONTENT -->
                    </div>
                </div>
                <!-- END PAGE CONTENT-->
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript" src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"  type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript" src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/elderly/elderInfo_assessDetails.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                console.log('${method}');
                Metronic.init();
                Layout.init();
                AreaTree.init();
                assessDetails.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
