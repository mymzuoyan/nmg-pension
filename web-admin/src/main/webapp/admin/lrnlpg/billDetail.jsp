<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>
            消费订单详情
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
                              消费订单详情
                            </span>
                        </div>
                    </div>

                    <form id="serviceOrg-form" name="serviceOrg-form">
                        <div class="tab-content">

                            <!--ONE TAB BODY START-->
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td width="10%"
                                        style="text-align:center;vertical-align:middle;">
                                        流水号
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="flowNumber"
                                               class="form-control" value="${m.flowNumber}" disabled/>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <font color="red">*</font>消费所在组织
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input name="orgName" type="text" class="form-control" value="${m.orgName}" readonly/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10%"
                                        style="text-align:center;vertical-align:middle;">
                                        卡号
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="cardNumber"
                                               class="form-control" value="${m.cardNumber}" disabled/>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        老人姓名
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input name="elderlyName" type="text"  value="${m.elderlyName}" class="form-control" disabled/>
                                    </td>
                                </tr>
                                <tr>

                                    <td style="text-align:center;vertical-align:middle;">
                                        卡内余额
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input name="currentBalance" type="text" value="${m.currentBalance}" class="form-control" disabled/>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        消费项目数量
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input name="count" type="text" class="form-control" value="${m.count}" disabled/>
                                    </td>
                                </tr>
                                <tr>

                                    <td style="text-align:center;vertical-align:middle;">
                                        消费总额
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input name="price" type="text" class="form-control" value="${m.price}" disabled/>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        结算后余额
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input name="ultimateBalance" type="text" class="form-control" value="${m.ultimateBalance}" disabled/>
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

                                            <td width="30%">
                                                项目名称
                                            </td>
                                            <td width="20%">
                                                价格标准
                                            </td>
                                            <td style="width: 50px;">
                                                次数/小时
                                            </td>
                                            <td style="width: 50px;">
                                                总额
                                            </td>
                                        </tr>
                                        <tbody id="listTableBodyorder2">
                                        <c:forEach items="${orders}" var="order">
                                            <tr>

                                                <td>
                                                        ${order.objectName}
                                                </td>
                                                <td>
                                                        ${order.unitPrice}
                                                </td>
                                                <td style="width: 50px;">
                                                        ${order.obcount}
                                                </td>
                                                <td style="width: 50px;">
                                                        ${order.obprice}
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </tr>
                            </table>
                        </div>
                    </form>
                </div>
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
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js?v=1.2"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    </tiles:putAttribute>
</tiles:insertDefinition>

