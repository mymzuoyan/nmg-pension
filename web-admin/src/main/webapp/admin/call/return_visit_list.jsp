<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>回访列表</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"
              rel="stylesheet" type="text/css">
        <style>
            #imgShow {
                width: 100%;
                height: 100%;
            }
            table . icon-call-out{
                text-decoration: none;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">
        <!-- BEGIN PAGE BREADCRUMB -->
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">日常回访</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">回访列表</a>
                </li>
            </ul>
        </div>
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
        <div class="col-md-12">
            <div class="portlet ">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-gift"></i>回访列表
                    </div>
                    <div class="tools">
                        <a href="" class="expand" style="" aria-describedby="hidden">
                        </a>
                    </div>
                </div>
                <div id="searchDiv" class="portlet-body form" style="display: none">
                    <table class="table table-bordered table-hover table-condensed table-responsive">
                        <tr>
                            <td width="13%" style="text-align:center;vertical-align:middle;">组织名称：</td>
                            <td width="20%" style="text-align:center;vertical-align:middle;">
                                <input name="institutionName" class="form-control"
                                       type="text"/>
                            </td>
                        </tr>
                    </table>
                    <div style="text-align: right">
                        <a id="search" class="btn btn-circle  green">
                            查询 </i>
                        </a>
                    </div>
                </div>
                <div class="portlet-body">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#tab_1" data-toggle="tab">
                                AA以下服务组织 </a>
                        </li>
                        <li>
                            <a href="#tab_2" data-toggle="tab">
                                AAA服务组织 </a>
                        </li>
                        <li>
                            <a href="#tab_3" data-toggle="tab">
                                AAAA服务组织 </a>
                        </li>
                        <li>
                            <a href="#tab_4" data-toggle="tab">
                                AAAAA服务组织  </a>
                        </li>
                        <li>
                            <a href="#tab_5" data-toggle="tab">
                                政府购买老人 </a>
                        </li>
                        <li>
                            <a href="#tab_6" data-toggle="tab">
                                呼叫器用户 </a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade active in" id="tab_1">
                            <table class="table table-striped table-bordered table-hover"
                                   id="datatable_serviceOrg_2a_List">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="1%">
                                        <input type="checkbox" class="group-checkable">
                                    </th>
                                    <th width="10%">
                                        所属区域
                                    </th>
                                    <th width="20%" >
                                        组织名称
                                    </th>
                                    <th width="10%" >
                                        组织类型
                                    </th>
                                    <th width="10%">
                                        联系人
                                    </th>
                                    <th width="20%">
                                        联系电话
                                    </th>
                                    <th width="10%">
                                        回访状态
                                    </th>
                                    <th width="10%">
                                        回访结果
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="tab_2">
                            <table class="table table-striped table-bordered table-hover"
                                   id="datatable_serviceOrg_3a_List">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="1%">
                                        <input type="checkbox" class="group-checkable">
                                    </th>
                                    <th width="10%">
                                        所属区域
                                    </th>
                                    <th width="20%" >
                                        组织名称
                                    </th>
                                    <th width="10%" >
                                        组织类型
                                    </th>
                                    <th width="10%">
                                        联系人
                                    </th>
                                    <th width="20%">
                                        联系电话
                                    </th>
                                    <th width="10%">
                                        回访状态
                                    </th>
                                    <th width="10%">
                                        回访结果
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="tab_3">
                            <table class="table table-striped table-bordered table-hover"
                                   id="datatable_serviceOrg_4a_List">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="1%">
                                        <input type="checkbox" class="group-checkable">
                                    </th>
                                    <th width="10%">
                                        所属区域
                                    </th>
                                    <th width="20%" >
                                        组织名称
                                    </th>
                                    <th width="10%" >
                                        组织类型
                                    </th>
                                    <th width="10%">
                                        联系人
                                    </th>
                                    <th width="20%">
                                        联系电话
                                    </th>
                                    <th width="10%">
                                        回访状态
                                    </th>
                                    <th width="10%">
                                        回访结果
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="tab_4">
                            <table class="table table-striped table-bordered table-hover"
                                   id="datatable_serviceOrg_5a_List">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="1%">
                                        <input type="checkbox" class="group-checkable">
                                    </th>
                                    <th width="10%">
                                        所属区域
                                    </th>
                                    <th width="20%" >
                                        组织名称
                                    </th>
                                    <th width="10%" >
                                        组织类型
                                    </th>
                                    <th width="10%">
                                        联系人
                                    </th>
                                    <th width="20%">
                                        联系电话
                                    </th>
                                    <th width="10%">
                                        回访状态
                                    </th>
                                    <th width="10%">
                                        回访结果
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="tab_5">
                            <table class="table table-striped table-bordered table-hover"
                                   id="datatable_elder_List">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="1%">
                                        <input type="checkbox" class="group-checkable">
                                    </th>
                                    <th width="10%">
                                        所属区域
                                    </th>
                                    <th width="20%" >
                                        老人姓名
                                    </th>
                                    <th width="10%" >
                                        年龄
                                    </th>
                                    <th width="10%">
                                        性别
                                    </th>
                                    <th width="20%">
                                        联系电话
                                    </th>
                                    <th width="10%">
                                        回访状态
                                    </th>
                                    <th width="10%">
                                        回访结果
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="tab_6">
                            <table class="table table-striped table-bordered table-hover"
                                   id="datatable_customer_List">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="1%">
                                        <input type="checkbox" class="group-checkable">
                                    </th>
                                    <th width="10%">
                                        所属区域
                                    </th>
                                    <th width="20%">
                                        呼叫号码
                                    </th>
                                    <th width="20%" >
                                        老人姓名
                                    </th>
                                    <th width="10%" >
                                        年龄
                                    </th>
                                    <th width="10%">
                                        性别
                                    </th>
                                    <th width="10%">
                                        回访状态
                                    </th>
                                    <th width="10%">
                                        回访结果
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="confirm" class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">确认框</h4>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="phone">
                        <input type="hidden" name="visitor">
                        <input type="hidden" name="type">
                        <p>
                            确认回拨号码：<span class="callNum"></span>吗？
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button class="btn default" data-dismiss="modal" aria-hidden="true">取消</button>
                        <button data-dismiss="modal" class="btn blue callback">确定</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- END PAGE CONTENT-->
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/call/return_visit_list.js?v=1.1"
                type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                //初始化
                Metronic.init();
                Layout.init();
                ReturnVisitList.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
