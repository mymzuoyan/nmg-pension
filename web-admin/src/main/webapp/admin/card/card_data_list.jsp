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
        <title>刷卡数据</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <style>
            #searchDiv table tr td {
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
                    <a href="#">刷卡系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">刷卡数据</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase"> 刷卡数据</span>
                        </div>
                        <div class="tools">
                            <a href="" class="collapse">
                            </a>
                        </div>
                    </div>
                    <div id="searchDiv" class="portlet-body form">
                        <table class="table table-bordered table-hover table-condensed table-responsive">
                            <tr>
                                <td>
                                    流水号
                                </td>
                                <td>
                                    <input class="form-control" name="accBookNo"/>
                                </td>
                                <td>
                                    卡号
                                </td>
                                <td>
                                    <input class="form-control" name="cardNo"/>
                                </td>
                                <td>
                                    组织名称
                                </td>
                                <td>
                                    <input class="form-control" name="serviceOrgName"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    老人姓名
                                </td>
                                <td>
                                    <input class="form-control" name="elderlyName"/>
                                </td>
                                <td>
                                    老人身份证
                                </td>
                                <td>
                                    <input class="form-control" name="idcardno"/>
                                </td>
                                <td>
                                    消费项目
                                </td>
                                <td>
                                    <select id="consumeSelect"
                                            class="table-group-action-input form-control">
                                        <option value="">所有</option>
                                        <option value="助餐">助餐</option>
                                        <option value="助浴">助浴</option>
                                        <option value="其他">其他</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <div style="text-align: right">
                            <a id="search" class="btn btn-circle  green">
                                查询 </i>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="table-container">
                    <table class="table table-striped table-bordered table-hover" id="datatable_card_data_list">
                        <thead>
                        <tr role="row" class="heading">
                            <th width="10%">
                                流水号
                            </th>
                            <th width="10%">
                                卡号
                            </th>
                            <th width="20%">
                                组织名称
                            </th>
                            <th width="10%">
                                老人姓名
                            </th>
                            <th width="10%">
                                消费项目
                            </th>
                            <th width="10%">
                                实际金额
                            </th>
                            <th width="10%">
                                优惠金额
                            </th>
                            <th width="20%">
                                消费时间
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
                                    href="" id="goPage" class="btn btn-sm default " onclick="CardDataList.goToPage()"
                                    title="GO">GO
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/card/card_data_list.js?v=1.2"></script>

        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                CardDataList.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

