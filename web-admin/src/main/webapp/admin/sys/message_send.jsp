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
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>发布公告</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
        <style>
            .remove {
                color: red;
                font-size: 17px;
                cursor: pointer;
                line-height: 12px;
                margin: 0px 10px;
                text-decoration: none;
            }

            .removeImg {
                z-index: 2;
                position: absolute;
                right: 0px;
                color: red;
                font-size: 25px;
            }

            .file-box {
                position: relative;
                width: 77px;
                height: 77px;
                border: 1px solid #D9D9D9;
                background-image: url("${pageContext.request.contextPath }/assets/admin/pages/img/add.png");
            }

            .file-div {
                width: 77px;
                height: 77px;
                display: inline-block;
                position: relative;
                vertical-align: text-bottom;
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

            }
        </style>
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
                    <a href="#">系统公告</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">发布公告</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            发布公告
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <div class="form-body">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">公告标题
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <input name="title" type="text" class="form-control "
                                               value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2">内容<span class="required">	* </span></label>
                                    <div class="col-md-10">
                                        <textarea id="editor_id" name="content"
                                                  style="width:100%;height:250px;"></textarea>
                                    </div>
                                </div>
                                <div class="form-group" id="addPic">
                                    <label class="col-md-2 control-label">附件上传
                                    </label>
                                    <div class="col-md-10">
                                        <div id="attachList" class="file-box-list"
                                             style="display: inline-block;margin: 0px"></div>
                                        <div style="display: inline-block" class="file-box">
                                            <input type="file" name="attach" id="attach" onchange="UploadFile('attach')"
                                                   style="opacity: 0;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <div class="row">
                        <div class="col-md-offset-4 col-md-8">
                            <button id="btnPublish" type="submit" class="btn green"
                                    data-loading-text="发布中...">发布
                            </button>
                            <span id="labelmsg" class="label "></span>
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
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript" charset="utf-8"
                src="${pageContext.request.contextPath }/assets/global/plugins/kindeditor/kindeditor-all-min.js"></script>
        <script type="text/javascript" charset="utf-8"
                src="${pageContext.request.contextPath }/assets/global/plugins/kindeditor/lang/zh-CN.js"></script>
        <!--fileUpload-->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                KindEditor.ready(function (K) {
                    window.editor = K.create('#editor_id', {
                        uploadJson: '${pageContext.request.contextPath }/file/kindeditor/u',
                        allowFileManager: false
                    });
                });
                $("input[type=file]").change(function () {
                    var result = $(this).val();
                    if (result != null && result != "")
                        result = result.substr(result.lastIndexOf("\\") + 1, result.length - 1)
                    $("#file_path").html(result)
                })
                $("#btnPublish").click(function (e) {
                    e.preventDefault();
                    $("#labelmsg").removeClass("label-danger").removeClass("label-success");
                    var a_title = $("input[name=title]").val();
                    var a_content = editor.html();
                    var attach = "";
                    $(".remove").each(function () {
                        attach += $(this).attr("data") + ",";
                    })
                    if (attach.length > 1)
                        attach = attach.substr(0, attach.length - 1);
                    if (a_title == "") {
                        $("#labelmsg").text('请填写标题').addClass("label-danger");
                    } else if (editor.isEmpty()) {
                        $("#labelmsg").text('请填写内容').addClass("label-danger");
                    } else {
                        var $btn = $(this).button('loading');
                        $("#labelmsg").text('');
                        editor.readonly();
                        $.post(window.apppath + "/admin/api/message/send", {
                            title: a_title,
                            content: a_content,
                            attach: attach,
                        }, function (res) {
                            $($btn).button('reset');
                            editor.readonly(false);
                            if (res.success) {
                                $("#labelmsg").text(res.message).addClass("label-success");
                                setTimeout(function () {
                                    window.location.reload();
                                }, 2000);
                            } else {
                                $("#labelmsg").text(res.message).addClass("label-danger");
                            }
                        }, 'json');
                    }
                });
            });
            function UploadFile(id) {
                var fileName = $("#" + id).val();
                if (fileName == null || fileName == "")
                    return false;
                $.ajaxFileUpload({
                    url: window.apppath + "/file/upload?path=message&createThumbnail=true&thumbnailWidth=77&thumbnailHeight=77",
                    secureuri: false,
                    fileElementId: "attach",//file控件id
                    dataType: 'json',
                    success: function (data, status) {
                        if (data.error == 0) {
                            fileName = fileName.substr(fileName.lastIndexOf("\\") + 1, fileName.length - 1);
                            var html = "";
                            if (!(/\.(jpe?g|gif|png|ico)$/i).test(fileName)) {
                                html = "<label style='margin: 0px;    vertical-align: top'>" + fileName + "<a data='" + data.url + "' class='remove'>&times;</a></label>"
                            }
                            else {
                                var path = data.url.substr(0, data.url.lastIndexOf(".")) + "_77_77" + data.url.substr(data.url.lastIndexOf("."))
                                html = "<div class='file-div'><img src='" + path + "'><a data='" + data.url + "' class=' remove removeImg'>&times;</a></div>"

                            }
                            $("#attachList").append(html);
                            $(".remove").click(function () {
                                $(this).parent().remove();
                            })
                        }
                    }
                });
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

