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
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>商品列表</title>
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
                    <a href="#">商城管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">商品列表</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <!-- Begin: life time stats -->
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption">
                            商品列表
                        </div>
                        <div class="tools">
                            <a href="" class="collapse" style="">
                            </a>
                        </div>
                    </div>
                    <div id="searchDiv" class="portlet-body form" style="">
                        <form id="serviceOrg-form" name="serviceOrg-form">
                          <table class="table table-bordered table-hover table-condensed table-responsive">
                            <tr>
                                <td width="13%" style="text-align:center;vertical-align:middle;">商品名称：</td>
                                <td width="20%" style="text-align:center;vertical-align:middle;" colspan="3">
                                    <input name="name" class="form-control" type="text"/>
                                </td>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    商品类型：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <select name="moduleId" class="form-control" id="typeId">
                                        <option Value="">--请选择--</option>
                                        <c:if test="${!empty types}">
                                            <c:forEach var="goodsType" items="${types}">
                                                <option Value="${goodsType.id}">${goodsType.name}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </td>
                            </tr>
                         </table>
                        </form>
                        <div style="text-align: right">
                            <a id="search" class="btn btn-circle  green">
                                查询 </i>
                            </a>
                            <a class="reload table-group-action-reload btn btn-circle btn-black"><i
                                    class="fa">重置</i></a>
                        </div>
                    </div>
                </div>
                <div class="portlet">
                    <div class="portlet-body">
                        <div class="table-container">
                            <table class="table table-striped table-bordered table-hover" id="datatable_goods_list">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="25%">
                                        商品名称
                                    </th>
                                    <th width="15%">
                                        类型
                                    </th>
                                    <th width="10%">
                                        库存
                                    </th>
                                    <th width="15%">
                                        更新时间
                                    </th>
                                    <th width="20%">
                                        操作
                                    </th>
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
                                            href="" id="goPage" class="btn btn-sm default "
                                            onclick="GoodsList.goToPage()" title="GO">GO
                                    </button>
                                </div>
                            </div>
                            <shiro:hasPermission name="elderServiceWebsite-storeManager-list-delete">
                                <input type="hidden" name="delete"
                                       value="1">
                            </shiro:hasPermission>
                            <shiro:hasPermission name="elderServiceWebsite-storeManager-list-list">
                                <input type="hidden" id="elderServiceStoreListList"
                                       value="1">
                            </shiro:hasPermission>
                            <input type="hidden" name="putTop"
                                   value="<shiro:hasPermission name="goods-putTop">1</shiro:hasPermission>">
                        </div>
                    </div>
                </div>
            </div>
            <!-- End: life time stats -->
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
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/portal/goods_list.js?v=1.2"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                GoodsList.init();
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

