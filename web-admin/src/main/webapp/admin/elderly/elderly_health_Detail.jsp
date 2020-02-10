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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>健康数据信息详情</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
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
                    <a href="#">健康管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">健康数据信息详情</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            用户健康数据详情
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <div class="form-body">
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 用户序号
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="memberID">${enroll.memberID}</div>
                                        </td>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 会员名：
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="elderName">${enroll.name}</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 身份证号：
                                        </td>
                                        <td class="app_list_search_td" >
                                            <input type="hidden" value="${elderlyGovBuyFw.elderId}" id="elderId">
                                            <input type="hidden" value="${enroll.idCardNo}" id="idCardNo">
                                            <div>${enroll.idCardNo}</div>
                                        </td>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 性别：
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="genderCode" class="form-control" name="genderCode" disabled="disabled">
                                                <option value='0'>-未知-</option>
                                                <option value='1' <c:if test="${enroll.genderCode==1}">selected</c:if>>男</option>
                                                <option value='2' <c:if test="${enroll.genderCode==2}">selected</c:if>>女</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 出生日期：
                                        </td>
                                        <td class="app_list_search_td" >
                                            <div id="birthDate">${enroll.birthDate}</div>
                                        </td>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 记录创建时间：
                                        </td>
                                        <td class="app_list_search_td" >
                                            <div id="recordDateTime">${enroll.recordDateTime}</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            联系电话：
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="homeTel">${enroll.phone}</div>
                                        </td>
                                        <td class="app_list_search_caption">
                                            备注：
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="remark">${enroll.remark}</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            监测类别
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="testType" class="form-control" name="testType" disabled="disabled">
                                                <option value='0'>-未知-</option>
                                                <option value='1' <c:if test="${blood.testType==1}">selected</c:if>>血压</option>
                                                <option value='2' <c:if test="${blood.testType==2}">selected</c:if>>血糖</option>
                                                <option value='3' <c:if test="${blood.testType==3}">selected</c:if>>体重</option>
                                                <option value='4' <c:if test="${blood.testType==4}">selected</c:if>>运动</option>
                                                <option value='5' <c:if test="${blood.testType==5}">selected</c:if>>睡眠</option>
                                                <option value='6' <c:if test="${blood.testType==6}">selected</c:if>>身体指数</option>
                                                <option value='7' <c:if test="${blood.testType==6}">selected</c:if>>血脂</option>
                                                <option value='8' <c:if test="${blood.testType==6}">selected</c:if>>血尿酸</option>
                                                <option value='9' <c:if test="${blood.testType==6}">selected</c:if>>血氧</option>
                                                <option value='10' <c:if test="${blood.testType==6}">selected</c:if>>心电</option>
                                                <option value='11' <c:if test="${blood.testType==6}">selected</c:if>>呼吸率</option>
                                                <option value='12' <c:if test="${blood.testType==6}">selected</c:if>>精神指数</option>
                                                <option value='13' <c:if test="${blood.testType==6}">selected</c:if>>皮肤指数</option>
                                                <option value='14' <c:if test="${blood.testType==6}">selected</c:if>>体温</option>
                                            </select>
                                        </td>
                                        <td class="app_list_search_caption">
                                            设备串号
                                        </td>
                                        <td>
                                            <div id="deviceSid">${enroll.deviceSid}</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            来源采集方式
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="collectType" class="form-control" name="collectType" disabled="disabled">
                                                <option value='0'>-未知-</option>
                                                <option value='1' <c:if test="${blood.collectType==1}">selected</c:if>>APP</option>
                                                <option value='2' <c:if test="${blood.collectType==2}">selected</c:if>>微信</option>
                                                <option value='3' <c:if test="${blood.collectType==3}">selected</c:if>>会员网站端</option>
                                            </select>
                                        </td>
                                        <td class="app_list_search_caption">
                                            设备型号
                                        </td>
                                        <td>
                                            <div id="deviceType">${blood.deviceType}</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            收缩压 高压
                                        </td>
                                        <td>
                                            <div id="hightValue">${blood.hightValue} mmHg</div>
                                        </td>
                                        <td class="app_list_search_caption">
                                            舒张压 低压
                                        </td>
                                        <td>
                                            <div id="lowValue">${blood.lowValue} mmHg</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            脉率
                                        </td>
                                        <td>
                                            <div id="pulseValue">${blood.pulseValue} bpm</div>
                                        </td>
                                        <td class="app_list_search_caption">
                                            血压级别
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="level" class="form-control" name="level" disabled="disabled">
                                                <option value='-1' <c:if test="${blood.level==-1}">selected</c:if>>偏低,</option>
                                                <option value='0' <c:if test="${blood.level==0}">selected</c:if>>正常</option>
                                                <option value='1' <c:if test="${blood.level==1}">selected</c:if>>正常高值</option>
                                                <option value='2' <c:if test="${blood.level==2}">selected</c:if>>1级高血压</option>
                                                <option value='3' <c:if test="${blood.level==3}">selected</c:if>>2级高血压</option>
                                                <option value='4' <c:if test="${blood.level==4}">selected</c:if>>3级高血压</option>
                                            </select>
                                        </td>
                                    </tr>
                                </table>
                                <div class="modal-footer" >
                                        <button id="update"  style="display: none" type="button" class="btn blue update">修改</button>
                                        <button id="save"  style="display: none" type="button" style="display: none" class="btn blue ">保存</button>
                                        <button onclick="history.back()" type="button" class="btn btn-default">返回
                                    </button>
                                </div>

                            </div>
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
                src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"></script>
        <script>
           jQuery(document).ready(function () {
                $("input").attr("disabled","true");
               var boxObj = $("input:checkbox[name='serviceItems']");  //获取所有的复选框
               var expresslist = "${elderlyGovBuyFw.serviceItems}"; //用el表达式获取在控制层存放的复选框的值为字符串类型
               var express = expresslist.split(','); //去掉它们之间的分割符“，”
               for(i=0;i<boxObj.length;i++){
                   for(j=0;j<express.length;j++){
                       if(boxObj[i].value == express[j])  //如果值与修改前的值相等
                       {
                           boxObj[i].checked= true;
                           break;
                       }
                   }
               }
                Metronic.init();
                Layout.init();
                if("${elderlyGovBuyFw.status}"==1){
                    $("#update").show();
                    $("#save").show();
                }
                $("#update").click(function () {
                    $("input").removeAttr("disabled");
                    $("select").removeAttr("disabled");
                    $(this).hide();
                    $("#save").show();
                });

                $("#save").click(function () {

                    var id = document.getElementsByName('serviceItems');
                    var serviceItems = "";
                    for(var i = 0; i < id.length; i++){
                        if(id[i].checked)
                            serviceItems+=id[i].value+",";
                    }
                    if(serviceItems.length>0){
                        serviceItems=serviceItems.substring(0,serviceItems.length-1);
                    }

                    var serviceOrgId=$("#serviceOrgId").val();
                    serviceOrgId=serviceOrgId.replace("serviceOrg","");
                    $.post(window.apppath + "/admin/api/elderly/govbuyfw/update", {
                        elderId: $("#elderId").val(),
                        serviceOrgId:serviceOrgId,
                        subsidy: $("#srvsubsidy").val(),
                        elderType: $("#elderType").val(),
                        idcardno: $("#idcardno").val(),
                        serviceItems:serviceItems,
                        status:1
                    }, function (res) {
                        if (res.success) {
                            alert2(res.message,function () {
                                window.location.reload();
                            });
                        }
                        else {
                            alert2(res.message);
                        }
                    }, 'json');
                })
                
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

