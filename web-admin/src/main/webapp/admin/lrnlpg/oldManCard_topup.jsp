<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>
           助老卡充值
        </title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
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
                              助老卡充值
                            </span>
                        </div>
                    </div>
                        <form id="moneyflow-form" name="moneyflow-form">
                            <div class="tab-content">
                                    <table class="table table-bordered table-hover table-condensed table-responsive">
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                流水号
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input class="form-control" name="serverNum" value="${m.serverNum}"
                                                       style="width: 100%"  readonly >
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                卡号
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input class="form-control" name="cardId" placeholder="请输入卡号"
                                                       style="width: 100%"  >
                                            </td>
                                            <td style="width:20%;" class="app_list_search_td">
                                                 <button type="button" class="btn blue search" onclick="InstitutionList.validateIdCard();">查询</button>
                                                 <input class="form-control" id="statusVal" placeholder="状态"
                                                       style="width: 100%;display: none"  >
                                            </td>

                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                               状态
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;"  id="status">

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                余额
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input class="form-control form-readonly"  id="money" placeholder="0"
                                                       style="width: 100%;font-size: 18px;color: darkgoldenrod"   readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                充值服务机构
                                            </td>
                                            <%--<td style="width:20%;text-align:center;vertical-align:middle;">--%>
                                                    <%--<input class="form-control form-readonly" name="area" placeholder="请输入充值服务机构"--%>
                                                           <%--style="width: 100%" >--%>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                            <c:if test="${user.serviceOrgId == null or user.serviceOrgId == ''}">
                                                <input type="hidden" name="serviceOrgId" class="form-control">
                                                <input type="text" class="form-control " id="serviceOrgName"
                                                       value=""
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
                                            <%--</td>--%>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                组织余额
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input class="form-control form-readonly"  id="serviceMoney" placeholder="0"
                                                       style="width: 100%;font-size: 18px;color: darkgoldenrod"   readonly value="0">


                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                老人姓名
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input class="form-control form-readonly"  id="elderName" placeholder="老人姓名"
                                                       style="width: 100%"  readonly>
                                                <input class="form-control" name="oldmanId" id="oldmanId"
                                                       style="display: none" >
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                充值金额
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input class="form-control form-readonly" name="amount" id="amount" placeholder="充值金额"
                                                       style="width: 100%"  >
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <!--ONE TAB BODY END-->
                        </form>
                </div>
                <button data-loading-text="提交中..."
                        type="button" class="btn btn-circle green"
                        onclick="InstitutionList.addorupdate()">
                    保存
                </button>
                <span id="labelmsg" class="label"></span>
            </div>
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
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/capacity/moneyflow_list.js?v=1.5"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js?v=1.2"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                // AreaTree.init();
                var retile='${retile}';
                if(retile=='true'){
                    $('.form-readonly').attr("readonly","readonly");
                }


                getServiceMoneyByserviceOrgId($('input[name=serviceOrgId]').val());



            });

            function getServiceMoneyByserviceOrgId(serviceOrgId) {
                $.post(window.apppath + "/admin/api/power/oldmancard/getServiceMoneyByserviceOrgId", {
                    serviceOrgId: serviceOrgId
                }, function (res) {
                    console.log(res);
                    if (res != null) {
                        $("#serviceMoney").val(res.data.serviceMoney);
                    }
                }, 'json')
            }




        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

