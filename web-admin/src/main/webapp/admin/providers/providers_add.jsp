<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>社会服务企业</title>
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
            #attachDiv img {
                width: 200px;
            }

            #attachDiv a {
                line-height: 35px;
                font-size: 20px;
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
        <!-- /.modal -->
        <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
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
                    <a href="#">养老服务组织</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">养老服务组织新增</a>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
        <div class="col-md-12">
            <!-- Begin: life time stats -->
            <div class="portlet " style="padding-top: 0px !important;">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-equalizer font-purple-plum hide"></i>
                        <span class="caption-subject font-red-sunglo bold uppercase">社会服务企业新增</span>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="tabbable-line">
                        <form id="serviceOrgAddForm">
                            <table border="1"
                                   class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                   align="center" style="border-collapse: collapse;">
                                <input type="hidden" id="province" value="0">
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
                                            <label class="checkbox-inline">
                                                <input type="checkbox"
                                                       name="institutionTypeDictId"
                                                       value="7" checked
                                                />社会服务企业
                                            </label>

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;vertical-align: middle">
                                        验证材料
                                    </td>
                                    <td style="text-align: center;vertical-align: middle">
                                        <div class="fileinput fileinput-new"
                                             data-provides="fileinput">
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new">选择材料 </span>
                                                <input type="file" name="attach" id="attach">
                                            </span>
                                            <span id="file_path"></span>
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
                                        <button onclick="javascript:window.history.back(-1)"
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
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>
        <!--area-->
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <!--timer-->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <!--fileUpload-->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
        <!--upload-->
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/uploadPreview.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/service_org_detail.js?v=1.5"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js?v=1"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js"
                type="text/javascript"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                AreaTree.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
                EographicArea.init();
                EographicArea.changeProvince();
                //上传文件显示
                $("input[name=attach]").change(function () {
                    var result = $(this).val();
                    if (result != null && result != "")
                        result = result.substr(result.lastIndexOf("\\") + 1, result.length - 1);
                    $("#file_path").html(result)
                })
                ServiceOrgDetail.init();
                if ("${m.serviceProject}" != "") {
                    ServiceOrgDetail.setServiceProject("${m.serviceProject}");
                }

                //附件展示
                if ("${m.attach}" != "") {
                    var str = "${m.attach}";
                    var attaches = str.split(",");
                    var html = "";
                    var fileCount = 1;
                    for (var i in attaches) {
                        if ((/\.(jpe?g|gif|png)$/i).test(attaches[i])) {
                            var path = attaches[i].substr(0, attaches[i].lastIndexOf(".")) + "_200_300" + attaches[i].substr(attaches[i].lastIndexOf("."))
                            html += "<a target='black' href='${pageContext.request.contextPath }" + attaches[i] + "'><img  src='${pageContext.request.contextPath }" + path + "'/></a>"
                        }
                        else {
                            html += "<a href='${pageContext.request.contextPath }" + attaches[i] + "'>附件" + fileCount + "</a>"
                            fileCount++;
                        }
                    }
                    $("#attachDiv").html(html);
                }

            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>


