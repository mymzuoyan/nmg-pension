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
        <title>服务项目价格体系</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/view/css/alertStyle.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/themes/default/style.min.css"/>
        <style>
            table tr td {
                text-align: center;
                vertical-align: middle;
            }

        </style>
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
                    <a href="#">养老服务组织</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">服务项目价格体系</a>
                </li>
            </ul>
        </div>
        <div class="row" style="height: 100% !important;">
            <div class="col-md-12" style="height: 100% !important;">
                <div class="portlet " style="height: 90% !important;">
                    <div class="portlet-title">
                        <div class="caption tabbable-line" style="padding: 0px">
                            <ul class="nav nav-tabs">
                                <li>
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/serviceOrgDetail/${id}'"
                                       data-toggle="tab" aria-expanded="false">养老组织信息</a>
                                </li>
                                <li>
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/serviceOrg/putOnRecord/${id}'"
                                       data-toggle="tab" aria-expanded="true">建档内容</a>
                                </li>
                                <li>
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/serviceOrgDetailMap/${id}'"
                                       data-toggle="tab" aria-expanded="true">养老组织定位
                                    </a>
                                </li>
                                <li class="active">
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/serviceOrg/price/${id}'"
                                       data-toggle="tab" aria-expanded="true">服务项目价格体系
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="portlet-body" style="height: 100% !important;overflow: auto">
                        <div class="table-container">
                            <div class="row">
                                <div class="col-md-4">
                                    <div id="tree-service-type">

                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div id="serviceProjectDiv" style="display: none;">
                                        <div style="text-align: right">
                                            <button type="button" class="btn green btn-sm " data-loading-text="保存中..."
                                                    onclick="ServiceOrgPrice.showAddServiceProjectModal()">
                                                申请服务内容
                                            </button>
                                        </div>
                                        <div id="tree-service-project">

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div id="addPriceDiv" style="display: none">
                                        <form>
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
                                            <div>
                                                <button type="button" class="btn blue" data-loading-text="保存中..."
                                                        onclick="ServiceOrgPrice.showAddModal()">
                                                    增加
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 导入模态框（Modal） -->
        <div class="modal fade" id="addModal" tabindex="-1"
             role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal"
                                aria-hidden="true"></button>
                        <h4 class="modal-title"
                            id="addModalLabel">设置价格体系</h4>
                    </div>
                    <div class="modal-body">
                        <form id="addPriceForm">
                            <input id="serviceOrgId" name="serviceOrgId" value="${id}" type="hidden">
                            <table class="table table-striped table-bordered table-cover" id="addPriceTable">
                                <tr>
                                    <td width="15%">
                                        价格标准:
                                    </td>
                                    <td width="35%">
                                        <input name="price" type="text" class="form-control"
                                               value="" placeholder="例:10" style="width: 90%;float: left"><span style="float: left;margin-top: 10px">元</span>
                                    </td>
                                    <td width="15%">
                                        内容描述:
                                    </td>
                                    <td width="35%">
                                        <input name="moreInfo" type="text" class="form-control"
                                               value="">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn blue" data-loading-text="保存中..."
                                onclick="ServiceOrgPrice.addPrice()">
                            保存
                        </button>
                        <span id="labelmsg" class="label"></span>

                        <button type="button"
                                class="btn default"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->

        <!-- 导入模态框（Modal） -->
        <div class="modal fade" id="updateModal" tabindex="-1"
             role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal"
                                aria-hidden="true"></button>
                        <h4 class="modal-title"
                            id="updateModalLabel">更新价格体系</h4>
                    </div>
                    <div class="modal-body">
                        <form id="updatePriceForm">
                            <input id="id" name="id" value="" type="hidden">
                            <table class="table table-striped table-bordered table-cover" id="updatePriceTable">
                                <tr>
                                    <td width="15%">
                                        价格标准:
                                    </td>
                                    <td width="35%">
                                        <input name="price" type="text" class="form-control"
                                               value="" placeholder="例:10" style="width: 90%;float: left"><span style="float: left;margin-top: 10px">元</span>
                                    </td>
                                    <td width="15%">
                                        内容描述:
                                    </td>
                                    <td width="35%">
                                        <input name="moreInfo" type="text" class="form-control"
                                               value="">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn blue" data-loading-text="保存中..."
                                onclick="ServiceOrgPrice.updatePrice()">
                            保存
                        </button>
                        <span id="labelmsg" class="label"></span>

                        <button type="button"
                                class="btn default"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->

        <!-- 导入模态框（Modal） -->
        <div class="modal fade" id="addServiceProjectModal" tabindex="-1"
             role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal"
                                aria-hidden="true"></button>
                        <h4 class="modal-title">
                            申请服务内容</h4>
                    </div>
                    <div class="modal-body form-horizontal from">
                        <form id="addServiceProjectForm">
                            <div class="form-group">
                                <label class="col-md-2 control-label">项目类型
                                    <span class="required">	* </span>
                                </label>
                                <div class="col-md-10">
                                    <input name="serviceType" type="text"
                                           class="form-control input-xlarge"
                                           value="" readonly>
                                    <input name="serviceTypeId"  type="hidden"
                                           class="form-control input-xlarge"
                                           value="" readonly>
                                </div>
                            </div>
                            <div class="form-body">
                                <div class="form-group">
                                    <input name="projectId" type="hidden"
                                           value="">
                                    <label class="col-md-2 control-label">项目名称
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <input name="serviceName" type="text"
                                               class="form-control input-xlarge"
                                               value="">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">结算类型
                                    <span class="required">	* </span>
                                </label>
                                <div class="col-md-10">
                                    <select name="serviceUnit"
                                            class="form-control input-xlarge"
                                            value="">
                                        <option value="元/次">
                                            元/次
                                        </option>
                                        <option value="元/小时">
                                            元/小时
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn blue" data-loading-text="保存中..."
                                onclick="ServiceOrgPrice.addServiceProject()">
                            保存
                        </button>
                        <button type="button"
                                class="btn default"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>


    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/jstree.min.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/serviceOrg_price.js?v=3.6"></script>
        <script>
            jQuery(document).ready(function () {
                window.apppath = "${pageContext.request.contextPath }";
                Metronic.init();
                Layout.init();
                ServiceOrgPrice.init("${id}");
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

