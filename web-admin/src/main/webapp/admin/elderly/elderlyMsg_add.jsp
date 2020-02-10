<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>老人基础信息</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">

        <!-- BEGIN PAGE HEADER-->
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="index.html">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">老人信息管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">老人基础信息</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">老人基础信息新增</a>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <div class="portlet " id="elderInfo_add">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">老人基础信息新增</span>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <form name="addElderForm" id="addElderForm" method="post" class="form-horizontal">
                            <input id="id" name="id" value="" type="hidden">
                            <input id="status" name="status" value="1" type="hidden">
                            <div class="form-wizard">
                                <div class="form-body">
                                    <ul class="nav nav-pills nav-justified steps">
                                        <li>
                                            <a href="#tab1" data-toggle="tab" class="step">
												<span class="number">
												1 </span>
                                                <span class="desc">
												<i class="fa fa-check"></i> 基本信息</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#tab2" data-toggle="tab" class="step">
												<span class="number">
												2 </span>
                                                <span class="desc">
												<i class="fa fa-check"></i> 扩展信息</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#tab3" data-toggle="tab" class="step">
												<span class="number">
												3 </span>
                                                <span class="desc">
												<i class="fa fa-check"></i> 健康状况</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#tab4" data-toggle="tab" class="step active">
												<span class="number">
												4 </span>
                                                <span class="desc">
												<i class="fa fa-check"></i> 居住状况</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#tab5" data-toggle="tab" class="step">
												<span class="number">
												5 </span>
                                                <span class="desc">
												<i class="fa fa-check"></i> 相关联系人 </span>
                                            </a>
                                        </li>
                                    </ul>
                                    <div id="bar" class="progress progress-striped" role="progressbar">
                                        <div class="progress-bar progress-bar-success">
                                        </div>
                                    </div>
                                    <div class="tab-content">
                                        <div class="alert alert-danger display-none">
                                            <button class="close" data-dismiss="alert"></button>
                                            有错误，请检查
                                        </div>
                                        <div class="alert alert-success display-none">
                                            <button class="close" data-dismiss="alert"></button>
                                            提交成功
                                        </div>
                                        <div class="tab-pane" id="tab1">
                                            <table border="1"
                                                   class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                                   align="center" style="border-collapse: collapse;">
                                                <tr>
                                                    <td colspan="4"
                                                        style="text-align:center;vertical-align:middle;font-size: 18px;width: 85%">
                                                        老人信息
                                                    </td>
                                                    <td rowspan="4" style="width: 15%;">
                                                        <img src="" id="photoImg">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%"
                                                        style="text-align:center;vertical-align:middle;">
                                                        <font color="red">*</font>所属区域
                                                    </td>
                                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                                        <input type="text" id="areaName2" name="areaName"
                                                               placeholder="请选择..."
                                                               onclick="ElderlyMsgCommon.selectArea('add');"
                                                               class="form-control"/>
                                                        <input type="hidden" id="areaId2" name="areaId">
                                                        <input type="hidden" id="deptCode2" name="deptCode"/>
                                                        <input type="hidden" name="serviceOrgId"
                                                               value="${serviceOrgId}">
                                                    </td>
                                                    <td width="10%" style="text-align:center;vertical-align:middle;">
                                                        照片
                                                    </td>
                                                    <td width="35%" style="text-align:center;vertical-align:middle;">
                                                        <form id="fileUpload1" name="fileUpload" action="" method="POST"
                                                              enctype="multipart/form-data" target="impResult">
                                                            <input type="hidden" name="photo" id="photo">
                                                            <table class="table-container">
                                                                <tr>
                                                                    <td style="text-align:center;width: 45%">
                                                                        <input type="file" id="file"
                                                                               name="file" size="30"
                                                                               onchange="ElderlyMsgAdd.importFile('file','msg')"/>
                                                                    </td>
                                                                    <td width="25%">
                                                                        <span id="msg" class="label"></span>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </form>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:center;vertical-align:middle;">
                                                        <font color="red">*</font>老人姓名
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;">
                                                        <input name="elderName" type="text" class="form-control"/>
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;">民族</td>
                                                    <td style="text-align:center;vertical-align:middle;">
                                                        <lb:select name="nationDictId" cssClass="form-control">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="1">汉族</lb:option>
                                                            <lb:option value="2">回族</lb:option>
                                                            <lb:option value="3">布依族</lb:option>
                                                            <lb:option value="4">藏族</lb:option>
                                                            <lb:option value="5">朝鲜族</lb:option>
                                                            <lb:option value="6">满族</lb:option>
                                                            <lb:option value="7">蒙古族</lb:option>
                                                            <lb:option value="8">维吾尔族</lb:option>
                                                            <lb:option value="9">土家族</lb:option>
                                                            <lb:option value="10">壮族</lb:option>
                                                            <lb:option value="11">苗族</lb:option>
                                                            <lb:option value="99">其他</lb:option>
                                                        </lb:select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:center;vertical-align:middle;">
                                                        <font color="red">*</font>身份证号码
                                                    </td>
                                                    <td style="text-align:left;;vertical-align:middle;" colspan="3">
                                                        <input style="width: 80%;display: inline-block;" maxlength="18"
                                                               name="idcardno" type="text" id="idcardno"
                                                               class="form-control"
                                                               onchange="ElderlyMsgAdd.validateIdCard()"/>
                                                        <span id="errorIdCard" style="color: red;"></span>
                                                        <input name="age" type="hidden" id="age"/>
                                                        <input name="sexDictId" type="hidden" id="sexDictId">
                                                        <input name="birthday" type="hidden" id="birthday"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:center;vertical-align:middle;">人员类别</td>
                                                    <td colspan="4">
                                                        <div class="checkbox-list">
                                                            <label class="checkbox-inline">
                                                                <input type="checkbox" name="elderTypeDictIds"
                                                                       value="1"/>城市三无</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="elderTypeDictIds"
                                                                       value="2"/>农村五保</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="elderTypeDictIds"
                                                                       value="3"/>城市低保</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="elderTypeDictIds"
                                                                       value="4"/>农村低保</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="elderTypeDictIds"
                                                                       value="5"/>经济困难的失能/半失能老人</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="elderTypeDictIds"
                                                                       value="6"/>70周岁及以上的计生特扶老人</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="elderTypeDictIds"
                                                                       value="7"/>百岁老人</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="elderTypeDictIds"
                                                                       value="8"/>空巢</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="elderTypeDictIds"
                                                                       value="9"/>独居</label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:center;vertical-align:middle;">住宅电话</td>
                                                    <td style="text-align:center;vertical-align:middle;">
                                                        <input name="homeTel" type="text" id="homeTel"/>
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;">移动电话</td>
                                                    <td style="text-align:center;vertical-align:middle;" colspan="2">
                                                        <input type="text" maxlength="15" name="mobile" id="mobile"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align:middle;text-align:center;">户籍所在地</td>
                                                    <td style="vertical-align:middle;text-align:center;">
                                                        <input maxlength="30" name="regPlace" type="text">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align:center;">实际居住地</td>
                                                    <td colspan="2" style="vertical-align:middle;">
                                                        <input maxlength="30" name="realAddress" type="text">
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="tab-pane" id="tab2">
                                            <table border="1"
                                                   class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                                   align="center" style="border-collapse: collapse;">
                                                <tr>
                                                    <td colspan="8"
                                                        style="text-align:center;vertical-align:middle;font-size: 18px">
                                                        扩展信息
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:center;vertical-align:middle;width: 10%">血型
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;width: 15%"><%--0:O,1:A,2:B,3:AB,4:其他--%>
                                                        <lb:select name="bloodType">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="0">O</lb:option>
                                                            <lb:option value="1">A</lb:option>
                                                            <lb:option value="2">B</lb:option>
                                                            <lb:option value="3">AB</lb:option>
                                                            <lb:option value="4">其他</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;width: 10%">
                                                        独生子女家庭
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;width: 15%">
                                                        <lb:select name="isOneChild">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="0">否</lb:option>
                                                            <lb:option value="1">是</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;width: 10%">
                                                        户籍性质
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;width: 15%">
                                                        <lb:select name="houseNature">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="0">城镇</lb:option>
                                                            <lb:option value="1">农村</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;width: 10%">
                                                        政治面貌
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;width: 15%">
                                                        <lb:select name="politics">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="0">中国共产党党员</lb:option>
                                                            <lb:option value="1">中国共产党预备党员</lb:option>
                                                            <lb:option value="2">中国国民党国民委员会会员</lb:option>
                                                            <lb:option value="3">中国民主同盟盟员</lb:option>
                                                            <lb:option value="4">中国民主建国会会员</lb:option>
                                                            <lb:option value="5">中国民主促进会会员</lb:option>
                                                            <lb:option value="6">中国农工民主党党员</lb:option>
                                                            <lb:option value="7">中国致公党党员</lb:option>
                                                            <lb:option value="8">九三学社社员</lb:option>
                                                            <lb:option value="9">台湾民主自治同盟盟员</lb:option>
                                                            <lb:option value="10">无党派民主人士</lb:option>
                                                            <lb:option value="11">群众</lb:option>
                                                            <lb:option value="12">其他</lb:option>
                                                        </lb:select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:center;vertical-align:middle;">婚姻状况</td>
                                                    <td style="vertical-align:middle;">
                                                        <lb:select name="maritalStatus">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="1">未婚</lb:option>
                                                            <lb:option value="2">已婚</lb:option>
                                                            <lb:option value="3">丧偶</lb:option>
                                                            <lb:option value="4">离异</lb:option>
                                                            <lb:option value="5">未说明</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;">享受保障待遇</td>
                                                    <td style="vertical-align:middle;">
                                                        <lb:select name="ensureTreaDictId">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="1">乘公交免费</lb:option>
                                                            <lb:option value="2">免费接种</lb:option>
                                                            <lb:option value="3">护理补贴</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;">社保卡号</td>
                                                    <td style="text-align:center;vertical-align:middle;">
                                                        <input maxlength="10" name="socialCardCode" type="text">
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;">社会保障</td>
                                                    <td style="vertical-align:middle;">
                                                        <lb:select name="liveTypeDictId">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="1">城镇职工基本养老保险</lb:option>
                                                            <lb:option value="2">机关事业单位离退休金</lb:option>
                                                            <lb:option value="3">居民或农民社会养老保险金</lb:option>
                                                            <lb:option value="8">政府其他救助</lb:option>
                                                            <lb:option value="7">城乡无社会保障老年居民养老</lb:option>
                                                            <lb:option value="6">最低生活保障金或贫困救助金</lb:option>
                                                            <lb:option value="4">高龄补贴</lb:option>
                                                            <lb:option value="10">居家养老服务补贴（服务券）</lb:option>
                                                            <lb:option value="5">农村计划生育家庭奖励扶助金</lb:option>
                                                            <lb:option value="9">失地农民政府保养金</lb:option>
                                                        </lb:select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:center;vertical-align:middle;">文化程度</td>
                                                    <td style="vertical-align:middle;">
                                                        <lb:select name="educationDictId">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="1">博士研究生</lb:option>
                                                            <lb:option value="2">硕士研究生</lb:option>
                                                            <lb:option value="3">大学本科</lb:option>
                                                            <lb:option value="4">大学专科和专科学校</lb:option>
                                                            <lb:option value="5">中等专业学校或中等技术学校</lb:option>
                                                            <lb:option value="6">技工学校</lb:option>
                                                            <lb:option value="7">高中</lb:option>
                                                            <lb:option value="8">初中</lb:option>
                                                            <lb:option value="9">小学</lb:option>
                                                            <lb:option value="0">其他</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;">常住时间</td>
                                                    <td style="vertical-align:middle;">
                                                        <lb:select name="liveYearDictId">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="1">半年以下</lb:option>
                                                            <lb:option value="2">常住</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align:center;">退休类别</td>
                                                    <td style="vertical-align:middle;">
                                                        <lb:select name="retiredType">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="500">离休</lb:option>
                                                            <lb:option value="501">退休</lb:option>
                                                            <lb:option value="502">城镇居民</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;">邮编</td>
                                                    <td style="text-align:center;vertical-align:middle;">
                                                        <input name="zipCode" maxlength="6" type="text" id="zipcode">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:center;vertical-align:middle;">
                                                        离退休前</br>单位工作性质
                                                    </td>
                                                    <td style="vertical-align:middle;">
                                                        <lb:select name="jobDictId">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="0">机关事业</lb:option>
                                                            <lb:option value="1">国有企业</lb:option>
                                                            <lb:option value="2">集体企业</lb:option>
                                                            <lb:option value="3">民营企业</lb:option>
                                                            <lb:option value="4">个体企业</lb:option>
                                                            <lb:option value="5">部队</lb:option>
                                                            <lb:option value="6">务农</lb:option>
                                                            <lb:option value="7">无业</lb:option>
                                                            <lb:option value="8">其他</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;">收入来源</td>
                                                    <td style="vertical-align:middle;">
                                                        <lb:select name="incomeSource">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="1">离退休金</lb:option>
                                                            <lb:option value="2">个人储蓄及商业养老金</lb:option>
                                                            <lb:option value="3">房屋出租金</lb:option>
                                                            <lb:option value="7">来自当地政府或社团的其他收入</lb:option>
                                                            <lb:option value="6">最低生活保障金</lb:option>
                                                            <lb:option value="4">子女给予</lb:option>
                                                            <lb:option value="5">孙子女给予</lb:option>
                                                            <lb:option value="8">劳动收入</lb:option>
                                                            <lb:option value="9">配偶收入</lb:option>
                                                            <lb:option value="10">高龄补贴</lb:option>
                                                            <lb:option value="11">其他</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;">子女情况</td>
                                                    <td style="vertical-align:middle;">
                                                        <lb:select name="childrenDictId">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="0">无</lb:option>
                                                            <lb:option value="3">独生子女</lb:option>
                                                            <lb:option value="1">二个</lb:option>
                                                            <lb:option value="2">三个及以上</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;">医疗保障</td>
                                                    <td style="vertical-align:middle;">
                                                        <lb:select name="medicalType">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="1">城镇职工基本医疗保险</lb:option>
                                                            <lb:option value="2">公费医疗</lb:option>
                                                            <lb:option value="3">新型农村合作医疗</lb:option>
                                                            <lb:option value="8">商业医疗保险</lb:option>
                                                            <lb:option value="7">城镇居民医疗保险</lb:option>
                                                            <lb:option value="6">其他</lb:option>
                                                            <lb:option value="4">没有保障</lb:option>
                                                        </lb:select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align:middle;text-align:center;">是否开通定位</td>
                                                    <td style="vertical-align:middle;">
                                                        <lb:select name="isLocation">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="是">是</lb:option>
                                                            <lb:option value="否">否</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align:center;">优待证编号</td>
                                                    <td style="vertical-align:middle;">
                                                        <input name="serialNumber" type="text">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align:center;">原照料情况1</td>
                                                    <td style="vertical-align:middle;">
                                                        <lb:select name="careCondition1">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="320">自己</lb:option>
                                                            <lb:option value="316">老伴</lb:option>
                                                            <lb:option value="317">子女</lb:option>
                                                            <lb:option value="318">兄弟姐妹</lb:option>
                                                            <lb:option value="319">孙辈</lb:option>
                                                            <lb:option value="530">两其他亲戚</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align:center;">原照料情况2</td>
                                                    <td style="vertical-align:middle;">
                                                        <lb:select name="careCondition2">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="323">住家保姆</lb:option>
                                                            <lb:option value="324">钟点工</lb:option>
                                                            <lb:option value="322">政府购买居家养老服务</lb:option>
                                                            <lb:option value="325">其他</lb:option>
                                                        </lb:select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align:middle;text-align:center;">社会活动情况</td>
                                                    <td style="vertical-align:middle;">
                                                        <lb:select name="socialActiDictId">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="387">经常</lb:option>
                                                            <lb:option value="388">偶尔</lb:option>
                                                            <lb:option value="389">从不</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align:center;">社会活动类型</td>
                                                    <td style="vertical-align:middle;">
                                                        <lb:select name="saTypeDictIds">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="1">文艺类</lb:option>
                                                            <lb:option value="2">教育类</lb:option>
                                                            <lb:option value="3">健身类</lb:option>
                                                            <lb:option value="4">慈善类</lb:option>
                                                            <lb:option value="5">经济类</lb:option>
                                                            <lb:option value="6">宗教类</lb:option>
                                                            <lb:option value="7">其他</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align:center;">特长</td>
                                                    <td style="vertical-align:middle;">
                                                        <lb:select name="specialAbility">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="1">医疗</lb:option>
                                                            <lb:option value="2">教育</lb:option>
                                                            <lb:option value="3">书画</lb:option>
                                                            <lb:option value="8">文艺表演</lb:option>
                                                            <lb:option value="7">摄影</lb:option>
                                                            <lb:option value="6">家电维修</lb:option>
                                                            <lb:option value="4">水电维修</lb:option>
                                                            <lb:option value="10">其他</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;">居住状况</td>
                                                    <td style="vertical-align:middle;">
                                                        <lb:select name="residenceDictId">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="1">与配偶住</lb:option>
                                                            <lb:option value="2">独居</lb:option>
                                                            <lb:option value="3">与子女共住</lb:option>
                                                            <lb:option value="4">与孙子女共住</lb:option>
                                                            <lb:option value="5">与兄弟姐妹共住</lb:option>
                                                            <lb:option value="6">与父母或岳父母共住</lb:option>
                                                            <lb:option value="7">住养老院</lb:option>
                                                            <lb:option value="0">其他</lb:option>
                                                        </lb:select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:center;vertical-align:middle;">现状情况</td>
                                                    <td style="text-align:center;vertical-align:middle;">
                                                        <select name="isDeath" id="isDeath"
                                                                onchange="ElderlyMsgAdd.isDeath();">
                                                            <option value="">-请选择-</option>
                                                            <option value="1" selected="selected">正常</option>
                                                            <option value="0">去世</option>
                                                            <option value="2">迁出</option>
                                                        </select>
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;">去世时间</td>
                                                    <td style="vertical-align:middle;" colspan="2">
                                                        <input type="text" class="form-control  date-picker"
                                                               name="deathTimeString"
                                                               data-date-format="yyyy-mm-dd" value=""
                                                               id="deathTimeString" disabled
                                                        >
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;">火化时间</td>
                                                    <td style="vertical-align:middle;" colspan="2">
                                                        <input type="text" class="form-control  date-picker"
                                                               name="cremationTimeString"
                                                               data-date-format="yyyy-mm-dd" value=""
                                                               id="cremationTimeString" disabled
                                                        >
                                                    </td>
                                                </tr>
                                                    <%--<tr>
                                                        <td style="vertical-align:middle;text-align:center;">服务需求</td>
                                                        <td class="box" colspan="7">
                                                            <input type="checkbox" name="serviceNeed" value="410"/>日托
                                                            <input type="checkbox" name="serviceNeed" value="411"/>家政服务
                                                            <input type="checkbox" name="serviceNeed" value="412"/>康复保健
                                                            <input type="checkbox" name="serviceNeed" value="413"/>紧急呼叫
                                                            <input type="checkbox" name="serviceNeed" value="414"/>助餐送餐
                                                            <input type="checkbox" name="serviceNeed" value="415"/>心理关爱
                                                            <input type="checkbox" name="serviceNeed" value="416"/>法律援助
                                                            <input type="checkbox" name="serviceNeed" value="417"/>文化娱乐
                                                            <input type="checkbox" name="serviceNeed" value="418"/>福利机构
                                                        </td>
                                                    </tr>--%>
                                            </table>
                                        </div>
                                        <div class="tab-pane" id="tab3">
                                            <table border="1"
                                                   class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                                   align="center" style="border-collapse: collapse;">
                                                <tr>
                                                    <td colspan="6"
                                                        style="text-align:center;vertical-align: middle;font-size: 18px">
                                                        健康状况
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align:middle;text-align: center;width: 15%">
                                                        健康状况
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 15%"><%--0:健康,1:患有疾病--%>
                                                        <lb:select name="healthStatus">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="0">健康</lb:option>
                                                            <lb:option value="1">患有疾病</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 15%">
                                                        心理状况
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 20%">
                                                        <lb:select name="psychologicDictId">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="1">正常</lb:option>
                                                            <lb:option value="2">偶尔有孤独感</lb:option>
                                                            <lb:option value="3">经常觉得孤独</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 15%">
                                                        老年疾病
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 20%">
                                                        <input name="elderDisease" maxlength="150" type="text">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align:middle;text-align: center;width: 15%">
                                                        生活自理能力
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 15%">
                                                        <lb:select name="selfcareAbility">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="0">失能</lb:option>
                                                            <lb:option value="1">半失能</lb:option>
                                                            <lb:option value="2">自理</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 15%">
                                                        药物过敏史
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 55%"
                                                        colspan="3">
                                                        <input name="drugAllergy" type="text">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align:middle;text-align: center;">慢性疾病</td>
                                                    <td style="vertical-align:middle;" colspan="5">
                                                        <div class="checkbox-list">
                                                            <label class="checkbox-inline">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="高血压"/>高血压</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="心脏病/冠心病"/>心脏病/冠心病</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="糖尿病"/>糖尿病</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="脑血管病（含中风）"/>脑血管病（含中风）</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="肾脏疾病"/>肾脏疾病</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="肝脏疾病"/>肝脏疾病</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="结核病"/>结核病</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="类风湿"/>类风湿</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="颈/腰椎病"/>颈/腰椎病</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="关节炎"/>关节炎</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="乳腺疾病"/>乳腺疾病</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="生殖系统疾病"/>生殖系统疾病</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="前列腺疾病"/>前列腺疾病</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="泌尿系统疾病"/>泌尿系统疾病</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="青光眼/白内障"/>青光眼/白内障</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="癌症/肿瘤"/>癌症/肿瘤</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="阿尔茨海默症"/>阿尔茨海默症</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="慢性支气管炎"/>慢性支气管炎</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="骨质疏松"/>骨质疏松</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="神经系统病"/>神经系统病</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="胃肠炎"/>胃肠炎</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="其他消化系统病"/>其他消化系统病</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="帕金森氏症"/>帕金森氏症</label>
                                                            <label class="checkbox-inline" style="padding-left: 0px">
                                                                <input type="checkbox" name="otherSlow"
                                                                       value="耳聋"/>耳聋</label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align:middle;text-align: center;">
                                                        其他慢性病
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;">
                                                        <input maxlength="150" name="otherSlowplus" type="text">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;">肢体残疾</td>
                                                    <td style="vertical-align:middle;text-align: center;">
                                                        <lb:select name="bodyDictId">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="352">一级</lb:option>
                                                            <lb:option value="353">二级</lb:option>
                                                            <lb:option value="354">三级</lb:option>
                                                            <lb:option value="355">四级</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;">智力残疾</td>
                                                    <td style="vertical-align:middle;text-align: center;">
                                                        <lb:select name="inteDisabled">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="362">一级</lb:option>
                                                            <lb:option value="363">二级</lb:option>
                                                            <lb:option value="364">三级</lb:option>
                                                            <lb:option value="365">四级</lb:option>
                                                        </lb:select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align:middle;text-align: center">听力残疾</td>
                                                    <td style="vertical-align:middle;text-align: center">
                                                        <lb:select name="listenDictId">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="372">一级</lb:option>
                                                            <lb:option value="373">二级</lb:option>
                                                            <lb:option value="374">三级</lb:option>
                                                            <lb:option value="375">四级</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center">多重残疾</td>
                                                    <td style="vertical-align:middle;text-align: center">
                                                        <lb:select name="manyDictId">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="382">一级</lb:option>
                                                            <lb:option value="383">二级</lb:option>
                                                            <lb:option value="384">三级</lb:option>
                                                            <lb:option value="385">四级</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center">精神残疾</td>
                                                    <td style="vertical-align:middle;text-align: center">
                                                        <lb:select name="spiritDictId">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="357">一级</lb:option>
                                                            <lb:option value="358">二级</lb:option>
                                                            <lb:option value="359">三级</lb:option>
                                                            <lb:option value="360">四级</lb:option>
                                                        </lb:select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align:middle;text-align: center">言语残疾</td>
                                                    <td style="vertical-align:middle;text-align: center">
                                                        <lb:select name="speakDictId">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="367">一级</lb:option>
                                                            <lb:option value="368">二级</lb:option>
                                                            <lb:option value="369">三级</lb:option>
                                                            <lb:option value="370">四级</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center">视力残疾</td>
                                                    <td style="vertical-align:middle;text-align: center">
                                                        <lb:select name="visionDictId">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="377">一级</lb:option>
                                                            <lb:option value="378">二级</lb:option>
                                                            <lb:option value="379">三级</lb:option>
                                                            <lb:option value="380">四级</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center">特殊对象</td>
                                                    <td style="vertical-align:middle;text-align: center">
                                                        <lb:select name="specialDictIds">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="522">颈椎病</lb:option>
                                                            <lb:option value="523">腰椎病</lb:option>
                                                            <lb:option value="524">双膝关节退变</lb:option>
                                                            <lb:option value="525">关节置换术后</lb:option>
                                                            <lb:option value="526">关节炎</lb:option>
                                                            <lb:option value="527">骨折后</lb:option>
                                                        </lb:select>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="tab-pane" id="tab4">
                                            <table border="1"
                                                   class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                                   align="center" style="border-collapse: collapse;">
                                                <tr>
                                                    <td style="text-align: center;" colspan="6">居住条件</td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align:middle;text-align: center;width: 15%">
                                                        住房性质
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 15%">
                                                        <lb:select name="houseTypeDictId">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="1">有产权</lb:option>
                                                            <lb:option value="2">无产权</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 15%">居室
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 20%">
                                                        <lb:select name="roomTypeDictId">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="287">一居</lb:option>
                                                            <lb:option value="288">二居</lb:option>
                                                            <lb:option value="289">三居</lb:option>
                                                            <lb:option value="290">其他</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 15%">
                                                        出入无障碍设施
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 20%">
                                                        <lb:select name="livingCondition1">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="301">有</lb:option>
                                                            <lb:option value="302">无</lb:option>
                                                        </lb:select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align:middle;text-align: center;width: 15%">
                                                        楼层电梯
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 15%">
                                                        <lb:select name="hasElevator">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="1">有</lb:option>
                                                            <lb:option value="2">无</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 15%">居住楼层<br/>(楼层无电梯的)
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 20%">
                                                        <lb:select name="floor">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="1">一层</lb:option>
                                                            <lb:option value="2">二层</lb:option>
                                                            <lb:option value="3">三层以上</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 15%">
                                                        室内厕所
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 20%">
                                                        <lb:select name="hasToilet">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="1">有</lb:option>
                                                            <lb:option value="2">无</lb:option>
                                                        </lb:select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align:middle;text-align: center;width: 15%">
                                                        室内洗浴设备
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 15%">
                                                        <lb:select name="hasBath">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="1">有</lb:option>
                                                            <lb:option value="2">无</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 15%">
                                                        室内无障碍设施
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 20%">
                                                        <lb:select name="livingCondition2">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="304">有</lb:option>
                                                            <lb:option value="305">无</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 15%">
                                                        室内洗浴设施
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width: 15%">
                                                        <lb:select name="livingCondition4">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="310">有</lb:option>
                                                            <lb:option value="311">无</lb:option>
                                                        </lb:select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align:middle;text-align: center;">
                                                        居住安全风险
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;" colspan="2">
                                                        <lb:select name="livingCondition5">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="313">有</lb:option>
                                                            <lb:option value="314">无</lb:option>
                                                        </lb:select>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;">
                                                        备注
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;" colspan="2">
                                                        <input type="text" name="residenceRemark" maxlength="60"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="tab-pane" id="tab5">
                                            <div class="table-container">
                                                <table class="table table-striped table-bordered table-hover"
                                                       id="datatable_retionship_list">
                                                    <thead>
                                                    <tr role="row" class="heading">
                                                        <th>
                                                            联系人姓名
                                                        </th>
                                                        <th>
                                                            手机号码
                                                        </th>
                                                        <th>
                                                            与老人关系
                                                        </th>
                                                        <th>
                                                            是否有老人钥匙
                                                        </th>
                                                        <th>
                                                            备注
                                                        </th>
                                                        <th>
                                                            操作
                                                        </th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    </tbody>
                                                </table>
                                                <div style="height: 40px">
                                                    <button id="btnAddRelate" type="button"
                                                            class="btn btn-circle green pull-right">增加
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-5 col-md-9">
                                        <a href="javascript:" class="btn default button-previous">
                                            <i class="m-icon-swapleft"></i> 返回 </a>
                                        <a href="javascript:" class="btn blue button-next">
                                            保存 <i class="m-icon-swapright m-icon-white"></i>
                                        </a>
                                        <a href="javascript:" class="btn green button-submit">
                                            提交 <i class="m-icon-swapright m-icon-white"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- END CHANGE AVATAR TAB -->
                    </div>
                </div>
            </div>
        </div>
        <!-- END CONTENT -->

        <div id="addRelateModal" class="modal" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" style="margin-top:150px; width: 800px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title">
                            新增联系人
                        </h4>
                    </div>
                    <div class="modal-body form-horizontal form">
                        <div class="form-body">
                            <form id="addForm">
                                <input type="hidden" name="elderId" id="elderId" value="${elderlyMsg.id}">
                                <table border="1"
                                       class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                       align="center" style="border-collapse: collapse;">
                                    <tr>
                                        <td>联系人姓名<span style="color: red">*</span></td>
                                        <td><input type="text" name="linkName" class="form-control">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>手机号码<span style="color: red">*</span></td>
                                        <td><input type="text" name="linkTel" class="form-control"></td>
                                    </tr>
                                    <tr>
                                        <td>与老人关系<span style="color: red">*</span></td>
                                        <td>
                                            <lb:select id="relationship" name="relationship"
                                                       cssClass="form-control">
                                                <lb:option value="">--请选择--</lb:option>
                                                <lb:option value="邻居">邻居</lb:option>
                                                <lb:option value="亲属">亲属</lb:option>
                                                <lb:option value="社区">社区</lb:option>
                                                <lb:option value="社区卫生院">社区卫生院</lb:option>
                                                <lb:option value="物业">物业</lb:option>
                                            </lb:select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>是否有老人钥匙<span style="color: red">*</span></td>
                                        <td>
                                            <select name="haveKey" class="form-control">
                                                <option value="">--请选择--</option>
                                                <option value="是">是</option>
                                                <option value="否">否</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>备注</td>
                                        <td><input type="text" class="form-control" name="remark"></td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!-- 模态框（Modal） -->
        <div class="modal " id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">请选择...</h4>
                </div>
                <div class="modal-body">
                    <!-- BEGIN PAGE CONTENT-->
                    <div id="areaTree" class="tree-demo"></div>
                    <!-- END PAGE CONTENT-->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary"
                            onclick="ElderlyMsgCommon.getAreaValue(AreaTree.getAllAreaName(AreaTree.getSelectArea()),AreaTree.getSelectArea(),AreaTree.getAllAreaCode(AreaTree.getSelectArea()));">
                        确定
                    </button>
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script type="text/javascript" charset="utf-8"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        <!--timer-->
        <script type="text/javascript" charset="utf-8"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" charset="utf-8"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <!--upload-->
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/uploadPreview.js"
                type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/elderly/elderlyMsg_add.js?v=1.4"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js?"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ueditor/third-party/webuploader/webuploader.custom.js?"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/elderly/elderlyMsg_common.js?v=1.1"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js"
                type="text/javascript"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();

                AreaTree.init();

                ElderlyMsgAdd.init();

                ElderlyMsgCommon.init();

                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
