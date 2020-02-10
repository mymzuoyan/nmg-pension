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
                                        <td class="app_list_search_td" colspan="2">
                                            <input type="hidden" value="${elderlyGovBuy.elderId}" id="elderId">
                                            <div>${elderlyGovBuy.idcardno}</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 所属区域：
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <div id="areaNameDiv">${elderlyGovBuy.areaName}</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 老人姓名：
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <div id="elderName">${elderlyGovBuy.elderName}</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            联系电话：
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="homeTel">${elderlyGovBuy.mobile}</div>
                                        </td>
                                        <td class="app_list_search_caption">
                                            移动电话：
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="mobile">${elderlyGovBuy.callerno}</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            居住地址：
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <div id="address">${elderlyGovBuy.realAddress}</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            人员类别：
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="elderType">${elderlyGovBuy.elderTypeDictIds}</div>
                                        </td>
                                        <td class="app_list_search_caption">
                                            子女状况：
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="hasChildren">${elderlyGovBuy.childrenDictId}</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            居住状况：
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="residence">${elderlyGovBuy.residenceDictId}</div>

                                        </td>
                                        <td class="app_list_search_caption">
                                            补贴金额：
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="subsidy" class="form-control" name="subsidy" value=" ${elderlyGovBuy.subsidy}"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            呼叫器类型：
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="callertype" class="form-control"
                                                    name="callertype" disabled="disabled">
                                                <option value="0" >--无--</option>
                                                <option value="1" <c:if test="${elderlyGovBuy.callertype==1}">selected</c:if>>固定</option>
                                                <option value="2" <c:if test="${elderlyGovBuy.callertype==2}">selected</c:if>>移动</option>
                                            </select>
                                        </td>
                                        <td class="app_list_search_caption">
                                            呼叫器厂商：
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="callerlabel" class="form-control" style='width:auto' disabled="disabled">
                                                <option value='0' >--无--</option>
                                                <option value='1'  <c:if test="${elderlyGovBuy.callerlabel==1}">selected</c:if>>12349</option>
                                                <option value='2'  <c:if test="${elderlyGovBuy.callerlabel==2}">selected</c:if>>安康通</option>
                                                <option value='3'  <c:if test="${elderlyGovBuy.callerlabel==3}">selected</c:if>>康惠通</option>
                                                <option value='4'  <c:if test="${elderlyGovBuy.callerlabel==4}">selected</c:if>>奥维</option>
                                                <option value='5'  <c:if test="${elderlyGovBuy.callerlabel==5}">selected</c:if>>96180</option>
                                                <option value='6'  <c:if test="${elderlyGovBuy.callerlabel==6}">selected</c:if>>平安保</option>
                                                <option value='7'  <c:if test="${elderlyGovBuy.callerlabel==7}">selected</c:if>>962069</option>
                                                <option value='8'  <c:if test="${elderlyGovBuy.callerlabel==8}">selected</c:if>>电信</option>
                                                <option value='9'  <c:if test="${elderlyGovBuy.callerlabel==9}">selected</c:if>>移动</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            呼叫器安装费：
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="callerinitfee" name="callerinitfee" value=" ${elderlyGovBuy.callerinitfee}" class="form-control"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            呼叫器月租费：
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="callermonthfee" name="callermonthfee" value=" ${elderlyGovBuy.callermonthfee}" class="form-control"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            呼叫器号码：
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="callerno" name="callerno" value=" ${elderlyGovBuy.callerno}" class="form-control"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            安装状态：
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="callerstatus" name="callerstatus"  class="form-control" disabled>
                                                <option value="0" <c:if test="${elderlyGovBuy.callerstatus==0}">selected</c:if>>未安装</option>
                                                <option value="1" <c:if test="${elderlyGovBuy.callerstatus==1}">selected</c:if>>已安装</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            呼叫器服务人员：
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="callerstaff" name="callerstaff" value=" ${elderlyGovBuy.callerstaff}" class="form-control"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            服务人员电话：
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="callerstafftel" name="callerstafftel" value=" ${elderlyGovBuy.callerstafftel}" class="form-control"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            市民卡号：
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="cardno" name="cardno" value=" ${elderlyGovBuy.cardno}" class="form-control"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            附件：
                                        </td>
                                        <td class="app_list_search_td">
                                            <img style="width: 200px"
                                                 src="${pageContext.request.contextPath }${elderlyGovBuy.attach}">
                                        </td>
                                    </tr>
                                </table>
                                <div class="modal-footer">
                                    <shiro:hasPermission name="elderGoveInfo-update">
                                        <button id="update" type="button" class="btn blue update">修改</button>
                                        <button id="save" type="button" style="display: none" class="btn blue ">保存</button>

                                    </shiro:hasPermission>
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
                var elderTypeDictIds = "${elderlyGovBuy.elderTypeDictIds}";
                if (elderTypeDictIds != null & elderTypeDictIds != "") {
                    var data = elderTypeDictIds;
                    var arr = {
                        "1": "城市特困/农村特困", "2": "低保/低保边缘", "3": "经济困难的失能/半失能老人", "4": "70周岁及以上的计生特扶老人",
                        "5": "百岁老人", "9": "空巢", "10": "独居"
                    };
                    var scopes = '';
                    if (data != "" && data != null) {
                        var scope = data.split(",");
                        for (var i = 0; i < scope.length; i++) {
                            if (arr[scope[i]] != "" && arr[scope[i]] != null) {
                                scopes += arr[scope[i]] + ','
                            }
                        }
                        scopes = scopes.substr(0, (scopes.length - 1));
                    }
                    $("#elderType").html(scopes);
                }
                var childrenDictId = "${elderlyGovBuy.childrenDictId}";

                if (childrenDictId != null & childrenDictId != "") {
                    var data = childrenDictId;
                    arr = {"270": "有子女", "271": "未生育子女", "272": "失去独生子女"};
                    $("#hasChildren").html(arr[data]);
                }
                var residenceDictId = "${elderlyGovBuy.residenceDictId}";
                if (residenceDictId != null & residenceDictId != "") {
                    var result = "";
                    if (residenceDictId == 280) {
                        result = "独居";
                    } else if (residenceDictId == 511) {
                        result = "空巢";
                    } else if (residenceDictId == 284) {
                        result = "合居";
                    } else {
                        result = "";
                    }
                    $("#residence").html(result);
                }
                Metronic.init();
                Layout.init();
                
                $("#update").click(function () {
                    $("input").removeAttr("disabled");
                    $("select").removeAttr("disabled");
                    $(this).hide();
                    $("#save").show();
                });

                $("#save").click(function () {
                    $.post(window.apppath + "/admin/api/elderMsg/govbuy/update", {
                        elderId: $("#elderId").val(),
                        subsidy: $("input[name=subsidy]").val(),
                        callertype: $("#callertype").val(),
                        callerlabel: $("#callerlabel").val(),
                        callerinitfee: $("input[name=callerinitfee]").val(),
                        callermonthfee: $("input[name=callermonthfee]").val(),
                        callerno: $("input[name=callerno]").val(),
                        callerstatus: $("#callerstatus").val(),
                        callerstaff: $("input[name=callerstaff]").val(),
                        callerstafftel: $("input[name=callerstafftel]").val(),
                        cardno: $("input[name=cardno]").val(),
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

