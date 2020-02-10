<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/9/12
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shoir" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>养老院服务质量自查检查</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/view/css/alertStyle.css"/>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">

        <div class="row" style="">
            <div class="col-md-12" style="height: 100% !important;">
                <div class="portlet " style="height: 90% !important;">
                    <div class="portlet-title">
                        <div class="caption tabbable-line" style="padding: 0px">
                            <ul class="nav nav-tabs">
                                <li>
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/institution/detail/${id}'"
                                       data-toggle="tab" aria-expanded="false">养老机构信息</a>
                                </li>
                                <li class="">
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/institution/putOnRecord/${id}'"
                                       data-toggle="tab" aria-expanded="true">建档内容</a>
                                </li>
                                <li>
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/institution/map/${id}'"
                                       data-toggle="tab" aria-expanded="true">养老机构定位
                                    </a>
                                </li>
                                <li class="">
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/institution/${id}/elderly/list'"
                                       data-toggle="tab" aria-expanded="true">入住老人管理</a>
                                </li>

                            </ul>
                        </div>
                    </div>
                    <div id="searchDiv" class="portlet-body form" style="">
                        <table class="table table-bordered table-hover table-condensed table-responsive">
                            <tr>
                                <td style="vertical-align: middle">
                                    名称
                                </td>
                                <td>
                                    <input name="name" id="name"
                                           class="form-control">  </input>
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
                    <div class="portlet-body" style="height: 100% !important;">
                        <div class="table-container">
                            <table class="table table-striped table-bordered table-hover"
                                   id="datatable_list">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="1%">
                                        <input type="checkbox" class="group-checkable">
                                    </th>
                                    <th width="70%">
                                        检查内容
                                    </th>
                                    <th width="29%">
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
                                                                         maxlenght="15"
                                                                         style="text-align:center; margin: 0 5px;">
                                    <button
                                            href="" id="goPage" class="btn btn-sm default "
                                            onclick="NursingHomeServiceCheck.goToPage()" title="GO">GO
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="impModal" tabindex="" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;
                        </button>
                        <h4 class="modal-title" id="impModalLabel">请选择...</h4>
                    </div>
                    <div class="modal-body">
                        <!-- BEGIN PAGE CONTENT-->
                        <form id="fileUpload" name="fileUpload" action="" method="POST"
                              enctype="multipart/form-data" target="impResult">
                            <table class="table-container">
                                <tr>
                                    <td width="20%">
                                        导入文件：
                                    </td>
                                    <td style="text-align:center;width: 20%">
                                        <input type="file" id="file" name="file" size="30"/>
                                    </td>
                                    <%--<td width="10%">
                                        <a href="#" class="btn btn-icon-only green"
                                           onclick="importExcel('file','/admin/api/sms/template/import')">
                                            <i class="fa fa-upload"></i>
                                        </a>
                                    </td>--%>
                                    <td width="25%">
                                        <span id="msg" class="label"></span>
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <!-- END PAGE CONTENT-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary"
                                onclick="NursingHomeServiceCheck.submitForm1()">
                            导入
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
        <!-- 导入模态框（Modal） -->
        <div class="modal fade" id="addModal" tabindex="" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;
                        </button>
                        <h4 class="modal-title" id="addModalLabel"> </h4>
                    </div>
                    <div class="modal-body">
                        <!-- BEGIN PAGE CONTENT-->
                        <div class="form-horizontal">
                            <form id="addForm" method="post">
                                <div class="form-body">
                                    <input type="hidden" id="id" name="id" value="">
                                    <div class="form-group">
                                        <label class="col-md-2 control-label" style="padding-top: 150px">查看文件
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-10">
                                            <textarea name="fileUrl" rows="15" type="text"
                                                      class="form-control"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- END PAGE CONTENT-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary"
                                onclick="NursingHomeServiceCheck.submitForm()">
                            确定
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script src="/assets/global/plugins/ajaxfileupload.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/nursing_home_service_check.js?v=3.0"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/assets/global/scripts/arrayValue.js"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();

                function UploadFile(id) {
                    var fileName = $("#" + id).val();
                    if (fileName == null || fileName == "")
                        return false;
                    $.ajaxFileUpload({
                        url: window.apppath + "/file/upload?path=serviceOrg&createThumbnail=true",
                        secureuri: false,
                        fileElementId: "fileUrl",//file控件id
                        dataType: 'json',
                        success: function (data, status) {
                            if (data.error == 0) {
                                fileName = fileName.substr(fileName.lastIndexOf("\\") + 1, fileName.length - 1)
                                var html = "<label style='margin: 0px'>" + fileName + "<a data='" + data.url + "' class='remove'>&times;</a></label>"
                                $("#attachList").append(html);

                                $(".remove").click(function () {
                                    $(this).parent().remove();

                                })
                            }
                        }
                    });
                }
            });
            NursingHomeServiceCheck.init("${id}");
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

