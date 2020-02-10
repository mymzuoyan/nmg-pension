<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>特困人员信息</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>

        <style>
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

            input {
                border: 0px;
                background-color: white;
            }

            .number {
                border: 0px;
                border-bottom: 1px solid #000;
            }

            .file-box-list {
                vertical-align: top;
            }

            #signSpan img {

            }
        </style>
        <style>
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
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">
        <!-- BEGIN PAGE HEADER-->
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">政府购买服务</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">特困人员供养申请</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet " style="padding-top: 0px !important;padding-bottom: 0px !important;">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">特困人员供养申请登记</span>
                        </div>
                        <div class="tools">
                            <div style="float: left">
                                <a href="javascript:void(0)" onclick="ElderMsgPoorApply.saveApply()"
                                   class="btn btn-circle btn-add">
                                    <i class="fa">保存</i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="portlet-body" style="padding-top: 0px !important;">
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
                                                readonly="readonly">
                                            <option value="">行政区，市，县</option>
                                        </select>
                                        <select name="town" class="input" id="town"
                                                onChange="EographicArea.changeTown();"
                                                readonly="readonly" >
                                            <option value="">街道，乡，镇</option>
                                        </select>
                                        <select name="areaId" class="input" id="village"
                                                onChange="EographicArea.changeVillage();"
                                                readonly="readonly">
                                            <option value="">社区，村</option>
                                        </select>
                                            <%--<input type="text" name="region2" value="" size="10" class="input"--%>
                                            <%--/>--%>
                                            <%--街道（镇）--%>
                                            <%--<input type="text" name="region3" value="" size="10" class="input"--%>
                                            <%--/>--%>
                                            <%--社区（村）--%>
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
                                               style="width: 180px;display: inline-block"
                                        />
                                        <input type="button" value="查询" onClick="ElderMsgPoorApply.queryElder()"/>
                                        <input type="hidden" name="elderId" value=""/>
                                        <input type="hidden" name="age" value=""/>
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
                                    <td rowspan="3" style="width: 200px;height: 200px;">
                                        <div style="width:100%;height:100%;background-image: url('${pageContext.request.contextPath }/assets/global/img/uploadAvatar.png?v=1');background-repeat: no-repeat">
                                            <input type="file" name="files" id="avatarInput"
                                                   onchange="updateAvatar('avatarInput','avatar')"
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
                            <br>
                            <div class="row DTTTFooter">
                                <div class="col-sm-12" style="text-align: right">
                                    <div class="" role="status" aria-live="polite" style="font-size: 18px">
                                        <span>本人(或家属)签字</span>
                                        <input type="hidden" name="sign">
                                        <span style="border-bottom: #000 1px solid;" id="signSpan">
                                            <a href="#" class="btn btn-xs default" onclick="showModal()">
                                                签名 <i class="fa fa-edit"></i>
                                            </a>

                                         </span>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- 导入模态框（Modal） -->
        <div class="modal" id="HWModal" tabindex="" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;
                        </button>
                        <h4 class="modal-title" id="impModalLabel">请签名...</h4>
                    </div>
                    <div class="modal-body" style="text-align: center">
                        <object id="HWPenSign" style="border: 0px"
                                name="HWPenSign"
                                classid="clsid:E8F5278C-0C72-4561-8F7E-CCBC3E48C2E3"
                                width="560"
                                height="300">
                        </object>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" onclick="HWInitialize()"
                        >重置
                        </button>
                        <button type="button" class="btn btn-primary" onclick="saveSign()"
                        >确认
                        </button>
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script type="text/javascript" charset="utf-8"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/elderly/elderly_poor_apply.js?v=3.5"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js?v=1"></script>
        <script src="${pageContext.request.contextPath }/assets/view/js/function.js?v=1.2"></script>

        <script>
            penwidth = 3;
            var obj;

            window.onload = function () {
                obj = document.getElementById("HWPenSign");
                if (isIE) {
                    try {
                        obj.HWSetBkColor(0xE0F8E0);
                        obj.HWSetCtlFrame(2, 0x000000);
                        var status = obj.HWGetDevStatus();
                        if (status == -1) {
                            alert("请连接手写设备", function () {
                                window.location.reload();
                            });
                        }
                        obj.HWInitialize();
                    } catch (err) {
                        // alert("请先下载控件<br>" +
                        //     "<a href='" + window.apppath + "/file/ocx/HWSetUp.exe'>控件下载", function () {
                        //     window.location.reload();
                        // });
                    }
                }
                else {
                    alert("签名控件只能在ie浏览器才能运行")
                }
            };


            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();

                //关闭
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
                EographicArea.initWith("${sessionScope.login_user.areaName}");
                EographicArea.changeCity();
                ElderMsgPoorApply.init();


                $('#HWModal').on('hidden.bs.modal', function (e) {
                    // do something...
                    obj.HWClearPenSign();
                    obj.HWFinalize();
                })
            });


            /**
             * 显示签名区域
             */
            function showModal() {
                $("#HWModal").modal("show");
                $("#HWPenSign").show();
                HWInitialize();
            }

            /**
             * 签名板初始化
             * @constructor
             */
            function HWInitialize() {
                obj.HWInitialize();
                obj.HWClearPenSign();
            }

            /**
             * 签名完成
             */
            function signComplete() {
                saveSign();
            }


            /**
             * 保存签名
             */
            function saveSign() {
                var stream;
                stream = obj.HWGetBase64Stream(2);
                $("input[name=sign]").val(stream);
                $("#HWModal").modal("hide");
                $("#signSpan").html("<img style='width: 100px;height: 50px' src='data:image/jpg;base64," + stream + "'>");
            }


            function updateAvatar(id, name) {
                var fileName = $("#" + id).val();
                if (fileName == null || fileName == "")
                    return false;
                if (!(/\.(jpe?g|gif|png|ico)$/i).test(fileName)) {
                    alert("请上传图片");
                    $("#" + id).val("");
                    return false;
                }
                $.ajaxFileUpload({
                    url: window.apppath + "/admin/api/elderly/poor/upload?path=avatar&createThumbnail=true&thumbnailWidth=80&thumbnailHeight=80",
                    secureuri: false,
                    fileElementId: id,//file控件id
                    dataType: 'json',
                    success: function (data, status) {
                        if (data.error == 0) {
                            var path = data.url.substr(0, data.url.lastIndexOf(".")) + "_80_80" + data.url.substr(data.url.lastIndexOf("."));
                            var html = "<img style='width: 100%;height: 100%' src='" + window.apppath + path + "'/>";
                            $("#" + id).parent().parent().html(html);
                            $("input[name=" + name + "]").val(data.url);
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
                    url: window.apppath + "/admin/api/elderly/poor/upload?path=attach&createThumbnail=true&thumbnailWidth=80&thumbnailHeight=80",
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
                                var path = data.url.substr(0, data.url.lastIndexOf(".")) + "_80_80" + data.url.substr(data.url.lastIndexOf("."));
                                html = "<div class='file-div''><img class='uploadImg' src='" + window.apppath + path + "'><a style='text-decoration: none;display: none' data='" + data.url + "' class=' remove removeImg'></a></div>"
                            }
                            $("." + id + "").append(html);
                            $(".remove").click(function () {
                                var url = $(this).attr("data");
                                $(this).parent().remove();
                                var urls = $("input[name=" + name + "]").val();
                                urls = urls.replace(url + ",", "");
                                $("input[name=" + name + "]").val(urls);
                            });
                            $(".uploadImg").hover(function () {
                                $(this).parent().find(".remove").css("display", "inherit");
                            });
                            $(".remove").hover(function () {
                            }, function () {
                                $(this).hide();
                            });
                            $("#" + id).val("");
                            $("input[name=" + name + "]").val($("input[name=" + name + "]").val() + data.url + ",");
                        }
                    }
                });
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
