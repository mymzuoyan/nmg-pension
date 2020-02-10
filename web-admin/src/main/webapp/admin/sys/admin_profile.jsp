<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>个人信息</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"
              rel="stylesheet" type="text/css">
        <style>
            #imgShow {
                width: 100%;
                height: 100%;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">
        <!-- BEGIN PAGE BREADCRUMB -->
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">个人中心</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">我的信息</a>
                </li>
            </ul>
        </div>
        <!-- END PAGE BREADCRUMB -->
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <!-- BEGIN PROFILE CONTENT -->
                <div class="profile-content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="portlet">
                                <div class="portlet-title tabbable-line">
                                    <div class="caption caption-md">
                                        <i class="icon-globe theme-font hide"></i>
                                        <span class="caption-subject font-blue-madison bold uppercase">我的信息</span>
                                    </div>
                                    <ul class="nav nav-tabs">
                                        <li class="<c:if test="${index==1}">active</c:if>">
                                            <a href="#tab_1_1" data-toggle="tab" aria-expanded="false">基本资料</a>
                                        </li>
                                        <li class="<c:if test="${index==2}">active</c:if>">
                                            <a href="#tab_1_2" data-toggle="tab" aria-expanded="false">头像</a>
                                        </li>
                                        <li class="<c:if test="${index==3}">active</c:if>">
                                            <a href="#tab_1_3" data-toggle="tab" aria-expanded="true">修改密码</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="portlet-body">
                                    <div class="tab-content">
                                        <!-- PERSONAL INFO TAB -->
                                        <div class="tab-pane <c:if test="${index==1}">active</c:if>" id="tab_1_1">
                                            <form id="form-info" role="form" action="#">
                                                <input type="hidden" id="user_id"
                                                       value="${sessionScope.login_user.uid}"/>
                                                <div class="form-group">
                                                    <label class="control-label">登录名</label>
                                                    <input type="text" name="login_name"
                                                           value="${sessionScope.login_user.login_name}"
                                                           readonly class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">角色</label>
                                                    <input type="text" value="${userRole.name}" readonly
                                                           class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">所在区域</label>
                                                    <input name="areaName" type="text"
                                                           value="${sessionScope.login_user.areaName}" readonly
                                                           class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">昵称</label>
                                                    <input name="nick_name" type="text"
                                                           value="${sessionScope.login_user.nick_name}"
                                                           class="form-control">
                                                </div>
                                                <c:if test="${not empty monitor}">
                                                    <div class="form-group">
                                                        <label class="control-label">分机号
                                                            <span class="required">	* </span>
                                                        </label>
                                                        <input name="extension" type="text"
                                                               class="form-control "
                                                               value="${monitor.extension}"/>
                                                    </div>
                                                </c:if>
                                                <div class="margiv-top-10">
                                                    <button id="update" type="button" class="btn green-haze">修改</button>
                                                    <button id="btnSubmit" type="button" class="btn green-haze"
                                                            data-loading-text="保存中..." style="display: none">保存
                                                    </button>
                                                    <span id="labelmsg" class="label "></span>
                                                </div>
                                            </form>
                                        </div>
                                        <!-- END PERSONAL INFO TAB -->
                                        <!-- CHANGE AVATAR TAB -->
                                        <div class="tab-pane <c:if test="${index==2}">active</c:if>" id="tab_1_2">
                                            <form action="#" role="form">
                                                <div class="form-group">
                                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                                        <div id="imgdiv" class="fileinput-new thumbnail"
                                                             style="width: 200px; height: 150px;">
                                                            <c:if test="${empty sessionScope.login_user.avatar}">
                                                                <img id="imgShow"
                                                                     src=""
                                                                     alt="">
                                                            </c:if>
                                                            <c:if test="${!empty sessionScope.login_user.avatar}">
                                                                <img id="imgShow"
                                                                     src="${pageContext.request.contextPath}${sessionScope.login_user.avatar}"
                                                                     alt="">
                                                            </c:if>
                                                        </div>
                                                        <div>
                                                                    <span class="btn default btn-file">
                                                                        <span class="fileinput-new">选择本地图片 </span>
                                                                        <input type="file" name="avatar" id="avatar">
                                                                    </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="margin-top-10">
                                                    <a id="saveImg" href="javascript:" class="btn green-haze">保存头像 </a>
                                                </div>
                                            </form>
                                        </div>
                                        <!-- END CHANGE AVATAR TAB -->
                                        <!-- CHANGE PASSWORD TAB -->
                                        <div class="tab-pane <c:if test="${index==3}">active</c:if>" id="tab_1_3">
                                            <form id="form-password" action="#">
                                                <div class="form-group">
                                                    <label class="control-label">当前密码</label>
                                                    <input name="cur_password" type="password" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">新密码</label>
                                                    <input name="new_password" type="password" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">再次输入新密码</label>
                                                    <input name="renew_password" type="password" class="form-control">
                                                </div>
                                                <div class="margin-top-10">
                                                    <button id="updatePwd" type="button" class="btn green-haze"
                                                            data-loading-text="修改中...">修改
                                                    </button>
                                                    <span id="updatePwdMsg" class="label "></span>

                                                </div>
                                            </form>
                                        </div>
                                        <!-- END CHANGE PASSWORD TAB -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END PROFILE CONTENT -->
            </div>
        </div>
        <!-- END PAGE CONTENT-->
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/sys/admin_profile.js?v=1"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/uploadPreview.js"
                type="text/javascript"></script>

        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                //初始化
                setCheckbocCheck("${monitor.queueName}", document.getElementsByName("queueName"));

                $("#form-info input").attr("disabled", "disabled");
                Metronic.init();
                Layout.init();
                $("#update").click(function () {
                    $("#btnSubmit").show();
                    $(this).hide();
                    $("#form-info input").removeAttr("disabled");
                    $("#form-info input[type=checkbox]").parent().parent().removeClass("disabled");
                });


                AdminProfile.init("${monitor.id}");
                new uploadPreview({UpBtn: "avatar", DivShow: "imgdiv", ImgShow: "imgShow"});
                $("#saveImg").on("click", function () {
                    upload();
                });
                function upload() {
                    var avatarFile = $("#avatar").val();
                    if (avatarFile == null || avatarFile == "") {
                        Metronic.alert({type: 'danger', message: '请上传头像.', closeInSeconds: 2, icon: 'warning'});
                        return false;
                    } else {
                    }

                    $.ajaxFileUpload({
                        url: window.apppath + "/admin/api/user/updateUrl",
                        secureuri: false,
                        fileElementId: 'avatar',//file控件id
                        dataType: 'json',
                        success: function (data, status) {
                            alertSuccess("提示信息", data.message, function () {
                                window.parent.updateAvatar(data.data);
                            });
                        }, error: function (data, status, e) {
                            console.log(e);
                        }
                    });
                }

            });
            function setCheckbocCheck(scopes, obj2) {
                var scope = scopes.split(",");
                if (scopes.length > 0) {
                    for (var i = 0; i < obj2.length; i++) {
                        for (var j = 0; j < scopes.length; j++) {
                            if (obj2[i].value == scope[j]) {
                                obj2[i].checked = true;
                            }
                        }
                    }
                }
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
