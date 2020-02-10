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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>更新知识库</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
        <style>
            table tr td{
                text-align: center;
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
                    <a href="#">知识库管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">更新知识库</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div id="info" class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            知识库详情
                        </div>
                        <div class="tools">
                            <div style="float: left">
                                <button id="showUpdate" type="submit" class="btn btn-default green">修改</button>
                                <button onclick="javascript:window.history.back(-1)" class="btn btn-default">返回</button>
                            </div>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div style="margin: 0px 40px">
                            <h3 style="text-align: center">${knowledge.title}</h3>
                                <%--<p style="text-align: center"><fmt:formatDate v/alue="${knowledge.createTime}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></p>--%>
                            <p>
                                    ${knowledge.content}
                            </p>
                        </div>
                    </div>
                </div>

            </div>
            <div id="update" class="col-md-12" style="display: none;">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            更新知识库
                        </div>
                        <button onclick="javascript:window.history.back(-1)" style="float: right"
                                class="btn btn-default">返回
                        </button>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <div class="form-body">
                                <input type="hidden" id="knowledgeId" value="${knowledge.id}">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">知识库类型
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <select class="form-control " id="type">
                                            <option Value="-1">--请选择--</option>
                                            <c:if test="${!empty knowledgeTypes}">
                                                <c:forEach var="type" items="${knowledgeTypes}">
                                                    <c:if test="${knowledge.typeId == type.id}">
                                                        <option Value="${type.id}" selected>${type.name}</option>
                                                    </c:if>
                                                    <c:if test="${knowledge.typeId != type.id}">
                                                        <option Value="${type.id}">${type.name}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">知识库标题
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <input name="title" type="text" class="form-control "
                                               value="${knowledge.title}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2">正文<span class="required">	* </span></label>
                                    <div class="col-md-10">
                                        <textarea id="editor_id" name="content"
                                                  style="width:100%;height:440px;">${knowledge.content}</textarea>
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
                                    data-loading-text="保存中...">保存
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
                $("table").attr("border","1");
                $("#showUpdate").click(function (e) {
                    $("#info").hide();
                    $("#update").show();

                });
                $("#btnPublish").click(function (e) {
                    e.preventDefault();
                    $("#labelmsg").removeClass("label-danger").removeClass("label-success");
                    var a_title = $("input[name=title]").val();
                    var a_content = editor.html();
                    if (-1 == $('#type').val()) {
                        $("#labelmsg").text('请选择分类').addClass("label-danger");
                    } else if (a_title == "") {
                        $("#labelmsg").text('请填写标题').addClass("label-danger");
                    } else if (editor.isEmpty()) {
                        $("#labelmsg").text('请填写内容').addClass("label-danger");
                    } else {
                        var $btn = $(this).button('loading');
                        $("#labelmsg").text('');
                        editor.readonly();
                        $.post(window.apppath + "/admin/call/api/knowledge/update", {
                            id: $("#knowledgeId").val(),
                            title: a_title,
                            content: a_content,
                            typeId: $('#type').val(),
                        }, function (res) {
                            $($btn).button('reset');
                            editor.readonly(false);
                            if (res.success) {
                                $("#labelmsg").text(res.message).addClass("label-success");
                                setTimeout(function () {
                                    window.location.reload();
                                }, 1000);
                            } else {
                                $("#labelmsg").text(res.message).addClass("label-danger");
                            }
                        }, 'json');
                    }
                });
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

