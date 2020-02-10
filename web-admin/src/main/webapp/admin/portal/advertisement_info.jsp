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
        <title>广告详情</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">

        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">广告管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">广告详情</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            广告详情
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <div class="form-body">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">标题
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <input name="id" type="hidden" class="form-control input-xlarge"
                                               value="${advertisement.id}">
                                        <input name="title" type="text" class="form-control input-xlarge"
                                               value="${advertisement.title}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">广告图片<span class="required"
                                                                                    id="upload"
                                                                                    hidden>	* </span></label>
                                    <div class="col-md-10">
                                        <img style="width: 140px;height: 250px"
                                             src="${pageContext.request.contextPath }${advertisement.imageFile}">
                                    </div>
                                </div>
                                <div class="form-group" id="addPic">
                                    <label class="col-md-2 control-label">广告图片
                                        <span class="required">	* </span></label>
                                    <div class="col-md-5">
                                        <div class="fileinput fileinput-new"
                                             data-provides="fileinput">
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new">选择图片 </span>
                                                <input type="file" name="attach" id="attach">
                                            </span>
                                            <span id="file_path"></span>
                                        </div>
                                    </div>
                                    <div class="col-md-5" style="line-height:34px;color: red ">
                                        注：图片尺寸为：14:25
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">排序
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-5">
                                        <input name="sort" type="text" class="form-control input-xlarge"
                                               value="${advertisement.sort}">
                                    </div>
                                    <div class="col-md-5" style="line-height:34px;color: red">
                                        注：数字大的排序在后面，默认30
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-4 col-md-8">
                                        <span id="labelmsg" class="label "></span>
                                        <button id="btnPublish" type="submit" class="btn green"
                                                data-loading-text="保存中...">保存
                                        </button>
                                        <button onclick="javascript:window.parent.closeTab('tab_institution_info')" type="button"
                                                class="btn btn-default back">返回
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/uploadPreview.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/portal/advertisement_list.js?v=2"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });

                $("#btnPublish").click(function (e) {
                    $("#labelmsg").text('').removeClass("label-danger");
                    if (( $("#attach").val() == null || $("#attach").val() == "")) {
                        $.post(window.apppath + "/admin/api/advertisement/update", {
                            id: $("input[name=id]").val(),
                            title: $("input[name=title]").val(),
                            sort: $("input[name=sort]").val(),
                        }, function (data) {
                            if (data.success) {
                                $("#labelmsg").text(data.message).addClass("label-success");
                                setTimeout(function () {
                                    window.location.reload();
                                }, 2000);
                            }
                        }, "json");
                    }
                    else {
                        $.ajaxFileUpload({
                            url: window.apppath + "/file/upload?path=advertisement",
                            secureuri: false,
                            fileElementId: 'attach',//file控件id
                            dataType: 'json',
                            success: function (data, status) {
                                if (data.error == 0) {
                                    //add
                                    $.post(window.apppath + "/admin/api/advertisement/update", {
                                        id: $("input[name=id]").val(),
                                        title: $("input[name=title]").val(),
                                        purpose: $("#purpose option:selected").val(),
                                        linkUrl: $("input[name=linkUrl]").val(),
                                        imageFile: data.url,
                                        start: $("input[name=start]").val(),
                                        end: $("input[name=end]").val(),
                                        sort: $("input[name=sort]").val(),
                                    }, function (data) {
                                        if (data.success) {
                                            $("#labelmsg").text(data.message).addClass("label-success");
                                            setTimeout(function () {
                                                window.location.reload();
                                            }, 2000);
                                        }
                                    }, "json");
                                }
                            },
                            error: function (data, status, e) {
                                console.log(e);
                            }
                        });
                    }
                });
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

