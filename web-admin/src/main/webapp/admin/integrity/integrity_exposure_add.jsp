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
        <title>发布新闻</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
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
                    <a href="#">诚信管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">诚信发布</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            诚信发布
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <div class="form-body">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">诚信类型
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-4">
                                        <select class="form-control" id="module">
                                            <option Value="-1">--请选择--</option>
                                            <option Value="0">光荣榜</option>
                                            <option Value="1">曝光台</option>
                                        </select>
                                    </div>
                                        <label class="col-md-2 control-label">分值
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input name="score" type="text" class="form-control" autocomplete="off"
                                                   value="">
                                        </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">部门名字
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-4">
                                        <input name="institutionName" type="text" class="form-control" autocomplete="off"
                                               value="">
                                    </div>
                                    <label class="col-md-2 control-label">诚信标题
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-4">
                                        <input name="title" type="text" class="form-control" autocomplete="off"
                                               value="">
                                    </div>
                                </div>
                                <div class="form-group" style="display:none" id="addOther1">
                                    <label class="col-md-2 control-label">文号
                                        <span class="required">	 </span>
                                    </label>
                                    <div class="col-md-4">
                                        <input name="articleNumber" type="text" class="form-control"
                                               value="">
                                    </div>
                                    <label class="col-md-2 control-label">关键字
                                        <span class="required">	 </span>
                                    </label>
                                    <div class="col-md-4">
                                        <input name="articleKeyword" type="text" class="form-control"
                                               value="">
                                    </div>
                                </div>
                                <div class="form-group" style="display:none" id="addOther2">
                                    <label class="col-md-2 control-label">发文单位
                                        <span class="required">	 </span>
                                    </label>
                                    <div class="col-md-4">
                                        <select class="form-control" id="sendArticleUnitId" name="sendArticleUnitId">
                                            <option Value="-1">--请选择--</option>
                                            <c:if test="${!empty sendArticleUnits}">
                                                <c:forEach var="sendArticleUnit" items="${sendArticleUnits}">
                                                    <option value="${sendArticleUnit.id}">${sendArticleUnit.name}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                    <label class="col-md-2 control-label">发文时间
                                        <span class="required">	 </span>
                                    </label>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control date-picker" name="sendTimeString" data-date-format="yyyy-mm-dd">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2">正文<span class="required">	* </span></label>
                                    <div class="col-md-10">
                                        <script id="container" name="content" type="text/plain">
                                        </script>
                                    </div>
                                </div>
                                <div class="form-group" id="addPic" style="display: none">
                                    <label class="col-md-2 control-label">封面上传<span class="required"
                                                                                    id="upload"
                                                                                    hidden>	* </span></label>
                                    <div class="col-md-10">
                                        <div class="fileinput fileinput-new"
                                             data-provides="fileinput">
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new">选择图片 </span>
                                                <input type="file" name="avatar" id="avatar">
                                            </span>
                                            <span id="file_path"></span>
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
        <!-- 配置文件 -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/ueditor/ueditor.config.js?v=1.4"></script>
        <!-- 编辑器源码文件 -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/ueditor/ueditor.all.js"></script>
        <!--timer-->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <!--fileUpload-->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
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
                    autoclose: true
                });
                var ue = UE.getEditor('container');
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
                    var a_content = ue.getContent();
                    if (-1 == $('#module').val()) {
                        $("#labelmsg").text('请选择诚信类型').addClass("label-danger");
                    }else if($("input[name='score']").val()==""||$("input[name='score']").val()==null )
                    {
                        $("#labelmsg").text('请填写分数').addClass("label-danger");
                    }else if(isNaN($("input[name='score']").val())) {
                        $("#labelmsg").text('分数应该为整数').addClass("label-danger");
                    }
                    else if($("input[name='institutionName']").val()==""||$("input[name='institutionName']").val()==null){
                        $("#labelmsg").text('请填写部门名字').addClass("label-danger");
                    }
                    else if (a_title == "") {
                        $("#labelmsg").text('请填写标题').addClass("label-danger");
                    } else if (a_content.trim().length == 0) {
                        $("#labelmsg").text('请填写内容').addClass("label-danger");
                    } else {
                        var $btn = $(this).button('loading');
                        $("#labelmsg").text('');
                        $.post(window.apppath + "/admin/api/Integrity/insert", {
                            title: a_title,
                            context: a_content,
                            flag: $('#module option:selected').val(),
                            score:$("input[name='score']").val(),
                            institutionName:$("input[name='institutionName']").val(),
                        }, function (res) {
                            $($btn).button('reset');
                            if (res.success) {
                                $("#labelmsg").text(res.message).addClass("label-danger");
                                setTimeout(function(){
                                    document.location.reload();
                                },1000);
                            } else {
                                $("#labelmsg").text(res.message).addClass("label-danger");
                                setTimeout(function(){
                                    document.location.reload();
                                },1000);
                            }
                        }, 'json');
                    }
                });
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

