<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/9/12
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>能力评估详细信息</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">
        <div class="row">
        <div class="col-md-12">
            <!-- Begin: life time stats -->
            <div class="portlet">
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-xs-12 col-md-12" id="print">
                            <c:if test="${assessInfo.code==2001}">
                                <div class="widget">
                                    <div class="widget-header "
                                         style="font-size: 18px;font-weight: bold;text-align:center;margin-bottom:10px;">
                                        <span class="widget-caption">老年人能力评估基本信息表</span>
                                    </div>
                                    <div class="widget-body">
                                        <div id="simpledatatable_wrapper"
                                             class="dataTables_wrapper form-inline no-footer">
                                            <table class="table table-striped table-bordered">
                                                <tbody>
                                                <tr role="row">
                                                    <td colspan="8" style="font-weight: bold;text-align:center;">
                                                        一、基本情况
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td colspan="8" style="width:100%">
                                                        单位：
                                                        <span style="border-bottom: #000 1px solid;padding:0px 15px;">
                                                        </span>区
                                                        <span style="border-bottom: #000 1px solid;padding:0px 15px;">
                                                        </span>街道（镇）
                                                        <span style="border-bottom: #000 1px solid;padding:0px 15px;">
                                                        </span>社区（村）
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td rowspan="2"
                                                        style="vertical-align:middle;text-align: center;width:17%;padding:0px">
                                                        姓名
                                                    </td>
                                                    <td rowspan="2"
                                                        style="vertical-align:middle;text-align: center;width:8%;padding:0px">
                                                            ${assessInfo.msg.elderName}
                                                    </td>
                                                    <td rowspan="2"
                                                        style="vertical-align:middle;text-align: center;width:8%;padding:0px">
                                                        身份证号
                                                    </td>
                                                    <td rowspan="2"
                                                        style="vertical-align:middle;text-align: center;width:17%;padding:0px">
                                                            ${assessInfo.msg.idcardno}

                                                    </td>
                                                    <td rowspan="2"
                                                        style="vertical-align:middle;text-align: center;width:13%;padding:0px">
                                                        老年优待证号
                                                    </td>
                                                    <td rowspan="2"
                                                        style="vertical-align:middle;text-align: center;width:12%;padding:0px">

                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width:8%;padding:0px">
                                                        固话
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width:15%;padding:0px">
                                                            ${assessInfo.msg.homeTel}
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;;padding:0px">
                                                        手机
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;;padding:0px">
                                                            ${assessInfo.msg.mobile}

                                                    </td>
                                                </tr>

                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;;padding:0px">
                                                        文化程度
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;;padding:0px">
                                                        户籍地址
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;;padding:0px">
                                                            ${assessInfo.msg.regPlace}

                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;;padding:0px">
                                                        居住地址
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                            ${assessInfo.msg.realAddress}

                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;;padding:0px">
                                                        常住时间
                                                    </td>
                                                    <td>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled value="1">&nbsp;1年以下
                                                        </label>
                                                        <p></p>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled value="2">&nbsp;1-3年
                                                        </label>
                                                        <p></p>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled value="3">&nbsp;3年以上
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td colspan="8"
                                                        style="vertical-align:middle;text-align: center;padding:0px">联系人
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;;padding:0px">
                                                        对象
                                                    </td>
                                                    <td colspan="2"
                                                        style="vertical-align:middle;text-align: center;;padding:0px">姓名
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;;padding:0px">
                                                        与老人关系
                                                    </td>
                                                    <td colspan="2"
                                                        style="vertical-align:middle;text-align: center;;padding:0px">
                                                        联系方式
                                                    </td>
                                                    <td colspan="2"
                                                        style="vertical-align:middle;text-align: center;;padding:0px">
                                                        是否有老年人钥匙
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;">联系人1<br/>（直系亲属）
                                                    </td>
                                                    <td colspan="2" style="vertical-align:middle;text-align: center;">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;">
                                                    </td>
                                                    <td colspan="2" style="vertical-align:middle;text-align: center;">
                                                    </td>
                                                    <td colspan="2" style="vertical-align:middle;text-align: center;">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled value="1">有
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled value="2"> 无
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;">联系人2</td>
                                                    <td colspan="2" style="vertical-align:middle;text-align: center;">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;">
                                                    </td>
                                                    <td colspan="2" style="vertical-align:middle;text-align: center;">
                                                    </td>
                                                    <td colspan="2" style="vertical-align:middle;text-align: center;">

                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled value="1">有
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled value="2"> 无
                                                        </label>

                                                        </span>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">联系人3</td>
                                                    <td colspan="2" style="vertical-align:middle;text-align: center;">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;">
                                                    </td>
                                                    <td colspan="2" style="vertical-align:middle;text-align: center;">
                                                    </td>
                                                    <td colspan="2" style="vertical-align:middle;text-align: center;">

                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>有
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled> 无
                                                        </label>

                                                        </span>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td colspan="8" style="font-weight: bold;text-align:center;">
                                                        二、社会生活环境参数
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">原职业</td>
                                                    <td colspan="7">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_zy" value="1" disabled>公务员
                                                        </label>

                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_zy" value="2" disabled>
                                                            教师
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_zy" value="3" disabled>军人
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_zy" value="4" disabled>事业职工
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_zy" value="5" disabled>企业职工
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_zy" value="6" disabled>农民
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_zy" value="7" disabled>商人
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_zy" value="8" disabled>无固定职业
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">人员类别</td>
                                                    <td colspan="7">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_category" value="1"
                                                                   disabled>离休
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_category" value="2"
                                                                   disabled>退休
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_category" value="3"
                                                                   disabled>低保户
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_category" value="4"
                                                                   disabled>低保边缘户
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_category" value="5"
                                                                   disabled>城市特困
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_category" value="6"
                                                                   disabled>农村特困
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_category" value="7"
                                                                   disabled>三线老军工
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_category" value="8"
                                                                   disabled>三无下放人员
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_category" value="9"
                                                                   disabled>供养人员
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_category" value="10"
                                                                   disabled>其他
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">特殊对象</td>
                                                    <td colspan="7">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="special_object" value="1"
                                                                   disabled>大屠杀幸存者
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="special_object" value="2"
                                                                   disabled>百岁老年人
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="special_object" value="3"
                                                                   disabled>计生特扶老人
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="special_object" value="4"
                                                                   disabled>重点优抚对象
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">收入来源</td>
                                                    <td colspan="7">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="1"
                                                                   disabled>机关事业单位离休金
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="2"
                                                                   disabled>机关事业单位退休金
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="3"
                                                                   disabled>养老金
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="4"
                                                                   disabled>三无下放人员补贴
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="5"
                                                                   disabled>三线老军工补贴
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="6"
                                                                   disabled>城乡居民养老保险
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="7"
                                                                   disabled>供养人员补贴
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="8"
                                                                   disabled>低保金
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="9"
                                                                   disabled>拆迁补助
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="10"
                                                                   disabled>失地农民补助
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="11"
                                                                   disabled>其他
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">子女状况</td>
                                                    <td colspan="3">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>有子女
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>无子女
                                                        </label>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center">医疗类别</td>
                                                    <td colspan="3">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" value="1" name="medical_category"
                                                                   disabled>公费
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" value="2" name="medical_category"
                                                                   disabled>职工医保
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" value="3" name="medical_category"
                                                                   disabled>居民医保
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" value="4" name="medical_category"
                                                                   disabled>新农合
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" value="5" name="medical_category"
                                                                   disabled>自费
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">居住状况</td>
                                                    <td style="vertical-align:middle;" colspan="3">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>独居
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>空巢
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>与子女同住
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>其他
                                                        </label>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center">住房性质</td>
                                                    <td style="vertical-align:middle;">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>有产权
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>无产权
                                                        </label>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center">居室</td>
                                                    <td colspan="2">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>一居
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>二居
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>三居
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>其他
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">居住条件</td>
                                                    <td style="vertical-align:middle;" colspan="2">
                                                        楼层电梯：
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>有
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>无
                                                        </label>
                                                    </td>
                                                    <td style="vertical-align:middle;" colspan="2">
                                                        居住楼层（楼层无电梯的）：
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>一层
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>二层
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>三层以上
                                                        </label>

                                                    </td>
                                                    <td style="vertical-align:middle;">
                                                        室内厕所：
                                                       <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>有
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>无
                                                        </label>

                                                    </td>
                                                    <td style="vertical-align:middle;" colspan="2">
                                                        室内洗浴设备：
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>有
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>无
                                                        </label>

                                                    </td>

                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">原照料情况</td>
                                                    <td colspan="7">

                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   name="care_situation" value="1" disabled>自我照料
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   name="care_situation" value="2" disabled>配偶照料
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   name="care_situation" value="3" disabled>子女照顾
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   name="care_situation" value="4" disabled>自购家政服务
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   name="care_situation" value="5" disabled>送餐服务
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="care_situation" value="6"
                                                                   disabled>互助门铃
                                                        </label>
                                                        <br>
                                                        政府购买居家养老服务：
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   name="government_purchase" value="1" disabled>居家照料
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="government_purchase" value="2"
                                                                   disabled>紧急呼叫终端
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="government_purchase" value="3"
                                                                   disabled>老年人意外伤害保险
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="government_purchase" value="4"
                                                                   disabled>其他
                                                        </label>

                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">服务需求</td>
                                                    <td colspan="7">

                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="1"
                                                                   disabled>家务料理
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="2"
                                                                   disabled>代购物品
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="3"
                                                                   disabled>康复保健
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="4"
                                                                   disabled>紧急呼叫
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="5"
                                                                   disabled>心理关爱
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="6"
                                                                   disabled>法律援助
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="7"
                                                                   disabled>文化娱乐
                                                        </label>

                                                        <p></p>

                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="8"
                                                                   disabled>助餐
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="9"
                                                                   disabled>送餐
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="10"
                                                                   disabled>陪聊
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="11"
                                                                   disabled>陪住
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="12"
                                                                   disabled>配外出
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="13"
                                                                   disabled>陪旅游
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="14"
                                                                   disabled>日托
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="15"
                                                                   disabled>入住老年人福利机构
                                                        </label>

                                                        <p></p>
                                                        其他：
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">身体状况</td>
                                                    <td colspan="7">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   disabled>身体健康
                                                        </label>
                                                         <br>
                                                        重病：
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="1" disabled>恶性肿瘤
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="2" disabled>尿毒性透析
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="3" disabled>器官移植（含手术后的抗排异治疗）
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="4" disabled>白血病
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="5" disabled>急性心肌梗塞
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="6" disabled>脑中风
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="7" disabled>急性坏死性胰腺炎
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="8" disabled>脑外伤
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="9" disabled>主动脉手术
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="10" disabled>冠状动脉旁路手术
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="11" disabled>慢性肾功能性衰竭
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="12" disabled>急慢性重症肝炎
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="13" disabled>危及生命的良性脑瘤
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="14" disabled>重症糖尿病
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="15" disabled>消化道出血
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="16" disabled>系统性红斑狼疮
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="17" disabled>慢性再生障碍性贫血
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="18" disabled>血友病
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="19" disabled>重症精神病
                                                        </label>
                                                        <br>
                                                        慢性病：
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_chronic_status"
                                                                   value="1" disabled>高血压
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_chronic_status"
                                                                   value="2" disabled>冠心病
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_chronic_status"
                                                                   value="3" disabled>前列前增生
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_chronic_status"
                                                                   value="4" disabled>糖尿病
                                                        </label>
                                                        <span style="margin-left:30px;">其他：</span>


                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">心理状况</td>
                                                    <td colspan="7">

                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="psychologic_status" value="1"
                                                                   disabled>正常
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="psychologic_status" value="2"
                                                                   disabled>偶尔有孤独感
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="psychologic_status" value="3"
                                                                   disabled>经常觉得很孤独
                                                        </label>

                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">社会活动情况</td>
                                                    <td style="vertical-align:middle;text-align: center" colspan="3">

                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="social_activities" value="1"
                                                                   disabled>经常
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="social_activities" value="2"
                                                                   disabled>偶尔
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="social_activities" value="3"
                                                                   disabled>从不
                                                        </label>

                                                    </td>
                                                    <td colspan="4">

                                                        社会活动类型：
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="social_activities_type"
                                                                   value="1" disabled>文艺类
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="social_activities_type"
                                                                   value="2" disabled>教育类
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="social_activities_type"
                                                                   value="3" disabled>健身类
                                                        </label>

                                                        <br>

                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="social_activities_type"
                                                                   value="4" disabled>慈善类
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="social_activities_type"
                                                                   value="5" disabled>经济类
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="social_activities_type"
                                                                   value="6" disabled>宗教类
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="social_activities_type"
                                                                   value="7" disabled>其他
                                                        </label>

                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td colspan="8" style="font-weight: bold;text-align:center;">
                                                        三、日常生活活动
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        项目
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">描述
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        正常
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        轻丧失
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        中丧失
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        完全丧失
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        吃饭
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        能完成入口、咀嚼、吞咽等步骤
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        穿衣
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        完成取衣、穿衣、系带、扣扣子等
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        上下床
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        能完成洗脚、洗脸、上下床等步骤
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        如厕
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        如厕、便后能自理及整理衣裤
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        室内走动
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        外出、上下楼正常
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        洗澡
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        能完成洗澡的全部过程
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        控制大小便
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        能控制大小便
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                </tr>

                                                <tr role="row">
                                                    <td colspan="8"
                                                        style="font-weight: bold;text-align:center;padding:0px">
                                                        四、认知能力
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        项目
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">描述
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        正常
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        轻丧失
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        中丧失
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        完全丧失
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        近期记忆
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        能回想近期发生的事情
                                                    </td>

                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        程序记忆
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        完成洗衣、做饭、做菜等
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        定向记忆
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        外出、回家不迷路
                                                    </td>
                                                </tr>
                                                <td style="vertical-align:middle;text-align: center;padding:0px">
                                                </td>
                                                <td style="vertical-align:middle;text-align: center;padding:0px">
                                                </td>
                                                <td style="vertical-align:middle;text-align: center;padding:0px">
                                                </td>
                                                <td style="vertical-align:middle;text-align: center;padding:0px">
                                                </td>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        判断能力
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        对日常事物的判断不违背常理
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td colspan="8" style="font-weight: bold;text-align:center;">
                                                        五、情绪行为
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        项目
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">描述
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        正常
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        轻丧失
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        中丧失
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        完全丧失
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        情绪
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        与人和睦相处，不偏激
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        行为
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        动作行为表现是否异常
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                </tr>

                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        沟通
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        在交流中能否互相理解
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td colspan="8" style="font-weight: bold;text-align:center;">
                                                        六、视、听觉
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        项目
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">描述
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        正常
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        轻丧失
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        中丧失
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        完全丧失
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        视觉
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        能正常看电视、读报等
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        听觉
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        能正常接听电话、交谈
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>

                                            <div class="row DTTTFooter">
                                                <div class="col-sm-12">
                                                    <div class="" role="status" aria-live="polite">
                                                        <span>本人(或家属)签字：(_______)</span>
                                                        <span style="border-bottom: #000 1px solid;">
                                                        </span>
                                                        <span>评估员：(__________)
                                                        </span>
                                                        <span style="border-bottom: #000 1px solid;">
                                                        </span>
                                                        <span>社区：</span>_________
                                                        <span>评估机构：</span>_______
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-top:20px;">
                                                <div class="col-sm-12">
                                                    <div class="dataTables_info" role="status" aria-live="polite"
                                                         style="text-align:right;margin-right:110px;width: 100%">
                                                        日期：
                                                        <span id="add_time">
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${assessInfo.code!=2001}">
                                <div class="widget">
                                    <div class="widget-header "
                                         style="font-size: 18px;font-weight: bold;text-align:center;margin-bottom:10px;">
                                        <span class="widget-caption">老年人能力评估基本信息表</span>
                                    </div>
                                    <div class="widget-body">
                                        <div id="simpledatatable_wrapper"
                                             class="dataTables_wrapper form-inline no-footer">
                                            <table class="table table-striped table-bordered">
                                                <tbody>
                                                <tr role="row">
                                                    <td colspan="8" style="font-weight: bold;text-align:center;">
                                                        一、基本情况
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td colspan="8" style="width:100%">
                                                        单位：
                                                        <span style="border-bottom: #000 1px solid;padding:0px 15px;">
                                                                ${assessInfo.msg.areaName}
                                                        </span>区

                                                        <span style="border-bottom: #000 1px solid;padding:0px 15px;">                                                                ${assessInfo.msg.areaName}
                                                                ${assessInfo.msg.streetsName}
                                                        </span>街道（镇）
                                                        <span style="border-bottom: #000 1px solid;padding:0px 15px;">
                                                                ${assessInfo.msg.community}

                                                        </span>社区（村）
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td rowspan="2"
                                                        style="vertical-align:middle;text-align: center;width:17%;padding:0px">
                                                        姓名
                                                    </td>
                                                    <td rowspan="2"
                                                        style="vertical-align:middle;text-align: center;width:8%;padding:0px">
                                                            ${assessInfo.msg.oldman_name}
                                                    </td>
                                                    <td rowspan="2"
                                                        style="vertical-align:middle;text-align: center;width:8%;padding:0px">
                                                        身份证号
                                                    </td>
                                                    <td rowspan="2"
                                                        style="vertical-align:middle;text-align: center;width:17%;padding:0px">
                                                            ${assessInfo.msg.id_card}
                                                    </td>
                                                    <td rowspan="2"
                                                        style="vertical-align:middle;text-align: center;width:13%;padding:0px">
                                                        老年优待证号
                                                    </td>
                                                    <td rowspan="2"
                                                        style="vertical-align:middle;text-align: center;width:12%;padding:0px">
                                                            ${assessInfo.msg.oldman_preferential_card}
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width:8%;padding:0px">
                                                        固话
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;width:15%;padding:0px">
                                                            ${assessInfo.msg.phone1}

                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;;padding:0px">
                                                        手机
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;;padding:0px">
                                                            ${assessInfo.msg.phone2}
                                                    </td>
                                                </tr>

                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;;padding:0px">
                                                        文化程度
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;;padding:0px">
                                                            ${assessInfo.msg.degree_of_education}
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;;padding:0px">
                                                        户籍地址
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;;padding:0px">
                                                            ${assessInfo.msg.domicile_address}

                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;;padding:0px">
                                                        居住地址
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                            ${assessInfo.msg.now_address}
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;;padding:0px">
                                                        常住时间
                                                    </td>
                                                    <td>
                                    <span>
                                        <label class="checkbox-inline">
                                            <input type="checkbox"
                                            <c:if test="${assessInfo.msg.conservation_time==1}"> checked</c:if>
                                                   disabled value="1">&nbsp;1年以下
                                        </label>
                                    </span>
                                                        <br>
                                                        <span>
                                        <label class="checkbox-inline">
                                            <input type="checkbox"
                                            <c:if test="${assessInfo.msg.conservation_time==2}"> checked</c:if>
                                                   disabled value="2">&nbsp;1-3年
                                        </label>

                                    </span>
                                                        <br>
                                                        <span>
                                        <label class="checkbox-inline">
                                            <input type="checkbox"
                                            <c:if test="${assessInfo.msg.conservation_time==3}"> checked</c:if>
                                                   disabled value="3">&nbsp;3年以上
                                        </label>
                                    </span>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td colspan="8"
                                                        style="vertical-align:middle;text-align: center;padding:0px">联系人
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;;padding:0px">
                                                        对象
                                                    </td>
                                                    <td colspan="2"
                                                        style="vertical-align:middle;text-align: center;;padding:0px">姓名
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;;padding:0px">
                                                        与老人关系
                                                    </td>
                                                    <td colspan="2"
                                                        style="vertical-align:middle;text-align: center;;padding:0px">
                                                        联系方式
                                                    </td>
                                                    <td colspan="2"
                                                        style="vertical-align:middle;text-align: center;;padding:0px">
                                                        是否有老年人钥匙
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;">联系人1<br/>（直系亲属）
                                                    </td>
                                                    <td colspan="2" style="vertical-align:middle;text-align: center;">
                                                            ${assessInfo.msg.emergency_contact1}
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;">
                                                            ${assessInfo.msg.emergency_contact1_relatives}
                                                    </td>
                                                    <td colspan="2" style="vertical-align:middle;text-align: center;">
                                                            ${assessInfo.msg.emergency_contact1_tel}
                                                    </td>
                                                    <td colspan="2" style="vertical-align:middle;text-align: center;">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.is_key1==1}"> checked</c:if>
                                                                   disabled value="1">有
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.is_key1==2}"> checked</c:if>
                                                                   disabled value="2"> 无
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;">联系人2</td>
                                                    <td colspan="2" style="vertical-align:middle;text-align: center;">
                                                            ${assessInfo.msg.emergency_contact2}
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;">
                                                            ${assessInfo.msg.emergency_contact2_relatives}
                                                    </td>
                                                    <td colspan="2" style="vertical-align:middle;text-align: center;">
                                                            ${assessInfo.msg.emergency_contact2_tel}
                                                    </td>
                                                    <td colspan="2" style="vertical-align:middle;text-align: center;">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.is_key2==1}"> checked</c:if>
                                                                   disabled value="1">有
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.is_key2==2}"> checked</c:if>

                                                                   disabled value="2"> 无
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">联系人3</td>
                                                    <td colspan="2" style="vertical-align:middle;text-align: center;">
                                                            ${assessInfo.msg.emergency_contact3}
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;">
                                                            ${assessInfo.msg.emergency_contact3_relatives}
                                                    </td>
                                                    <td colspan="2" style="vertical-align:middle;text-align: center;">
                                                            ${assessInfo.msg.emergency_contact3_tel}
                                                    </td>
                                                    <td colspan="2" style="vertical-align:middle;text-align: center;">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.is_key3==1}"> checked</c:if>
                                                                   disabled>有
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" {
                                                            <c:if test="${assessInfo.msg.is_key3==2}"> checked</c:if>
                                                                   disabled> 无
                                                        </label>

                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td colspan="8" style="font-weight: bold;text-align:center;">
                                                        二、社会生活环境参数
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">原职业</td>
                                                    <td colspan="7">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_zy" value="1" disabled>公务员
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_zy" value="2" disabled>教师
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_zy" value="3" disabled>军人
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_zy" value="4" disabled>事业职工
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_zy" value="5" disabled>企业职工
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_zy" value="6" disabled>农民
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_zy" value="7" disabled>商人
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_zy" value="8" disabled>无固定职业
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">人员类别</td>
                                                    <td colspan="7">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_category" value="1"
                                                                   disabled>离休
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_category" value="2"
                                                                   disabled>退休
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_category" value="3"
                                                                   disabled>低保户
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_category" value="4"
                                                                   disabled>低保边缘户
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_category" value="5"
                                                                   disabled>城市三无
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_category" value="6"
                                                                   disabled>农村五保
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_category" value="7"
                                                                   disabled>三线老军工
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_category" value="8"
                                                                   disabled>三无下放人员
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_category" value="9"
                                                                   disabled>供养人员
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="oldman_category" value="10"
                                                                   disabled>其他
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">特殊对象</td>
                                                    <td colspan="7">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="special_object" value="1"
                                                                   disabled>大屠杀幸存者
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="special_object" value="2"
                                                                   disabled>百岁老年人
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="special_object" value="3"
                                                                   disabled>计生特扶老人
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="special_object" value="4"
                                                                   disabled>重点优抚对象
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">收入来源</td>
                                                    <td colspan="7">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="1"
                                                                   disabled>机关事业单位离休金
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="2"
                                                                   disabled>机关事业单位退休金
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="3"
                                                                   disabled>养老金
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="4"
                                                                   disabled>三无下放人员补贴
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="5"
                                                                   disabled>三线老军工补贴
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="6"
                                                                   disabled>城乡居民养老保险
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="7"
                                                                   disabled>供养人员补贴
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="8"
                                                                   disabled>低保金
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="9"
                                                                   disabled>拆迁补助
                                                        </label>
                                                        （<span
                                                            style="margin-left:30px;">${assessInfo.msg.relocation_allowance}</span>元/月）
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="10"
                                                                   disabled>失地农民补助
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="sources_of_income" value="11"
                                                                   disabled>其他
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">子女状况</td>
                                                    <td colspan="3">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.status_of_children==1}">
                                                                   checked</c:if>
                                                                   disabled>有子女
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.status_of_children==2}">
                                                                   checked</c:if>
                                                                   disabled>无子女
                                                        </label>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center">医疗类别</td>
                                                    <td colspan="3">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" value="1" name="medical_category"
                                                                   disabled>公费
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" value="2" name="medical_category"
                                                                   disabled>职工医保
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" value="3" name="medical_category"
                                                                   disabled>居民医保
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" value="4" name="medical_category"
                                                                   disabled>新农合
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" value="5" name="medical_category"
                                                                   disabled>自费
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">居住状况</td>
                                                    <td style="vertical-align:middle;" colspan="3">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.residential_status==1}">
                                                                   checked</c:if>

                                                                   disabled>独居
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.residential_status==2}">
                                                                   checked</c:if>
                                                                   disabled>空巢
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.residential_status==3}">
                                                                   checked</c:if>

                                                                   disabled>与子女同住
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.residential_status==4}">
                                                                   checked</c:if>

                                                                   disabled>其他
                                                        </label>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center">住房性质</td>
                                                    <td style="vertical-align:middle;text-align: center">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.housing_nature==1}">
                                                                   checked</c:if>

                                                                   disabled>有产权
                                                        </label>
                                                        <BR/>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.housing_nature==2}">
                                                                   checked</c:if>
                                                                   disabled>无产权
                                                        </label>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center">居室</td>
                                                    <td colspan="2">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.habitable_room==1}">
                                                                   checked</c:if>
                                                                   disabled>一居
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.habitable_room==2}">
                                                                   checked</c:if>
                                                                   disabled>二居
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.habitable_room==3}">
                                                                   checked</c:if>
                                                                   disabled>三居
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.habitable_room==4}">
                                                                   checked</c:if>
                                                                   disabled>其他
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">居住条件</td>
                                                    <td style="vertical-align:middle;" colspan="2">
                                                        楼层电梯：
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.floor_lift==1}"> checked</c:if>
                                                                   disabled>有
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.floor_lift==2}"> checked</c:if>
                                                                   disabled>无
                                                        </label>
                                                    </td>
                                                    <td style="vertical-align:middle;" colspan="2">
                                                        居住楼层（楼层无电梯的）：
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.residential_floor==1}">
                                                                   checked</c:if>
                                                                   disabled>一层
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.residential_floor==2}">
                                                                   checked</c:if>
                                                                   disabled>二层
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.residential_floor==3}">
                                                                   checked</c:if>
                                                                   disabled>三层以上
                                                        </label>
                                                    </td>
                                                    <td style="vertical-align:middle;">
                                                        室内厕所：
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.indoor_toilet==1}">
                                                                   checked</c:if>
                                                                   disabled>有
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.indoor_toilet==2}">
                                                                   checked</c:if>
                                                                   disabled>无
                                                        </label>
                                                    </td>
                                                    <td style="vertical-align:middle;" colspan="2">
                                                        室内洗浴设备：
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.indoor_bath_equipment==1}">
                                                                   checked</c:if>
                                                                   disabled>有
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.indoor_bath_equipment==2}">
                                                                   checked</c:if>
                                                                   disabled>无
                                                        </label>
                                                    </td>

                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">原照料情况</td>
                                                    <td colspan="7">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   name="care_situation" value="1" disabled>自我照料
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   name="care_situation" value="2" disabled>配偶照料
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   name="care_situation" value="3" disabled>子女照顾
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   name="care_situation" value="4" disabled>自购家政服务
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   name="care_situation" value="5" disabled>送餐服务
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="care_situation" value="6"
                                                                   disabled>互助门铃
                                                        </label>
                                                        <br>
                                                        政府购买居家养老服务：
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                                   name="government_purchase" value="1" disabled>居家照料
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="government_purchase" value="2"
                                                                   disabled>紧急呼叫终端
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="government_purchase" value="3"
                                                                   disabled>老年人意外伤害保险
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="government_purchase" value="4"
                                                                   disabled>其他
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">服务需求</td>
                                                    <td colspan="7">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="1"
                                                                   disabled>家务料理
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="2"
                                                                   disabled>代购物品
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="3"
                                                                   disabled>康复保健
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="4"
                                                                   disabled>紧急呼叫
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="5"
                                                                   disabled>心理关爱
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="6"
                                                                   disabled>法律援助
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="7"
                                                                   disabled>文化娱乐
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="8"
                                                                   disabled>助餐
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="9"
                                                                   disabled>送餐
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="10"
                                                                   disabled>陪聊
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="11"
                                                                   disabled>陪住
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="12"
                                                                   disabled>配外出
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="13"
                                                                   disabled>陪旅游
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="14"
                                                                   disabled>日托
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="services_requested" value="15"
                                                                   disabled>入住老年人福利机构
                                                        </label>
                                                        <br>
                                                        其他：${assessInfo.msg.services_requested_others}
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">身体状况</td>
                                                    <td colspan="7">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox"
                                                            <c:if test="${assessInfo.msg.physiclal_health_status==1}">
                                                                   checked</c:if>
                                                                   isabled>身体健康
                                                        </label>
                                                        <br>
                                                        重病：
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="1" disabled>恶性肿瘤
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="2" disabled>尿毒性透析
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="3" disabled>器官移植（含手术后的抗排异治疗）
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="4" disabled>白血病
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="5" disabled>急性心肌梗塞
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="6" disabled>脑中风
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="7" disabled>急性坏死性胰腺炎
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="8" disabled>脑外伤
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="9" disabled>主动脉手术
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="10" disabled>冠状动脉旁路手术
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="11" disabled>慢性肾功能性衰竭
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="12" disabled>急慢性重症肝炎
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="13" disabled>危及生命的良性脑瘤
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="14" disabled>重症糖尿病
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="15" disabled>消化道出血
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="16" disabled>系统性红斑狼疮
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="17" disabled>慢性再生障碍性贫血
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="18" disabled>血友病
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_illness_status"
                                                                   value="19" disabled>重症精神病
                                                        </label>
                                                        <br>
                                                        慢性病：
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_chronic_status"
                                                                   value="1" disabled>高血压
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_chronic_status"
                                                                   value="2" disabled>冠心病
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_chronic_status"
                                                                   value="3" disabled>前列前增生
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="physiclal_chronic_status"
                                                                   value="4" disabled>糖尿病
                                                        </label>
                                                        <span style="margin-left:30px;">其他：${assessInfo.msg.physiclal_chronic_others}</span>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">心理状况</td>
                                                    <td colspan="7">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="psychologic_status" value="1"
                                                                   disabled>正常
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="psychologic_status" value="2"
                                                                   disabled>偶尔有孤独感
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="psychologic_status" value="3"
                                                                   disabled>经常觉得很孤独
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center">社会活动情况</td>
                                                    <td style="vertical-align:middle;text-align: center" colspan="3">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="social_activities" value="1"
                                                                   disabled>经常
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="social_activities" value="2"
                                                                   disabled>偶尔
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="social_activities" value="3"
                                                                   disabled>从不
                                                        </label>
                                                    </td>
                                                    <td colspan="4">
                                                        社会活动类型：
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="social_activities_type"
                                                                   value="1" disabled>文艺类
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="social_activities_type"
                                                                   value="2" disabled>教育类
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="social_activities_type"
                                                                   value="3" disabled>健身类
                                                        </label>
                                                        <br>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="social_activities_type"
                                                                   value="4" disabled>慈善类
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="social_activities_type"
                                                                   value="5" disabled>经济类
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="social_activities_type"
                                                                   value="6" disabled>宗教类
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="social_activities_type"
                                                                   value="7" disabled>其他
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td colspan="8" style="font-weight: bold;text-align:center;">
                                                        三、日常生活活动
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        项目
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">描述
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        正常
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        轻丧失
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        中丧失
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        完全丧失
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        吃饭
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        能完成入口、咀嚼、吞咽等步骤
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity1==1}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity1==2}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity1==3}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity1==4}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        穿衣
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        完成取衣、穿衣、系带、扣扣子等
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity2==1}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity2==2}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity2==3}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity2==4}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        上下床
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        能完成洗脚、洗脸、上下床等步骤
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity3==1}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity3==2}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity3==3}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity3==4}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        如厕
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        如厕、便后能自理及整理衣裤
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity4==1}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity4==2}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity4==3}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity4==4}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        室内走动
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        外出、上下楼正常
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity5==1}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity5==2}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity5==3}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity5==4}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        洗澡
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        能完成洗澡的全部过程
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity6==1}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity6==2}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity6==3}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity6==4}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        控制大小便
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        能控制大小便
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity7==1}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity7==2}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity7==3}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.day_activity7==4}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                </tr>

                                                <tr role="row">
                                                    <td colspan="8"
                                                        style="font-weight: bold;text-align:center;padding:0px">
                                                        四、认知能力
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        项目
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">描述
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        正常
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        轻丧失
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        中丧失
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        完全丧失
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        近期记忆
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        能回想近期发生的事情
                                                    </td>

                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.cognitive_ability1==1}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.cognitive_ability1==2}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.cognitive_ability1==3}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.cognitive_ability1==4}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        程序记忆
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        完成洗衣、做饭、做菜等
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.cognitive_ability2==1}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.cognitive_ability2==2}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.cognitive_ability2==3}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.cognitive_ability2==4}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        定向记忆
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        外出、回家不迷路
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.cognitive_ability3==1}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.cognitive_ability3==2}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.cognitive_ability3==3}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.cognitive_ability3==4}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        判断能力
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        对日常事物的判断不违背常理
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.cognitive_ability4==1}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.cognitive_ability4==2}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.cognitive_ability4==3}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.cognitive_ability4==4}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td colspan="8" style="font-weight: bold;text-align:center;">
                                                        五、情绪行为
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        项目
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">描述
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        正常
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        轻丧失
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        中丧失
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        完全丧失
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        情绪
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        与人和睦相处，不偏激
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.mood_action1==1}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.mood_action1==2}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.mood_action1==3}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.mood_action1==4}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        行为
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        动作行为表现是否异常
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.mood_action2==1}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.mood_action2==2}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.mood_action2==3}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.mood_action2==4}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                </tr>

                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        沟通
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        在交流中能否互相理解
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.mood_action3==1}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.mood_action3==2}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.mood_action3==3}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.mood_action3==4}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td colspan="8" style="font-weight: bold;text-align:center;">
                                                        六、视、听觉
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        项目
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">描述
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        正常
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        轻丧失
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        中丧失
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        完全丧失
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        视觉
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        能正常看电视、读报等
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.audiovisual1==1}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.audiovisual1==2}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.audiovisual1==3}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.audiovisual1==4}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr role="row">
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        听觉
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px"
                                                        colspan="3">
                                                        能正常接听电话、交谈
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.audiovisual2==1}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.audiovisual2==2}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.audiovisual2==3}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="vertical-align:middle;text-align: center;padding:0px">
                                                        <c:if test="${assessInfo.msg.audiovisual2==4}">
                                                            <span style="font-weight: bold">&#10004</span>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>

                                            <div class="row DTTTFooter">
                                                <div class="col-sm-12">
                                                    <div class="" role="status" aria-live="polite">
                                                        <span>本人(或家属)签字：(${assessInfo.msg.jiashuname})</span>
                                                        <span style="border-bottom: #000 1px solid;">
                                                                <img src="${photoInfo.msg[0].path}"
                                                                     style="width:80px; height:35px;">
                                                        </span>
                                                        <span>评估员：(${assessInfo.msg.pingguyuanname})
                                                        </span>
                                                        <span style="border-bottom: #000 1px solid;">
                                                            <c:if test="${not empty assessInfo.msg.sign_photo2}">
                                                                <img src="http://120.55.112.44/${assessInfo.msg.sign_photo2}"
                                                                     style="width:80px; height:35px;">
                                                            </c:if>
                                                             <c:if test="${ empty assessInfo.msg.sign_photo2}">
                                                                 ${assessInfo.msg.assess_user_name}
                                                             </c:if>
                                                        </span>
                                                        <c:if test="${assessInfo.msg.is_edit==2}">
                                                            <span>编辑人：</span><span
                                                                style="border-bottom: #000 1px solid;">
                                                             <img src="${assessInfo.msg.edit_photo_path}"
                                                                  style="width:80px; height:35px;">
                                                            </span>
                                                        </c:if>
                                                        <span>社区：</span><span style="border-bottom: #000 1px solid;">
                                                            ${assessInfo.msg.community_name}

                                                    </span>
                                                        <span>评估机构：</span><span style="border-bottom: #000 1px solid;">
                                                            ${assessInfo.msg.service_name}

                                                    </span>
                                                        <span>总分数：</span><span style="border-bottom: #000 1px solid;">
                                                            ${assessInfo.msg.all_scores}

                                                    </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-top:20px;">
                                                <div class="col-sm-12">
                                                    <div class="dataTables_info" role="status" aria-live="polite"
                                                         style="text-align:right;margin-right:110px;">
                                                        日期：
                                                        <span id="add_time">
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                        </div>

                    </div>
                </div>
            </div>
        </div>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                <c:if test="${assessInfo.code!=2001}">
                var addTimeStr = "${assessInfo.msg.add_time}000";
                var add_time = new Date(parseFloat(addTimeStr)).getFullYear() + "-" + (new Date(parseFloat(addTimeStr)).getMonth() + 1) + "-" + new Date(parseFloat(addTimeStr)).getDay() + "";
                $("#add_time").html(add_time);
                setCheckbocCheck("${assessInfo.msg.oldman_zy}", document.getElementsByName("oldman_zy"));
                setCheckbocCheck("${assessInfo.msg.oldman_category}", document.getElementsByName("oldman_category"));
                setCheckbocCheck("${assessInfo.msg.special_object}", document.getElementsByName("special_object"));
                setCheckbocCheck("${assessInfo.msg.social_activities}", document.getElementsByName("social_activities"));
                setCheckbocCheck("${assessInfo.msg.sources_of_income}", document.getElementsByName("sources_of_income"));
                setCheckbocCheck("${assessInfo.msg.medical_category}", document.getElementsByName("medical_category"));
                setCheckbocCheck("${assessInfo.msg.care_situation}", document.getElementsByName("care_situation"));
                setCheckbocCheck("${assessInfo.msg.government_purchase}", document.getElementsByName("government_purchase"));
                setCheckbocCheck("${assessInfo.msg.physiclal_chronic_status}", document.getElementsByName("physiclal_chronic_status"));
                setCheckbocCheck("${assessInfo.msg.services_requested}", document.getElementsByName("services_requested"));
                setCheckbocCheck("${assessInfo.msg.psychologic_status}", document.getElementsByName("psychologic_status"));
                setCheckbocCheck("${assessInfo.msg.social_activities_type}", document.getElementsByName("social_activities_type"));

                </c:if>
                Metronic.init();
                Layout.init();
            });
            function setCheckbocCheck(scopes, obj2) {
                var scope = scopes.split(",");
                if (scopes.length > 0) {
                    for (var i = 0; i < obj2.length; i++) {
                        for (var j = 0; j < scopes.length; j++) {
                            if (obj2[i].value == scope[j]) {
                                obj2[i].checked = true;
                            }
                        }
                    }
                }
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

