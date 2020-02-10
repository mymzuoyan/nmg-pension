<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>
            绑卡详情
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
                              绑卡详情
                            </span>
                        </div>
                    </div>

                        <form id="serviceOrg-form" name="serviceOrg-form">
                            <div class="tab-content">
                                <!--ONE TAB BODY START-->
                                    <table class="table table-bordered table-hover table-condensed table-responsive">
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                卡号
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                ${oldManCard.cardId}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                身份证号
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                ${oldManCard.idNumber}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                所属服务机构
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                               ${oldManCard.area}

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                老人姓名
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                    ${oldManCard.oldManName}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                               绑卡时间
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                    ${oldManCard.createDate}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                               退卡时间
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                ${oldManCard.removeDate}
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                        </form>
                </div>
            </div>
        </div>
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
                                onclick="ServiceOrgDetail.getAreaName()">
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
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/service_org_detail.js?v=1.5"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/lrnlpg/old_man_power_card.js?v=1.5"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js?v=1.2"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    </tiles:putAttribute>
</tiles:insertDefinition>

