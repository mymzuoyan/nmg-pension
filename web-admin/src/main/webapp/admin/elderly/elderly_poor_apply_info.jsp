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

            .table3 {
                border-top: 1px solid #000;
                border-left: 1px solid #000;
            }

            .table3 td {
                padding: 5px;
                border-bottom: 1px solid #000;
                border-right: 1px solid #000;
            }

            .table4 {
                border-top: 1px solid #000;
                border-left: 1px solid #000;
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
        </style>
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

            .file-div img {
                width: 100%;
                height: 100%;
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
                    <a href="#">老人信息管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">政府买居家养老服务申请</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet " style="padding-top: 0px !important;padding-bottom: 0px !important;">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">
                                <c:if test="${apply.status==0}">街道已登记，街道审核</c:if>
                                <c:if test="${apply.status==1}">初审(街道)通过,街道公示</c:if>
                                <c:if test="${apply.status==2}">初审(街道)不通过</c:if>
                                <c:if test="${apply.status==3}">街道已公示,是否有异议</c:if>
                                <c:if test="${apply.status==4}">公示无异议，区审核</c:if>
                                <c:if test="${apply.status==5}">公示有异议,街道再审核</c:if>
                                <c:if test="${apply.status==6}">区审核通过</c:if>
                                <c:if test="${apply.status==7}">区未审核通过</c:if>
                            </span>
                        </div>
                        <div class="tools">
                            <div style="float: left">
                                <c:if test="${apply.result!=1 and apply.result!=2  }">
                                    <shior:hasRole name="stadmin">
                                        <c:if test="${apply.status==0  or apply.status==1or apply.status==3or apply.status==5}">
                                            <a href="javascript:void(0)" onclick="ElderMsgPoorInfo.nextStep()"
                                               class="table-group-action-import btn btn-circle btn-import"><i
                                                    class="fa">审核</i>
                                            </a>
                                        </c:if>
                                    </shior:hasRole>
                                    <shior:hasRole name="readmin">
                                        <c:if test="${apply.status==4}">
                                            <a href="javascript:void(0)" onclick="ElderMsgPoorInfo.saveApply()"
                                               class="btn btn-circle btn-add">
                                                <i class="fa">保存</i>
                                            </a>
                                            <a href="javascript:void(0)" onclick="ElderMsgPoorInfo.nextStep()"
                                               class="table-group-action-import btn btn-circle btn-import"><i
                                                    class="fa">审核</i></a>
                                        </c:if>
                                    </shior:hasRole>
                                </c:if>

                            </div>
                        </div>
                    </div>
                    <div class="portlet-body" style="padding-top: 0px !important;">
                        <form id="poorApplyForm">
                            <div id="elderInfoDiv">
                                <table width="100%" cellpadding="5" cellspacing="0" style="margin-bottom: 10px">
                                    <tr>
                                        <td colspan="6" id="biaot" align="center">
                                            特困人员供养申请表
                                            <input type="hidden" name="id"
                                                   value="${apply.id}"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" align="right">
                                            编号：
                                            <input type="text" name="number" value="${apply.number}" class="number"
                                                   readonly="readonly"/>
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
                                            <input type="text" name="region1" value="${apply.region1}" size="10"
                                                   class="input"
                                                   readonly="readonly"/>
                                            区
                                            <input type="text" name="region2" value="${apply.region2}" size="10"
                                                   class="input"
                                                   readonly="readonly"/>
                                            街道（镇）
                                            <input type="text" name="region3" value="${apply.region3}" size="10"
                                                   class="input"
                                                   readonly="readonly"/>
                                            社区（村）
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="90" align="center">
                                            <font style="color:red">*</font>
                                            姓名
                                        </td>
                                        <td width="208" align="center">
                                            <input type="text" name="name" value="${apply.name}" size="20"
                                                   class="form-control" readonly
                                                   style="width: 100%;"/>
                                        </td>
                                        <td align="center" width="156">
                                            <font style="color:red">*</font>
                                            身份证号
                                        </td>
                                        <td width="246" rowspan="">
                                            <input type="text" name="idcardno" class="form-control"
                                                   value="${apply.idcardno}" readonly
                                            />
                                        </td>
                                        <td align="center" colspan="2">
                                            <font style="color:red">*</font>
                                            性别
                                        </td>
                                        <td align="left">
                                            <input id="sex1" type="radio" name="sex" value="1" readonly="readonly"
                                                   disabled
                                                    <c:if test="${apply.sex==1}"> checked</c:if> />
                                            <label for="sex1">男</label>
                                            <input id="sex2" type="radio" name="sex" value="2" readonly="readonly"
                                                   disabled
                                                    <c:if test="${apply.sex==2}"> checked</c:if>/>
                                            <label for="sex2">女</label>
                                        </td>
                                        <td rowspan="3" style="width: 200px;height: 200px;">
                                            <img style="width: 100%;height: 100%"
                                                 src="${pageContext.request.contextPath }${apply.avatar}">
                                        </td>

                                    </tr>
                                    <tr>
                                        <td align="center">
                                            民族
                                        </td>
                                        <td align="left">
                                            <lb:select name="nation" cssClass="form-control" value="${apply.nation}"
                                                       readOnly="true">
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
                                            <input type="text" name="regPlace" id="regPlace" value="${apply.regPlace}"
                                                   class="form-control" readonly
                                                   size="25" style="width: 100%;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>出生年月</td>
                                        <td>
                                            <input type="text" name="birthday" class="form-control" size="15"
                                                   readonly="readonly" value="${apply.birthday}"/>
                                        </td>
                                        <td align="center">
                                            <font style="color:red">*</font>
                                            住址
                                        </td>
                                        <td colspan="4">
                                            <input type="text" name="address" id="address" style="width: 100%"
                                                   class="form-control" readonly
                                                   value="${apply.address}"/>
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
                                            <input type="hidden" name="identification" value="${apply.identification}">
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
                                            <input type="hidden" name="incomeCertificate"
                                                   value="${apply.incomeCertificate}">
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
                                            <input type="hidden" name="propertyCertificate"
                                                   value="${apply.propertyCertificate}">
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
                                            <input type="hidden" name="writtenStatement"
                                                   value="${apply.writtenStatement}">
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
                                            <input type="hidden" name="commitment" value="${apply.commitment}">
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
                                            <input type="hidden" name="otherAttches" value="${apply.otherAttches}">
                                        </td>
                                    </tr>
                                </table>
                                <br>
                                <div class="row DTTTFooter">
                                    <div class="col-sm-12" style="text-align: right">
                                        <div class="" role="status" aria-live="polite" style="font-size: 18px">
                                            <span>本人(或家属)签字</span>
                                            <span style="border-bottom: #000 1px solid;" id="signSpan">
                                                <c:if test="${not empty apply.sign}">
                                                      <img style='width: 100px;height: 50px'
                                                           src='data:image/jpg;base64,${apply.sign}'>
                                                </c:if>
                                         </span>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${apply.result==2  }">
                                    <table width="100%" cellpadding="0" cellspacing="0" class="table1">
                                        <tr>
                                            <td width="10%">
                                                备注
                                            </td>
                                            <td>
                                                    ${apply.note}
                                            </td>
                                        </tr>
                                    </table>
                                </c:if>
                            </div>
                            <br/>
                        </form>
                    </div>
                </div>
            </div>
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
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/elderly/elderly_poor_info.js?v=3.3"
                type="text/javascript"></script>
        <script>
            jQuery(document).ready(function () {
                //checkbox初始化
                Metronic.init();
                Layout.init();
                setAttachValue("identification");
                setAttachValue("incomeCertificate");
                setAttachValue("propertyCertificate");
                setAttachValue("writtenStatement");
                setAttachValue("commitment");
                setAttachValue("otherAttches");
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
                <c:if test="${not empty nameError}">
                alert("${nameError}");
                </c:if>
                ElderMsgPoorInfo.init("${apply.status}");
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

            function setAttachValue(id) {
                var str = $("input[name=" + id + "]").val();
                if (str != null && str != "") {
                    var strs = str.split(",");
                    for (var i in strs) {
                        var fileName = strs[i];
                        if (fileName == null || fileName == "")
                            break;
                        var html = "";
                        if (!(/\.(jpe?g|gif|png|ico)$/i).test(fileName)) {
                            html = "<label style='margin: 0px;    vertical-align: top'>" + fileName + "</label>"
                        }
                        else {
                            var path = fileName.substr(0, fileName.lastIndexOf(".")) + "_80_80" + fileName.substr(fileName.lastIndexOf("."));
                            html = "<div class='file-div'><a target='_blank' href='" + window.apppath + path + "'><img src='" + window.apppath + path + "'></a></div>"

                        }
                        $("." + id + "Input").append(html);
                    }
                }
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
