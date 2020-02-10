<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>
            旅居老人需求发放
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
                              旅居老人需求发放详情
                            </span>
                        </div>
                        <div class="tools">
                            <shiro:hasPermission name="needs-update">
                                <div style="float: right;margin-right: 15px;margin-top: 5px;margin-bottom: 5px;">
                                    <div style="width:80px;float:left;display: block;padding-right: 10px;">
                                        <a class="btn btn-circle green"
                                           onclick="ElderlyNeedsDistributionDetail.allowEdit()"><i
                                                class="fa">修改</i></a>
                                    </div>
                                </div>
                            </shiro:hasPermission>
                        </div>
                    </div>

                    <form id="serviceOrg-form" name="serviceOrg-form">
                        <div class="tab-content">

                            <!--ONE TAB BODY START-->
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td width="10%"
                                        style="text-align:center;vertical-align:middle;">
                                        标题
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="title"
                                               class="form-control" value="${m.title}" disabled/>
                                        <input type="hidden" name="id"
                                               class="form-control" value="${m.id}" disabled/>
                                        <input type="hidden" name="status"
                                               class="form-control" value="${m.status}" disabled/>
                                    </td>
                                    <td width="10%"
                                        style="text-align:center;vertical-align:middle;">
                                        需求内容
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="context"
                                               class="form-control" value="${m.context}" disabled/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10%"
                                        style="text-align:center;vertical-align:middle;">
                                        组织名称
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="serviceOrgName"
                                               class="form-control" value="${m.serviceOrgName}" readonly disabled/>
                                    </td>
                                    <td width="10%"
                                        style="text-align:center;vertical-align:middle;">
                                        发布人
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="publisher"
                                               class="form-control" value="${m.publisher}" disabled/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10%"
                                        style="text-align:center;vertical-align:middle;">
                                        发布时间
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="releaseTime"
                                               class="form-control date-picker" data-date-format="yyyy-mm-dd" value="${m.releaseTime}" disabled/>
                                    </td>
                                </tr>
                                    </table>
                            <div class="form-actions">
                                <div class="row">
                                    <shiro:hasPermission name="needs-update">
                                        <div class="col-md-offset-5 " style="float:left;">
                                            <button data-loading-text="提交中..."
                                                    type="button" class="btn btn-circle green"
                                                    onclick="ElderlyNeedsDistributionDetail.submitEdit()"
                                                    name="editVolunteer">
                                                提交
                                            </button>
                                            <span id="labelmsg1" class="label"></span>
                                        </div>
                                    </shiro:hasPermission>
                                    <div class="col-md-offset-7">
                                        <button onclick="window.parent.closeTab('tab_bill_info')"
                                                class="btn btn-circle green"><i
                                                class="fa">返回</i>
                                        </button>
                                    </div>
                                </div>
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
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/lrnlpg/elderlyNeedsDistribution_detail.js?v=2.6"
                type="text/javascript"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                ElderlyNeedsDistributionDetail.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });

            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

