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
<%@ taglib prefix="shoir" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>运营补贴申请详情</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jquery-multi-select/css/multi-select.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <style>
            * {
                padding: 0;
                margin: 0;
            }

            .tb-contain-write {
                background: #fff;
                border: 1px solid #999;
                padding: 10px;
                width: 100%;
            }

            .tb-contain-write form table tr td {
                padding: 6px 0;
                text-align: center;
            }

            .tb-contain-write form table:first-of-type tr td {
                border: 1px solid #999;
            }

            .tb-contain-write form table:nth-of-type(2) tr td {
                border-left: 1px solid #999;
                /*border-bottom: 1px solid #999;*/
            }

            .tb-contain-write form table:nth-of-type(2) tr td:nth-of-type(4) {
                border-right: 1px solid #999;
            }

            .tb-contain-write form table:nth-of-type(3) tr td {
                border: 1px solid #999;
            }

            .tb-contain-write form table:nth-of-type(4) tr td {
                border-left: 1px solid #999;
                width: 50%;

            }

            .tb-contain-write form table:nth-of-type(5) tr td {
                border: 1px solid #999;
            }

            ul {
                list-style: none;
            }

            .tb-contain-write .write-f {
                display: flex;
                width: 100%;
            }

            .organ-write {
                width: 10%;
                text-align: center;
                border-top: 1px solid #999;
                border-left: 1px solid #999;
                position: relative;
            }

            .organ-write span {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                left: 0;
            }

            .organ-name {
                width: 100%;
                display: flex;
                align-items: center;
            }

            .write-f table {
                border-collapse: collapse;
            }

            /* .organ-name ul li {
                border: 1px solid #999;
            } */

            .organ-f {
                width: 20%;
                box-sizing: border-box;
            }

            .organ-s {
                width: 20%;
                box-sizing: border-box;
            }

            .organ-t {
                width: 14%;
                box-sizing: border-box;
            }

            .organ-fo {
                width: 16%;
                box-sizing: border-box;
            }

            .organ-fi {
                width: 10%;
                box-sizing: border-box;
            }

            .organ-si {
                width: 20%;
                /* position: absolute;
                right:0; */
                box-sizing: border-box;
            }

            .organ-main {
                width: 100%;
            }

            .organ-name-form {
                width: 100%;
            }

            .organ-name-form table {
                width: 100%;
            }

            .organ-name-form table tr {
                position: relative;
            }

            .total-main {
                display: flex;
                align-items: center;
                /*border: 1px solid #999;*/
            }

            .total-main ul {
                height: 113px;
                width: 10%;
                margin: 0;
            }

            .total-main ul li:first-of-type {
                height: 66px;
                line-height: 63px;
                border-bottom: 1px solid #999;
                text-align: center;
            }

            .total-main ul li:nth-of-type(2) {
                height: 47px;
                line-height: 47px;
                border-bottom: 1px solid #999;
                text-align: center;
                padding: 5px 0;
            }

            .total-main form table {
                width: 100%;
            }

            .year-table {
                width: 40%
            }

            .time-organ {
                line-height: 40px;
                height: 40px;
                display: flex;
                border: 1px solid #999;
                position: relative;
                margin: 0;
            }

            .time-organ li {
                border: none !important;
                position: absolute;

            }

            .time-year {
                border-right: 1px solid #999;
                border-left: 1px solid #999;
                display: flex;

            }

            .time-year div {
                width: 50%;
                line-height: 34px;
                box-sizing: border-box;
            }

            .time-year div:first-of-type {
                border-right: 1px solid #999;
            }

            .time-organ li {
                display: flex;
                align-items: center;
            }

            .time-organ li:first-of-type {
                left: 6%;
            }

            .time-organ li:nth-of-type(2) {
                right: 22%;
            }

            .time-organ li:nth-of-type(3) {
                right: 16%;
            }

            .time-organ li:nth-of-type(4) {
                right: 10%;
            }

            .organ-state {
                border-right: 1px solid #999;
                border-left: 1px solid #999;
                height: 34px;
                line-height: 34px;
            }

            .organ-state ul li:first-of-type {
                border-right: 1px solid #999;
                width: 15%;
                text-align: center;
            }

            .count-bed {
                padding: 10px 0;
                border-bottom: 1px solid #999;
                border-left: 1px solid #999;
                border-right: 1px solid #999;
                height: 113px;
                text-align: center;
                line-height: 83px;
                width: 18%;
            }

            .address-h tr td {
                height: 50px;
            }

            .tb-contain-write input {
                background: none;
                border: none;
                outline: none;
                text-align: center;
            }

            .form-control {
                border: none;
                outline: none;
                background: none;
            }

            .workers {
                width: 11%;
                box-sizing: border-box;
            }

            .workers-all {
                width: 17%;
                box-sizing: border-box;
            }
            .tb-contain-write .header-sy{
                position: relative;
                height:60px;
            }
            .tb-contain-write .header-sy div:first-of-type{
                width:100%;
                text-align: center;
                font-size:22px;
            }
            .tb-contain-write .header-sy div:nth-of-type(2){
                position: absolute;
                right:1%;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">

        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">居家养老信息管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">运营补贴申请详情</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
           <%--     <shiro:hasPermission name="mechanism-update">
                    <div style="float: right;margin-right: 15px;margin-top: 5px;margin-bottom: 5px;">
                        <div style="width:80px;float:left;display: block;padding-right: 10px;">
                            <a class="btn btn-circle green"
                               onclick="modify()"><i
                                    class="fa">修改</i></a>
                        </div>
                    </div>
                </shiro:hasPermission>--%>
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            <span class="caption-subject font-red-sunglo bold uppercase">
                            申请运营补贴详情
                            </span>
                        </div>
                        <div style="margin-left: 1750px;">
                            <a  class="btn btn-circle green"  id="loadingPDF">
                                生成PDF
                            </a>
                        </div>
                    </div>
                    <div id="operation_subsidy" class="portlet-body form">
                        <div class="form-horizontal">
                            <div class="tb-contain-write">
                                <div class="header-sy">
                                    <div>内蒙古市民办养老机构运营补贴审批表</div>
                                    <div>单位：人、元</div>
                                </div>
                                <div class="write-f">
                                    <div class="organ-write"><span>民办养老机构填写</span></div>
                                    <div class="organ-main">
                                        <div class="organ-name">
                                            <form class="organ-name-form" id="addGovBuy">
                                                <table>
                                                    <tr>
                                                        <td class="organ-f">机构名称</td>
                                                        <td class="organ-s">
                                                            <input type="text" id="serviceOrgName" name="serviceOrgName"
                                                                   value="${apply.serviceOrgName}" disabled
                                                                   class="form-control date-picker"/>
                                                           <%-- <input type="text" class="form-control" id="serviceOrgName"
                                                                   name="serviceOrgName"
                                                                   value="${sessionScope.login_user.serviceOrgName}"
                                                                   maxlength="18" disabled/>
                                                            <input type="hidden" class="form-control" id="serviceOrgId"
                                                                   name="serviceOrgId"
                                                                   value="${sessionScope.login_user.serviceOrgId}"
                                                                   maxlength="18" disabled/>--%>
                                                        </td>
                                                        <td class="organ-t">开业时间</td>
                                                        <td class="organ-fo">
                                                            <input type="text" id="openingHours" name="openingHours"
                                                                   value="${apply.openingHours}" disabled
                                                                   class="form-control date-picker"/>
                                                        </td>
                                                        <td class="organ-fi">申请时间</td>
                                                            <%--<td class="organ-si"></td>--%>
                                                        <td colspan="2" class="app_list_search_td">
                                                            <input type="text" id="applyTime" name="applyTime" value="${apply.applyTime}" disabled
                                                                   class="form-control date-picker" />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="organ-f">养老机构许可证编号</td>
                                                        <td>
                                                            <input type="text" class="form-control" value="${apply.institutionNum}" id="institutionNum" name="institutionNum"
                                                                   maxlength="18"/>
                                                        </td>
                                                        <td>联系电话</td>
                                                        <td>
                                                            <input type="text" class="form-control" id="mobile"
                                                                   name="mobile" value="${apply.mobile}" disabled
                                                                   maxlength="18"/>
                                                        </td>
                                                        <td>法人代表</td>
                                                        <td>
                                                            <input type="text" class="form-control"
                                                                   id="legalRepresentative"
                                                                   name="legalRepresentative" value="${apply.legalRepresentative}" disabled
                                                                   maxlength="18"/>
                                                        </td>

                                                    </tr>

                                                </table>
                                                <table class="address-h">
                                                    <tr>
                                                        <td class="organ-f">民办机构企业登记证书编号和机构代码证号</td>
                                                            <%--<td class="organ-s">55996643-9</td>--%>

                                                        <td>
                                                            <input type="text" class="form-control"
                                                                   id="orgCode"
                                                                   name="orgCode" value="${apply.orgCode}" disabled
                                                                   maxlength="18"/>
                                                        </td>
                                                        <td class="organ-t">详细地址</td>
                                                        <td>
                                                            <input type="text" class="form-control" id="address"
                                                                   name="address" value="${apply.address}" disabled
                                                                   maxlength="18"/>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table>
                                                    <tr>
                                                        <td class="organ-f">建筑面积</td>
                                                        <td style="width:30%">
                                                            <input type="text" class="form-control" value="${apply.landArea}" id="landArea" disabled
                                                                   name="landArea"
                                                                   maxlength="18"/>
                                                        </td>
                                                        <td style="width:20%">标准床位数</td>
                                                        <td>
                                                            <input type="text" class="form-control" value="${apply.bedNums}" id="bedNums" disabled
                                                                   name="bedNums"
                                                                   maxlength="18"/>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table>
                                                    <tr>
                                                        <td>职工情况</td>
                                                        <td style="border-right:1px solid #999;">入住老人类型</td>
                                                    </tr>
                                                </table>
                                                <table>
                                                    <tr>
                                                        <td class="workers-all">总数</td>
                                                        <td class="workers">管理人员</td>
                                                        <td class="workers">服务人员</td>
                                                        <td class="workers">其他人员</td>
                                                        <td>总数</td>
                                                        <td>特困老年人</td>
                                                        <td>其他（自费）</td>
                                                    </tr>
                                                    <tr>
                                                            <%--职工情况--%>
                                                        <td>
                                                            <input type="text" class="form-control"  id="total" name="total" value="${apply.total}" disabled
                                                                   maxlength="18"/>
                                                        </td>
                                                        <td>
                                                            <input type="text" class="form-control"  id="management" name="management" value="${apply.management}" disabled
                                                                   maxlength="18"/>
                                                        </td>
                                                        <td>
                                                            <input type="text" class="form-control"  id="servicePersonal" name="servicePersonal" value="${apply.servicePersonal}" disabled
                                                                   maxlength="18"/>
                                                        </td>
                                                        <td>
                                                            <input type="text" class="form-control"  id="otherPersonal" name="otherPersonal" value="${apply.otherPersonal}" disabled
                                                                   maxlength="18"/>
                                                        </td>
                                                            <%--入住老人类型--%>
                                                        <td>
                                                            <input type="text" class="form-control" value="${apply.totalElderAndOther}"   id="totalElderAndOther"
                                                                   name="totalElderAndOther"
                                                                   maxlength="18"/>
                                                        </td>
                                                        <td>
                                                            <input type="text" class="form-control"
                                                                   id="extremelyPoorElderly"
                                                                   name="extremelyPoorElderly" value="0"<%--value="${apply.extremelyPoorElderly}"--%> disabled
                                                                   maxlength="18"/>
                                                        </td>
                                                        <td>
                                                            <input type="text" class="form-control" id="other"
                                                                   name="other"
                                                                   value="0"
                                                                   maxlength="18"/>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <div>
                                                    <div class="total-main">
                                                        <div class="count-bed">申请补贴床次数</div>
                                                        <ul>
                                                            <li>合计</li>
                                                            <li>
                                                                <input type="text" class="form-control" value="${apply.bedNum}" id="bedNum" name="bedNum"
                                                                       maxlength="18"/>
                                                            </li>
                                                        </ul>
                                                        <div style="width:90%;text-align: center;">
                                                            <div class="time-year">
                                                                <div>申请年度</div>
                                                                <div>

                                                                    <td colspan="1" class="app_list_search_td">
                                                                        <input type="text" id="applyYear" name="applyYear" value="${apply.applyYear}" disabled
                                                                               class="form-control date-picker"/>
                                                                    </td>
                                                                        <%--  <select id="applyYear" name="applyYear"
                                                                                  class="form-control">--%>
                                                                        <%--    <option value="">
                                                                                -- 请选择 --
                                                                            </option>
                                                                            <option value="2017.01~2017.12">
                                                                                2017.01~2017.12
                                                                            </option>
                                                                            <option value="2018.01~2018.12">
                                                                                2018.01~2018.12
                                                                            </option>
                                                                            <option value="2019.01~2019.12">
                                                                                2019.01~2019.12
                                                                            </option>--%>
                                                                        <%-- </select>--%>
                                                                </div>
                                                            </div>
                                                            <form>
                                                                <table>
                                                                    <tr>
                                                                        <td>1月</td>
                                                                        <td>2月</td>
                                                                        <td>3月</td>
                                                                        <td>4月</td>
                                                                        <td>5月</td>
                                                                        <td>6月</td>
                                                                        <td>7月</td>
                                                                        <td>8月</td>
                                                                        <td>9月</td>
                                                                        <td>10月</td>
                                                                        <td>11月</td>
                                                                        <td>12月</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   id="bedNum1" name="bedNum1" value="${apply.bedNum1}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   id="bedNum2" name="bedNum2" value="${apply.bedNum2}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   id="bedNum3" name="bedNum3" value="${apply.bedNum3}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   id="bedNum4" name="bedNum4" value="${apply.bedNum4}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td><input type="text" class="form-control"
                                                                                   id="bedNum5" name="bedNum5" value="${apply.bedNum5}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   id="bedNum6" name="bedNum6" value="${apply.bedNum6}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   id="bedNum7" name="bedNum7" value="${apply.bedNum7}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   id="bedNum8" name="bedNum8" value="${apply.bedNum8}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   id="bedNum9" name="bedNum9" value="${apply.bedNum9}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   id="bedNum10" name="bedNum10"
                                                                                   value="${apply.bedNum10}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   id="bedNum11" name="bedNum11"
                                                                                   value="${apply.bedNum11}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   id="bedNum12" name="bedNum12"
                                                                                   value="${apply.bedNum12}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <div class="organ-state">
                                                        本机构郑重声明以上信息完全真实，且本申请年度内我机构无严重责任事故和重大
                                                        服务纠纷，无侵害入住老人服务对象合法权益的现象。特此申请运营补贴。
                                                    </div>
                                                    <ul class="time-organ">
                                                        <li>盖 章：</li>
                                                        <li>
                                                            <input type="text" style="width:70px;" class="form-control"
                                                                   value=""
                                                                   maxlength="18"/>
                                                            <span>年</span>
                                                        </li>
                                                        <li>
                                                            <input type="text" style="width:70px;" class="form-control"
                                                                   value=""
                                                                   maxlength="18"/>
                                                            <span>月</span>
                                                        </li>
                                                        <li>
                                                            <input type="text" style="width:70px;" class="form-control"
                                                                   value=""
                                                                   maxlength="18"/>
                                                            <span>日</span>
                                                        </li>
                                                    </ul>
                                                </div>

                                            </form>

                                        </div>

                                    </div>

                                </div>
                                <div class="write-f">
                                    <div class="organ-write"><span>县（市、区）民政、财政部门审核意见</span></div>
                                    <div class="organ-main">
                                        <div class="organ-name">
                                            <form class="organ-name-form">
                                                <div>
                                                    <div class="total-main">
                                                        <div class="count-bed">符合补贴床次数</div>
                                                        <ul>
                                                            <li>合计</li>
                                                            <li>
                                                                <input type="text" class="form-control" value="${apply.bedNum}"
                                                                       maxlength="18"/>
                                                            </li>
                                                        </ul>
                                                        <div style="width:90%;text-align: center;">
                                                            <div class="time-year">
                                                                <div>年度</div>
                                                                <div>
                                                                    <td colspan="1" class="app_list_search_td">
                                                                        <input type="text" id="applyYear2"  value="${apply.applyYear}" disabled
                                                                               class="form-control date-picker"/>
                                                                    </td>
                                                                        <%--<select class="form-control">
                                                                            <option value="">
                                                                                -- 请选择 --
                                                                            </option>
                                                                            <option value="2017.01~2017.12">
                                                                                2017.01~2017.12
                                                                            </option>
                                                                            <option value="2018.01~2018.12">
                                                                                2018.01~2018.12
                                                                            </option>
                                                                            <option value="2019.01~2019.12">
                                                                                2019.01~2019.12
                                                                            </option>
                                                                        </select>--%>
                                                                </div>
                                                            </div>
                                                            <form>
                                                                <table>
                                                                    <tr>
                                                                        <td>1月</td>
                                                                        <td>2月</td>
                                                                        <td>3月</td>
                                                                        <td>4月</td>
                                                                        <td>5月</td>
                                                                        <td>6月</td>
                                                                        <td>7月</td>
                                                                        <td>8月</td>
                                                                        <td>9月</td>
                                                                        <td>10月</td>
                                                                        <td>11月</td>
                                                                        <td>12月</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   value="${apply.bedNum1}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   value="${apply.bedNum2}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   value="${apply.bedNum3}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   value="${apply.bedNum4}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td><input type="text" class="form-control"
                                                                                   value="${apply.bedNum5}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   value="${apply.bedNum6}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   value="${apply.bedNum7}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   value="${apply.bedNum8}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   value="${apply.bedNum9}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"

                                                                                   value="${apply.bedNum10}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"

                                                                                   value="${apply.bedNum11}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"

                                                                                   value="${apply.bedNum12}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <div class="organ-state">
                                                        <ul style="display:flex;">
                                                            <li>补贴金额</li>
                                                            <li>
                                                                <input type="text" class="form-control" value="${apply.money}" disabled
                                                                       maxlength="18"/>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <ul class="time-organ">
                                                        <li>盖 章：</li>
                                                        <li>
                                                            <input type="text" style="width:70px;" class="form-control"
                                                                   value=""
                                                                   maxlength="18"/>
                                                            <span>年</span>
                                                        </li>
                                                        <li>
                                                            <input type="text" style="width:70px;" class="form-control"
                                                                   value=""
                                                                   maxlength="18"/>
                                                            <span>月</span>
                                                        </li>
                                                        <li>
                                                            <input type="text" style="width:70px;" class="form-control"
                                                                   value=""
                                                                   maxlength="18"/>
                                                            <span>日</span>
                                                        </li>
                                                    </ul>
                                                </div>

                                            </form>

                                        </div>

                                    </div>

                                </div>
                                <div class="write-f">
                                    <div class="organ-write" style="border-bottom: 1px solid #999">
                                        <span>市民政、财政部门审核意见</span>
                                    </div>
                                    <div class="organ-main">
                                        <div class="organ-name">
                                            <form class="organ-name-form">
                                                <div>
                                                    <div class="total-main">
                                                        <div class="count-bed">符合补贴床次数</div>
                                                        <ul>
                                                            <li>合计</li>
                                                            <li>
                                                                <input type="text" class="form-control" value="${apply.bedNum}"
                                                                       maxlength="18"/>
                                                            </li>
                                                        </ul>
                                                        <div style="width:90%;text-align: center;">
                                                            <div class="time-year">
                                                                <div>年度</div>
                                                                <div>
                                                                    <td colspan="1" class="app_list_search_td">
                                                                        <input type="text" id="applyYear3" value="${apply.applyYear}" disabled
                                                                               class="form-control date-picker"/>
                                                                    </td>
                                                                        <%--    <select class="form-control">
                                                                                <option value="">
                                                                                    -- 请选择 --
                                                                                </option>
                                                                                <option value="2017.01~2017.12">
                                                                                    2017.01~2017.12
                                                                                </option>
                                                                                <option value="2018.01~2018.12">
                                                                                    2018.01~2018.12
                                                                                </option>
                                                                                <option value="2019.01~2019.12">
                                                                                    2019.01~2019.12
                                                                                </option>
                                                                            </select>--%>
                                                                </div>
                                                            </div>
                                                            <form>
                                                                <table>
                                                                    <tr>
                                                                        <td>1月</td>
                                                                        <td>2月</td>
                                                                        <td>3月</td>
                                                                        <td>4月</td>
                                                                        <td>5月</td>
                                                                        <td>6月</td>
                                                                        <td>7月</td>
                                                                        <td>8月</td>
                                                                        <td>9月</td>
                                                                        <td>10月</td>
                                                                        <td>11月</td>
                                                                        <td>12月</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   value="${apply.bedNum1}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   value="${apply.bedNum2}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   value="${apply.bedNum3}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   value="${apply.bedNum4}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td><input type="text" class="form-control"
                                                                                   value="${apply.bedNum5}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   value="${apply.bedNum6}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   value="${apply.bedNum7}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   value="${apply.bedNum8}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"
                                                                                   value="${apply.bedNum9}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"

                                                                                   value="${apply.bedNum10}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"

                                                                                   value="${apply.bedNum11}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" class="form-control"

                                                                                   value="${apply.bedNum12}"
                                                                                   maxlength="18"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <div class="organ-state">
                                                        <ul style="display:flex;">
                                                            <li>补贴金额</li>
                                                            <li>
                                                                <input type="text" class="form-control" value="${apply.money}" disabled
                                                                       maxlength="18"/>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <ul class="time-organ">
                                                        <li>盖 章：</li>
                                                        <li>
                                                            <input type="text" style="width:70px;" class="form-control"
                                                                   value=""
                                                                   maxlength="18"/>
                                                            <span>年</span>
                                                        </li>
                                                        <li>
                                                            <input type="text" style="width:70px;" class="form-control"
                                                                   value=""
                                                                   maxlength="18"/>
                                                            <span>月</span>
                                                        </li>
                                                        <li>
                                                            <input type="text" style="width:70px;" class="form-control"
                                                                   value=""
                                                                   maxlength="18"/>
                                                            <span>日</span>
                                                        </li>
                                                    </ul>
                                                </div>

                                            </form>

                                        </div>

                                    </div>

                                </div>
                            <!-- PERSONAL INFO TAB -->
                        <%--    <form class="form-body" id="addGovBuy">
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="app_list_search_caption" colspan="1" style="text-align:center;vertical-align:middle;">
                                            组织名称<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="serviceOrgName" name="serviceOrgName" readonly value="${apply.serviceOrgName}"
                                                   maxlength="18" disabled/>
                                            <input type="hidden" class="form-control" id="serviceOrgId" name="serviceOrgId" value="${sessionScope.login_user.serviceOrgId}"
                                                   maxlength="18" disabled/>
                                            <input type="hidden" class="form-control" id="id" name="id" value="${apply.id}"
                                                   maxlength="18" disabled/>
                                        </td>
                                        <td class="app_list_search_caption" colspan="1" style="text-align:center;vertical-align:middle;">
                                            开业时间<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td" colspan="1" style="text-align:center;vertical-align:middle;">
                                            <input type="text" id="openingHours" name="openingHours" value="${apply.openingHours}"
                                                   class="form-control date-picker" />
                                        </td>
                                        <td class="app_list_search_caption" colspan="1" style="text-align:center;vertical-align:middle;">
                                            法定代表<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td" colspan="1" style="text-align:center;vertical-align:middle;">
                                            <input type="text" class="form-control" id="legalRepresentative" name="legalRepresentative" value="${apply.legalRepresentative}"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption" colspan="1" style="text-align:center;vertical-align:middle;">
                                            详细地址<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td" colspan="5">
                                            <input type="text" class="form-control" id="address" name="address" value="${apply.address}"
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_caption" colspan="1" style="text-align:center;vertical-align:middle;">
                                            联系电话<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td" colspan="1">
                                            <input type="text" class="form-control" id="mobile" name="mobile" value="${apply.mobile}"
                                                   maxlength="18"/>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption" colspan="8" style="text-align:center;vertical-align:middle;">
                                            职工情况
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption" colspan="1" style="text-align:center;vertical-align:middle;">
                                            总数
                                        </td>
                                        <td class="app_list_search_td" colspan="1">
                                            <input type="text" id="total" name="total" value="${apply.total}"
                                                   class="form-control" />
                                        </td>
                                        <td class="app_list_search_caption" colspan="1" style="text-align:center;vertical-align:middle;">
                                            管理人员
                                        </td>
                                        <td class="app_list_search_td" colspan="1">
                                            <input type="text" id="management" name="management" value="${apply.management}"
                                                   class="form-control" />
                                        </td>
                                        <td class="app_list_search_caption" colspan="1" style="text-align:center;vertical-align:middle;">
                                            服务人员
                                        </td>
                                        <td class="app_list_search_td" colspan="1">
                                            <input type="text" id="servicePersonal" name="servicePersonal" value="${apply.servicePersonal}"
                                                   class="form-control" />
                                        </td>
                                        <td class="app_list_search_caption" colspan="1" style="text-align:center;vertical-align:middle;">
                                            其他人员
                                        </td>
                                        <td class="app_list_search_td" colspan="1">
                                            <input type="text" id="otherPersonal" name="otherPersonal" value="${apply.otherPersonal}"
                                                   class="form-control" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption" colspan="8" style="text-align:center;vertical-align:middle;">
                                            入住老人类型
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption" colspan="1" style="text-align:center;vertical-align:middle;">
                                            总数
                                        </td>
                                        <td class="app_list_search_td" colspan="1">
                                            <input type="text" id="totalElderAndOther" name="totalElderAndOther" value="${apply.totalElderAndOther}"
                                                   class="form-control" />
                                        </td>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 特困老年人数
                                        </td>
                                        <td class="app_list_search_td" colspan="2">
                                            <input type="text" class="form-control" id="extremelyPoorElderly" name="extremelyPoorElderly" value="${apply.extremelyPoorElderly}"
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 其他（自费）
                                        </td>
                                        <td class="app_list_search_td" colspan="2">
                                            <input type="text" class="form-control" id="other" name="other" value="${apply.other}"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption" style="text-align:center;vertical-align:middle;">
                                            申请年度<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <lb:select id="applyYear" name="applyYear" cssClass="form-control" value="${apply.applyYear}">
                                                <lb:option value="">-- 请选择 --</lb:option>
                                                <lb:option value="2017.01~2017.12">2017.01~2017.12</lb:option>
                                                <lb:option value="2018.01~2018.12">2018.01~2018.12</lb:option>
                                                <lb:option value="2019.01~2019.12">2019.01~2019.12</lb:option>
                                            </lb:select>
                                        </td>
                                        <td class="app_list_search_caption" colspan="1" style="text-align:center;vertical-align:middle;">
                                            申请时间<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td" colspan="3" style="text-align:center;vertical-align:middle;">
                                            <input type="text" id="applyTime" name="applyTime" value="${apply.applyTime}"
                                                   class="form-control date-picker" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption" style="text-align:center;vertical-align:middle;">
                                            <font color="red">*</font> 申请补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum" name="bedNum" value="${apply.bedNum}"
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_caption" style="text-align:center;vertical-align:middle;">
                                            <font color="red">*</font> 一月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum1" name="bedNum1" value="${apply.bedNum1}"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption" style="text-align:center;vertical-align:middle;">
                                            <font color="red">*</font> 二月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum2" name="bedNum2" value="${apply.bedNum2}"
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_caption" style="text-align:center;vertical-align:middle;">
                                            <font color="red">*</font> 三月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum3" name="bedNum3" value="${apply.bedNum3}"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption" style="text-align:center;vertical-align:middle;">
                                            <font color="red">*</font> 四月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum4" name="bedNum4" value="${apply.bedNum4}"
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_caption" style="text-align:center;vertical-align:middle;">
                                            <font color="red">*</font> 五月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum5" name="bedNum5" value="${apply.bedNum5}"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption" style="text-align:center;vertical-align:middle;">
                                            <font color="red">*</font> 六月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum6" name="bedNum6" value="${apply.bedNum6}"
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_caption" style="text-align:center;vertical-align:middle;">
                                            <font color="red">*</font> 七月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum7" name="bedNum7" value="${apply.bedNum7}"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption" style="text-align:center;vertical-align:middle;">
                                            <font color="red">*</font> 八月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum8" name="bedNum8" value="${apply.bedNum8}"
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_caption" style="text-align:center;vertical-align:middle;">
                                            <font color="red">*</font> 九月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum9" name="bedNum9" value="${apply.bedNum9}"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption" style="text-align:center;vertical-align:middle;">
                                            <font color="red">*</font> 十月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum10" name="bedNum10" value="${apply.bedNum10}"
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_caption" style="text-align:center;vertical-align:middle;">
                                            <font color="red">*</font> 十一月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum11" name="bedNum11" value="${apply.bedNum11}"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption" style="text-align:center;vertical-align:middle;">
                                            <font color="red">*</font> 十二月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum12" name="bedNum12" value="${apply.bedNum12}"
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_caption" style="text-align:center;vertical-align:middle;">
                                            申请人<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="applyer" name="applyer" value="${apply.applyer}"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                </table>
                            </form>--%>
                       <%--     <div class="modal-footer">
                                <button type="button" class="btn blue addHappy">保存</button>
                                <span id="labelmsg" class="label"></span>
                                <button onclick="window.parent.closeTab('tab_mechanism_add')" class="btn btn-default">返回
                                </button>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/pdf/html2canvas.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/pdf/jspdf.debug.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();

                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    format: 'yyyy-mm-dd',
                    autoclose: true
                });

                $("#loadingPDF").on("click",function () {
                    html2canvas(document.getElementById("operation_subsidy"), {
                        onrendered:function(canvas) {
                            var contentWidth = canvas.width;
                            var contentHeight = canvas.height;
                            var pageHeight = contentWidth / 592.28 * 841.89;
                            var leftHeight = contentHeight;
                            var position = 0;
                            var imgWidth = 595.28;
                            var imgHeight = 592.28/contentWidth * contentHeight;
                            var pageData = canvas.toDataURL('image/jpeg', 1.0);
                            var pdf = new jsPDF('', 'pt', 'a4');
                            if (leftHeight < pageHeight) {
                                pdf.addImage(pageData, 'JPEG', 0, 0, imgWidth, imgHeight );
                            } else {
                                while(leftHeight > 0) {
                                    pdf.addImage(pageData, 'JPEG', 0, position, imgWidth, imgHeight)
                                    leftHeight -= pageHeight;
                                    position -= 841.89;
                                    if(leftHeight > 0) {
                                        pdf.addPage();
                                    }
                                }
                            }
                            pdf.save('内蒙古市民办养老机构运营补贴审批表.pdf');
                        }
                    })
                });

                $(".addHappy").click(function () {
                    var serviceOrgName = $("input[name=serviceOrgName]").val();
                    var openingHours = $("input[name=openingHours]").val();
                    var applyTime = $("input[name=applyTime]").val();
                    var legalRepresentative = $("input[name=legalRepresentative]").val();
                    var address = $("input[name=address]").val();
                    var mobile = $("input[name=mobile]").val();
                    var applyYear = $("select[name=applyYear]").val();
                    var applyer = $("input[name=applyer]").val();

                    if(serviceOrgName=="" || serviceOrgName==null){
                        $("#labelmsg").text('组织名称不能为空！').addClass("label-danger");
                        return;
                    }else if(openingHours=="" || openingHours==null){
                        $("#labelmsg").text('开业时间不能为空！').addClass("label-danger");
                        return;
                    }else if(applyTime=="" || applyTime==null){
                        $("#labelmsg").text('申请时间不能为空！').addClass("label-danger");
                        return;
                    }else if(legalRepresentative=="" || legalRepresentative==null){
                        $("#labelmsg").text('法定代表不能为空！').addClass("label-danger");
                        return;
                    }else if(address=="" || address==null){
                        $("#labelmsg").text('详细地址不能为空！').addClass("label-danger");
                        return;
                    }else if(mobile=="" || mobile==null){
                        $("#labelmsg").text('联系电话不能为空！').addClass("label-danger");
                        return;
                    }else if(applyer=="" || applyer==null){
                        $("#labelmsg").text('申请人不能为空！').addClass("label-danger");
                        return;
                    }else if(applyYear=="" || applyYear==null){
                        $("#labelmsg").text('申请年度不能为空！').addClass("label-danger");
                        return;
                    }
                    addHappy();
                });

                function addHappy() {
                    $.post(window.apppath + "/admin/api/serviceOrg/subsidy/updateMechanisam", {
                        type:1,
                        object:1,
                        submitStatus:1,
                        id: $("input[name=id]").val(),
                        serviceOrgId: $("input[name=serviceOrgId]").val(),
                        serviceOrgName: $("input[name=serviceOrgName]").val(),
                        openingHours: $("input[name=openingHours]").val(),
                        applyTime: $("input[name=applyTime]").val(),
                        legalRepresentative: $("input[name=legalRepresentative]").val(),
                        address: $("input[name=address]").val(),
                        mobile: $("input[name=mobile]").val(),
                        total: $("input[name=total]").val(),
                        management: $("input[name=management]").val(),
                        servicePersonal: $("input[name=servicePersonal]").val(),
                        otherPersonal: $("input[name=otherPersonal]").val(),
                        totalElderAndOther: $("input[name=totalElderAndOther]").val(),
                        extremelyPoorElderly: $("input[name=extremelyPoorElderly]").val(),
                        other: $("input[name=other]").val(),
                        applyYear: $("select[name=applyYear]").val(),
                        bedNum: $("input[name=bedNum]").val(),
                        bedNum1: $("input[name=bedNum1]").val(),
                        bedNum2: $("input[name=bedNum2]").val(),
                        bedNum3: $("input[name=bedNum3]").val(),
                        bedNum4: $("input[name=bedNum4]").val(),
                        bedNum5: $("input[name=bedNum5]").val(),
                        bedNum6: $("input[name=bedNum6]").val(),
                        bedNum7: $("input[name=bedNum7]").val(),
                        bedNum8: $("input[name=bedNum8]").val(),
                        bedNum9: $("input[name=bedNum9]").val(),
                        bedNum10: $("input[name=bedNum10]").val(),
                        bedNum11: $("input[name=bedNum11]").val(),
                        bedNum12: $("input[name=bedNum12]").val(),
                        applyer: $("input[name=applyer]").val()
                    }, function (res) {
                        if (res.success) {
                            alert(res.message);
                            window.location.reload();
                        }
                        else {
                            alert(res.message);
                        }
                    },'json');
                }
            });

            function modify() {
                $("#addGovBuy").find("input").prop("disabled", false);//找到form表单下的所有input标签并置为可编辑
                $("#addGovBuy").find("select").prop("disabled", false);//找到form表单下的所有select标签并置为可编辑
            }

            function init() {
                $("#addGovBuy").find("input").prop("disabled", true);//找到form表单下的所有input标签并置为不可编辑
                $("#addGovBuy").find("select").prop("disabled", true);//找到form表单下的所有select标签并置为不可编辑
            }

            init();
            var now = new Date();
            var year = now.getFullYear(); //得到年份
            var month = now.getMonth()+1;//得到月份
            var date = now.getDate();//得到日期
            var hour = now.getHours();//得到小时
            var minu = now.getMinutes();//得到分钟
            var sec = now.getSeconds();//得到秒
            if (month < 10) month = "0" + month;
            if (date < 10) date = "0" + date;
            if (hour < 10) hour = "0" + hour;
            if (minu < 10) minu = "0" + minu;
            if (sec < 10) sec = "0" + sec;
            timeNow = year + "-" + month + "-" + date + " " + hour + ":" + minu + ":" + sec;
            timeNows = year-1;

           // $("#applyTime").val(timeNow);
  /*          $("#applyYear").val(timeNows);
            $("#applyYear2").val(timeNows);
            $("#applyYear3").val(timeNows);*/

        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

