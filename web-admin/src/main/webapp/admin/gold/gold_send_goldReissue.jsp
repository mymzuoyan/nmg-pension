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
        <title>高龄补贴补发</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
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
                    <a href="#">高龄补贴发放管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">高龄补贴补发</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            高龄补贴补发
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <form class="form-body" id="addGovBuy">
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 身份证号
                                        </td>
                                        <td class="app_list_search_td" colspan="2">
                                            <input type="hidden" value="" id="elderId">
                                            <input type="text" class="form-control" id="idcardno" name="idcardno" value=""
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_td">
                                            <shiro:hasPermission name="elder-glod-manager-system-reisueeMoney-list">
                                            <button type="button" class="btn blue search">查询</button>
                                            </shiro:hasPermission>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red"> </font> 姓名
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="elderName" name="elderName"></div>
                                        </td>
                                        <td class="app_list_search_caption">
                                            老人银行卡号
                                        </td>
                                        <td class="app_list_search_td">
                                            <%--<input type="text" id="bankCardno" name="bankCardno" value=""
                                                   class="form-control"/>--%>
                                                <div id="bankCardno" name="bankCardno"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            开户银行
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="fafangWay" name="fafangWay"></div>
                                        </td>
                                        </td>

                                        <td class="app_list_search_caption">
                                            开始时间
                                        </td>
                                        <td class="app_list_search_td">
                                            <input id="startTimeString" name="startTimeString"
                                                   class="form-control date-picker" data-date-format="yyyy-mm"
                                                   onchange="getMonth()"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            结束时间
                                        </td>
                                        <td class="app_list_search_td">
                                            <input id="endTimeString" name="endTimeString"
                                                   class="form-control date-picker" data-date-format="yyyy-mm"
                                                   disabled onchange="getMonth()"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            申请类别
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="applyType" name="applyType"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            标准(元)
                                        </td>
                                        <td class="app_list_search_td">
                                            <%--<input type="text" id="moneyStandard" name="moneyStandard" value=""
                                                   class="form-control"/>--%>
                                                <div id="moneyStandard" name="moneyStandard"></div>
                                        </td>
                                        <td class="app_list_search_caption">
                                            金额(元)
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="bufaMoney" name="bufaMoney" value=""
                                                   class="form-control" <%--onchange="getTotalMoney()"--%>/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            月数
                                        </td>
                                        <td class="app_list_search_td">
                                            <%--<div id="monthCount" name="monthCount"></div>--%>
                                            <%--<input type="text" id="monthCount" name="monthCount" value=""
                                                    class="form-control" />--%>
                                            <input type="text" value="" name="monthCount" id="monthCount" class="form-control"
                                                   readonly>
                                        </td>
                                        <td class="app_list_search_caption">
                                            补发总金额
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="totalMoney" name="totalMoney" value="" class="form-control"
                                                   readonly onclick="getTotalMoney()"/>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <div class="modal-footer" >
                                <shoir:hasAnyRoles name="suadmin,readmin,muadmin">
                                <button type="button" class="btn blue addGovBuy">补发</button>
                                </shoir:hasAnyRoles>
                                <%--<button onclick="javascript:history.back(-1)" type="button" class="btn btn-default">返回--%>
                                <%--</button>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" id="selectArea" tabindex="-1" role="basic" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <div id="areaTree" class="tree-demo"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn blue add">添加</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
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

            function showModel(roleId) {
                AreaTree.setSelectServiceOrg(true);
                if (AreaTree.isInit()) {
                    AreaTree.refresh(roleId);
                }
                else {
                    AreaTree.init(roleId);
                }
                $("#selectArea").modal("show");
            }

            /*function  searchElder2(idcardno){
                $.post(window.apppath  + "/admin/api/gold/forGoldInfo/getElderByCardNoForGold", {
                    idcardno: idcardno
                },function(res){
                    console.log(res);
                    if (res!=null){
                        alert("身份证已登记");
                    }else{
                        searchElder(idcardno);
                    }
                }, 'json');
            }*/
            function searchElder(idcardno) {
                $.post(window.apppath + "/admin/api/gold/goldSend/getElderByCardNoForGoldSend", {
                    idcardno: idcardno
                }, function (res) {
                    console.log(res);
                    if (res != null) {
                        $("#elderName").html(res.elderlyMsg.elderName);
                        $("#bankCardno").html(res.bankCardno);
                        $("#moneyStandard").html(res.goldSendStandard.moneyStandard);
                        if (res.applyType != null & res.applyType != "") {
                            var data = res.applyType;
                            var  arr = {
                                "0": "80-89周岁", "1": "90-94周岁","2":"95-99周岁","3":"100周岁以上"
                            };

                            $("#applyType").html(arr[data]);
                        };
                        if (res.fafangWay != null & res.fafangWay != "") {
                            var data = res.fafangWay;
                            var  arr = {
                                "0": "市民卡", "1": "工商银行","2":"农业银行","3":"中国银行","4":"建设银行","5":"交通银行"
                                ,"6":"邮储银行","7":"农商银行","8":"其他","9":"南京银行","10":"紫金农商银行","11":"招商银行"
                                ,"12":"民生银行","13":"中信银行","14":"兴业银行","15":"浦发银行","16":"江苏银行","17":"广发银行"
                                ,"18":"平安银行","19":"华夏银行","20":"光大银行","21":"上海银行","22":"苏州银行","23":"江南农村商业银行"
                            };

                            $("#fafangWay").html(arr[data]);
                        };
                    }
                }, 'json');
            }
            function addGovbuy() {
                $.post(window.apppath + "/admin/api/gold/goldSend/goldReissue", {
                    idcardno: $("input[name=idcardno]").val(),
                    startTimeString: $("input[name=startTimeString]").val(),
                    endTimeString: $("input[name=endTimeString]").val(),
                    bufaMoney: $("input[name=bufaMoney]").val(),
                    totalMoney:$("input[name=totalMoney]").val(),
                    monthCount:$("input[name=monthCount]").val()
                }, function (res) {
                    if (res.success) {
                        alert(res.message);
                        window.location.reload();
                    }
                    else {
                        alert(res.message);
                    }
                }, 'json');
            }

            function getMonth(){
                var ks =document.getElementById("startTimeString");
                var et =document.getElementById("endTimeString");
                if(!/GMT/gi.test(new Date(ks.value))){
                    alert("请输入有效的日期！");
                    ks.focus();
                    et.disabled = true;
                    document.getElementById("monthCount").value = "";
                }else{
                    et.disabled = false;
                    if(et.value != ""){
                        if(!/GMT/gi.test(new Date(et.value))){
                            alert("请输入有效的日期！");
                            et.focus();
                        }else{
                            Date.prototype.a = function(date){
                                if(this.getYear()-date.getYear() ==0){
                                    return (this.getMonth() - date.getMonth());
                                }else if(this.getYear() -date.getYear()> 0){
                                    return (this.getMonth()+(this.getYear()-date.getYear())*12-date.getMonth());
                                }

                            };
                            document.getElementById("monthCount").value = new Date(et.value).a(new Date(ks.value));
                        }
                    }
                }
            }

            function getTotalMoney(){
                var bfm =document.getElementById("bufaMoney");
                var monthCou =document.getElementById("monthCount").value;
                    if (bfm.value != "" && monthCou != ""){
                        document.getElementById("totalMoney").value = monthCou *(bfm.value);
                    }else {
                        document.getElementById("totalMoney").value =0;
                    }
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

