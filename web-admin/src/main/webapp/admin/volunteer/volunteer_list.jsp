<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>公益志愿者组织</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
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
                    <a href="#">服务资源管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">公益志愿者组织</a>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <div class="portlet " style="padding-top: 0px !important;padding-bottom: 0px !important;">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">志愿者列表</span>
                        </div>
                        <div class="tools">
                            <div style="float: left">
                            <a class="table-group-action-add btn btn-circle btn-add"><i class="fa">新增</i></a>
                            </div>
                            <a href="" class="collapse"></a>
                        </div>
                    </div>
                    <div class="portlet-body" style="padding-top: 0px !important;">
                        <form id="volunteer-form" name="volunteer-form">
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td colspan="7" class="tr-title">
                                        <span class="caption-helper">基本信息</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        所属区域
                                    </td>
                                    <td style="width:20%;text-align:center;vertical-align:middle;">
                                        <input class="form-control" type="text" id="areaName" name="areaName"
                                               data-toggle="modal"
                                               data-target="#areaModal" placeholder="请选择所属区域"
                                        <c:if test="${empty areaName}">
                                               value="${sessionScope.login_user.areaName}"
                                        </c:if>
                                               onclick="showModel();" style="width: 100%">
                                    </td>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        姓名
                                    </td>
                                    <td style="width:20%;text-align:center;vertical-align:middle;">
                                        <input type="text" id="volunteerName" name="volunteerName"
                                               class="form-control" style="width: 100%"/>
                                    </td>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        身份证
                                    </td>
                                    <td style="width:30%;text-align:center;vertical-align:middle;">
                                        <input type="text" id="idcardno" name="idcardno"
                                               class="form-control" style="width: 100%"/>
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <div class="right" style="text-align: right">
                            <a class="table-group-action-submit btn btn-circle btn-import"><i class="fa">查询</i></a>
                            <a class="reload table-group-action-reload btn btn-circle btn-black"><i
                                    class="fa">重置</i></a>
                        </div>
                    </div>

                    <div class="table-container">
                        <table class="table table-striped table-bordered table-hover"
                               id="datatable_volunteer_List">
                            <thead>
                            <tr role="row" class="heading">
                                <th width="1%">
                                    <input type="checkbox" class="group-checkable">
                                </th>
                                <th width="10%">
                                    所属区域
                                </th>
                                <th width="10%">
                                    姓名
                                </th>
                                <th width="4%">
                                    性别
                                </th>
                                <th width="15%">
                                    身份证号
                                </th>
                                <th width="14%">
                                    手机
                                </th>
                                <th width="4%">
                                    积分
                                </th>
                                <th width="10%">
                                    时间
                                </th>
                                <th width="22%">
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
                                        onclick="VolunteerList.goToPage()" title="GO">GO
                                </button>
                            </div>
                        </div>

                        <shior:hasPermission name="timeBank-volunteerList-delete">
                            <input type="hidden" id="timeBankDel" value="1"/>
                            <div class=" right" style="text-align: right" id="volunteer-delete">
                                <span></span>
                                <button id="btnDeleteVolunteer" class="btn btn-circle red"><i class="fa fa-times">
                                    删除</i>
                                </button>
                            </div>
                        </shior:hasPermission>
                        <shior:hasPermission name="timeBank-volunteerList-list">
                            <input type="hidden" id="timeBankList" value="1"/>
                        </shior:hasPermission>
                        <shior:hasPermission name="timeBank-volunteerList-update">
                            <input type="hidden" id="timeBankUpdate" value="1"/>
                        </shior:hasPermission>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!-- END PAGE CONTENT-->

        <!-- 导入模态框（Modal） -->
        <div class="modal fade" id="areaModal" tabindex="-1"
             role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal"
                                aria-hidden="true"></button>
                        <h4 class="modal-title"
                            id="myModalLabel">请选择所属区域</h4>
                    </div>
                    <div class="modal-body">
                        <div id="areaTree"
                             class="tree-demo"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn blue"
                                onclick="VolunteerList.getAreaName()">
                            确定
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
        <!-- /.modal -->
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
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/volunteer/volunteer_list.js?v=1.5"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                AreaTree.init();
                VolunteerList.init();

            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

