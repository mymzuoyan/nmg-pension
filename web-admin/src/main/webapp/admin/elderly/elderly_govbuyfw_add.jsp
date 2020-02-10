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
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>添加政府购买老人</title>
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
                    <a href="#">老人信息管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">添加政府购买老人</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            <span class="caption-subject font-red-sunglo bold uppercase">添加政府购买老人</span>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <form class="form-body" id="addGovBuy">
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 养老组织
                                        </td>
                                        <c:if test="${ empty sessionScope.login_name.serviceId}">
                                            <td class="app_list_search_td" colspan="2">
                                                <input type="hidden" value="" id="serviceOrgId">
                                                <input type="text" class="form-control" id="serviceOrgName" disabled placeholder="请点击选择组织"
                                                       name="serviceOrgName" value=""
                                                />
                                            </td>
                                            <td class="app_list_search_td">
                                                <button type="button" class="btn blue select">选择组织</button>
                                            </td>
                                        </c:if>
                                        <c:if test="${ not empty sessionScope.login_name.serviceId}">
                                            <td class="app_list_search_td" colspan="2">
                                                <input type="hidden" value="${sessionScope.login_name.serviceId}"
                                                       id="serviceOrgId">
                                                <input type="text" class="form-control" id="serviceOrgName" disabled placeholder="请点击选择组织"
                                                       name="serviceOrgName"
                                                       value="${sessionScope.login_name.serviceOrgName}"
                                                />
                                            </td>
                                            <td class="app_list_search_td">
                                                <button type="button" class="btn blue select">选择组织</button>
                                            </td>
                                        </c:if>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 身份证号
                                        </td>
                                        <td class="app_list_search_td" colspan="2">
                                            <input type="hidden" value="" id="elderId">
                                            <input type="text" class="form-control" id="elderNo" name="idcardno" value=""
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_td">
                                            <button type="button" class="btn blue search">查询</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 所属区域
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <div id="areaNameDiv"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 老人姓名
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <div id="elderName" name="elderName"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            联系电话
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="homeTel"></div>
                                        </td>
                                        <td class="app_list_search_caption">
                                            移动电话
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="mobile"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            居住地址
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <div id="address"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            人员类别
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="elderType" class="form-control" name="elderType" <%--onchange="onselcallertype()"--%>>
                                                <option value='0'>-待定-</option>
                                                <option value='1'>分散供养特困人员</option>
                                                <option value='2'>低保老人</option>
                                                <option value='3'>建档立卡贫困老人</option>
                                                <option value='4'>重点优抚对象</option>
                                                <option value='5'>重度残疾人</option>
                                                <option value='6'>计划生育特殊困难</option>
                                            </select>
                                        </td>
                                        <td class="app_list_search_caption">
                                            补贴金额
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="srvsubsidy" class="form-control">
                                                <option value="">请选择</option>
                                                <option value='1'>每月50元</option>
                                                <option value='2'>每月100元</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            服务项目
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


                                </table>
                               <%-- <div>注：市民卡号为16位卡号，如果是12位卡号，请在原卡号前加4个0，如：0000997166140026</div>--%>
                            </form>
                            <div class="modal-footer">
                                <button type="button" class="btn blue addGovBuy">保存</button>
                                <button onclick="history.back(-1)" type="button" class="btn btn-default">返回
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" id="selectArea" tabindex="-1" role="basic" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">选择组织</h4>
                    </div>
                   <%-- <div class="modal-body">
                        <div id="areaTree" class="tree-demo"></div>
                    </div>--%>
                    <div class="modal-body" style="margin-left: 10px;">
                        搜索：<input style="background-color: #ffffff;width: 300px;height: 36px;" id="treeSearch" name="treeSearch" type="text" placeholder="请输入查询关键字"/><br /><br />
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
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                $("input[type=file]").change(function () {
                    var result = $(this).val();
                    if (result != null && result != "")
                        result = result.substr(result.lastIndexOf("\\") + 1, result.length - 1);
                    $("#file_path").html(result)
                });

                $("#addGovBuy .select").click(function () {
                    showModel("${zuzhiRoleId}");
                });

                $("#selectArea .add").click(function () {
                    var select = AreaTree.getSelectArea();
                    if (select != -1) {
                        $("#serviceOrgId").val(select);
                        $("#serviceOrgName").val(AreaTree.getSelectAreaName(select));

                        $("#selectArea").modal("hide");
                    }
                });


                $("#addGovBuy .search").click(function () {
                    var cardNo = $("#elderNo").val();
                    if (cardNo != null & cardNo != "") {
                        searchElder(cardNo);
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

            function searchElder(cardNo) {
                $.post(window.apppath + "/admin/api/elderly/getElderByCardNo", {
                    cardNo: cardNo
                }, function (res) {
                    console.log(res);
                    if(res==null){
                        alert("无法查询到该老人");
                    }
                    if (res != null) {
                        $("#elderId").val(res.id);
                        $("#areaNameDiv").html(res.areaName);
                        $("#elderName").html(res.elderName);
                        $("#homeTel").html(res.homeTel);
                        $("#mobile").html(res.mobile);
                        $("#address").html(res.realAddress);
                    }
                }, 'json');
            }
            function addGovbuy() {
                var cardNo = $("#elderNo").val();
                var serviceOrgId=$("#serviceOrgId").val();
                if (serviceOrgId== null || serviceOrgId == "") {
                    alert("请先选择组织");
                    return false;
                }
                if (cardNo != null & cardNo != "") {
                    if ($("#elderId").val() == null || $("#elderId").val() == "") {
                        alert("请先通过身份证号码查询老人");
                        return false;
                    }

                    addGovInfo();
                }
                else
                    alert("请输入身份证号码");

                function addGovInfo() {
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
                    $.post(window.apppath + "/admin/api/elderly/govbuyfw/add", {
                        elderId: $("#elderId").val(),
                        serviceOrgId:serviceOrgId,
                        subsidy: $("#srvsubsidy").val(),
                        elderType: $("#elderType").val(),
                        idcardno: $("#elderNo").val(),
                        serviceItems:serviceItems,

                        status:1
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
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

