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
        <title>新增出院人员</title>
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
                    <a href="#">新增出院人员</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            添加人员信息
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
                                            <button type="button" class="btn blue search">查询</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red"></font> 姓名
                                        </td>
                                        <td class="app_list_search_td" >
                                            <input type="hidden" value="" id="id">
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
                                            <font color="red">*</font>出院时间
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="checkOutTime" name="checkOutTime" value=""
                                                   class="form-control date-picker" data-date-format="yyyy-mm-dd"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            出院状态
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="status" class="form-control"
                                                    name="status">
                                                <option value="">--全部--</option>
                                                <option value="0">删除</option>
                                                <option value="1">登记中</option>
                                                <option value="2">待缴费</option>
                                                <option value="3">已住院</option>
                                                <option value="4">外出</option>
                                                <option value="4">待结算</option>
                                                <option value="6">已退住</option>
                                            </select>
                                        </td>
                                        <td class="app_list_search_caption">
                                            失能状况
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="disableStutiation" class="form-control"
                                                    name="disableStutiation">
                                                <option value="">--全部--</option>
                                                <option value="0">失能</option>
                                                <option value="1">半失能</option>
                                                <option value="2">健全</option>
                                            </select>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <div class="modal-footer">
                                <button type="button" class="btn blue addGovBuy">保存</button>
                               <%-- <button onclick="javascript:history.back(-1)" type="button" class="btn btn-default">返回
                                </button>--%>
                                <button onclick="javascript:window.parent.closeTab('institution_elderly_add2')" type="button" class="btn btn-default">返回
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
                    }else{
                        $("#elderName").html(null);
                        $("#age").html(null);
                        $("#sexDictId").html(null);
                        alert("该身份证没有查询该老人");
                    }
                }, 'json');
            }
            function addGovbuy() {
                var cotime = $("input[name=checkOutTime]").val();
                $("#addGovBuy .search").click();
                if(cotime==null || cotime==''){
                    alert("请输入出院时间");
                    return false;
                }
                $.post(window.apppath + "/admin/api/institution/elderly/add2", {
                    idcardno:$("input[name=idcardno]").val(),
                    id:$("input[name=id]").val(),
                    checkOutTime: $("input[name=checkOutTime]").val(),
                    status: $("select[name=status]").val(),
                    disableStutiation: $("select[name=disableStutiation]").val()
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
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

