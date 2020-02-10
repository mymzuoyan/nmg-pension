<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>候鸟式养老</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.css"/>
        <style>
            #datatable_care_List tr td{
                text-align: center;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">
        <!-- BEGIN CONTENT -->
                <!-- BEGIN PAGE HEADER-->
                <div class="page-bar">
                    <ul class="page-breadcrumb">
                        <li>
                            <i class="fa fa-home"></i>
                            <a href="#">当前位置</a>
                            <i class="fa fa-angle-right"></i>
                        </li>
                        <li>
                            <a href="#">服务资源管理</a>
                            <i class="fa fa-angle-right"></i>
                        </li>
                        <li>
                            <a href="#">候鸟式养老</a>
                        </li>
                    </ul>
                </div>
                <!-- END PAGE HEADER-->
                <!-- BEGIN PAGE CONTENT-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="portlet light">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa fa-list"></i>候鸟式养老机构列表
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-container">
                                    <table class="table table-striped table-bordered table-hover"
                                           id="datatable_care_List">
                                        <thead>
                                        <tr role="row" class="heading">
                                            <th width="1%">
                                                <input type="checkbox" class="group-checkable">
                                            </th>
                                            <th>
                                                所在城市
                                            </th>
                                            <th>
                                                机构名称
                                            </th>
                                            <th>
                                                联系人
                                            </th>
                                            <th>
                                                联系方式
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>
                                                <input type="checkbox" class="group-checkable">
                                            </td>
                                            <td>
                                                南京
                                            </td>
                                            <td>
                                                南京爱德仁谷颐养院
                                            </td>
                                            <td>
                                                王娜
                                            </td>
                                            <td>
                                                025-86407566
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="checkbox" class="group-checkable">
                                            </td>
                                            <td>
                                                青岛
                                            </td>
                                            <td>
                                                青岛疗养院
                                            </td>
                                            <td>
                                                于善良
                                            </td>
                                            <td>
                                                (0532)83871359
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="checkbox" class="group-checkable">
                                            </td>
                                            <td>
                                                上海
                                            </td>
                                            <td>
                                                上海康桥亲和源
                                            </td>
                                            <td>
                                                郑晓
                                            </td>
                                            <td>
                                                021-58133980
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="checkbox" class="group-checkable">
                                            </td>
                                            <td>
                                                江西
                                            </td>
                                            <td>
                                                江西颐天年养老基地
                                            </td>
                                            <td>
                                                耿进
                                            </td>
                                            <td>
                                                0791-57133980
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="checkbox" class="group-checkable">
                                            </td>
                                            <td>
                                                天津
                                            </td>
                                            <td>
                                                天津雲杉镇
                                            </td>
                                            <td>
                                                霍克亮
                                            </td>
                                            <td>
                                                18920218882
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="checkbox" class="group-checkable">
                                            </td>
                                            <td>
                                                延庆
                                            </td>
                                            <td>
                                                天开瑞祥养生养老院
                                            </td>
                                            <td>
                                                尤利军
                                            </td>
                                            <td>
                                                010-61169797
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="checkbox" class="group-checkable">
                                            </td>
                                            <td>
                                                成都
                                            </td>
                                            <td>
                                                青城山快乐谷养生基地
                                            </td>
                                            <td>
                                                李侩
                                            </td>
                                            <td>
                                                028-87239395
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="checkbox" class="group-checkable">
                                            </td>
                                            <td>
                                                新疆
                                            </td>
                                            <td>
                                                新疆大漠老年公寓
                                            </td>
                                            <td>
                                                王振声
                                            </td>
                                            <td>
                                                0991-6291330
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END PAGE CONTENT-->

        <!-- END CONTENT -->
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
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

