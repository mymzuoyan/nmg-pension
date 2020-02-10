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
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>老人基础信息</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
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
                    <a href="#">居家（社区）养老服务中心</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">老人基础信息</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet" style="padding-top: 0px !important;padding-bottom: 0px !important;">
                    <div class="portlet-body" style="padding-top: 0px !important;">
                        <form id="serviceOrg-form" name="serviceOrg-form">
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td colspan="8" onclick="UserLinkElder.showTbody1();" class="tr-title">
                                        <span class="caption-helper">老人基本信息</span>
                                    </td>
                                </tr>
                                <tbody id="tbody1" style="border-bottom:0px solid #eee;">
                                    <tr>
                                        <td width="10%" style="text-align:center;vertical-align:middle;">地址</td>
                                        <td width="15%" style="text-align:center;vertical-align:middle;">
                                            <input class="form-control" name="elderAddress" id="elderAddress" autocomplete="off"/>
                                        </td>

                                        <td width="10%" style="text-align:center;vertical-align:middle;">
                                            联系电话
                                        </td>
                                        <td width="15%" style="text-align:center;vertical-align:middle;">
                                            <input class="form-control" name="elderMobile" autocomplete="off"/>
                                        </td>

                                        <td width="10%" style="text-align:center;vertical-align:middle;">
                                            姓&nbsp;&nbsp;名
                                        </td>
                                        <td width="15%" style="text-align:center;vertical-align:middle;">
                                            <input class="form-control" name="elderName" autocomplete="off"/>
                                        </td>

                                        <td style="text-align:center;vertical-align:middle;">
                                            性&nbsp;&nbsp;别
                                        </td>
                                        <td style="text-align:center;vertical-align:middle;">
                                            <select name="elderSex"
                                                    class="table-group-action-input form-control input-inline input-small input-sm">
                                                <option value=''>-全部-</option>
                                                <option value='1'>男</option>
                                                <option value='2'>女</option>
                                            </select>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                        <div class="right" style="text-align: right">
                            <a class="table-group-action-submit btn btn-circle btn-import"><i class="fa">查询</i></a>
                            <a class="reload table-group-action-reload btn btn-circle btn-black"><i
                                    class="fa">重置</i></a>
                        </div>
                    </div>
                </div>
                <div class="portlet">
                    <div class="portlet-body">
                        <div class="table-container">
                            <table class="table table-striped table-bordered table-hover"
                                   id="datatable_user_link_elder_list">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="15%">
                                        姓名
                                    </th>
                                    <th width="10%">
                                        性别
                                    </th>
                                    <th width="10%">
                                        年龄
                                    </th>
                                    <th width="15%">
                                        地址
                                    </th>
                                    <th width="10%">
                                        身份证
                                    </th>
                                    <th width="10%">
                                        电话号码
                                    </th>
                                    <th width="10%">
                                        组织名称
                                    </th>
                                    <%--<th width="30%">--%>
                                        <%--操作--%>
                                    <%--</th>--%>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                            <div class="table-actions-check-wrapper">
                                <div class="pagination-panel"> 页数 <input type="text" id="page"
                                                                         class="pagination-panel-input form-control input-mini input-inline input-sm"
                                                                         maxlenght="5"
                                                                         style="text-align:center; margin: 0 5px;">
                                    <button
                                            href="" id="goPage" class="btn btn-sm default " onclick="UserLinkElder.goToPage()"
                                            title="GO">GO
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End: life time stats -->
            </div>
        </div>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/task/user_link_elder_list.js?v=1.1"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                UserLinkElder.init();
                $(".table-group-action-reload").click(function () {
                    $("#serviceOrg-form").find("input:text").val("");//找到form表单下的所有input标签并清空
                    $("#serviceOrg-form").find("input:hidden").val("");//找到form表单下的所有input标签并清空
                    $("#serviceOrg-form").find("select").val("");//找到form表单下的所有select标签并清空
                    $("#serviceOrg-form").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
                });

            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

