<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>
            老人绑卡
        </title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <style>

            .file-box {
                position: relative;
                width: 80px;
                height: 80px;
                border: 1px solid #D9D9D9;
                background-image: url("${pageContext.request.contextPath }/assets/admin/pages/img/add.png");
            }
            .file-box input {
                position: absolute;
                z-index: 1;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                opacity: 0;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <div class="portlet " style="padding-top: 0px !important;padding-bottom: 0px !important;">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">
                              老人绑卡
                            </span>
                        </div>
                    </div>
                        <form id="serviceOrg-form" name="serviceOrg-form">
                            <div class="tab-content">
                                    <table class="table table-bordered table-hover table-condensed table-responsive">
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                卡号
                                            </td>
                                            <td style="width:50%;text-align:center;vertical-align:middle;">
                                                <input class="form-control" name="cardId" placeholder="请输入卡号"
                                                       style="width: 100%"  value="${oldManCard.cardId}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                身份证号
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input class="form-control form-readonly" name="idNumber" placeholder="请输入身份证号"
                                                       style="width: 100%" value="${oldManCard.idNumber}" >
                                            </td>
                                            <td class="app_list_search_td" style="width: 100px">
                                                <button type="button" class="btn blue search">查    询</button>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                所属服务机构
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <c:if test="${user.serviceOrgId == null or user.serviceOrgId == ''}">
                                                    <input type="hidden" name="serviceOrgId" class="form-control" value="${oldManCard.serviceOrgId}">
                                                    <input type="text" class="form-control " id="serviceOrgName"
                                                           value="${oldManCard.serviceOrgName}"
                                                           name="serviceOrgName" readonly>
                                                </c:if>
                                                <c:if test="${user.serviceOrgId != null and user.serviceOrgId != ''}">
                                                    <input type="hidden" name="serviceOrgId" class="form-control"
                                                           value="${user.serviceOrgId}">
                                                    <input type="text" class="form-control " id="serviceOrgName"
                                                           name="serviceOrgName"
                                                           value="${user.serviceOrgName}" readonly>
                                                </c:if>
                                            </td>

                                            <%--<c:if test="${ empty sessionScope.login_name.serviceId}">--%>
                                                <%--<td class="app_list_search_td" >--%>
                                                    <%--<input type="hidden" value="serviceOrg+${oldManCard.serviceOrgId}" id="serviceOrgId" name="serviceOrgId">--%>
                                                    <%--<input type="text" class="form-control" id="serviceOrgName"--%>
                                                           <%--name="serviceOrgName" value="${oldManCard.serviceOrgName}" readonly--%>
                                                    <%--/>--%>
                                                <%--</td>--%>
                                                <%--<td class="app_list_search_td">--%>
                                                    <%--<button type="button" class="btn blue select">选择组织</button>--%>
                                                <%--</td>--%>
                                            <%--</c:if>--%>
                                            <%--<c:if test="${ not empty sessionScope.login_name.serviceId}">--%>
                                                <%--<td class="app_list_search_td" >--%>
                                                    <%--<input type="hidden" value="${sessionScope.login_name.serviceId}"--%>
                                                           <%--id="serviceOrgId" name="serviceOrgId">--%>
                                                    <%--<input type="text" class="form-control" id="serviceOrgName"--%>
                                                           <%--name="serviceOrgName"--%>
                                                           <%--value="${sessionScope.login_name.serviceOrgName}"--%>
                                                           <%--readonly--%>
                                                    <%--/>--%>
                                                <%--</td>--%>
                                                <%--<td class="app_list_search_td">--%>
                                                    <%--<button type="button" class="btn blue select">选择组织</button>--%>
                                                <%--</td>--%>
                                            <%--</c:if>--%>

                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                老人姓名
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input class="form-control form-readonly" name="oldManName" id="oldManName" placeholder="老人姓名"
                                                       style="width: 100%" value="${oldManCard.oldManName}" readonly>
                                                <input class="form-control" name="oldManId" id="oldManId"
                                                       style="display: none" value="${oldManCard.oldManId}">
                                                <input class="form-control" name="status" id="status"
                                                       style="display: none" value="${oldManCard.status}">
                                                <input class="form-control" name="id" id="id"
                                                       style="display: none" value="${oldManCard.id}">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <!--ONE TAB BODY END-->
                        </form>
                </div>
                <button data-loading-text="提交中..."
                        type="button" class="btn btn-circle green"
                        onclick="OldManCard.addorupdate()">
                    保存
                </button>
                <span id="labelmsg" class="label"></span>
            </div>
        </div>

        <div class="modal" id="selectArea" tabindex="-1" role="basic" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">选择组织</h4>
                    </div>
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
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <%--<script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/service_org_detail.js?v=1.5"--%>
                <%--type="text/javascript"></script>--%>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/lrnlpg/old_man_power_card.js?v=1.5"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js?v=1.2"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                AreaTree.init();
                var retile='${retile}';
                if(retile=='true'){
                    $('.form-readonly').attr("readonly","readonly");
                }

                $("#serviceOrg-form .select").click(function () {
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


                $("#serviceOrg-form .search").click(function () {
                    var cardNo = $("input[name=idNumber]").val();
                    if (cardNo != null & cardNo != "") {
                        OldManCard.validateIdCard();
                    }
                    else{
                        alert("请输入身份证号码");
                    }
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
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

