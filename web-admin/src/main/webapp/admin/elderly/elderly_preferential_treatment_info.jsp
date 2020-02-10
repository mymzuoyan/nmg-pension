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
        <title> 老年优待证信息详细</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/admin/pages/css/card-scan.css"/>
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
        <object id="mfc" classid="clsid:23794B9F-8883-44DB-9A95-D5D197F15200"
                codebase="CSmart510OCX.ocx" height="100" width="100" style="display: none;"></object>

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
                    <a href="#"> 老年优待证信息详细</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            老年优待证信息详细
                        </div>
                    </div>
                    <div class="portlet-body form" id="tab_add">
                        <div class="form-horizontal">
                            <div class="form-body">
                                <div class="form-group">
                                    <label class="col-md-1 control-label">编号
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-3">
                                        <input name="number" type="text"
                                               class="form-control"
                                               value="${treatment.number}" readonly>
                                        </input>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input name="id" type="hidden"
                                           class="form-control"
                                           value="${treatment.id}">
                                    </input>
                                    <label class="col-md-1 control-label">姓名
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-3">
                                        <input name="name" type="text"
                                               class="form-control"
                                               value="${treatment.name}" readonly>
                                        </input>
                                    </div>
                                </div>
                                <div id="avatar">
                                        <img style="width: 200px;height: 200px" src="${pageContext.request.contextPath}${treatment.avatar}">
                                </div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">性别
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-3">
                                        <input name="sex" type="text"
                                               class="form-control"
                                               value="${treatment.sex}" readonly>
                                        </input>
                                    </div>
                                    <label class="col-md-1 control-label">民族
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-3">
                                        <input name="nation" type="text"
                                               class="form-control"
                                               value="${treatment.nation}" readonly>
                                        </input>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">出生
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-7">
                                        <input name="birthday" type="text"
                                               class="form-control"
                                               value="${treatment.birthday}" readonly>
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
                                               value="${treatment.address}" readonly>
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
                                               value="${treatment.idcardno}" readonly>
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
                                               value="${treatment.organization}" readonly>
                                        </input>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">有效期限
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-7">
                                        <input name="valid" type="text"
                                               class="form-control"
                                               value="${treatment.valid}" readonly>
                                        </input>
                                    </div>
                                </div>
                                <c:if test="${treatment.status==0}">
                                    <div class="form-group">
                                        <label class="col-md-1 control-label">审核
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-7">
                                            <select id="status" type="text"
                                                    class="form-control">
                                                <option value="1">审核通过</option>
                                                <option value="2">审核不通过</option>
                                            </select>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                            <c:if test="${treatment.status==0}">
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-offset-4 col-md-8">
                                            <button id="btnPublish" type="btn" class="btn green"
                                                    data-loading-text="审核中...">审核
                                            </button>
                                            <span id="labelmsg" class="label "></span>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${treatment.status==1 or treatment.status==3}">
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-offset-4 col-md-8">
                                            <button id="scan" type="btn" class="btn blue"
                                                    data-loading-text="">预览
                                            </button>
                                                <%--<c:if test="${treatment.status==1}">--%>

                                            <button style="margin-left: 20px" id="createA" type="btn" class="btn green"
                                                    data-loading-text="制卡中...">制卡(正面)
                                            </button>
                                                <%--</c:if>--%>
                                            <button style="margin-left: 20px" id="createB" type="btn" class="btn green"
                                                    data-loading-text="制卡中...">制卡(反面)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
        <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal"
                                aria-hidden="true"></button>
                        <h4 class="modal-title"
                            id="myModalLabel">预览</h4>
                    </div>
                    <div class="modal-body">
                        <div class="front" style="zoom:0.55">
                            <div class="title"></div>
                            <div class="form">
                                <form action="">
                                    <div class="line number">
                                        <span class="field">编号：</span><input type="text" value="${treatment.number}">
                                    </div>
                                    <div class="line name">
                                        <span class="field">姓名：</span><input type="text" value="${treatment.name}">
                                    </div>
                                    <div class="line id">
                                        <span class="field">身份证号码：</span><input type="text" value="${treatment.idcardno}" style="width: 239px">
                                    </div>
                                </form>
                            </div>
                            <div class="badge" style="background-color: transparent"><img src="${pageContext.request.contextPath }/assets/admin/pages/img/front/badge.png" alt=""></div>
                            <div class="right">
                                <img style="width: 286px;height: 367px" src="${pageContext.request.contextPath}${treatment.avatar}">

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn default" data-dismiss="modal">关闭
                        </button>
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
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();

                $("#scan").click(function () {
                    $("#modal").modal("show");
                })

                $("#btnPublish").click(function (e) {
                    var id = $("#tab_add input[name=id]").val();
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
                    var valid = $("#tab_add input[name=valid]").val();
                    if (valid == null || valid == "") {
                        $("#labelmsg").text('有效期限不能为空').addClass("label-danger");
                        return false;
                    }
                    $("#btnPublish").button("loading");
                    $.post(window.apppath + "/admin/api/elderly/preferentialTreatment/update", {
                        id:id,
                        name: name,
                        sex: sex,
                        nation: nation,
                        birthday: birthday,
                        address: address,
                        idcardno: idcardno,
                        organization: organization,
                        valid: valid,
                        status: $("#status").val()
                    }, function (res) {
                        $("#btnPublish").button('reset');
                        if (res.success) {
                            alertSuccess("提示信息", "添加成功", function () {
                                window.parent.updateTab("elderly-preferential-treatment-list");
                                window.location.reload();
                            });
                        } else {
                            $("#labelmsg").text(res.message).addClass("label-danger");
                        }
                    }, "json");
                });


                $("#createA").click(function () {
                    var dwRet;

                    mfc.Size=40;
                    mfc.Weight=800;//400是正常，800是加粗
                    mfc.FontName="黑体";

                    mfc.FrontImgURL = "http://www.njyl12349.com/file/img/front.jpg";  //背景
                    mfc.FrontImgX = 0;
                    mfc.FrontImgY = 0;
                    mfc.FrontImgCX = 1016;
                    mfc.FrontImgCY = 642;

                    var avatar="${treatment.avatar}";
                    mfc.HeadImgURL = avatar;  //头像
                    mfc.HeadImgX = 60;
                    mfc.HeadImgY = 14;
                    mfc.HeadImgCX = 285;
                    mfc.HeadImgCY =355;

                    mfc.SealURL = ""; //印章
                    mfc.SealX = 30;
                    mfc.SealY = 50;
                    mfc.SealCX = 150;
                    mfc.SealCY = 150;

                    var number="${treatment.number}";
                    mfc.ID=number.trim();
                    mfc.ID_X=160;
                    mfc.ID_Y=340;


                    var name="${treatment.name}";
                    mfc.Name=name.trim();   //姓名
                    mfc.Name_X=160;
                    mfc.Name_Y=410;

                    var idcardno="${treatment.idcardno}";
                    mfc.IDNum=idcardno.trim();   //姓名
                    mfc.IDNum_X=270;
                    mfc.IDNum_Y=480;

                    dwRet= mfc.Print;
                    if(dwRet==0)
                    {
                        var id = $("#tab_add input[name=id]").val();
                        $.post(window.apppath + "/admin/api/elderly/preferentialTreatment/update", {
                            id:id,
                            status: 3
                        }, function (res) {
                            $("#btnPublish").button('reset');
                            if (res.success) {
                                alertSuccess("提示信息", "打印成功", function () {
                                    window.parent.updateTab("elderly-preferential-treatment-list");
                                    window.location.reload();
                                });
                            } else {
                                $("#labelmsg").text(res.message).addClass("label-danger");
                            }
                        }, "json");
                    }
                    else
                    {
                        alert("打印失败");

                    }

                })

                $("#createB").click(function () {
                    var dwRet;

                    mfc.Size=40;
                    mfc.Weight=800;//400是正常，800是加粗
                    mfc.FontName="黑体";

                    mfc.FrontImgURL = "http://www.njyl12349.com//file/img/back.jpg";  //背景
                    mfc.FrontImgX = 0;
                    mfc.FrontImgY = 0;
                    mfc.FrontImgCX = 1016;
                    mfc.FrontImgCY = 642;
                    dwRet= mfc.Print;
                    if(dwRet==0)
                    {
                        alert("打印成功");
                    }
                    else
                    {
                        alert("打印失败");

                    }
                })

            })
            ;
            function UploadFile(id, name) {
                var fileName = $("#" + id).val();
                if (fileName == null || fileName == "") {
                    return false;
                }
                if (!(/\.(jpe?g|gif|png|ico)$/i).test(fileName)) {
                    alert("请上传图片");
                    $("#" + id).val("");
                    return false;
                }
                $.ajaxFileUpload({
                    url: window.apppath + "/admin/api/assessProject/geracomium/upload?path=attach&createThumbnail=true&thumbnailWidth=80&thumbnailHeight=80",
                    secureuri: false,
                    fileElementId: id,//file控件id
                    dataType: 'json',
                    success: function (data, status) {
                        if (data.error == 0) {
                            fileName = fileName.substr(fileName.lastIndexOf("\\") + 1, fileName.length - 1);
                            var html = "";
                            if (!(/\.(jpe?g|gif|png|ico)$/i).test(fileName)) {
                                html = "<label style='margin: 0px;    vertical-align: top'>" + fileName + "<a style='text-decoration: none' data='" + data.url + "' class='remove'>&times;</a></label>"
                            }
                            else {
                                var path = data.url.substr(0, data.url.lastIndexOf(".")) + "_80_80" + data.url.substr(data.url.lastIndexOf("."))
                                html = "<div class='file-div''><img class='uploadImg' src='" + window.apppath + path + "'><a style='text-decoration: none;display: none' data='" + data.url + "' class=' remove removeImg'></a></div>"
                            }
                            $("." + id + "").append(html);
                            $(".remove").click(function () {
                                var url = $(this).attr("data");
                                $(this).parent().remove();
                                var urls = $("input[name=" + name + "]").val();
                                urls = urls.replace(url + ",", "")
                                $("input[name=" + name + "]").val(urls);
                            });
                            $(".uploadImg").hover(function () {
                                $(this).parent().find(".remove").css("display", "inherit");
                            })
                            $(".remove").hover(function () {
                            }, function () {
                                $(this).hide();
                            })
                            $("#" + id).val("");
                            $("input[name=" + name + "]").val($("input[name=" + name + "]").val() + data.url + ",");
                        }
                    }
                });

            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

