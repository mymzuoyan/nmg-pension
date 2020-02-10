<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>入职补贴查询</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <style>
            #selectIcon img {
                width: 30px;
                height: 30px;
                margin: 2.5px;
                padding: 2.5px;
            }

            #selectIcon img:hover {
                background-color: #ccc;
                cursor: pointer;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">

        <!-- BEGIN PAGE HEADER-->
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">入职补贴审批</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">资格补贴查询列表</a>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <!-- Begin: life time stats -->
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption">
                            资格补贴查询列表
                        </div>
                    </div>
                    <div id="searchDiv" class="portlet-body form" style="">
                        <table class="table table-bordered table-hover table-condensed table-responsive">
                            <tr>
                                <td style="vertical-align: middle">
                                    所在区域
                                </td>
                                <td>
                                    <select name="areaName" id="areaName"
                                            class="form-control">
                                        <option value="">--请选择--</option>
                                    </select>
                                </td>
                                <td style="vertical-align: middle">
                                    审批状态
                                </td>
                                <td style="text-align:center;vertical-align:middle;">
                                    <select name="verityStatus" id="verityStatus" class="form-control">
                                        <option value="">--全部--</option>
                                        <option value="0">未审核</option>
                                        <option value="1">审核通过</option>
                                        <option value="2">审核未通过</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <div style="text-align: right">
                            <a id="refresh" class="btn btn-circle  green">
                                <i> 刷新 </i>
                            </a>
                            <a id="search" class="btn btn-circle  green">
                                <i> 查询 </i>
                            </a>
                            <a id="reload" class="reload table-group-action-reload btn btn-circle btn-black"><i
                                    class="fa">重置</i></a>
                        </div>
                    </div>
                </div>
                <div class="portlet">
                    <div class="portlet-body">
                        <div class="table-container">
                            <table class="table table-striped table-bordered table-hover"
                                   id="entrySubsidytable">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="5%">
                                        <input type="checkbox" class="group-checkable">
                                    </th>
                                    <th width="20%">
                                        区域
                                    </th>
                                    <th width="20%">
                                        机构名称
                                    </th>
                                    <th width="25%">
                                        申请时间
                                    </th>
                                    <th width="10%">
                                        申请状态
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
                                            onclick="QualificationList.goToPage()" title="GO">GO
                                    </button>
                                </div>
                            </div>
                            <div class="right" style="text-align: right;display: block;">
                                <button id="deleteSomeMsg" class="btn btn-circle red"
                                        data-loading-text="删除中..."><i class="fa fa-times"> 批量删除</i>
                                </button>
                            </div>
                        </div>
                        <shior:hasPermission name="qual_subsidy_list_verity">
                            <input type="hidden" id="verity" value="${flag}">
                        </shior:hasPermission>
                    </div>
                </div>
            </div>
            <!-- End: life time stats -->
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
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/qual_subsidy_list.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js?v=1.2"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                AreaTree.init();
                QualificationList.init();
                loadArea();
            });
            //动态加载区域下拉列表
            function loadArea() {
                $.post(window.apppath + "/admin/api/qualification/area", {
                }, function (res) {
                    if (res.success) {
                        var selectList = document.getElementById("areaName");
                        var result = eval(res.data);
                        if(result.length > 0){
                            for( var i = 0;i<result.length;i++){
                                if(result[i].level == 2){
                                    selectList.options.add(new Option(result[i].name,result[i].id));
                                }
                            }
                        }
                    }
                    else {
                        alert(res.message);
                    }
                }, 'json');
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

