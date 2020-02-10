<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>养老机构</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jquery-multi-select/css/multi-select.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
        <style>

            .remove {
                color: red;
                font-size: 17px;
                cursor: pointer;
                text-decoration: none;
            }

            .removeImg {
                z-index: 2;
                width: 10px;
                height: 10px;
                position: absolute;
                right: 0px;
                background-image: url("${pageContext.request.contextPath }/assets/global/img/delete.png");
                background-position: 50% 50%;
            }

            .file-box {
                position: relative;
                width: 80px;
                height: 80px;
                border: 1px solid #D9D9D9;
                background-image: url("${pageContext.request.contextPath }/assets/admin/pages/img/add.png");
            }

            .file-div {
                width: 80px;
                height: 80px;
                margin-right: 10px;
                display: inline-block;
                position: relative;
                vertical-align: text-bottom;
            }

            .file-div img {
                width: 100%;
                height: 100%;
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

            .file-box-list {
                vertical-align: top;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">

        <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
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
        <div class="row">
        <div class="col-md-12">
            <!-- Begin: life time stats -->
            <div class="portlet " style="padding-top: 0px !important;">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-equalizer font-purple-plum hide"></i>
                        <span class="caption-subject font-red-sunglo bold uppercase">养老机构新增</span>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="tabbable-line">
                        <form id="serviceOrgAddForm">
                            <table border="1"
                                   class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                   align="center" style="border-collapse: collapse;">
                                <input type="hidden" id="province" value="0">
                                <input type="hidden" id="type" value="2">
                                <tr>
                                    <td style="text-align: center;vertical-align: middle;width: 20%">
                                        城市 <span style="color:red"> *</span>
                                    </td>
                                    <td style="text-align: center;vertical-align: middle;width: 80%">
                                        <select name="city" class="form-control" id="city"
                                                onChange="EographicArea.changeCity();"
                                                readonly="readonly">
                                            <option value="">直辖市，地级市</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;vertical-align: middle">
                                        行政区<span style="color:red"> *</span>
                                    </td>
                                    <td style="text-align: center;vertical-align: middle">
                                        <select name="area" class="form-control" id="county"
                                                onChange="EographicArea.changeCounty();"
                                                readonly="readonly">
                                            <option value="">行政区，市，县</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;vertical-align: middle">街道</td>
                                    <td style="text-align: center;vertical-align: middle">
                                        <select name="street" class="form-control" id="town"
                                                onChange="EographicArea.changeTown();"
                                                readonly="readonly">
                                            <option value="">街道，乡，镇</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;vertical-align: middle">
                                        单位名称<span style="color:red"> *</span>
                                    </td>
                                    <td style="text-align: center;vertical-align: middle">
                                        <input type="text" class="form-control"
                                               name="institutionName" id="institutionName"
                                               onblur="ServiceOrgDetail.judgeInstitutionName('institutionName','same')"/>
                                    </td>
                                </tr>
                                <tr style="display: none">
                                    <td style="text-align: center;vertical-align: middle">
                                        组织类型<span style="color:red"> *</span>
                                    </td>
                                    <td style="text-align: left;vertical-align: middle">
                                        <div class="td2 checkbox-list">
                                            <input type="hidden" id="institutionTypeDictId"
                                                   value="${m.institutionTypeDictId}">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;vertical-align: middle">
                                        验证材料
                                    </td>
                                    <td>
                                        <div class="file-box-list attachInput"
                                             style="display: inline-block;margin: 0px"></div>
                                        <div style="display: inline-block" class="file-box">
                                            <input type="file" name="files" id="attachInput"
                                                   onchange="UploadImage('institution/attach','attachInput','attach')"
                                                   style="opacity: 0;">
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <div class="form-actions">
                                <div class="col-md-12">
                                    <div class="col-md-offset-4" style="float:left;">
                                        <button data-loading-text="提交中..."
                                                type="button" class="btn btn-circle green"
                                                onclick="ServiceOrgDetail.submitAdd()">
                                            保存
                                        </button>
                                        <span id="labelmsg" class="label"></span>
                                    </div>
                                    <div class="col-md-offset-6">
                                        <button onclick="window.parent.closeTab('tab_institution_add')"
                                                class="btn btn-circle green"><i
                                                class="fa">返回</i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <!--fileUpload-->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
        <!--upload-->
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/uploadPreview.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/service_org_detail.js?v=1.6"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js?v=1"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js?v=1.2"></script>

        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                EographicArea.init();
                EographicArea.changeProvince();

            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>


