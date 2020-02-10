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
        <title> 老年优待证信息增加</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <style>
            a, a:hover {
                text-decoration: none;
            }

            #avatar {
                right: 100px;
                top: 65px;
                width: 200px;
                height: 200px;
                position: absolute;
            }

        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">
        <p>
            <object classid="clsid:4B3CB088-9A00-4D24-87AA-F65C58531039" id="SynCardOcx1"
                    codeBase="SynCardOcx.CAB#version=1,0,0,1" width="0" height="0">
            </object>
        </p>
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">老年优待证管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#"> 老年优待证信息增加</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            老年优待证信息增加
                        </div>
                    </div>
                    <div class="portlet-body form" id="tab_add">
                        <div class="form-horizontal">
                            <div class="form-body">
                                <div class="form-group">
                                    <label class="col-md-1 control-label">姓名
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-3">
                                        <input name="name" type="text"
                                               class="form-control"
                                               value="">
                                        </input>
                                    </div>
                                    <lable class="col-md-1 control-label">照片</lable>
                                    <div class="col-md-3">
                                        <form id="fileUpload1" name="fileUpload" action="" method="POST"
                                              enctype="multipart/form-data" target="impResult">
                                            <input type="hidden" name="avatar">
                                            <table class="table-container">
                                                <tr>
                                                    <td style="text-align:center;width: 45%">
                                                        <input type="file" id="files"
                                                               name="files" size="30"
                                                               onchange="uploadFile('files','msg')"/>
                                                    </td>
                                                    <td width="25%">
                                                        <span id="msg" class="label"></span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </form>
                                    </div>
                                </div>
                                <div id="avatar">

                                </div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">性别
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-3">
                                        <input name="sex" type="text"
                                               class="form-control"
                                               value="">
                                        </input>
                                    </div>
                                    <label class="col-md-1 control-label">民族
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-3">
                                        <input name="nation" type="text"
                                               class="form-control"
                                               value="">
                                        </input>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">出生
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-7">
                                        <input name="birthday" type="text"
                                               class="form-control  date-picker"
                                               value="">
                                        </input>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">地址
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-7">
                                        <input name="address" type="text"
                                               class="form-control"
                                               value="">
                                        </input>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">身份证号码
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-7">
                                        <input name="idcardno" type="text"
                                               class="form-control"
                                               value="">
                                        </input>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">签发单位
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-7">
                                        <input name="organization" type="text"
                                               class="form-control"
                                               value="">
                                        </input>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">有效期限
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-7">
                                        <input name="validStartStr" type="text"
                                               class="form-control  date-picker"
                                               value="" style="display: inline-block;width: 290px">
                                        </input>至
                                        <input name="validEndStr" type="text"
                                               class="form-control  date-picker"
                                               value="" style="display: inline-block;width: 300px">
                                        </input>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-4 col-md-8">
                                            <%--<button id="search" type="button" class="btn green"
                                                    data-loading-text="读卡中...">读卡
                                            </button>--%>
                                        <button id="btnPublish" type="button" class="btn green"
                                                data-loading-text="添加中...">添加
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
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script language="javascript" for="SynCardOcx1" event="CardIn( State );">
            {
                if (State == 1) {
                }
            }
        </script>

        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();


                //初始化
                /*SynCardOcx1.FindReader();
                 SynCardOcx1.SetPhotoName(2);
                 SynCardOcx1.SetPhotoType(2);
                 var str="D:\\Photo";
                 SynCardOcx1.SetPhotoPath(2,str);*/


                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: "yyyy-mm-dd",
                });

                $("#search").click(function (e) {
                    SynCardOcx1.SetReadType(0);
                    SynCardOcx1.SetViewPhoto(0);
                    var nRet = SynCardOcx1.ReadCardMsg();
                    if (nRet == 0) {
                        $("#tab_add input[name=name]").val(SynCardOcx1.NameA);
                        var sex = SynCardOcx1.sex;
                        var sexVal = "男"
                        if (sex == 2) {
                            sexVal = "女"
                        }
                        if (SynCardOcx1.Nation == "01") {
                            $("#tab_add input[name=nation]").val("汉族");

                        }
                        else {
                            $("#tab_add input[name=nation]").val("其他");
                        }
                        $("#tab_add input[name=sex]").val(sexVal);
                        $("#tab_add input[name=birthday]").val(SynCardOcx1.Born);
                        $("#tab_add input[name=address]").val(SynCardOcx1.Address);
                        $("#tab_add input[name=idcardno]").val(SynCardOcx1.CardNo);
                        $("#tab_add input[name=valid]").val(SynCardOcx1.UserLifeB + "-" + SynCardOcx1.UserLifeE);
                        $("#tab_add input[name=organization]").val(SynCardOcx1.Police);
                        $("#tab_add input[name=avatar]").val(SynCardOcx1.Base64Photo);
//                        $("#tab_add input[name=avatar]").val(SynCardOcx1.Base64Photo);
                        $("#avatar").html("<img style='width: 200px;height: 200px' src='data:image/jpg;base64," + SynCardOcx1.Base64Photo + "'>");
                    }
                });

                $("#btnPublish").click(function () {
                    var name = $("#tab_add input[name=name]").val();
                    if (name == null || name == "") {
                        $("#labelmsg").text('请填写名称').addClass("label-danger");
                        return false;
                    }
                    var sex = $("#tab_add input[name=sex]").val();
                    if (sex == null || sex == "") {
                        $("#labelmsg").text('性别不能为空').addClass("label-danger");
                        return false;
                    }
                    var nation = $("#tab_add input[name=nation]").val();
                    if (nation == null || nation == "") {
                        $("#labelmsg").text('民族不能为空').addClass("label-danger");
                        return false;
                    }
                    var birthday = $("#tab_add input[name=birthday]").val();
                    if (birthday == null || birthday == "") {
                        $("#labelmsg").text('出生年月日不能为空').addClass("label-danger");
                        return false;
                    }
                    var address = $("#tab_add input[name=address]").val();
                    if (address == null || address == "") {
                        $("#labelmsg").text('地址不能为空').addClass("label-danger");
                        return false;
                    }
                    var idcardno = $("#tab_add input[name=idcardno]").val();
                    if (idcardno == null || idcardno == "") {
                        $("#labelmsg").text('身份证号码不能为空').addClass("label-danger");
                        return false;
                    }
                    var organization = $("#tab_add input[name=organization]").val();
                    if (organization == null || organization == "") {
                        $("#labelmsg").text('签发单位不能为空').addClass("label-danger");
                        return false;
                    }
                    var avatar = $("#tab_add input[name=avatar]").val();
                    var validStartStr = $("#tab_add input[name=validStartStr]").val();
                    var validEndStr = $("#tab_add input[name=validEndStr]").val();
                    if (validStartStr == null || validStartStr == "" || validEndStr == null || validEndStr == '') {
                        $("#labelmsg").text('请选择详细的有效期限').addClass("label-danger");
                        return false;
                    }
                    $("#btnPublish").button("loading");
                    $.post(window.apppath + "/admin/api/elderly/preferentialTreatment/add", {
                        name: name,
                        sex: sex,
                        nation: nation,
                        birthday: birthday,
                        address: address,
                        avatar: avatar,
                        idcardno: idcardno,
                        organization: organization,
                        valid: validStartStr + "至" + validEndStr,
                        status: 0
                    }, function (res) {
                        $("#btnPublish").button('reset');
                        if (res.success) {
                            alertSuccess("提示信息", "添加成功", function () {
                                window.location.reload();
                            });
                        } else {
                            $("#labelmsg").text(res.message).addClass("label-danger");
                        }
                    }, "json");
                });

            })
            ;

            function uploadFile(file, msg) {
                var typeFile = $("#" + file).val().trim();
                if (typeFile != null && typeFile != "") {
                    var suffix = typeFile.substr(typeFile.lastIndexOf("."), typeFile.length);
                    $.ajaxFileUpload({
                        url: window.apppath + "/file/uploadFiles?path=preferential&createThumbnail=true&thumbnailWidth=80&thumbnailHeight=80",
                        secureuri: false,
                        fileElementId: file,//file控件id
                        dataType: 'json',
                        success: function (data, status) {
                            /*$("#" + msg).text("上传成功").addClass("label-danger");*/
                            $("input[name=avatar]").val(data.url);
                            $("#avatar").html("<img style='width: 200px;height: 200px' src='" + window.apppath + data.url + "'>");
                        },
                        error: function (data, status, e) {
                            console.log(e);
                        }
                    });
                } else {
                    $("#" + msg).text("请选择文件！").addClass("label-danger");
                }
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>


