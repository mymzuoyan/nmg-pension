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
        <title>老人列表修改</title>
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
                    <a href="#">机构养老信息管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">老人列表修改</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            老人列表修改
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
                                            <input type="text" class="form-control" id="idcardno" name="idcardno" value="${soe.elderlyMsg.idcardno}"
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_td">
                                            <button type="button" class="btn blue search">查询</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red"></font> 姓名
                                        </td>
                                        <td class="app_list_search_td" >
                                            <input type="hidden" value="${soe.id}" id="id">
                                            <div id="elderName" name="elderName"></div>
                                        </td>
                                        <td class="app_list_search_caption">
                                            性别
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="sexDictId"></div>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td class="app_list_search_caption">
                                            年龄
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="age"></div>
                                        </td>
                                        <td class="app_list_search_caption">
                                            出院时间
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="checkOutTime" name="checkOutTime" value="${soe.checkOutTime}"
                                                   class="form-control date-picker" data-date-format="yyyy-mm-dd"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            入院状态
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="status" class="form-control"
                                                    name="status" value="${soe.status}">
                                                <option value="">--全部--</option>
                                                <option value="0" <c:if test="${soe.status=='0'}">selected </c:if>>删除</option>
                                                <option value="1" <c:if test="${soe.status=='1'}">selected </c:if>>登记中</option>
                                                <option value="2" <c:if test="${soe.status=='2'}">selected </c:if>>待缴费</option>
                                                <option value="3" <c:if test="${soe.status=='3'}">selected </c:if>>已住院</option>
                                                <option value="4" <c:if test="${soe.status=='4'}">selected </c:if>>外出</option>
                                                <option value="4" <c:if test="${soe.status=='5'}">selected </c:if>>待结算</option>
                                                <option value="6" <c:if test="${soe.status=='6'}">selected </c:if>>已退住</option>
                                            </select>
                                        </td>
                                        <td class="app_list_search_caption">
                                            失能状况
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="disableStutiation" class="form-control"
                                                    name="disableStutiation" value="${soe.disableStutiation}">
                                                <option value="">--全部--</option>
                                                <option value="0" <c:if test="${soe.disableStutiation=='0'}">selected </c:if>>失能</option>
                                                <option value="1" <c:if test="${soe.disableStutiation=='1'}">selected </c:if>>半失能</option>
                                            </select>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <div class="modal-footer">
                                <button type="button" class="btn blue addGovBuy">修改</button>
                                <button onclick="javascript:history.back(-1)" type="button" class="btn btn-default">返回
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
                        <%--<div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h4 class="modal-title">选择组织</h4>
                        </div>--%>
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
                searchElder('${soe.elderlyMsg.idcardno}');
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
                    if (res!=null){
                        alert("身份证已登记");
                    }else{
                        searchElder(idcardno);
                    }
                 }, 'json');
            }*/
            function searchElder(idcardno) {
                $.post(window.apppath + "/admin/api/institution/getElderByCardNo", {
                    idcardno: idcardno
                }, function (res) {
                    console.log(res);
                    if (res != null) {
                        $("#elderId").val(res.id);
                        $("#elderName").html(res.elderName);
                        $("#age").html(res.age);
                        if (res.sexDictId != null & res.sexDictId != "") {
                            var data = res.sexDictId;
                            var  arr = {
                                "1": "男", "2": "女"
                            };

                            $("#sexDictId").html(arr[data]);
                        };
                    }
                }, 'json');
            }
            function addGovbuy() {
                $.post(window.apppath + "/admin/api/institution/elderly/update", {
                    id:$("#id").val(),
                    checkOutTime: $("input[name=checkOutTime]").val(),
                    status: $("select[name=status]").val(),
                    disableStutiation: $("select[name=disableStutiation]").val()
                }, function (res) {
                    console.log(res);
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

