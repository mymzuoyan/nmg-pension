<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>公益志愿者组织</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
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
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <c:choose>
                                <c:when test="${storeOrDraw=='store'}">
                                    <span class="caption-subject font-red-sunglo bold uppercase"> 志愿者存入列表</span>

                                </c:when>
                                <c:when test="${storeOrDraw=='draw'}">
                                    <span class="caption-subject font-red-sunglo bold uppercase"> 志愿者支取列表</span>

                                </c:when>
                            </c:choose>
                        </div>
                        <div class="tools">
                           <shiro:hasPermission name="timeBank-volunteerList-create">
                                <div style="float: left">
                                    <c:choose>
                                        <c:when test="${storeOrDraw=='store'}">
                                            <a data="${pageContext.request.contextPath}/admin/volStoreOrDrawAdd/${id}?storeOrDraw=store"
                                               class="btn btn-circle green table-group-action-add">新增</a>
                                        </c:when>
                                        <c:when test="${storeOrDraw=='draw'}">
                                            <a data="${pageContext.request.contextPath}/admin/volStoreOrDrawAdd/${id}?storeOrDraw=draw"
                                               class="btn btn-circle green table-group-action-add">新增</a>
                                        </c:when>
                                    </c:choose>
                                </div>
                           </shiro:hasPermission>
                            <a href="" class="collapse"></a>
                        </div>
                    </div>
                    <div class="portlet-body" style="padding-top: 0px !important;">
                        <form id="serviceOrg-providers-form" name="serviceOrg-providers-form">
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td colspan="4">
                                        <span class="caption-helper">基本信息</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        组织机构名称
                                    </td>
                                    <td style="width:20%;text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="organizationName" placeholder="请输入组织名称"
                                               style="width: 100%">
                                    </td>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        开始时间
                                    </td>
                                    <td style="width:20%">
                                        <input type="text" class=" date-picker form-control" placeholder="请选择日期"
                                               name="startTimeString"
                                               data-date-format="yyyy-mm-dd"
                                        >

                                    </td>
                                  <%--  <td style="width:10%">
                                        结束时间
                                    </td>
                                    <td style="width:40%">
                                        <input type="text" class=" date-picker  form-control"
                                               name="endTimeString"
                                               data-date-format="yyyy-mm-dd">
                                    </td>--%>
                                </tr>
                            </table>
                        </form>
                        <div class="right" style="text-align: right">
                            <c:choose>
                                <c:when test="${storeOrDraw=='store'}">
                                    <input type="hidden" name="serviceType" value="0">
                                    <input type="hidden" name="volunteerId" value="${id}">
                                    <button class="green table-group-action-submit btn btn-circle green"><i class="fa">查询</i>
                                    </button>
                                </c:when>
                                <c:when test="${storeOrDraw=='draw'}">
                                    <input type="hidden" name="serviceType" value="1">
                                    <input type="hidden" name="volunteerId" value="${id}">
                                    <button class="green table-group-action-submit btn btn-circle green"><i class="fa">查询</i>
                                    </button>
                                </c:when>
                            </c:choose>
                            <a class="btn btn-circle green " id="reset"><i class="fa">重置</i></a>
                        </div>
                    </div>

                    <div class="table-container">
                        <table class="table table-striped table-bordered table-hover"
                               id="datatable_volStoreOrDraw_List">
                            <thead>
                            <tr role="row" class="heading">
                                <th width="1%">
                                    <input type="checkbox" class="group-checkable">
                                </th>
                                <th width="20%">
                                    接收组织机构
                                </th>
                                <th width="20%">
                                    服务对象
                                </th>
                                <th width="19%">
                                    积分
                                </th>
                                <th width="20%">
                                    时间
                                </th>
                                <th width="20%">
                                    服务内容
                                </th>
                                <th width="20%">
                                    操作
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
        <!-- END PAGE CONTENT-->

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
        <!--timer-->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/volunteer/volStoreOrDraw_list.js?time=1"
                type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                VolStoreOrDrawList.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
                $(".table-group-action-add").click(function () {
                    var href = $(this).attr("data");
                    window.parent.addTab("tab-volStoreOrDraw-add", "新增", href);
                });
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

