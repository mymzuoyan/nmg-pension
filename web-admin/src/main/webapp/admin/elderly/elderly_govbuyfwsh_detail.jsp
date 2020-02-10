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
        <title>政府购买老人详情</title>
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
                    <a href="#">老人信息管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">政府购买老人详情</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            政府购买老人详情
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <div class="form-body">
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 身份证号：
                                        </td>
                                        <td class="app_list_search_td" >
                                            <input type="hidden" value="${elderlyGovBuyFw.elderId}" id="elderId">
                                            <input type="hidden" value="${elderlyGovBuyFw.idcardno}" id="idcardno">
                                            <div>${elderlyGovBuyFw.idcardno}</div>
                                        </td>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 老人姓名：
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <div id="elderName">${elderlyGovBuyFw.elderName}</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 所属区域：
                                        </td>
                                        <td class="app_list_search_td" >
                                            <div id="areaNameDiv">${elderlyGovBuyFw.areaName}</div>
                                        </td>
                                        <td class="app_list_search_caption">
                                            <input type="hidden" value="${elderlyGovBuyFw.serviceOrgId}" id="serviceOrgId">
                                            <font color="red">*</font> 服务组织：
                                        </td>
                                        <td class="app_list_search_td" >
                                            <div id="serviceNameDiv">${elderlyGovBuyFw.serviceOrgName}</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            联系电话：
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="homeTel">${elderlyGovBuyFw.phone}</div>
                                        </td>
                                        <td class="app_list_search_caption">
                                            移动电话：
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="mobile">${elderlyGovBuyFw.mobile}</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            人员类别
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="elderType" class="form-control" name="elderType" disabled="disabled">
                                                <option value='0'>-未知-</option>
                                                <option value='1' <c:if test="${elderlyGovBuyFw.elderType==1}">selected</c:if>> 分散供养特困人员</option>
                                                <option value='2' <c:if test="${elderlyGovBuyFw.elderType==2}">selected</c:if>>低保老人</option>
                                                <option value='3' <c:if test="${elderlyGovBuyFw.elderType==3}">selected</c:if>>建档立卡贫困老人</option>
                                                <option value='4' <c:if test="${elderlyGovBuyFw.elderType==4}">selected</c:if>>重点优抚对象</option>
                                                <option value='5' <c:if test="${elderlyGovBuyFw.elderType==5}">selected</c:if>>重度残疾人</option>
                                                <option value='6' <c:if test="${elderlyGovBuyFw.elderType==6}">selected</c:if>>计划生育特殊困难</option>
                                            </select>
                                        </td>
                                        <td class="app_list_search_caption">
                                            补贴金额
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="srvsubsidy" class="form-control" disabled="disabled">
                                                <option value='0'>请选择</option>
                                                <option value='1' <c:if test="${elderlyGovBuyFw.subsidy==1}">selected</c:if>>每月50元</option>
                                                <option value='2' <c:if test="${elderlyGovBuyFw.subsidy==2}">selected</c:if>>每月100元</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            服务项目：
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="checkbox" name="serviceItems" value="1"/>助餐
                                            <input type="checkbox" name="serviceItems" value="2"/>助洁
                                            <input type="checkbox" name="serviceItems" value="3"/>助医
                                            <input type="checkbox" name="serviceItems" value="4"/>助急
                                            <input type="checkbox" name="serviceItems" value="5"/>助浴
                                            <input type="checkbox" name="serviceItems" value="6"/>助行
                                            <input type="checkbox" name="serviceItems" value="7"/>其他
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            居住地址：
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <div id="address">${elderlyGovBuyFw.realAddress}</div>
                                        </td>
                                    </tr>

                                </table>
                                <div class="modal-footer">
                                        <%--<button id="update" type="button" class="btn blue update">修改</button>
                                        <button id="save" type="button" style="display: none" class="btn blue ">保存</button>--%>
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

