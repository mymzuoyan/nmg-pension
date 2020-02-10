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
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>发布广告</title>
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
                    <a href="#">发布广告</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            发布广告
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <div class="form-body">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">广告用途
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <select class="form-control input-xlarge" id="purpose">
                                            <option Value="-1">--请选择--</option>
                                            <option Value="1">APP引导页</option>
                                        </select>
                                    </div>
                                </div>
                                <div style="display: none" id="addDiv">
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">标题
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-10">
                                            <input name="title" type="text" class="form-control input-xlarge"
                                                   value="">
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
                                        <div  class="col-md-5" style="line-height:34px;color: red ">
                                            注：图片尺寸为：14:25
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">排序
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-5">
                                            <input name="sort" type="text" class="form-control input-xlarge"
                                                   value="30">
                                        </div>
                                        <div  class="col-md-5" style="line-height:34px;color: red">
                                            注：数字大的排序在后面，默认30
                                        </div>
                                    </div>
                                        <%--<div class="form-group">--%>
                                        <%--<label class="col-md-2 control-label">链接--%>
                                        <%--<span class="required">	* </span>--%>
                                        <%--</label>--%>
                                        <%--<div class="col-md-10">--%>
                                        <%--<input name="linkUrl" type="text" class="form-control input-xlarge"--%>
                                        <%--value="">--%>
                                        <%--</div>--%>
                                        <%--</div>--%>
                                        <%--<div class="form-group">--%>
                                        <%--<label class="control-label col-md-2">期限 <span--%>
                                        <%--class="required">	* </span></label>--%>
                                        <%--<div class="col-md-10">--%>
                                        <%--<div class="input-group input-large date-picker input-daterange"--%>
                                        <%--data-date-format="yyyy-mm-dd">--%>
                                        <%--<input type="text" class="form-control" name="start">--%>
                                        <%--<span class="input-group-addon">--%>
                                        <%--至 </span>--%>
                                        <%--<input type="text" class="form-control" name="end">--%>
                                        <%--</div>--%>
                                        <%--</div>--%>
                                        <%--</div>--%>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-4 col-md-8">
                                        <button id="btnPublish" type="submit" class="btn green"
                                                data-loading-text="保存中...">保存
                                        </button>
                                        <span id="labelmsg" class="label "></span>
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
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: 'yyyy-mm-dd'

                });

                $("#purpose").change(function () {
                    var purpose = $("#purpose option:selected").val()
                    if (purpose == 1) {
                        $("#addDiv").show();
                    } else {
                        $("#addDiv").hide();
                    }
                })
                $("input[type=file]").change(function () {
                    var result = $(this).val();
                    if (result != null && result != "")
                        result = result.substr(result.lastIndexOf("\\") + 1, result.length - 1)
                    $("#file_path").html(result)
                })

                $("#btnPublish").click(function (e) {
                    $("#labelmsg").text('').removeClass("label-danger");
                    if (( $("#attach").val() == null || $("#attach").val() == "")) {
                        $("#labelmsg").text('请选择图片').addClass("label-danger");
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
                                    $.post(window.apppath + "/admin/api/advertisement/add", {
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

