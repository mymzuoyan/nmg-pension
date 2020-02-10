<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/7
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <title>特困人员申请</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/alertStyle.css"/>
    <link href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/css/bootstrap.min.css"
          rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
    <link href="${pageContext.request.contextPath }/assets/global/plugins/font-awesome/css/font-awesome.min.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/assets/global/plugins/simple-line-icons/simple-line-icons.min.css"
          rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/favicon.ico"/>
    <style>
        a
        {
            text-decoration: none;
        }
        a:hover, a:focus
        {
            text-decoration: none;
        }
        .news_list_con {
            min-height: 500px;
            position: relative
        }
         .t {
             border-collapse: collapse;
         }

        .t td {
            border: 1px solid #000;
        }

        .t input {
            width: 98%;
            border: 0px;
        }

        .t textarea {
            width: 98%;
            border: 0px;
            overflow: auto;
        }

        .table1 {
            border-top: 1px solid #000;
            border-left: 1px solid #000;
        }

        .table1 td {
            padding: 5px;
            border-bottom: 1px solid #000;
            border-right: 1px solid #000;
        }

        .table3 td {
            padding: 5px;
            border-bottom: 1px solid #000;
            border-right: 1px solid #000;
        }

        .table4 td {
            padding: 5px;
            border-bottom: 1px solid #000;
            border-right: 1px solid #000;
        }

        #biaot {
            font-weight: bold;
            font-size: 25px;
        }

        input[type=file]
        {
            cursor: pointer;
        }

        .number {
            border: 0px;
            border-bottom: 1px solid #000;
        }

        .file-box-list {
            vertical-align: top;
        }
        .remove {
            color: red;
            font-size: 17px;
            cursor: pointer;
            text-decoration: none;
        }

        .removeImg {
            z-index: 2;
            width: 80px;
            height: 80px;
            position: absolute;
            right: 0px;
            background-image: url("${pageContext.request.contextPath }/assets/global/img/delete.png");
            background-position: 50% 50%;
        }

        .file-box {
            position: relative;
            width: 80px;
            height: 80px;
            border: 1px solid #D9D9D9;
            background-image: url("${pageContext.request.contextPath }/assets/admin/pages/img/add.png");
        }

        .file-div {
            width: 80px;
            height: 80px;
            margin-right: 10px;
            display: inline-block;
            position: relative;
            vertical-align: text-bottom;
        }

        .file-div img {
            width: 100%;
            height: 100%;
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
</head>
<body>
<!--头部-->
<!--头部  begin-->
<jsp:include page="view_header.jsp"/>
<!--头部  end-->
<section id="main_con" class="content_box">
    <!--养老动态-->

    <!--右侧内容star-->
    <div id="news_rt_con" style="width: 100%">
        <div class="news_list_con_wrap">
            <div class="news_list_con">
                <c:if test="${ empty sessionScope.login_user}">
                    您还未登录
                </c:if>
                <c:if test="${!empty sessionScope.login_user}">
                <form id="poorApplyForm">
                    <table width="100%" cellpadding="5" cellspacing="0" style="margin-bottom: 10px">
                        <tr>
                            <td id="biaot" align="center">
                                特困人员供养申请表
                                <input type="hidden" name="areaName"
                                       value="${sessionScope.login_user.areaName}"/>
                            </td>
                        </tr>
                    </table>
                    <table width="100%" cellpadding="0" cellspacing="0" class="table1">
                        <tr>
                            <td colspan="8" align="center">
                                <font>一、基本情况（街道审核确认）</font>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="8" align="left">
                                <input type="hidden" id="province" value="0">
                                <input type="hidden" id="city" value="1">
                                <select name="county" class="input" id="county"
                                        onChange="EographicArea.changeCounty();"
                                        readonly="readonly" >
                                    <option value="">行政区，市，县</option>
                                </select>
                                <select name="town" class="input" id="town"
                                        onChange="EographicArea.changeTown();"
                                        readonly="readonly" >
                                    <option value="">街道，乡，镇</option>
                                </select>
                                <select name="areaId" class="input" id="village"
                                        onChange="EographicArea.changeVillage();"

                                        readonly="readonly" >
                                    <option value="">社区，村</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td width="90" align="center">
                                <font style="color:red">*</font>
                                姓名
                            </td>
                            <td width="208" align="center">
                                <input type="text" name="name" value="" size="20" class="form-control"
                                       style="width: 100%;"/>
                            </td>
                            <td align="center" width="156">
                                <font style="color:red">*</font>
                                身份证号
                            </td>
                            <td width="246" rowspan="">
                                <input type="text" name="idcardno" class="form-control" value=""
                                />
                            </td>
                            <td align="center" colspan="2">
                                <font style="color:red">*</font>
                                性别
                            </td>
                            <td align="left">
                                <input id="sex1" type="radio" name="sex" value="1"/>
                                <label for="sex1">男</label>
                                <input id="sex2" type="radio" name="sex" value="2"/>
                                <label for="sex2">女</label>
                                <input type="hidden" name="avatar">
                            </td>
                            <td rowspan="3" style="width: 200px;height: 200px;" >
                                <div style="width:100%;height:100%;background-image: url('${pageContext.request.contextPath }/assets/global/img/uploadAvatar.png?v=1');background-repeat: no-repeat">
                                    <input type="file" name="files" id="avatarInput" onchange="updateAvatar('avatarInput','avatar')"
                                           style="opacity: 0;width: 100%;height: 100%">
                                </div>
                            </td>

                        </tr>
                        <tr>
                            <td align="center">
                                民族
                            </td>
                            <td align="left">
                                <lb:select name="nation" cssClass="form-control">
                                    <lb:option value="">--请选择--</lb:option>
                                    <lb:option value="汉族">汉族</lb:option>
                                    <lb:option value="回族">回族</lb:option>
                                    <lb:option value="布依族">布依族</lb:option>
                                    <lb:option value="藏族">藏族</lb:option>
                                    <lb:option value="朝鲜族">朝鲜族</lb:option>
                                    <lb:option value="满族">满族</lb:option>
                                    <lb:option value="蒙古族">蒙古族</lb:option>
                                    <lb:option value="维吾尔族">维吾尔族</lb:option>
                                    <lb:option value="土家族">土家族</lb:option>
                                    <lb:option value="壮族">壮族</lb:option>
                                    <lb:option value="苗族">苗族</lb:option>
                                    <lb:option value="其他">其他</lb:option>
                                </lb:select>
                            </td>
                            <td align="center">
                                <font style="color:red">*</font>
                                户籍地址
                            </td>
                            <td colspan="4">
                                <input type="text" name="regPlace" id="regPlace" value="" class="form-control"
                                       size="25" style="width: 100%;"/>
                            </td>
                        </tr>
                        <tr>
                            <td>出生年月</td>
                            <td>
                                <input type="text" name="birthday" value="" size="15"
                                       class="form-control input date-picker" data-date-format="yyyy-mm-dd"/>
                            </td>
                            <td align="center">
                                <font style="color:red">*</font>
                                住址
                            </td>
                            <td colspan="4">
                                <input type="text" name="address" id="address" style="width: 100%"
                                       class="form-control"
                                       value=""/>
                            </td>
                        </tr>
                    </table>
                    <br/>
                    <table width="100%" cellpadding="0" cellspacing="0" class="table1">
                        <tr>
                            <td align="center">二、材料上传</td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                户口簿、居民身份证、第二代《中华人民共和国残疾证》等有效身份证明
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="file-box-list identificationInput"
                                     style="display: inline-block;margin: 0px"></div>
                                <div style="display: inline-block" class="file-box">
                                    <input type="file" name="files" id="identificationInput"
                                           onchange="UploadFile('identificationInput','identification')"
                                           style="opacity: 0;">
                                </div>
                                <input type="hidden" name="identification">
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                收入证明
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="file-box-list incomeCertificateInput"
                                     style="display: inline-block;margin: 0px"></div>
                                <div style="display: inline-block" class="file-box">
                                    <input type="file" name="files" id="incomeCertificateInput"
                                           onchange="UploadFile('incomeCertificateInput','incomeCertificate')"
                                           style="opacity: 0;">
                                </div>
                                <input type="hidden" name="incomeCertificate">
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                房产证明
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="file-box-list propertyCertificateInput"
                                     style="display: inline-block;margin: 0px"></div>
                                <div style="display: inline-block" class="file-box">
                                    <input type="file" name="files" id="propertyCertificateInput"
                                           onchange="UploadFile('propertyCertificateInput','propertyCertificate')"
                                           style="opacity: 0;">
                                </div>
                                <input type="hidden" name="propertyCertificate">
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                劳动能力、生活来源、财产状况以及赡养、抚养、扶养情况的书面声明
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="file-box-list writtenStatementInput"
                                     style="display: inline-block;margin: 0px"></div>
                                <div style="display: inline-block" class="file-box">
                                    <input type="file" name="files" id="writtenStatementInput"
                                           onchange="UploadFile('writtenStatementInput','writtenStatement')"
                                           style="opacity: 0;">
                                </div>
                                <input type="hidden" name="writtenStatement">
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                承诺所提供信息真实、完整的承诺书
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="file-box-list commitmentInput"
                                     style="display: inline-block;margin: 0px"></div>
                                <div style="display: inline-block" class="file-box">
                                    <input type="file" name="files" id="commitmentInput"
                                           onchange="UploadFile('commitmentInput','commitment')"
                                           style="opacity: 0;">
                                </div>
                                <input type="hidden" name="commitment">
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                能证明特困人员的其它材料
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="file-box-list otherAttchesInput"
                                     style="display: inline-block;margin: 0px"></div>
                                <div style="display: inline-block" class="file-box">
                                    <input type="file" name="files" id="otherAttchesInput"
                                           onchange="UploadFile('otherAttchesInput','otherAttches')"
                                           style="opacity: 0;">
                                </div>
                                <input type="hidden" name="otherAttches">
                            </td>
                        </tr>
                    </table>
                    <br/>
                    <table width="100%" cellpadding="0" cellspacing="0" class="table2">
                        <tr>
                            <td style="text-align: center">
                                <button type="button"  onclick="ElderMsgPoorApply.saveApply()" class="btn btn-primary">提交</button>

                            </td>
                        </tr>
                    </table>
                </c:if>
            </div>
        </div>
    </div>
    <!--右侧内容end-->
</section>
<%--footer begin--%>
<jsp:include page="view_footer.jsp"></jsp:include>
<%--footer end--%>

<div id="alertModal2" class='alert_wrap' style="display: none">
    <div class="alert_main">
        <div class="alert_wrap_con">
            <div class="alert_head_wrap">
                <h4 style="margin: 0px;padding: 10px">提示信息</h4>
                <a class="cancel" href="javascript:void(0)">×</a>
            </div>
            <div class="alert_info_con">
                <p class="alertModalMes" style="text-align: center"></p>
            </div>
            <div class="alert_btm_con">
                <a href="javascript:void(0)" style="width: 30%" class="confirm lg_btn">确定</a>
                <a href="javascript:void(0)" style="width: 30%;margin-left: 20%" class="cancel lg_btn">取消</a>

            </div>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/jquery.blockui.min.js"
        type="text/javascript"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/elderMsg/elderMsg_poor_apply.js?v=3.2"
        type="text/javascript"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js?v=1"></script>
<script src="${pageContext.request.contextPath }/assets/view/js/function.js"></script>

<script>
    $(function () {
        window.apppath = "${pageContext.request.contextPath }";
        $('.date-picker').datepicker({
            rtl: Metronic.isRTL(),
            orientation: "left",
            autoclose: true
        });
        EographicArea.init();
        EographicArea.changeCity();
        ElderMsgPoorApply.init();
    });

    function updateAvatar(id,name) {
        var fileName = $("#" + id).val();
        if (fileName == null || fileName == "")
            return false;
        if (!(/\.(jpe?g|gif|png|ico)$/i).test(fileName)) {
            alert("请上传图片");
            $("#" + id).val("");
            return false;
        }
        $.ajaxFileUpload({
            url: window.apppath + "/admin/api/elderMsg/poor/upload?path=serviceUser&createThumbnail=true&thumbnailWidth=80&thumbnailHeight=80",
            secureuri: false,
            fileElementId: id,//file控件id
            dataType: 'json',
            success: function (data, status) {
                if (data.error == 0) {
                    var path = data.url.substr(0, data.url.lastIndexOf(".")) + "_80_80" + data.url.substr(data.url.lastIndexOf("."))
                    var html = "<img style='width: 100%;height: 100%' src='" + window.apppath + path + "'/>"
                    $("#"+id).parent().parent().html(html);
                    $("input[name=" + name + "]").val(data.url );
                }
            },
        });
    }

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
            url: window.apppath + "/admin/api/elderMsg/poor/upload?path=serviceUser&createThumbnail=true&thumbnailWidth=80&thumbnailHeight=80",
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

    function alert(res, callback) {
        $("#alertModal2 .alertModalMes").html(res);
        $('#alertModal2').show();

        $("#alertModal2 .confirm").unbind('click').click(function () {
            $("#alertModal2").hide();
            if (callback != null)
                callback();
        })

        $("#alertModal2 .cancel").unbind('click').click(function () {
            $("#alertModal2").hide();
        })

    }
</script>
</html>
