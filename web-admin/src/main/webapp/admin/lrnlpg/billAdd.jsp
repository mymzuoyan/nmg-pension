<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>消费订单新增</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" Stype="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <style>
            datatable-row-openclose {
                background: url("${pageContext.request.contextPath }/assets/global/img/datatable-row-openclose.png") no-repeat 0 0px;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">

        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <div class="portlet " id="elderInfo_add">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">消费订单新增</span>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div name="addElderForm" id="addElderForm" method="post" class="form-horizontal">
                            <div class="form-wizard">
                                <div class="form-body">
                                    <ul class="nav nav-pills nav-justified steps">
                                        <li>
                                            <a href="#tab1" data-toggle="tab" class="step">
												<span class="number">
												1 </span>
                                                <span class="desc">
												<i class="fa fa-check"></i> 基本信息</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#tab2" data-toggle="tab" class="step">
												<span class="number">
												2 </span>
                                                <span class="desc">
												<i class="fa fa-check"></i> 消费项目</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#tab3" data-toggle="tab" class="step">
												<span class="number">
												3 </span>
                                                <span class="desc">
												<i class="fa fa-check"></i> 订单总览</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <div id="bar" class="progress progress-striped" role="progressbar">
                                        <div class="progress-bar progress-bar-success">
                                        </div>
                                    </div>
                                    <div class="tab-content">
                                        <div class="alert alert-danger display-none">
                                            <button class="close" data-dismiss="alert"></button>
                                            有错误，请检查
                                        </div>
                                        <div class="alert alert-success display-none">
                                            <button class="close" data-dismiss="alert"></button>
                                            提交成功
                                        </div>
                                        <div class="tab-pane" id="tab1">
                                            <table border="1"
                                                   class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                                   align="center" style="border-collapse: collapse;">
                                                <tr>
                                                    <td width="10%"
                                                        style="text-align:center;vertical-align:middle;">
                                                        流水号
                                                    </td>
                                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                                        <input type="text"  name="flowNumber"
                                                               class="form-control" value="${m.flowNumber}" readonly/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%"
                                                        style="text-align:center;vertical-align:middle;">
                                                        卡号
                                                    </td>
                                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                                        <input type="text"  name="cardNumber"
                                                               class="form-control" value="${cardNumber}" onblur="BillAdd.findOldManCardId()"/>
                                                        <input type="text" style="display: none"  name="oldManCardId"
                                                               class="form-control" value="${oldManCardId}" />
                                                        <input type="text" style="display: none"  name="elderlyId"
                                                               class="form-control" value="${elderlyId}" />
                                                    </td>
                                                    <%--<td style="text-align:center;vertical-align:middle;">--%>
                                                        <%--<font color="red">*</font>消费所在组织--%>
                                                    <%--</td>--%>
                                                    <%--<td style="text-align:center;vertical-align:middle;">--%>
                                                        <%--<input name="orgName" type="text" class="form-control" onblur="BillAdd.validateOrgName()"/>--%>
                                                        <%--<input type="text" style="display: none"  name="orgId"--%>
                                                               <%--class="form-control" value="${orgId}" />--%>
                                                    <%--</td>--%>
                                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                                        所属服务机构
                                                    </td>

                                                    <td style="width:20%;text-align:center;vertical-align:middle;">
                                                        <c:if test="${user.serviceOrgId == null or user.serviceOrgId == ''}">
                                                            <input type="hidden" name="orgId" class="form-control" value="${bill.orgId}">
                                                            <input type="text" class="form-control " id="serviceOrgName"
                                                                   value="${bill.orgName}"
                                                                   name="orgName" readonly>
                                                        </c:if>
                                                        <c:if test="${user.serviceOrgId != null and user.serviceOrgId != ''}">
                                                            <input type="hidden" name="orgId" class="form-control"
                                                                   value="${user.serviceOrgId}">
                                                            <input type="text" class="form-control " id="serviceOrgName"
                                                                   name="orgName"
                                                                   value="${user.serviceOrgName}" readonly>
                                                        </c:if>
                                                    </td>

                                                    <%--<c:if test="${ empty sessionScope.login_name.serviceId}">--%>
                                                        <%--<td class="app_list_search_td" >--%>
                                                            <%--<input type="hidden" value="serviceOrg+${bill.orgId}" id="serviceOrgId" name="orgId">--%>
                                                            <%--<input type="text" class="form-control" id="serviceOrgName"--%>
                                                                   <%--name="orgName" value="${bill.orgName}" readonly--%>
                                                            <%--/>--%>
                                                        <%--</td>--%>
                                                        <%--<td class="app_list_search_td">--%>
                                                            <%--<button type="button" class="btn blue select">选择组织</button>--%>
                                                        <%--</td>--%>
                                                    <%--</c:if>--%>
                                                    <%--<c:if test="${ not empty sessionScope.login_name.serviceId}">--%>
                                                        <%--<td class="app_list_search_td" >--%>
                                                            <%--<input type="hidden" value="${sessionScope.login_name.serviceId}"--%>
                                                                   <%--id="serviceOrgId" name="orgId">--%>
                                                            <%--<input type="text" class="form-control" id="serviceOrgName"--%>
                                                                   <%--name="orgName"--%>
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
                                                    <td style="text-align:center;vertical-align:middle;">
                                                        老人姓名
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;">
                                                        <input name="elderlyName" type="text" class="form-control" readonly/>
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;">
                                                        卡内余额
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle;">
                                                        <input name="currentBalance" type="text" class="form-control" readonly/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="tab-pane" id="tab2">
                                            <input type="text" style="display: none"  name="orgId"
                                                   class="form-control" value="" />
                                            <div class="table-container">
                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <div id="tree-service-type">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div id="serviceProjectDiv" style="display: none;">
                                                            <div id="tree-service-project">

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div id="addPriceDiv" style="display: none">
                                                            <table class="table table-striped table-bordered table-cover"
                                                                   id="listTable">
                                                                <tr>
                                                                    <td colspan="4">
                                                                        服务项目
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        价格标准
                                                                    </td>
                                                                    <td>
                                                                        内容描述
                                                                    </td>
                                                                    <td>
                                                                        操作
                                                                    </td>
                                                                </tr>
                                                                <tbody id="listTableBody">

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div id="orderobjectDiv" style="display: none">
                                                            <table class="table table-striped table-bordered table-cover"
                                                                   id="listTabletrue">
                                                                <tr>
                                                                    <td colspan="4">
                                                                        消费项目
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        价格标准
                                                                    </td>
                                                                    <td>
                                                                        内容描述
                                                                    </td>
                                                                    <td style="width: 50px;">
                                                                        次数/小时
                                                                    </td>
                                                                </tr>
                                                                <tbody id="listTableBodyorder">

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="tab3">
                                            <div>
                                            <form id="submitForm" id="submitForm" method="post" class="form-horizontal">
                                                <table border="1"
                                                       class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                                       align="center" style="border-collapse: collapse;">
                                                    <tr>
                                                        <td width="10%"
                                                            style="text-align:center;vertical-align:middle;">
                                                            流水号
                                                        </td>
                                                        <td width="30%" style="text-align:center;vertical-align:middle;">
                                                            <input type="text"  name="flowNumber"
                                                                   class="form-control" value="" readonly/>
                                                        </td>
                                                        <td style="text-align:center;vertical-align:middle;">
                                                            <font color="red">*</font>消费所在组织
                                                        </td>
                                                        <td style="text-align:center;vertical-align:middle;">
                                                            <input name="orgName" type="text" class="form-control" readonly/>
                                                            <input type="text" style="display: none"  name="orgId"
                                                                   class="form-control" value="" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="10%"
                                                            style="text-align:center;vertical-align:middle;">
                                                            卡号
                                                        </td>
                                                        <td width="30%" style="text-align:center;vertical-align:middle;">
                                                            <input type="text"  name="cardNumber"
                                                                   class="form-control" value="${cardNumber}" style="width: 80%;"/>
                                                            <div  style="float: right;margin-top: -25px;background: url(${pageContext.request.contextPath }/assets/global/img/portlet-reload-icon.png) no-repeat;height: 20px;width: 20px;cursor: pointer" title="重新加载卡号"  onclick="BillAdd.reloadCardNumber()"></div>
                                                            <input type="text" style="display: none"  name="oldManCardId"
                                                                   class="form-control" value="${oldManCardId}" />
                                                            <input type="text" style="display: none"  name="elderlyId"
                                                                   class="form-control" value="${elderlyId}" />
                                                        </td>
                                                        <td style="text-align:center;vertical-align:middle;">
                                                            老人姓名
                                                        </td>
                                                        <td style="text-align:center;vertical-align:middle;">
                                                            <input name="elderlyName" type="text" class="form-control" readonly/>
                                                        </td>
                                                    </tr>
                                                    <tr>

                                                        <td style="text-align:center;vertical-align:middle;">
                                                            卡内余额
                                                        </td>
                                                        <td style="text-align:center;vertical-align:middle;">
                                                            <input name="currentBalance" type="text" class="form-control" readonly/>
                                                        </td>
                                                        <td style="text-align:center;vertical-align:middle;">
                                                            消费项目数量
                                                        </td>
                                                        <td style="text-align:center;vertical-align:middle;">
                                                            <input name="count" type="text" class="form-control" readonly/>
                                                        </td>
                                                    </tr>
                                                    <tr>

                                                        <td style="text-align:center;vertical-align:middle;">
                                                            消费总额
                                                        </td>
                                                        <td style="text-align:center;vertical-align:middle;">
                                                            <input name="price" type="text" class="form-control" readonly/>
                                                        </td>
                                                        <td style="text-align:center;vertical-align:middle;">
                                                            结算后余额
                                                        </td>
                                                        <td style="text-align:center;vertical-align:middle;">
                                                            <input name="ultimateBalance" type="text" class="form-control" readonly/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <table class="table table-striped table-bordered table-cover"
                                                               id="listTabletrue2">
                                                            <tr>
                                                                <td colspan="4">
                                                                    消费项目
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    价格
                                                                </td>
                                                                <td>
                                                                    项目名称
                                                                </td>
                                                                <td style="width: 50px;">
                                                                    次数/小时
                                                                </td>
                                                                <td style="width: 50px;">
                                                                    总额
                                                                </td>
                                                            </tr>
                                                            <tbody id="listTableBodyorder2">

                                                            </tbody>
                                                        </table>
                                                    </tr>

                                                </table>
                                            </form></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-5 col-md-9">
                                        <a href="javascript:" class="btn default button-previous">
                                            <i class="m-icon-swapleft"></i> 返回 </a>
                                        <a href="javascript:" class="btn blue button-next">
                                            下一步 <i class="m-icon-swapright m-icon-white"></i>
                                        </a>
                                        <a href="javascript:" class="btn green button-submit">
                                            结算 <i class="m-icon-swapright m-icon-white"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END CHANGE AVATAR TAB -->
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

        <!-- END CONTENT -->
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript" charset="utf-8"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <!--timer-->
        <script type="text/javascript" charset="utf-8"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" charset="utf-8"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/lrnlpg/bill_add.js?v=1.4"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js"
                type="text/javascript"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                BillAdd.init();

                $("#addElderForm .select").click(function () {
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
