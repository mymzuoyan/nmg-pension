<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>老人基础信息</title>
        <c:choose>
            <c:when test="${method=='show'}">
                <c:set var="title1" value="active"></c:set>
            </c:when>
            <c:when test="${method=='edit'}">
                <c:set var="title2" value="active"></c:set>
            </c:when>
        </c:choose>
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
                    <c:choose>
                        <c:when test="${method=='show'}">
                            <a href="#">老人殡葬信息详情</a>
                        </c:when>
                        <c:when test="${method=='edit'}">
                            <a href="#">老人基础信息查看</a>
                        </c:when>
                    </c:choose>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <c:choose>
                                <c:when test="${method=='show'}">
                                    <span class="caption-subject font-red-sunglo bold uppercase">老人殡葬信息详情</span>
                                </c:when>
                                <c:when test="${method=='edit'}">
                                    <span class="caption-subject font-red-sunglo bold uppercase">老人基础信息查看</span>
                                </c:when>
                            </c:choose>
                        </div>
                        <div class="tools">
                            <c:choose>
                                <c:when test="${method=='edit'}">
                                    <div style="float: right;margin-right: 15px;margin-top: 5px;margin-bottom: 5px;">
                                        <div style="width:80px;float:left;display: block;padding-right: 10px;">
                                            <a class="btn btn-circle green"
                                               onclick="ElderlyMsgCommon.allowEdit()"><i
                                                    class="fa">修改</i></a>
                                        </div>
                                    </div>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="tabbable-line">
                            <ul class="nav nav-tabs ">
                                <li class="active">
                                    <a id="tab_info1" href="#tab_info" data-toggle="tab">
                                        基本信息 </a>
                                </li>
                                <li>
                                    <a id="tab_kuozhan1" href="#tab_kuozhan" data-toggle="tab">
                                        扩展信息 </a>
                                </li>
                                <li>
                                    <a id="tab_health1" href="#tab_health" data-toggle="tab">
                                        健康状况 </a>
                                </li>
                                <li>
                                    <a id="tab_assess1" href="#tab_assess" data-toggle="tab">
                                        能力评估 </a>
                                </li>
                                <li>
                                    <a id="tab_living1" href="#tab_living" data-toggle="tab">
                                        居住状况 </a>
                                </li>
                                <li>
                                    <a id="tab_relate1" href="#tab_relate" data-toggle="tab">
                                        相关联系人 </a>
                                </li>
                            </ul>
                            <form id="editElderFrom" name="editElderFrom" method="post">
                                <div class="tab-content">
                                    <!-- PERSONAL INFO TAB -->
                                    <div class="tab-pane active" id="tab_info">
                                        <table border="1"
                                               class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                               align="center" style="border-collapse: collapse;">
                                            <tr>
                                                <td colspan="4"
                                                    style="text-align: center;vertical-align:middle;font-size:18px;width: 85%">
                                                    老人信息
                                                </td>
                                                <td rowspan="4" style="width: 15%;">
                                                    <c:choose>
                                                        <c:when test="${elderlyMsg.photo!=null and elderlyMsg.photo!=''}">
                                                            <img src="${pageContext.request.contextPath}${elderlyMsg.photo}"
                                                                 style="width: 168px;height: 164px;" id="photoImg">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="" id="photoImg">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="10%"
                                                    style="text-align:center;vertical-align:middle;">
                                                    <font color="red">*</font>所属区域
                                                </td>
                                                <td width="30%" style="vertical-align:middle;">
                                                    <input type="text" name="areaName" id="areaName"
                                                           style="width:90%" placeholder="请选择..."
                                                           onclick="ElderlyMsgCommon.selectArea('edit');"
                                                           value="${elderlyMsg.areaName}"/>
                                                    <input type="hidden" name="areaId" id="areaId"
                                                           value="${elderlyMsg.areaId}"/>
                                                        <%--<a id="abut" href="javascript:ElderlyMsgCommon.selectArea('edit');" style="width: 50px;">[选择]</a>--%>
                                                    <input type="hidden" name="id" id="id"
                                                           value="${elderlyMsg.id}"/>
                                                    <input type="hidden" name="deptCode" id="deptCode"
                                                           value="${elderlyMsg.deptCode}"/>
                                                </td>
                                                <td width="10%"
                                                    style="text-align:center;vertical-align:middle;">
                                                    照片
                                                </td>
                                                <td width="35%" style="text-align:center;vertical-align:middle;"
                                                >
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
                                                    <input name="elderName" type="text"
                                                           value="${elderlyMsg.elderName}"/>
                                                </td>
                                                <td style="text-align:center;vertical-align:middle;">民族</td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="nationDictId"
                                                               value="${elderlyMsg.nationDictId}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="1">汉族</lb:option>
                                                        <lb:option value="2">蒙古族</lb:option>
                                                        <lb:option value="3">回族</lb:option>
                                                        <lb:option value="4">藏族</lb:option>
                                                        <lb:option value="5">维吾尔族</lb:option>
                                                        <lb:option value="6">苗族</lb:option>
                                                        <lb:option value="7">彝族</lb:option>
                                                        <lb:option value="8">壮族</lb:option>
                                                        <lb:option value="9">布依族</lb:option>
                                                        <lb:option value="10">朝鲜族</lb:option>
                                                        <lb:option value="11">满族</lb:option>
                                                        <lb:option value="12">侗族</lb:option>
                                                        <lb:option value="13">瑶族</lb:option>
                                                        <lb:option value="14">白族</lb:option>
                                                        <lb:option value="15">土家族</lb:option>
                                                        <lb:option value="16">哈尼族</lb:option>
                                                        <lb:option value="17">哈萨克族</lb:option>
                                                        <lb:option value="18">傣族</lb:option>
                                                        <lb:option value="19">黎族</lb:option>
                                                        <lb:option value="20">傈僳族</lb:option>
                                                        <lb:option value="21">佤族</lb:option>
                                                        <lb:option value="22">畲族</lb:option>
                                                        <lb:option value="23">高山族</lb:option>
                                                        <lb:option value="24">拉祜族</lb:option>
                                                        <lb:option value="25">水族</lb:option>
                                                        <lb:option value="26">东乡族</lb:option>
                                                        <lb:option value="27">纳西族</lb:option>
                                                        <lb:option value="28">景颇族</lb:option>
                                                        <lb:option value="29">柯尔克孜</lb:option>
                                                        <lb:option value="30">土族</lb:option>
                                                        <lb:option value="31">达斡尔族</lb:option>
                                                        <lb:option value="32">仫佬族</lb:option>
                                                        <lb:option value="33">羌族</lb:option>
                                                        <lb:option value="34">布朗族</lb:option>
                                                        <lb:option value="35">撒拉族</lb:option>
                                                        <lb:option value="36">毛南族</lb:option>
                                                        <lb:option value="37">仡佬族</lb:option>
                                                        <lb:option value="38">锡伯族</lb:option>
                                                        <lb:option value="39">阿昌族</lb:option>
                                                        <lb:option value="40">普米族</lb:option>
                                                        <lb:option value="41">塔吉克族</lb:option>
                                                        <lb:option value="42">怒族</lb:option>
                                                        <lb:option value="43">乌孜别克</lb:option>
                                                        <lb:option value="44">俄罗斯族</lb:option>
                                                        <lb:option value="45">鄂温克族</lb:option>
                                                        <lb:option value="46">德昂族</lb:option>
                                                        <lb:option value="47">保安族</lb:option>
                                                        <lb:option value="48">裕固族</lb:option>
                                                        <lb:option value="49">京族</lb:option>
                                                        <lb:option value="50">塔塔尔族</lb:option>
                                                        <lb:option value="51">独龙族</lb:option>
                                                        <lb:option value="52">鄂伦春族</lb:option>
                                                        <lb:option value="53">赫哲族</lb:option>
                                                        <lb:option value="54">门巴族</lb:option>
                                                        <lb:option value="55">珞巴族</lb:option>
                                                        <lb:option value="56">基诺族</lb:option>
                                                        <lb:option value="99">其他</lb:option>
                                                    </lb:select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center;vertical-align:middle;">
                                                    <font color="red">*</font>身份证号码
                                                </td>
                                                <td style="text-align:center;vertical-align:middle;" colspan="3">
                                                    <input maxlength="18" name="idcardno" type="text" id="idcardno"
                                                           value="${elderlyMsg.idcardno}"
                                                           onchange="ElderlyAdd.validateIdCard();"/><span
                                                        id="errorIdCard" style="color: red;"></span>
                                                    <input name="age" type="hidden" value="${elderlyMsg.age}"
                                                           id="age"/>
                                                    <input name="sexDictId" type="hidden"
                                                           value="${elderlyMsg.sexDictId}"
                                                           id="sexDictId"/>
                                                    <input name="birthday" type="hidden" value="${elderlyMsg.birthday}"
                                                           id="birthday"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center;vertical-align:middle;">人员类别</td>
                                                <td colspan="4">
                                                    <input type="hidden" id="elderTypeDictIds"
                                                           value="${elderlyMsg.elderTypeDictIds}">
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
                                                <td style="text-align:center;vertical-align:middle;">住宅电话
                                                </td>
                                                <td style="text-align:center;vertical-align:middle;">
                                                    <input name="homeTel" type="text"
                                                           value="${elderlyMsg.homeTel}"/>
                                                </td>
                                                <td style="text-align:center;vertical-align:middle;">移动电话
                                                </td>
                                                <td style="text-align:center;vertical-align:middle;" colspan="2">
                                                    <input type="text" maxlength="15" name="mobile"
                                                           value="${elderlyMsg.mobile}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:middle;text-align:center;">户籍所在地</td>
                                                <td style="vertical-align:middle;">
                                                    <input maxlength="30" name="regPlace" type="text"
                                                           value="${elderlyMsg.regPlace}">
                                                </td>
                                                <td style="vertical-align:middle;text-align:center;">实际居住地</td>
                                                <td style="vertical-align:middle;" colspan="2">
                                                    <input maxlength="30" name="realAddress" type="text"
                                                           value="${elderlyMsg.realAddress}">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:middle;text-align: center">养老需求</td>
                                                <td colspan="4" class="box">
                                                    <input type="hidden" id="serviceNeed" name="serviceNeed"
                                                           value="${elderlyMsg.serviceNeed}">
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
                                            </tr>
                                        </table>
                                        <c:choose>
                                            <c:when test="${method=='edit'}">
                                                <div style="text-align: right;width: 40%; margin-right: 71px; display: inline-block;">
                                                    <span id="labelmsg" class="label"></span>
                                                    <button type="button" onclick="ElderlyMsgCommon.editElder()"
                                                            name="editElder"
                                                            class="btn btn-circle green"><i
                                                            class="fa">保存</i>
                                                    </button>
                                                </div>
                                                <div style="width: 40%;display: inline-block">
                                                    <button onclick="window.parent.closeTab('elderInfo')"
                                                            class="btn btn-circle green back"><i
                                                            class="fa ">返回</i>
                                                    </button>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div style="text-align: right;width: 53%; margin-right: 71px; display: inline-block;">
                                                    <button onclick="window.parent.closeTab('elderInfo')"
                                                            class="btn btn-circle green back"><i
                                                            class="fa ">返回</i>
                                                    </button>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="tab-pane" id="tab_kuozhan">
                                        <table border="1"
                                               class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                               align="center" style="border-collapse: collapse;">
                                            <tr>
                                                <td colspan="8"
                                                    style="text-align: center;vertical-align:middle;font-size:18px;">
                                                    扩展信息
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center;vertical-align:middle;width: 10%">血型</td>
                                                <td style="text-align:center;vertical-align:middle;width: 15%"><%--0:O,1:A,2:B,3:AB,4:其他--%>
                                                    <lb:select name="bloodType"
                                                               value="${elderlyMsg.bloodType}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="0">O</lb:option>
                                                        <lb:option value="1">A</lb:option>
                                                        <lb:option value="2">B</lb:option>
                                                        <lb:option value="3">AB</lb:option>
                                                        <lb:option value="4">其他</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="text-align:center;vertical-align:middle;width: 10%">
                                                    是否独生子女家庭
                                                </td>
                                                <td style="text-align:center;vertical-align:middle;width: 15%">
                                                    <lb:select name="isOneChild"
                                                               value="${elderlyMsg.isOneChild}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="0">否</lb:option>
                                                        <lb:option value="1">是</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="text-align:center;vertical-align:middle;width: 10%">户籍性质
                                                </td>
                                                <td style="vertical-align:middle;width: 15%">
                                                    <lb:select name="houseNature"
                                                               value="${elderlyMsg.houseNature}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="0">城镇</lb:option>
                                                        <lb:option value="1">农村</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="text-align:center;vertical-align:middle;width: 10%">政治面貌
                                                </td>
                                                <td style="text-align:center;vertical-align:middle;width: 15%">
                                                    <lb:select name="politics"
                                                               value="${elderlyMsg.politics}">
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
                                                <td style="text-align:center;vertical-align:middle;">婚姻状况
                                                </td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="maritalStatus"
                                                               value="${elderlyMsg.maritalStatus}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="1">未婚</lb:option>
                                                        <lb:option value="2">已婚</lb:option>
                                                        <lb:option value="3">丧偶</lb:option>
                                                        <lb:option value="4">离异</lb:option>
                                                        <lb:option value="5">未说明</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="text-align:center;vertical-align:middle;">
                                                    享受保障待遇
                                                </td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="ensureTreaDictId"
                                                               value="${elderlyMsg.ensureTreaDictId}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="1">乘公交免费</lb:option>
                                                        <lb:option value="2">免费接种</lb:option>
                                                        <lb:option value="3">护理补贴</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="text-align:center;vertical-align:middle;">社保卡号
                                                </td>
                                                <td style="text-align:center;vertical-align:middle;">
                                                    <input maxlength="10" name="socialCardCode" type="text"
                                                           value="${elderlyMsg.socialCardCode}" id="socialCardCode">
                                                </td>
                                                <td style="text-align:center;vertical-align:middle;">社会保障
                                                </td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="liveTypeDictId"
                                                               value="${elderlyMsg.liveTypeDictId}">
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
                                                <td style="text-align:center;vertical-align:middle;">文化程度
                                                </td>

                                                <td style="vertical-align:middle;">
                                                    <lb:select name="educationDictId"
                                                               value="${elderlyMsg.educationDictId}">
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
                                                <td style="text-align:center;vertical-align:middle;">常住时间
                                                </td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="liveYearDictId"
                                                               value="${elderlyMsg.liveYearDictId}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="1">半年以下</lb:option>
                                                        <lb:option value="2">常住</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="text-align:center;vertical-align:middle;">退休类别</td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="retiredType"
                                                               value="${elderlyMsg.retiredType}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="500">离休</lb:option>
                                                        <lb:option value="501">退休</lb:option>
                                                        <lb:option value="502">城镇居民</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="text-align:center;vertical-align:middle;">邮编</td>
                                                <td style="text-align:center;vertical-align:middle;">
                                                    <input name="zipCode" maxlength="10"
                                                           value="${elderlyMsg.zipCode}" type="text">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center;vertical-align:middle;">
                                                    离退休前<br/>单位工作性质
                                                </td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select value="${elderlyMsg.jobDictId}"
                                                               name="jobDictId">
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
                                                <td style="text-align:center;vertical-align:middle;">收入来源
                                                </td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="incomeSource"
                                                               value="${elderlyMsg.incomeSource}">
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
                                                <td style="text-align:center;vertical-align:middle;">子女情况
                                                </td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="childrenDictId"
                                                               value="${elderlyMsg.childrenDictId}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="0">无</lb:option>
                                                        <lb:option value="3">独生子女</lb:option>
                                                        <lb:option value="1">二个</lb:option>
                                                        <lb:option value="2">三个及以上</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="text-align:center;vertical-align:middle;">医疗保障
                                                </td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="medicalType"
                                                               value="${elderlyMsg.medicalType}">
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
                                                <td style="vertical-align:middle;text-align: center">是否开通定位</td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="isLocation"
                                                               value="${elderlyMsg.isLocation}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="是">是</lb:option>
                                                        <lb:option value="否">否</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="vertical-align:middle;text-align: center">优待证编号</td>
                                                <td style="vertical-align:middle;">
                                                    <input name="serialNumber" type="text"
                                                           value="${elderlyMsg.serialNumber}">
                                                </td>
                                                <td style="vertical-align:middle;text-align: center">原照料情况1</td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="careCondition1"
                                                               value="${elderlyMsg.careCondition1}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="320">自己</lb:option>
                                                        <lb:option value="316">老伴</lb:option>
                                                        <lb:option value="317">子女</lb:option>
                                                        <lb:option value="318">兄弟姐妹</lb:option>
                                                        <lb:option value="319">孙辈</lb:option>
                                                        <lb:option value="530">两其他亲戚</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="vertical-align:middle;text-align: center">原照料情况2</td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="careCondition2"
                                                               value="${elderlyMsg.careCondition2}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="323">住家保姆</lb:option>
                                                        <lb:option value="324">钟点工</lb:option>
                                                        <lb:option value="322">政府购买居家养老服务</lb:option>
                                                        <lb:option value="325">其他</lb:option>
                                                    </lb:select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:middle;text-align: center">社会活动情况</td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="socialActiDictId"
                                                               value="${elderlyMsg.socialActiDictId}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="387">经常</lb:option>
                                                        <lb:option value="388">偶尔</lb:option>
                                                        <lb:option value="389">从不</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="vertical-align:middle;text-align: center">社会活动类型</td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="saTypeDictIds"
                                                               value="${elderlyMsg.saTypeDictIds}">
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
                                                <td style="vertical-align:middle;text-align: center">特长</td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="specialAbility"
                                                               value="${elderlyMsg.specialAbility}">
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
                                                <td style="text-align:center;vertical-align:middle;">居住状况
                                                </td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="residenceDictId"
                                                               value="${elderlyMsg.residenceDictId}">
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
                                                <td style="text-align:center;vertical-align:middle;">现状情况
                                                </td>
                                                <td style="text-align:center;vertical-align:middle;">
                                                    <lb:select name="isDeath" value="${elderlyMsg.isDeath}"
                                                               id="isDeath">
                                                        <lb:option value="">-请选择-</lb:option>
                                                        <lb:option value="1"
                                                                   selected="selected">正常</lb:option>
                                                        <lb:option value="0">去世</lb:option>
                                                        <lb:option value="2">迁出</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="text-align:center;vertical-align:middle;">去世时间
                                                </td>
                                                <td colspan="2" style="vertical-align:middle;">
                                                    <input type="text" class="form-control  date-picker"
                                                           name="deathTimeString"
                                                           data-date-format="yyyy-mm-dd"
                                                           value="${deathTimeString}" disabled
                                                    >
                                                </td>
                                                <td style="text-align:center;vertical-align:middle;">火化时间
                                                </td>
                                                <td colspan="2" style="vertical-align:middle;">
                                                    <input type="text" class="form-control  date-picker"
                                                           name="cremationTimeString"
                                                           data-date-format="yyyy-mm-dd"
                                                           value="${cremationTimeString}" disabled
                                                    >
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:middle;text-align: center">养老意愿</td>
                                                <td colspan="7" class="box">
                                                    <input type="text" class="form-control" name="will"
                                                           value="">
                                                </td>
                                            </tr>
                                        </table>
                                        <c:choose>
                                            <c:when test="${method=='edit'}">
                                                <div style="text-align: right;width: 40%; margin-right: 71px; display: inline-block;">
                                                    <span id="labelmsg" class="label"></span>
                                                    <button type="button" onclick="ElderlyMsgCommon.editElder()"
                                                            name="editElder"
                                                            class="btn btn-circle green"><i
                                                            class="fa">保存</i>
                                                    </button>
                                                </div>
                                                <div style="width: 40%;display: inline-block">
                                                    <button onclick="window.parent.closeTab('elderInfo');"
                                                            class="btn btn-circle green back"><i
                                                            class="fa ">返回</i>
                                                    </button>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div style="text-align: right;width: 53%; margin-right: 71px; display: inline-block;">
                                                    <button onclick="window.parent.closeTab('elderInfo')"
                                                            class="btn btn-circle green back"><i
                                                            class="fa ">返回</i>
                                                    </button>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="tab-pane" id="tab_health">
                                        <table border="1"
                                               class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                               align="center" style="border-collapse: collapse;">
                                            <tr>
                                                <td colspan="6"
                                                    style="text-align: center;vertical-align: middle;font-size: 18px">
                                                    健康状况
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:middle;text-align: center;width: 15%">健康状况
                                                </td>
                                                <td style="vertical-align:middle;width: 15%"><%--0:健康,1:患有疾病--%>
                                                    <lb:select name="healthStatus"
                                                               value="${elderlyMsg.healthStatus}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="0">健康</lb:option>
                                                        <lb:option value="1">患有疾病</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="vertical-align:middle;text-align: center;width: 15%">心理状况
                                                </td>
                                                <td style="vertical-align:middle;width: 20%">
                                                    <lb:select name="psychologicDictId"
                                                               value="${elderlyMsg.psychologicDictId}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="1">正常</lb:option>
                                                        <lb:option value="2">偶尔有孤独感</lb:option>
                                                        <lb:option value="3">经常觉得孤独</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="vertical-align:middle;text-align: center;width: 15%">老年疾病
                                                </td>
                                                <td style="vertical-align:middle;width: 20%">
                                                    <input name="elderDisease" maxlength="150" type="text"
                                                           value="${elderlyMsg.elderDisease}">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:middle;text-align: center;">生活自理能力</td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="selfcareAbility"
                                                               value="${elderlyMsg.selfcareAbility}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="0">失能</lb:option>
                                                        <lb:option value="1">半失能</lb:option>
                                                        <lb:option value="2">自理</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="vertical-align:middle;text-align: center;">药物过敏史</td>
                                                <td style="vertical-align:middle;" colspan="3">
                                                    <input name="drugAllergy" type="text"
                                                           value="${elderlyMsg.drugAllergy}">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:middle;text-align: center;">慢性疾病</td>
                                                <td style="vertical-align:middle;" colspan="5">
                                                    <input type="hidden" id="otherSlow"
                                                           value="${elderlyMsg.otherSlow}">
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
                                                <td style="vertical-align:middle;text-align: center;">其他慢性病</td>
                                                <td style="vertical-align:middle;">
                                                    <input maxlength="150" name="otherSlowplus" type="text"
                                                           value="${elderlyMsg.otherSlowplus}">
                                                </td>
                                                <td style="vertical-align:middle;text-align: center;">肢体残疾</td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="bodyDictId"
                                                               value="${elderlyMsg.bodyDictId}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="352">一级</lb:option>
                                                        <lb:option value="353">二级</lb:option>
                                                        <lb:option value="354">三级</lb:option>
                                                        <lb:option value="355">四级</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="vertical-align:middle;text-align: center">智力残疾</td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="inteDisabled"
                                                               value="${elderlyMsg.inteDisabled}">
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
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="listenDictId"
                                                               value="${elderlyMsg.listenDictId}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="372">一级</lb:option>
                                                        <lb:option value="373">二级</lb:option>
                                                        <lb:option value="374">三级</lb:option>
                                                        <lb:option value="375">四级</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="vertical-align:middle;text-align: center">多重残疾</td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="manyDictId"
                                                               value="${elderlyMsg.manyDictId}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="382">一级</lb:option>
                                                        <lb:option value="383">二级</lb:option>
                                                        <lb:option value="384">三级</lb:option>
                                                        <lb:option value="385">四级</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="vertical-align:middle;text-align: center">精神残疾</td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="spiritDictId"
                                                               value="${elderlyMsg.spiritDictId}">
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
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="speakDictId"
                                                               value="${elderlyMsg.speakDictId}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="367">一级</lb:option>
                                                        <lb:option value="368">二级</lb:option>
                                                        <lb:option value="369">三级</lb:option>
                                                        <lb:option value="370">四级</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="vertical-align:middle;text-align: center">视力残疾</td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="visionDictId"
                                                               value="${elderlyMsg.visionDictId}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="377">一级</lb:option>
                                                        <lb:option value="378">二级</lb:option>
                                                        <lb:option value="379">三级</lb:option>
                                                        <lb:option value="380">四级</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="vertical-align:middle;text-align: center">特殊对象</td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="specialDictIds"
                                                               value="${elderlyMsg.specialDictIds}">
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
                                        <c:choose>
                                            <c:when test="${method=='edit'}">
                                                <div style="text-align: right;width: 40%; margin-right: 71px; display: inline-block;">
                                                    <span id="labelmsg" class="label"></span>
                                                    <button type="button" onclick="ElderlyMsgCommon.editElder()"
                                                            name="editElder"
                                                            class="btn btn-circle green"><i
                                                            class="fa">保存</i>
                                                    </button>
                                                </div>
                                                <div style="width: 40%;display: inline-block">
                                                    <button onclick="window.parent.closeTab('elderInfo')"
                                                            class="btn btn-circle green back"><i
                                                            class="fa ">返回</i>
                                                    </button>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div style="text-align: right;width: 53%; margin-right: 71px; display: inline-block;">
                                                    <button onclick="window.parent.closeTab('elderInfo')"
                                                            class="btn btn-circle green back"><i
                                                            class="fa ">返回</i>
                                                    </button>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="tab-pane" id="tab_ability">
                                        <%--<table border="1"--%>
                                               <%--class="table table-bordered table-hover table-condensed table-responsive table-expandable"--%>
                                               <%--align="center" style="border-collapse: collapse;">--%>
                                        <%--</table>--%>
                                    </div>
                                    <div class="tab-pane" id="tab_living">
                                        <table border="1"
                                               class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                               align="center" style="border-collapse: collapse;">
                                            <tr>
                                                <td style="text-align: center;vertical-align: middle;font-size: 18px"
                                                    colspan="6">居住条件
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:middle;text-align:center;width: 15%">住房性质</td>
                                                <td style="vertical-align:middle;width: 15%">
                                                    <lb:select name="houseTypeDictId"
                                                               value="${elderlyMsg.houseTypeDictId}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="1">有产权</lb:option>
                                                        <lb:option value="2">无产权</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="vertical-align:middle;text-align:center;width: 15%">居室</td>
                                                <td style="vertical-align:middle;width: 20%">
                                                    <lb:select name="roomTypeDictId"
                                                               value="${elderlyMsg.roomTypeDictId}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="287">一居</lb:option>
                                                        <lb:option value="288">二居</lb:option>
                                                        <lb:option value="289">三居</lb:option>
                                                        <lb:option value="290">其他</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="vertical-align:middle;text-align:center;width: 15%">出入无障碍设施
                                                </td>
                                                <td style="vertical-align:middle;width: 20%">
                                                    <lb:select name="livingCondition1"
                                                               value="${elderlyMsg.livingCondition1}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="301">有</lb:option>
                                                        <lb:option value="302">无</lb:option>
                                                    </lb:select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:middle;text-align:center;">楼层电梯</td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="hasElevator"
                                                               value="${elderlyMsg.hasElevator}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="1">有</lb:option>
                                                        <lb:option value="2">无</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="vertical-align:middle;text-align:center;">居住楼层</br>(楼层无电梯的)
                                                </td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="floor" value="${elderlyMsg.floor}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="1">一层</lb:option>
                                                        <lb:option value="2">二层</lb:option>
                                                        <lb:option value="3">三层以上</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="vertical-align:middle;text-align:center;">室内厕所</td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="hasToilet"
                                                               value="${elderlyMsg.hasToilet}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="1">有</lb:option>
                                                        <lb:option value="2">无</lb:option>
                                                    </lb:select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:middle;text-align: center">室内洗浴设备</td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="hasBath" value="${elderlyMsg.hasBath}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="1">有</lb:option>
                                                        <lb:option value="2">无</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="vertical-align:middle;text-align: center">室内无障碍设施</td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="livingCondition2"
                                                               value="${elderlyMsg.livingCondition2}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="304">有</lb:option>
                                                        <lb:option value="305">无</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="vertical-align:middle;text-align: center">室内洗浴设施</td>
                                                <td style="vertical-align:middle;">
                                                    <lb:select name="livingCondition4"
                                                               value="${elderlyMsg.livingCondition4}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="310">有</lb:option>
                                                        <lb:option value="311">无</lb:option>
                                                    </lb:select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:middle;text-align: center">居住安全风险</td>
                                                <td style="vertical-align:middle;" colspan="2">
                                                    <lb:select name="livingCondition5"
                                                               value="${elderlyMsg.livingCondition5}">
                                                        <lb:option value="">--请选择--</lb:option>
                                                        <lb:option value="313">有</lb:option>
                                                        <lb:option value="314">无</lb:option>
                                                    </lb:select>
                                                </td>
                                                <td style="vertical-align:middle;text-align: center">备注</td>
                                                <td style="vertical-align:middle;" colspan="2">
                                                    <input type="text" id="residenceRemark"
                                                           name="residenceRemark"
                                                           value="${elderlyMsg.residenceRemark}"
                                                           maxlength="60"/>
                                                </td>
                                            </tr>
                                        </table>
                                        <c:choose>
                                            <c:when test="${method=='edit'}">
                                                <div style="text-align: right;width: 40%; margin-right: 71px; display: inline-block;">
                                                    <span id="labelmsg" class="label"></span>
                                                    <button type="button" onclick="ElderlyMsgCommon.editElder()"
                                                            name="editElder"
                                                            class="btn btn-circle green"><i
                                                            class="fa">保存</i>
                                                    </button>
                                                </div>
                                                <div style="width: 40%;display: inline-block">
                                                    <button onclick="window.parent.closeTab('elderInfo')"
                                                            class="btn btn-circle green back"><i
                                                            class="fa ">返回</i>
                                                    </button>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div style="text-align: right;width: 53%; margin-right: 71px; display: inline-block;">
                                                    <button onclick="window.parent.closeTab('elderInfo')"
                                                            class="btn btn-circle green back"><i
                                                            class="fa ">返回</i>
                                                    </button>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="tab-pane" id="tab_relate">
                                        <input type="hidden" name="elderId" id="elderId" value="${elderlyMsg.id}">
                                        <input type="hidden" value="${method}" id="type">
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
                                            <c:choose>
                                                <c:when test="${method=='edit'}">
                                            <div style="width: 40%;display: inline-block">
                                                    <button id="btnAddRelate" type="button" name="btnAddRelate"
                                                            class="btn btn-circle green pull-right" disabled>增加
                                                    </button>
                                            </div>
                                            <div style="width: 40%;display: inline-block">
                                                <button onclick="window.parent.closeTab('elderInfo')"
                                                        class="btn btn-circle green back" style="margin-top:-30px;margin-left:100px"><i
                                                        class="fa ">返回</i>
                                                </button>
                                            </div>
                                            </c:when>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab_assess">
                                        <div class="table-container">
                                            <iframe name="iframeIndex" id="iframe "
                                                    class="iframeClass full-height-content-body"
                                                    frameborder="no" border="0"
                                               <%--     src="${pageContext.request.contextPath }/admin/elderly/elder_assess_Info?idcardno=${elderlyMsg.idcardno}"--%>
                                                    src="${pageContext.request.contextPath }/admin/elderly/catacityDetail?idcardno=${elderlyMsg.idcardno}"
                                                    style="width: 100%;background-color: #F4F8FB"></iframe>
                                            <c:choose>
                                                <c:when test="${method=='edit'}">
                                                    <div style="width: 40%;display: inline-block">
                                                        <button onclick="window.parent.closeTab('elderInfo')"
                                                                class="btn btn-circle green back" style="margin-top:-30px;margin-left:100px"><i
                                                                class="fa ">返回</i>
                                                        </button>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <div id="updateRelateModal" class="modal" tabindex="-1" role="dialog"
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
                                                <form id="updateForm">
                                                    <input type="hidden" name="id" id="id">
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
                                                            <td><input type="text" name="linkTel" class="form-control">
                                                            </td>
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
                                                            <td><input type="text" class="form-control" name="remark">
                                                            </td>
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
                            <%--新增联系人--%>
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
                                                <input type="hidden" name="elderId" id="elderId"
                                                       value="${elderlyMsg.id}">
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
                        </div><!-- /.modal -->
                    </div>
                </div>
            </div>
        </div>
        </div>
        </div>
        <!-- END PROFILE CONTENT -->

        <!-- END CONTENT -->
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script type="text/javascript" charset="utf-8"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
        <!--timer-->
        <script type="text/javascript" charset="utf-8"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" charset="utf-8"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js?v=1"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>


        <!--upload-->
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/uploadPreview.js"
                type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/elderly/elderlyMsg_common.js?v=1.3"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/elderly/elderlyMsg_add.js"
                type="text/javascript"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                AreaTree.init();
                $("iframe").height($("iframe", window.parent.document).height() - 140);
                ElderlyMsgAdd.init();

                ElderlyMsgCommon.notAllowEdit();

                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
