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
                        <span class="caption-subject font-red-sunglo bold uppercase">老人能力评估信息新增</span>
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
                                <tr>
                                    <td colspan="12">一、基本情况</td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                       姓名 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <input type="text" class="form-control" id="name" name="name"
                                               value="${m.name}">
                                    </td>
                                    <td colspan="1"style="text-align: center;vertical-align: middle;width:9%;">
                                        身份证号 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <input type="text" class="form-control" id="sfz" name="sfz"
                                               value="${m.sfz}">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:10%;">
                                        老年优待证号 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3"style="text-align: center;vertical-align: middle;width:24%;">
                                        <input type="text" class="form-control" id="lnydz" name="lnydz"
                                               value="${m.lnydz}">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        固话 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        <input  type="text" class="form-control" id="gh" name="gu"
                                                value="${m.gh}">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        手机 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        <input type="text" class="form-control" id="sj" name="sj"
                                               value="${m.sj}">
                                    </td>
                                </tr>
                              <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        老人照片 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width: 24%">
                                        <input  id="lrzp" name="lrzp" type="text" class="form-control"
                                                value="${m.lrzp}">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        文化程度 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width: 24%">
                                        <select  name="whcd" class="form-control" id="whcd"readonly="readonly">
                                            <option value="0">文盲</option>
                                            <option value="1">半文盲</option>
                                            <option value="2">小学</option>
                                            <option value="3">初中</option>
                                            <option value="4">高中</option>
                                            <option value="5">大专</option>
                                            <option value="6">本科</option>
                                        </select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        常住时间 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width: 24%" >
                                        <select  name="czsj" class="form-control" id="czsj"readonly="readonly">
                                            <option value="0">1年以下</option>
                                            <option value="1">1到3年</option>
                                            <option value="2">3年以上</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 17%">
                                        户籍地址 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width: 33%">
                                        <input  id="hjdz" type="text" class="form-control" name="hjdz"
                                                value="${m.hjdz}">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 17%">
                                        现居地址 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width: 33%">
                                        <input id="xjdz" type="text" class="form-control" name="xjdz"
                                               value="${m.xjdz}">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人1姓名 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input  id="lxra" name="lxra" type="text" class="form-control"
                                                value="${m.lxra}">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人1与老人关系 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input id="aylrgx" type="text" class="form-control" name="aylrgx"
                                               value="${m.aylrgx}">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人1联系方式 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input  id="alxfs" type="text" class="form-control" name="alxfs"
                                                value="${m.alxfs}">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人1是否有老人钥匙 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 14%">
                                        <select  name="asfyys" class="form-control" id="asfyys"readonly="readonly">
                                            <option value="0">有</option>
                                            <option value="1">没有</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人1姓名 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input  id="lxrb" name="lxrb" type="text" class="form-control"
                                                value="${m.lxrb}">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人2与老人关系 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input id="bylrgx" type="text" class="form-control" name="bylrgx"
                                               value="${m.bylrgx}">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人2联系方式 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input  id="blxfs" type="text" class="form-control" name="blxfs"
                                                value="${m.blxfs}">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人2是否有老人钥匙 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 14%">
                                        <select  name="bsfyys" class="form-control" id="bsfyys"readonly="readonly">
                                            <option value="0">有</option>
                                            <option value="1">没有</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人3姓名 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input  id="lxrc" name="lxrc" type="text" class="form-control"
                                                value="${m.lxrc}">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人3与老人关系 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input id="cylrgx" type="text" class="form-control" name="cylrgx"
                                               value="${m.cylrgx}">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人3联系方式 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input  id="clxfs" type="text" class="form-control" name="clxfs"
                                                value="${m.clxfs}">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人3是否有老人钥匙 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 14%">
                                        <select  name="csfyys" class="form-control" id="csfyys"readonly="readonly">
                                            <option value="0">有</option>
                                            <option value="1">没有</option>
                                        </select>
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
                                        <select  name="yzy" class="form-control" id="yzy"readonly="readonly">
                                            <option value="0">公务员</option>
                                            <option value="1">教师</option>
                                            <option value="2">军人</option>
                                            <option value="3">事业职工</option>
                                            <option value="4">企业职工</option>
                                            <option value="5">农民</option>
                                            <option value="6">商人</option>
                                            <option value="7">无固定职业</option>
                                        </select>
                                    </td>
                                    <td colspan="1"style="text-align: center;vertical-align: middle;width:9%;">
                                        人员类别 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <select  name="rylb" class="form-control" id="rylb"readonly="readonly">
                                            <option value="0">离休</option>
                                            <option value="1">退休</option>
                                            <option value="2">低保户</option>
                                            <option value="3">低保边缘户</option>
                                            <option value="4">城市三无</option>
                                            <option value="5">农村五保</option>
                                            <option value="6">供养人员</option>
                                            <option value="7">其他：</option>
                                        </select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:10%;">
                                        特殊对象 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3"style="text-align: center;vertical-align: middle;width:24%;">
                                        <select  name="tsdx" class="form-control" id="tsdx"readonly="readonly">
                                            <option value="0">是</option>
                                            <option value="1">否</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        收入来源 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <select  name="srly" class="form-control" id="srly"readonly="readonly">
                                            <option value="0">离休金/退休金</option>
                                            <option value="1">养老保险</option>
                                            <option value="2">子女补贴</option>
                                            <option value="3">亲友资助</option>
                                            <option value="4">低保金</option>
                                            <option value="5">供养人员补贴</option>
                                            <option value="6">拆迁补助</option>
                                            <option value="7">失地农民补助</option>
                                            <option value="8">其他：</option>
                                        </select>
                                    </td>
                                    <td colspan="1"style="text-align: center;vertical-align: middle;width:9%;">
                                        子女状况 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <select  name="znzk" class="form-control" id="znzk"readonly="readonly">
                                            <option value="0">有子女</option>
                                            <option value="1">无子女</option>
                                        </select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:10%;">
                                        医疗类别 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3"style="text-align: center;vertical-align: middle;width:24%;">
                                        <select  name="yllb" class="form-control" id="yllb"readonly="readonly">
                                            <option value="0">公费</option>
                                            <option value="1">职工医保</option>
                                            <option value="2">居民医保</option>
                                            <option value="3">新农合</option>
                                            <option value="4">自费</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 17%">
                                        居住状况 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width: 33%">
                                        <select  name="jzzk" class="form-control" id="jzzk"readonly="readonly">
                                            <option value="0">独居</option>
                                            <option value="1">空巢</option>
                                            <option value="2">与配偶/伴侣居住</option>
                                            <option value="3">与子女居住</option>
                                            <option value="4">与其他亲属居住</option>
                                            <option value="5">与非亲属关系的人居住</option>
                                            <option value="6">养老机构</option>
                                        </select>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 17%">
                                        住房性质 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width: 33%">
                                        <select  name="zfxz" class="form-control" id="zfxz"readonly="readonly">
                                            <option value="0">自主产权房</option>
                                            <option value="1">租房</option>
                                            <option value="2">政府安置房</option>
                                            <option value="3">其他：</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        居室 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <select  name="js" class="form-control" id="js"readonly="readonly">
                                            <option value="0">一居</option>
                                            <option value="1">二居</option>
                                            <option value="2">三居</option>
                                            <option value="3">其他：</option>
                                        </select>
                                    </td>
                                    <td colspan="1"style="text-align: center;vertical-align: middle;width:9%;">
                                        楼层电梯 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <select  name="lcdt" class="form-control" id="lcdt"readonly="readonly">
                                            <option value="0">有</option>
                                            <option value="1">无</option>
                                        </select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:10%;">
                                        居住楼层（楼层无电梯） <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3"style="text-align: center;vertical-align: middle;width:24%;">
                                        <select  name="jzlc" class="form-control" id="jzlc"readonly="readonly">
                                            <option value="0">一层</option>
                                            <option value="1">二层</option>
                                            <option value="2">三层以上</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 17%">
                                        室内厕所 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width: 33%">
                                        <select  name="sncs" class="form-control" id="sncs"readonly="readonly">
                                            <option value="0">有</option>
                                            <option value="1">无</option>
                                        </select>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 17%">
                                        室内洗浴设备 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width: 33%">
                                        <select  name="snxysb" class="form-control" id="snxysb"readonly="readonly">
                                            <option value="0">有</option>
                                            <option value="1">无</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        愿照料情况 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <select  name="yzlqk" class="form-control" id="yzlqk"readonly="readonly">
                                            <option value="0">自我照料</option>
                                            <option value="1">配偶照料</option>
                                            <option value="2">子女照顾</option>
                                            <option value="3">自购家政服务</option>
                                            <option value="4">送餐服务</option>
                                            <option value="5">互助门铃</option>
                                        </select>
                                    </td>
                                    <td colspan="1"style="text-align: center;vertical-align: middle;width:9%;">
                                        政府购买居家养老服务 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <select  name="zfgmjjylfw" class="form-control" id="zfgmjjylfw"readonly="readonly">
                                            <option value="0">居家照料</option>
                                            <option value="1">紧急呼叫终端</option>
                                            <option value="2">老年人意外伤害保险</option>
                                            <option value="3">其他：</option>
                                        </select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:10%;">
                                        服务要求 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3"style="text-align: center;vertical-align: middle;width:24%;">
                                        <select  name="fwyq" class="form-control" id="fwyq"readonly="readonly">
                                            <option value="0">家务料理</option>
                                            <option value="1">代购物品</option>
                                            <option value="2">康复保健</option>
                                            <option value="3">紧急呼叫</option>
                                            <option value="4">心理关爱</option>
                                            <option value="5">法律援助</option>
                                            <option value="6">文化娱乐</option>
                                            <option value="7">助餐</option>
                                            <option value="8">送餐</option>
                                            <option value="9">陪聊</option>
                                            <option value="10">陪住</option>
                                            <option value="11">陪外出</option>
                                            <option value="12">陪旅游</option>
                                            <option value="13">日托</option>
                                            <option value="14">入住老年人福利机构</option>
                                            <option value="15">其他：</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        身体状况<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:16%;">
                                        <select  name="stzk" class="form-control" id="stzk"readonly="readonly">
                                            <option value="0">身体健康</option>
                                            <option value="1">身体不健康</option>
                                        </select>
                                    </td>
                                    <td colspan="1"style="text-align: center;vertical-align: middle;width:9%;">
                                        重病 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:16%;">
                                        <select  name="zb" class="form-control" id="zb"readonly="readonly">
                                            <option value="0">恶性肿瘤</option>
                                            <option value="1">尿毒性透析</option>
                                            <option value="2">器官移植（含手术后的抗排异治疗）</option>
                                            <option value="3">白血病</option>
                                            <option value="4">急性心肌梗塞</option>
                                            <option value="5">脑中风</option>
                                            <option value="6">急性坏死性胰腺炎</option>
                                            <option value="7">脑外伤</option>
                                            <option value="8">主动脉手术</option>
                                            <option value="9">冠状动脉旁路手术</option>
                                            <option value="10">慢性肾功能性衰竭</option>
                                            <option value="11">急慢性重症肝炎</option>
                                            <option value="12">危及生命的良性脑瘤</option>
                                            <option value="13">重症糖尿病</option>
                                            <option value="14">消化道出血</option>
                                            <option value="15">系统性红斑狼疮</option>
                                            <option value="16">慢性再生障碍性贫血</option>
                                            <option value="17">血友病</option>
                                            <option value="18">重症精神病</option>
                                            <option value="19">其他</option>
                                        </select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        慢性病<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:16%;">
                                        <select  name="mxb" class="form-control" id="mxb"readonly="readonly">
                                            <option value="0">高血压</option>
                                            <option value="1">冠心病</option>
                                            <option value="2">前列腺增生</option>
                                            <option value="3">糖尿病</option>
                                        </select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        其他：<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:16%;">
                                        <select  name="qtjkwt" class="form-control" id="qtjkwt"readonly="readonly">
                                            <option value="0">因摔伤导致行动不便</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                       心理状况 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <select  name="xlzk" class="form-control" id="xlzk"readonly="readonly">
                                            <option value="0">正常</option>
                                            <option value="1">偶尔有孤独感</option>
                                            <option value="2">经常觉得很孤独</option>
                                        </select>
                                    </td>
                                    <td colspan="1"style="text-align: center;vertical-align: middle;width:9%;">
                                        社会活动情况 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <select  name="shhdqk" class="form-control" id="shhdqk"readonly="readonly">
                                            <option value="0">经常</option>
                                            <option value="1">偶尔</option>
                                            <option value="2">从不</option>
                                        </select>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:10%;">
                                        社会活动类型<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3"style="text-align: center;vertical-align: middle;width:24%;">
                                        <select  name="shhdlx" class="form-control" id="shhdlx"readonly="readonly">
                                            <option value="0">文艺类</option>
                                            <option value="1">教育类</option>
                                            <option value="2">健身类</option>
                                            <option value="3">慈善类</option>
                                            <option value="4">经济类</option>
                                            <option value="5">宗教类</option>
                                            <option value="6">其他：无</option>
                                        </select>
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
                                        <select id="cf" class="form-control"
                                                name="cf">
                                            <option value="0">正常</option>
                                            <option value="1">轻丧失</option>
                                            <option value="2">中丧失</option>
                                            <option value="3">完全丧失</option>
                                        </select>
                                    </td>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        穿衣(完成取衣、穿衣、系带、扣扣子等) <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <select id="cy" class="form-control"
                                                name="cy">
                                            <option value="0">正常</option>
                                            <option value="1">轻丧失</option>
                                            <option value="2">中丧失</option>
                                            <option value="3">完全丧失</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        上下床(能完成洗脚、洗脸、上下床等步骤)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <select id="sxc" class="form-control"
                                                name="sxc">
                                            <option value="0">正常</option>
                                            <option value="1">轻丧失</option>
                                            <option value="2">中丧失</option>
                                            <option value="3">完全丧失</option>
                                        </select>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        如厕(如厕、便后能自理及整理衣裤)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <select id="rc" class="form-control"
                                                name="rc">
                                            <option value="0">正常</option>
                                            <option value="1">轻丧失</option>
                                            <option value="2">中丧失</option>
                                            <option value="3">完全丧失</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        室内走动(外出、上下楼正常)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <select id="snzd" class="form-control"
                                                name="snzd">
                                            <option value="0">正常</option>
                                            <option value="1">轻丧失</option>
                                            <option value="2">中丧失</option>
                                            <option value="3">完全丧失</option>
                                        </select>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        洗澡(能完成洗澡的全部过程)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <select id="xz" class="form-control"
                                                name="cf">
                                            <option value="0">正常</option>
                                            <option value="1">轻丧失</option>
                                            <option value="2">中丧失</option>
                                            <option value="3">完全丧失</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        控制大小便(能控制大小便)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <select id="kzdxb" class="form-control"
                                                name="kzdxb">
                                            <option value="0">正常</option>
                                            <option value="1">轻丧失</option>
                                            <option value="2">中丧失</option>
                                            <option value="3">完全丧失</option>
                                        </select>
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
                                        <select id="jqjy" class="form-control"
                                                name="jqjy">
                                            <option value="0">正常</option>
                                            <option value="1">轻丧失</option>
                                            <option value="2">中丧失</option>
                                            <option value="3">完全丧失</option>
                                        </select>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        程序记忆(完成洗衣、做饭、做菜等)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <select id="cxjy" class="form-control"
                                                name="cxjy">
                                            <option value="0">正常</option>
                                            <option value="1">轻丧失</option>
                                            <option value="2">中丧失</option>
                                            <option value="3">完全丧失</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        定向记忆(外出、回家不迷路)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <select id="dxjy" class="form-control"
                                                name="dxjy">
                                            <option value="0">正常</option>
                                            <option value="1">轻丧失</option>
                                            <option value="2">中丧失</option>
                                            <option value="3">完全丧失</option>
                                        </select>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        判断能力(对日常事物的判断不违背常理)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <select id="pdnl" class="form-control"
                                                name="pdnl">
                                            <option value="0">正常</option>
                                            <option value="1">轻丧失</option>
                                            <option value="2">中丧失</option>
                                            <option value="3">完全丧失</option>
                                        </select>
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
                                        <select  name="qx" class="form-control" id="qx"readonly="readonly">
                                            <option value="0">正常</option>
                                            <option value="1">轻丧失</option>
                                            <option value="2">中丧失</option>
                                            <option value="3">完全丧失</option>
                                        </select>
                                    </td>
                                    <td colspan="3"style="text-align: center;vertical-align: middle;width:23%;">
                                        行为(动作行为表现是否异常) <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        <select  name="xw" class="form-control" id="xw"readonly="readonly">
                                            <option value="0">正常</option>
                                            <option value="1">轻丧失</option>
                                            <option value="2">中丧失</option>
                                            <option value="3">完全丧失</option>
                                        </select>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        沟通(在交流中能否互相理解)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:16%;">
                                        <select  name="gt" class="form-control" id="gt"readonly="readonly">
                                            <option value="0">正常</option>
                                            <option value="1">轻丧失</option>
                                            <option value="2">中丧失</option>
                                            <option value="3">完全丧失</option>
                                        </select>
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
                                        <select id="sjnl" class="form-control"
                                                name="sjnl">
                                            <option value="0">正常</option>
                                            <option value="1">轻丧失</option>
                                            <option value="2">中丧失</option>
                                            <option value="3">完全丧失</option>
                                        </select>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        听觉(能正常接听电话、交谈)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <select id="tjnl" class="form-control"
                                                name="tjnl">
                                            <option value="0">正常</option>
                                            <option value="1">轻丧失</option>
                                            <option value="2">中丧失</option>
                                            <option value="3">完全丧失</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="12">七、其他</td>
                                </tr>
                                <tr>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        区域<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <select id="qy" class="form-control"
                                                name="qy">
                                            <option value="0">正常</option>
                                            <option value="1">轻丧失</option>
                                            <option value="2">中丧失</option>
                                            <option value="3">完全丧失</option>
                                        </select>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        社区<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <select id="sq" class="form-control"
                                                name="sq">
                                            <option value="0">正常</option>
                                            <option value="1">轻丧失</option>
                                            <option value="2">中丧失</option>
                                            <option value="3">完全丧失</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        本人(或家属)签字<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input type="text" class="form-control" id="brjsqz" name="brjsqz"
                                               value="${m.brjsqz}">
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        评估员签字<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input type="text" class="form-control" id="pgyqz" name="pgyqz"
                                               value="${m.pgyqz}">
                                    </td>
                                </tr>
                            </table>
                            <div class="form-actions">
                                <div class="col-md-12">
                                    <div class="col-md-offset-4" style="margin-left: 48%;">
                                        <button data-loading-text="提交中..."
                                                type="button" class="btn btn-circle green"
                                                onclick="ServiceOrgDetail.submitAdd()">
                                            保存
                                        </button>
                                        <span id="labelmsg" class="label"></span>
                                    </div>
                                    <%--<div class="col-md-offset-6">--%>
                                        <%--<button onclick="window.parent.closeTab('tab_institution_add')"--%>
                                                <%--class="btn btn-circle green"><i--%>
                                                <%--class="fa">返回</i>--%>
                                        <%--</button>--%>
                                    <%--</div>--%>
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
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    format:'yyyy-mm-dd',
                    autoclose: true
                });
                $("input[type=file]").change(function () {
                    var result = $(this).val();
                    if (result != null && result != "")
                        result = result.substr(result.lastIndexOf("\\") + 1, result.length - 1)
                    $("#file_path").html(result)
                })

                $("#addGovBuy .select").click(function () {
                    showModel("${zuzhiRoleId}");
                });

                $("#selectArea .add").click(function () {
                    var select = AreaTree.getSelectArea();
                    if (select != -1) {
                        $("#serviceOrgId").val(select);
                        $("#serviceOrgName").val(AreaTree.getSelectAreaName(select))

                        $("#selectArea").modal("hide");
                    }
                });


                $("#addGovBuy .search").click(function () {
                    var idcardno = $("#idcardno").val();
                    if (idcardno != null & idcardno != "") {
                        searchElder(idcardno);
                    }
                    else
                        alert("请输入身份证号码");
                });
                $(".addGovBuy").click(function () {
                    addGovbuy();
                });
            });

        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

