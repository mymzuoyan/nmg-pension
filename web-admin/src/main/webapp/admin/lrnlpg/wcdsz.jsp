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
                        <span class="caption-subject font-red-sunglo bold uppercase">老人能力评估完成度配置</span>
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
                                <input type="hidden" name="id" value="${m.id}">
                                <tr>
                                    <td colspan="12">一、基本情况</td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                       姓名<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <input name="oldman_name"  class="form-control input-sm" placeholder="姓名得分"  value="${m.oldman_name}" type="number" >
                                        <%--<input name="oldman_name"  class="form-control input-sm" placeholder="姓名得分" type="number"  value="${m.oldman_name}">--%>
                                    </td>
                                    <td colspan="1"style="text-align: center;vertical-align: middle;width:9%;">
                                        身份证号 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <input name="id_card"  class="form-control input-sm" placeholder="身份证号得分" type="number"  value="${m.id_card}">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:10%;">
                                        老年优待证号 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3"style="text-align: center;vertical-align: middle;width:24%;">
                                        <input name="oldman_preferential_card"  value="${m.oldman_preferential_card}"  class="form-control input-sm" placeholder="老年优待证号得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        固话 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        <input name="phone1" value="${m.phone1}" class="form-control input-sm" placeholder="固话得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        手机 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        <input name="phone2"  value="${m.phone2}" class="form-control input-sm" placeholder="手机得分" type="number">
                                    </td>
                                </tr>
                              <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        老人照片 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width: 24%">
                                        <%--<input  id="lrzp" name="lrzp" type="text" class="form-control"--%>
                                                <%--value="${m.lrzp}">--%>
                                        <input name="oldman_photo" value="${m.oldman_photo}" class="form-control input-sm" placeholder="老人照片得分" type="number">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        文化程度 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width: 24%">
                                        <input name="degree_of_education" value="${m.degree_of_education}" class="form-control input-sm" placeholder="文化程度得分" type="number">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        常住时间 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width: 24%" >
                                        <input name="conservation_time" value="${m.conservation_time}" class="form-control input-sm" placeholder="常住时间得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 17%">
                                        户籍地址 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width: 33%">
                                        <input name="domicile_address" value="${m.domicile_address}" class="form-control input-sm" placeholder="户籍地址得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 17%">
                                        现居地址 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width: 33%">
                                        <input name="now_address" value="${m.now_address}" class="form-control input-sm" placeholder="现居地址得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人1姓名 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input name="emergency_contact1" value="${m.emergency_contact1}" class="form-control input-sm" placeholder="联系人1姓名得分" type="number">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人1与老人关系 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input name="emergency_contact1_relatives" value="${m.emergency_contact1_relatives}" class="form-control input-sm" placeholder="联系人1与老人关系得分" type="number">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人1联系方式 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input name="emergency_contact1_tel" value="${m.emergency_contact1_tel}" class="form-control input-sm" placeholder="联系人1联系方式得分" type="number">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人1是否有老人钥匙 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 14%">
                                        <input name="is_key1" value="${m.is_key1}" class="form-control input-sm" placeholder="联系人1是否有老年人钥匙得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人2姓名 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input name="emergency_contact2" value="${m.emergency_contact2}" class="form-control input-sm" placeholder="联系人2姓名得分" type="number">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人2与老人关系 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input name="emergency_contact2_relatives" value="${m.emergency_contact2_relatives}" class="form-control input-sm" placeholder="联系人2与老人关系得分" type="number">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人2联系方式 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input name="emergency_contact2_tel" value="${m.emergency_contact2_tel}" class="form-control input-sm" placeholder="联系人2联系方式得分" type="number">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人2是否有老人钥匙 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 14%">
                                        <input name="is_key2" value="${m.is_key2}" class="form-control input-sm" placeholder="联系人2是否有老年人钥匙得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人3姓名 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input name="emergency_contact3" value="${m.emergency_contact3}" class="form-control input-sm" placeholder="联系人3姓名得分" type="number">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人3与老人关系 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input name="emergency_contact3_relatives" value="${m.emergency_contact3_relatives}" class="form-control input-sm" placeholder="联系人3与老人关系得分" type="number">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人3联系方式 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 16%">
                                        <input name="emergency_contact3_tel"value="${m.emergency_contact3_tel}" class="form-control input-sm" placeholder="联系人3联系方式得分" type="number">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width: 9%">
                                        联系人3是否有老人钥匙 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 14%">
                                        <input name="is_key3" value="${m.is_key3}" class="form-control input-sm" placeholder="联系人3是否有老年人钥匙得分" type="number">
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
                                        <input name="oldman_zy" value="${m.oldman_zy}" class="form-control input-sm" placeholder="原职业得分" type="number">
                                    </td>
                                    <td colspan="1"style="text-align: center;vertical-align: middle;width:9%;">
                                        人员类别 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <input name="oldman_category" value="${m.oldman_category}" class="form-control input-sm" placeholder="人员类别得分" type="number">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:10%;">
                                        特殊对象 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3"style="text-align: center;vertical-align: middle;width:24%;">
                                        <input name="special_object"  value="${m.special_object}"  class="form-control input-sm" placeholder="特殊对象得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        收入来源 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <input name="sources_of_income" value="${m.sources_of_income}"  class="form-control input-sm" placeholder="收入来源	得分" type="number">
                                    </td>
                                    <td colspan="1"style="text-align: center;vertical-align: middle;width:9%;">
                                        子女状况 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <input name="status_of_children" value="${m.status_of_children}" class="form-control input-sm" placeholder="子女状况	得分" type="number">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:10%;">
                                        医疗类别 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3"style="text-align: center;vertical-align: middle;width:24%;">
                                        <input name="medical_category" value="${m.medical_category}" class="form-control input-sm" placeholder="医疗类别	得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 17%">
                                        居住状况 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width: 33%">
                                        <input name="residential_status" value="${m.residential_status}"  class="form-control input-sm" placeholder="居住状况得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 17%">
                                        住房性质 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width: 33%">
                                        <input name="housing_nature" value="${m.housing_nature}" class="form-control input-sm" placeholder="住房性质	得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        居室 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <input name="habitable_room" value="${m.habitable_room}" class="form-control input-sm" placeholder="居室	得分" type="number">
                                    </td>
                                    <td colspan="1"style="text-align: center;vertical-align: middle;width:9%;">
                                        楼层电梯 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <input name="floor_lift" value="${m.floor_lift}" class="form-control input-sm" placeholder="楼层电梯	得分" type="number">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:10%;">
                                        居住楼层（楼层无电梯） <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3"style="text-align: center;vertical-align: middle;width:24%;">
                                        <input name="residential_floor" value="${m.residential_floor}" class="form-control input-sm" placeholder="居住楼层	得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 17%">
                                        室内厕所 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width: 33%">
                                        <input name="indoor_toilet" value="${m.indoor_toilet}" class="form-control input-sm" placeholder="室内厕所得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width: 17%">
                                        室内洗浴设备 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width: 33%">
                                        <input name="indoor_bath_equipment" value="${m.indoor_bath_equipment}" class="form-control input-sm" placeholder="室内洗浴设备得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        愿照料情况 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <input name="care_situation" value="${m.care_situation}" class="form-control input-sm" placeholder="原照料情况	得分" type="number">
                                    </td>
                                    <td colspan="1"style="text-align: center;vertical-align: middle;width:9%;">
                                        政府购买居家养老服务 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <input name="government_purchase" value="${m.government_purchase}" class="form-control input-sm" placeholder="政府购买居家养老服务得分" type="number">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:10%;">
                                        服务要求 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3"style="text-align: center;vertical-align: middle;width:24%;">
                                        <input name="services_requested" value="${m.services_requested}" class="form-control input-sm" placeholder="服务需求	得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        身体状况<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:16%;">
                                        <input name="physiclal_health_status" value="${m.physiclal_health_status}" class="form-control input-sm" placeholder="	身体健康得分" type="number">
                                    </td>
                                    <td colspan="1"style="text-align: center;vertical-align: middle;width:9%;">
                                        重病 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:16%;">
                                        <input name="physiclal_illness_status" value="${m.physiclal_illness_status}" class="form-control input-sm" placeholder="	重病得分" type="number">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        慢性病<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:16%;">
                                        <input name="physiclal_chronic_status" value="${m.physiclal_chronic_status}" class="form-control input-sm" placeholder="慢性病得分" type="number">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        其他：<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:16%;">
                                        <input name="psychologic_status" value="${m.psychologic_status}" class="form-control input-sm" placeholder="	心理状况得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                       心理状况 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <input name="psychologic_status" value="${m.psychologic_status}" class="form-control input-sm" placeholder="	心理状况得分" type="number">
                                    </td>
                                    <td colspan="1"style="text-align: center;vertical-align: middle;width:9%;">
                                        社会活动情况 <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:24%;">
                                        <input name="social_activities" value="${m.social_activities}" class="form-control input-sm" placeholder="	社会活动情况得分" type="number">
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:10%;">
                                        社会活动类型<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="3"style="text-align: center;vertical-align: middle;width:24%;">
                                        <input name="social_activities_type" value="${m.social_activities_type}" class="form-control input-sm" placeholder="社会活动类型得分" type="number">
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
                                        <input name="day_activity1" value="${m.day_activity1}" class="form-control input-sm" placeholder="吃饭得分" type="number">
                                    </td>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        穿衣(完成取衣、穿衣、系带、扣扣子等) <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="day_activity2" value="${m.day_activity2}" class="form-control input-sm" placeholder="穿衣得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        上下床(能完成洗脚、洗脸、上下床等步骤)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="day_activity3" value="${m.day_activity3}" class="form-control input-sm" placeholder="上下床得分" type="number">
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        如厕(如厕、便后能自理及整理衣裤)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="day_activity4" value="${m.day_activity4}" class="form-control input-sm" placeholder="如厕得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        室内走动(外出、上下楼正常)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="day_activity5" value="${m.day_activity5}" class="form-control input-sm" placeholder="室内走动得分" type="number">
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        洗澡(能完成洗澡的全部过程)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="day_activity6" value="${m.day_activity6}" class="form-control input-sm" placeholder="洗澡得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        控制大小便(能控制大小便)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="day_activity7" value="${m.day_activity7}" class="form-control input-sm" placeholder="控制大小便得分" type="number">
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
                                        <input name="cognitive_ability1" value="${m.cognitive_ability1}" class="form-control input-sm" placeholder="	近期记忆得分" type="number">
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        程序记忆(完成洗衣、做饭、做菜等)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="cognitive_ability2" value="${m.cognitive_ability2}" class="form-control input-sm" placeholder="	程序记忆得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        定向记忆(外出、回家不迷路)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="cognitive_ability3" value="${m.cognitive_ability3}" class="form-control input-sm" placeholder="定向记忆得分" type="number">
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        判断能力(对日常事物的判断不违背常理)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="cognitive_ability4" value="${m.cognitive_ability4}" class="form-control input-sm" placeholder="判断能力得分" type="number">
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
                                        <input name="mood_action1" value="${m.mood_action1}" class="form-control input-sm" placeholder="	情绪得分" type="number">
                                    </td>
                                    <td colspan="3"style="text-align: center;vertical-align: middle;width:23%;">
                                        行为(动作行为表现是否异常) <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        <input name="mood_action2" value="${m.mood_action2}" class="form-control input-sm" placeholder="	行为得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        沟通(在交流中能否互相理解)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:16%;">
                                        <input name="mood_action3" value="${m.mood_action3}" class="form-control input-sm" placeholder="沟通得分" type="number">
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
                                        <input name="audiovisual1" value="${m.audiovisual1}" class="form-control input-sm" placeholder="	视觉得分" type="number">
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        听觉(能正常接听电话、交谈)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="audiovisual2" value="${m.audiovisual2}" class="form-control input-sm" placeholder="	听觉得分" type="number">
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
                                        <input name="areaId" value="${m.areaId}" class="form-control input-sm" placeholder="	区域得分" type="number">
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        社区<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="community" value="${m.community}" class="form-control input-sm" placeholder="	社区得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        本人(或家属)签字<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="sign" value="${m.sign}" class="form-control input-sm" placeholder="	签字得分" type="number">
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        评估员签字<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="judge_sign" value="${m.judge_sign}" class="form-control input-sm" placeholder="	评估员签字得分" type="number">
                                    </td>
                                </tr>
                            </table>
                            <div class="form-actions">
                                <div class="col-md-12">
                                    <div class="col-md-offset-4" style="margin-left: 48%;">
                                        <%--<button data-loading-text="提交中..."--%>
                                                <%--type="button" class="btn btn-circle green"--%>
                                                <%--onclick="ServiceOrgDetail.submitAdd()">--%>
                                            <%--保存--%>
                                        <%--</button>--%>
                                        <button data-loading-text="提交中..." type="button" class="btn blue addGovBuy">保存</button>
                                        <span id="labelmsg" class="label"></span>
                                    </div>
                                    <%--<div class="col-md-offset-4">
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
                    addOldManPower();
                });
            });

            function addOldManPower() {
                // alert( $('form').serialize() );
               var data= $('form').serialize();
                // return;
                $.post(window.apppath + "/admin/api/power/wcdfzsz/add",
                   data
                , function (res) {
                    if (res.success) {
                        alert(res.message);
                        window.location.reload();
                    }
                    else {
                        alert(res.message);
                    }
                }, 'json');



            }

        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

