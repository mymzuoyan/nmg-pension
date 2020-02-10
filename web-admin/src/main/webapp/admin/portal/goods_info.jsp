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
        <title>商品详情</title>
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
                    <a href="#">商品详情</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            商品详情
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <div class="form-body">
                                <input type="hidden" id="goodsId" value="${goods.id}">
                                <input type="hidden" id="putTop" value="${goods.putTop}">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">商品类型
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <select class="form-control input-xlarge" id="typeId">
                                            <option Value="-1">--请选择--</option>
                                            <c:if test="${!empty types}">
                                                <c:forEach var="goodsType" items="${types}">
                                                    <c:if test="${goods.typeId == goodsType.id}">
                                                        <option Value="${goodsType.id}"
                                                                selected>${goodsType.name}</option>
                                                    </c:if>
                                                    <c:if test="${goods.typeId != goodsType.id}">
                                                        <option Value="${goodsType.id}">${goodsType.name}</option>
                                                    </c:if> </c:forEach>
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
                                               value="${goods.num}">
                                    </div>
                                    <label class="col-md-2 control-label">商品名称
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-4">
                                        <input name="name" type="text" class="form-control input-xlarge"
                                               value="${goods.name}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">商品库存
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-4">
                                        <input name="amount" type="text" class="form-control input-xlarge"
                                               value="${goods.amount}">
                                    </div>
                                    <label class="col-md-2 control-label">商品价格
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-4">
                                        <input name="price" type="text" class="form-control input-xlarge"
                                               value="${goods.price}">
                                    </div>
                                </div>
                                <c:if test="${not empty goods.goodsAttrs}">
                                    <input type="hidden" id="attrIds" value='<c:forEach items="${goods.goodsAttrs}" var="goodsAttr">${goodsAttr.attrId},</c:forEach>'>
                                    <c:forEach items="${goods.goodsAttrs}" var="goodsAttr">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">${goodsAttr.attr}
                                                <span class="required">	* </span>
                                            </label>
                                            <div class="col-md-4">
                                                <input name="attr" type="text" class="form-control input-xlarge"
                                                       value="${goodsAttr.value}">
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <div class="form-group" id="addPic" style="">
                                    <label class="col-md-2 control-label">商品图片
                                        <span class="required" id="upload">	* </span>
                                    </lab>
                                    <div class="col-md-10">
                                        <div class="fileinput fileinput-new"
                                             data-provides="fileinput">
                                            <div id="imgdiv" class="fileinput-new thumbnail"
                                                 style="width: 200px; height: 200px;">
                                                <c:if test="${!empty goods.img}">
                                                    <img id="imgShow"
                                                         src="${pageContext.request.contextPath}${goods.img}"
                                                         alt="" style="height: 100%;width: 100%">
                                                </c:if>
                                            </div>
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new">更新图片 </span>
                                                <input type="file" name="img" id="img">
                                            </span>
                                            <span id="file_path"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label clelass="control-label col-md-2">商品详情<span class="required">	* </span></label>
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
                                    data-loading-text="修改中...">修改
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
                var   ue = UE.getEditor('container');
                ue.ready(function () {
                    //设置编辑器的内容
                    ue.setContent('${goods.info}');
                });
                function upload(avatar) {
                    var avatarFile = $("#" + avatar).val();
                    var id = $("#goodsId").val();
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
                        $("#labelmsg").text("更新成功").addClass("label-success");
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000);
                    }
                }

                $("input[type=file]").change(function () {
                    var result = $(this).val();
                    if (result != null && result != "")
                        result = result.substr(result.lastIndexOf("\\") + 1, result.length - 1)
                    $("#file_path").html(result)
                });
                $("#btnPublish").click(function (e) {
                    e.preventDefault();
                    $("#labelmsg").removeClass("label-danger").removeClass("label-success");
                    var name = $("input[name=name]").val();
                    var num = $("input[name=num]").val();
                    var amount = $("input[name=amount]").val();
                    var price = $("input[name=price]").val();
                    var info = ue.getContent();
                    var  attrIds = $("#attrIds").val();
                    var attrs = "";
                    $("input[name=attr]").each(function () {
                        attrs += $(this).val() + "|";
                    })
                    if (-1 == $('#typeId').val()) {
                        $("#labelmsg").text('请选择分类').addClass("label-danger");
                    }
                    else if (num == "") {
                        $("#labelmsg").text('请填写商品编码').addClass("label-danger");
                    }
                    else if (name == "") {
                        $("#labelmsg").text('请填写商品名称').addClass("label-danger");
                    }
                    else if (amount == "") {
                        $("#labelmsg").text('请填写商品库存').addClass("label-danger");
                    }
                    else if (isNaN(amount)) {
                        $("#labelmsg").text('商品库存请填写数字').addClass("label-danger");
                    }
                    else if (price == "") {
                        $("#labelmsg").text('请填写商品价格').addClass("label-danger");
                    }
                    else if (isNaN(price)) {
                        $("#labelmsg").text('商品价格请填写数字').addClass("label-danger");
                    }
                    else if (!checkProperty()) {
                        return false;
                    }
                    else if (info.trim()=="") {
                        $("#labelmsg").text('请填写内容').addClass("label-danger");
                    }
                    else {
                        console.log(info);
                        var $btn = $(this).button('loading');
                        $("#labelmsg").text('');
                        $.post(window.apppath + "/admin/api/goods/update", {
                            id: $("#goodsId").val(),
                            name: name,
                            num: num,
                            amount: amount,
                            price: price,
                            info: info,
                            typeId: $('#typeId').val(),
                            attrs: attrs,
                            attrIds: attrIds,
                            putTop: $('#putTop').val()
                        }, function (res) {
                            $($btn).button('reset');
                            if (res.success) {
                                upload("img");
                            } else {
                                $("#labelmsg").text(res.message).addClass("label-danger");
                            }
                        }, 'json');
                    }
                });
                new uploadPreview({UpBtn: "avatar", DivShow: "imgdiv", ImgShow: "imgShow"});
            });
            function checkProperty() {
                $("input[name=attr]").each(function () {
                    var value = $(this).val().trim();
                    var name = $(this).attr("data")
                    if (value.length == 0) {
                        $("#labelmsg").text('请输入' + name + '属性').addClass("label-danger");
                        return false;
                    }
                });
                return true;
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

