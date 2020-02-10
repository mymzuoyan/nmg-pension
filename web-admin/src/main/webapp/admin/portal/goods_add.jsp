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
        <title>添加商品</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
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
                    <a href="#">商城管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">添加商品</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            添加商品
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <div class="form-body">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">商品类型
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <select class="form-control input-xlarge" id="typeId">
                                            <option Value="-1">--请选择--</option>
                                            <c:if test="${!empty types}">
                                                <c:forEach var="goodsType" items="${types}">
                                                    <option data-ids="<c:forEach var="attr" items="${goodsType.attrs}">${ attr.id},</c:forEach>"
                                                            data="<c:forEach var="attr" items="${goodsType.attrs}">${ attr.attr},</c:forEach>"
                                                            value="${goodsType.id}">${goodsType.name}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">商品编码
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-4">
                                        <input name="num" type="text" class="form-control input-xlarge"
                                               value="">
                                    </div>
                                    <label class="col-md-2 control-label">商品名称
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-4">
                                        <input name="name" type="text" class="form-control input-xlarge"
                                               value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">商品库存
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-4">
                                        <input name="amount" type="text" class="form-control input-xlarge"
                                               value="">
                                    </div>
                                    <label class="col-md-2 control-label">商品价格
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-4">
                                        <input name="price" type="text" class="form-control input-xlarge"
                                               value="">
                                    </div>
                                </div>
                                <div id="addPropertyDiv" class="">
                                </div>
                                <div class="form-group" id="addPic" style="">
                                    <label class="col-md-2 control-label">
                                        商品图片
                                        <span class="required" id="upload">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <div class="fileinput fileinput-new"
                                             data-provides="fileinput">
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new">选择图片 </span>
                                                <input type="file" name="img" id="img">
                                            </span>
                                            <span id="file_path"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2">商品详情<span class="required">	* </span></label>
                                    <div class="col-md-10">
                                        <script id="container"name="content" type="text/plain">
                                        </script>
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
                src="${pageContext.request.contextPath }/assets/global/plugins/ueditor/ueditor.all.js"></script> <!--fileUpload-->
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
                var attrIds = "";
                var ue = UE.getEditor('container');

                $("#typeId").change(function () {
                    var data = $("#typeId option:selected").attr("data");
                    data = data.replace("[", "").replace("]", "");
                    attrIds = $("#typeId option:selected").data("ids");
                    var attrStr = data.split(",");
                    var html = "";
                    if (attrStr != null && attrStr != "") {
                        for (var i in attrStr) {
                            if (attrStr[i].trim() != "") {
                                html += '<div class="form-group"><label class="col-md-2 control-label">' + attrStr[i].trim() +
                                    '<span class="required"> * </span>' +
                                    ' </label>' +
                                    '<div class="col-md-4">' +
                                    '<input data="' + attrStr[i].trim() + '" name="attr" type="text" class="form-control input-xlarge"' +
                                    'value="">' +
                                    '</div></div>';
                            }
                        }
                    }
//                   '+attrStrIds[i].trim()+'
                    $("#addPropertyDiv").html(html)

                });

                $("input[type=file]").change(function () {
                    var result = $(this).val();
                    if (result != null && result != "")
                        result = result.substr(result.lastIndexOf("\\") + 1, result.length - 1)
                    $("#file_path").html(result)
                });

                function upload(avatar, id) {
                    var avatarFile = $("#" + avatar).val();
                    if (avatarFile != null && avatarFile != "") {
                        $.ajaxFileUpload({
                            url: window.apppath + "/admin/api/goods/fileUpload?id=" + id,
                            secureuri: false,
                            fileElementId: avatar,//file控件id
                            dataType: 'json',
                            success: function (data, status) {
                                $("#labelmsg").text(data.message).addClass("label-success");
                                setTimeout(function () {
                                    window.location.reload();
                                }, 1000);
                            },
                            error: function (data, status, e) {
                                console.log(e);
                            }
                        });
                    } else {
                        $("#labelmsg").text("添加成功").addClass("label-success");
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000);
                    }
                }


                $("#btnPublish").click(function (e) {
                    e.preventDefault();
                    $("#labelmsg").removeClass("label-danger").removeClass("label-success");
                    var name = $("input[name=name]").val();
                    var num = $("input[name=num]").val();
                    var amount = $("input[name=amount]").val();
                    var price = $("input[name=price]").val();
                    var info = ue.getContent();
                    var attrs = "";
                    $("input[name=attr]").each(function () {
                        attrs += $(this).val() + "|";
                    });
                    if (-1 == $('#typeId').val()) {
                        $("#labelmsg").text('请选择分类').addClass("label-danger");
                    } else if (num == "") {
                        $("#labelmsg").text('请填写商品编码').addClass("label-danger");
                    } else if (name == "") {
                        $("#labelmsg").text('请填写商品名称').addClass("label-danger");
                    } else if (amount == "") {
                        $("#labelmsg").text('请填写商品库存').addClass("label-danger");
                    }
                    else if (isNaN(amount)) {
                        $("#labelmsg").text('商品库存请填写数字').addClass("label-danger");
                    } else if (price == "") {
                        $("#labelmsg").text('请填写商品价格').addClass("label-danger");
                    } else if (isNaN(price)) {
                        $("#labelmsg").text('商品价格请填写数字').addClass("label-danger");
                    } else if (!checkProperty()) {

                        return false;
                    } else if ($("#img").val() == "") {
                        $("#labelmsg").text('请选择图片').addClass("label-danger");
                    } else if (info.trim()=="") {
                        $("#labelmsg").text('请填写内容').addClass("label-danger");
                    }
                    else {
                        var $btn = $(this).button('loading');
                        attrIds = attrIds.substr(0, attrIds.length - 1)
                        attrs = attrs.substr(0, attrs.length - 1)
                        $.post(window.apppath + "/admin/api/goods/add", {
                            name: name,
                            num: num,
                            amount: amount,
                            price: price,
                            info: info,
                            typeId: $('#typeId').val(),
                            attrs: attrs,
                            attrIds: attrIds,
                        }, function (res) {
                            $($btn).button('reset');
                            if (res.success) {
                                upload("img", res.data.id);
                            } else {
                                $("#labelmsg").text(res.message).addClass("label-danger");
                            }
                        }, 'json');
                    }
                });
            });
            function checkProperty() {
                $("input[name=attr]").each(function () {
                    var value = $(this).val().trim();
                    var name = $(this).attr("data")
                    if (value.length == 0) {
                        $("#labelmsg").text('请输入' + name + '属性').addClass("label-danger");
                        return false;
                    }
                })
                return true;
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

