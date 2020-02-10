<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>
            文娱活动信息详情
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
                              文娱活动信息详情
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
                                        组织名称
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="activityName"
                                               class="form-control" value="${m.organizationName}" disabled/>
                                    </td>

                                    <td width="10%"
                                        style="text-align:center;vertical-align:middle;">
                                        活动名称
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="activityName"
                                               class="form-control" value="${m.activityName}" disabled/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10%"
                                        style="text-align:center;vertical-align:middle;">
                                        参与人数
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="participantsNumber"
                                               class="form-control" value="${m.participantsNumber}" disabled/>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        活动内容
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input name="activityContent" type="text"  value="${m.activityContent}" class="form-control" disabled/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10%"
                                        style="text-align:center;vertical-align:middle;">
                                        组织者
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="organizer"
                                               class="form-control" value="${m.organizer}" disabled/>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        活动地址
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input name="activityContent" type="text"  value="${m.address}" class="form-control" disabled/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10%"
                                        style="text-align:center;vertical-align:middle;">
                                        活动时长
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="duration"
                                               class="form-control" value="${m.duration}" disabled/>
                                    </td>
                                    <td width="10%"
                                        style="text-align:center;vertical-align:middle;">
                                        活动时间
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="activityTime"
                                               class="form-control" value="${m.activityTime}" disabled/>
                                    </td>
                                </tr>
                            </table>

                        </div>
                        <div class="form-actions">
                                <div class="col-md-offset-6">
                                    <button onclick="window.parent.closeTab('tab_happy_detail')"
                                            class="btn btn-circle green"><i
                                            class="fa">返回</i>
                                    </button>
                                </div>
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

