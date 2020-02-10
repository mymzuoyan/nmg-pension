<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>养老机构</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jquery-multi-select/css/multi-select.css?v=1.1"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
        <style>
            #attachDiv img {
                width: 100px;
                height: 100px;
            }

            #attachDiv a {
                margin-right: 20px;
                line-height: 35px;
                font-size: 20px;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">

        <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
        <div class="modal fade" id="areaModal" tabindex="-1"
             role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal"
                                aria-hidden="true"></button>
                        <h4 class="modal-title"
                            id="myModalLabel">请选择所属区域</h4>
                    </div>
                    <div class="modal-body">
                        <div id="areaTree"
                             class="tree-demo"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn blue"
                                onclick="ServiceOrgDetail.getAreaName()">
                            确定
                        </button>
                        <button type="button"
                                class="btn default"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        <div class="row">
            <div class="col-md-12">
                <!-- Begin: life time stats -->
                <div class="portlet " style="padding-top: 0px !important;">
                    <div class="portlet-title">
                        <div class="caption tabbable-line" style="padding: 0px">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/institution/detail/${m.id}'"
                                       data-toggle="tab" aria-expanded="false">养老机构信息</a>
                                </li>
                                <c:if test="${m.status!=0}">
                                    <li class="">
                                        <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/institution/putOnRecord/${m.id}'"
                                           data-toggle="tab" aria-expanded="true">建档内容</a>
                                    </li>
                                    <li class="">
                                        <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/institution/map/${m.id}'"
                                           data-toggle="tab" aria-expanded="true">养老机构定位</a>
                                    </li>
                                    <li class="">
                                        <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/institution/${m.id}/elderly/list'"
                                           data-toggle="tab" aria-expanded="true">入住老人管理</a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                        <div class="tools" style="padding: 12px 0 8px 0;">
                            <c:if test="${m.status>=1}">
                                <div style="float: right;margin-right: 15px;margin-top: 5px;margin-bottom: 5px;">
                                    <div style="width:80px;float:left;display: block;padding-right: 10px;">
                                        <a class="btn btn-circle green"
                                           onclick="ServiceOrgDetail.allowEdit()"><i
                                                class="fa">修改</i></a>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form id="serviceOrgEditForm">
                            <input type="hidden" id="type" value="${m.type}">
                            <c:if test="${m.status==0}">
                                <table border="1"
                                       class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                       align="center" style="border-collapse: collapse;">
                                    <input type="hidden" id="serviceOrgId" value="${m.id}">
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle;width: 20%">
                                            所属区域 <span style="color:red"> *</span>
                                        </td>
                                        <td style="text-align: center;vertical-align: middle;width: 80%">
                                            <input type="text" class="form-control"
                                                   id="areaName"
                                                   readonly value="${m.areaName}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">
                                            单位名称<span style="color:red"> *</span>
                                        </td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input type="text" class="form-control"
                                                   name="institutionName"
                                                   readonly
                                                   value="${m.institutionName}"
                                            />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">
                                            申请时间<span style="color:red"> *</span>
                                        </td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input type="text" class="form-control"
                                                   name="createTime"
                                                   value="<fmt:formatDate value="${m.createTime}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate>"
                                                   readonly
                                            />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">
                                            验证材料
                                        </td>
                                        <td style="text-align: left;vertical-align: middle">
                                            <div class="col-md-8" id="attachDiv">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">
                                            审核信息(注：不通过的时候填写原因)
                                        </td>
                                        <td style="text-align: left;vertical-align: middle">
                                            <input type="text" class="form-control"
                                                   name="verifyContent"
                                            />
                                        </td>
                                    </tr>
                                </table>
                                <div class="form-actions">
                                    <div class="col-md-12">
                                        <div class="col-md-offset-4" style="float:left;">
                                            <shiro:hasPermission name="institution-detail-vertify">


                                                <button data-loading-text="审核中..."
                                                        type="button" class="btn btn-circle green"
                                                        style="margin-right: 50px"
                                                        onclick="ServiceOrgDetail.verify(1,1)" id="verify1">
                                                    审核通过
                                                </button>
                                                <button data-loading-text="审核中..."
                                                        type="button" class="btn btn-circle red"
                                                        style="margin-right: 50px"
                                                        onclick="ServiceOrgDetail.verify(3,1)" id="verify3">
                                                    审核不通过
                                                </button>
                                            </shiro:hasPermission>
                                            <button onclick="window.parent.closeTab('tab_institution_info')"
                                                    class="btn btn-circle blue"><i
                                                    class="fa">返回</i>
                                            </button>
                                            <span id="labelmsg" class="label"></span>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${m.status==1 or m.status==2}">
                                <table border="1"
                                       class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                       align="center" style="border-collapse: collapse;">
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle;font-size: 18px"
                                       c     colspan="5">
                                            基础信息
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">
                                            机构名称（中文） <span style="color: red;">(必填)</span>
                                        </td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input type="text" class="form-control"
                                                   value="${m.institutionName}"
                                                   name="institutionName" id="institutionName1"
                                                   onchange="ServiceOrgDetail.judgeInstitutionName('institutionName1','same1')"
                                            /><span class="required" id="same1"
                                                    style="color: red"></span>
                                        </td>
                                        <td style="text-align: center;vertical-align: middle">机构名称（英文）</td>
                                        <td style="text-align: center;vertical-align: middle" colspan="2">
                                            <input class="form-control" type="text"
                                                   value="${m.institutionNameEnglish}" name="institutionNameEnglish"
                                                   id="institutionNameEnglish">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">通信地址<span
                                                style="color: red">(必填)</span></td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input class="form-control" type="text"
                                                   id="address1" value="${m.address}" name="address">
                                        </td>
                                        <td style="text-align: center;vertical-align: middle">邮政编码<span
                                                style="color: red">(必填)</span></td>
                                        <td style="text-align: center;vertical-align: middle" colspan="2">
                                            <input class="form-control" type="text"
                                                   value="${m.postcode}" name="postcode" id="postcode">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">组织机构代码<span
                                                style="color: red">(必填)</span></td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input class="form-control" type="text"
                                                   value="${m.orgCode}" name="orgCode"
                                                   id="orgCode">
                                        </td>
                                        <td style="text-align: center;vertical-align: middle">机构部门设置（个）<%--<span
                                                style="color: red">(必填)</span>--%></td>
                                        <td style="text-align: center;vertical-align: middle" colspan="2">
                                            <input class="form-control" type="text"
                                                   value="${m.organizationDepartmentsSet}"
                                                   name="organizationDepartmentsSet" id="organizationDepartmentsSet">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">开办时间<span
                                                style="color: red">(必填)</span></td>
                                        <td style="text-align: center;vertical-align: middle" colspan="1">
                                            <input type="text" class="form-control date-picker"
                                                   value="${m.beginTime}" name="beginTime" id="beginTime"
                                                   pattern="yyyy-MM-dd"
                                            ></td>
                                        <td style="text-align: center;vertical-align: middle">一次性建设投资总额<%--<span
                                                style="color: red">(必填)</span>--%></td>
                                        <td style="text-align: center;vertical-align: middle" colspan="2">
                                            <input class="form-control" type="text"
                                                   value="${m.grossAssets}" name="grossAssets" id="grossAssets">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle;">机构性质<span
                                                style="color: red">(必填)</span></td>
                                        <td style="text-align: center;vertical-align: middle;">
                                            <lb:select value="${m.instProp}"
                                                       cssClass="selectpickershow-tick form-control"
                                                       name="instProp" id="instProp">
                                                <lb:option value="" selected="true">请选择</lb:option>
                                                <lb:option value="1">民非法人</lb:option>
                                                <lb:option value="2">事业法人</lb:option>
                                                <lb:option value="3">工商法人</lb:option>
                                                <lb:option value="4">未登记</lb:option>
                                            </lb:select></td>
                                        <td style="text-align: center;vertical-align: middle">法定代表人<span
                                                style="color: red">(必填)</span></td>
                                        <td style="text-align: center;vertical-align: middle" colspan="2">
                                            <input class="form-control" type="text"
                                                   value="${m.legalRepresentatives}"
                                                   name="legalRepresentatives"
                                                   id="legalRepresentatives1"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">法人资格证书号</td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input class="form-control" type="text"
                                                   value="${m.corporateQualificationCertificateNum}"
                                                   name="corporateQualificationCertificateNum"
                                                   id="corporateQualificationCertificateNum">
                                        </td>
                                        <td style="text-align: center;vertical-align: middle;">兴办主体<span
                                                style="color: red">(必填)</span></td>
                                        <td style="text-align: center;vertical-align: middle;" colspan="2">
                                            <lb:select value="${m.initiateSubject}"
                                                       cssClass="selectpickershow-tick form-control"
                                                       name="initiateSubject" id="initiateSubject">
                                                <lb:option value="" selected="true">请选择</lb:option>
                                                <lb:option value="1">省级民政部门</lb:option>
                                                <lb:option value="2">地级民政部门</lb:option>
                                                <lb:option value="3">县级民政部门</lb:option>
                                                <lb:option value="4">乡镇人民政府（含地区办事处）</lb:option>
                                                <lb:option value="5">街道办事处</lb:option>
                                                <lb:option value="6">单位、企业或社团</lb:option>
                                                <lb:option value="7">个人</lb:option>
                                                <lb:option value="8">与境外合资、合作</lb:option>
                                                <lb:option value="9">境外独资</lb:option>
                                                <lb:option value="10">村委会</lb:option>
                                                <lb:option value="11">居委会</lb:option>
                                                <lb:option value="12">其他</lb:option>
                                            </lb:select></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle" colspan="1"><%--《民办非企业单位登记证书》
                                            或《营业执照》编号--%>工商登记号<%--<span
                                                    style="color: red" >*</span>--%></td>
                                        <td style="text-align: center;vertical-align: middle" colspan="1">
                                            <input class="form-control" value="${m.businessLicenseNo}" type="text"
                                                   name="businessLicenseNo" id="businessLicenseNo">
                                        </td>
                                        <td style="text-align: center;vertical-align: middle">税务登记号<span
                                                style="color: red">(必填)</span></td>
                                        <td style="text-align: center;vertical-align: middle" colspan="2">
                                            <input class="form-control" type="text"
                                                   value="${m.taxRegistrationNum}" name="taxRegistrationNum"
                                                   id="taxRegistrationNum">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="1" style="text-align:center;vertical-align:middle;">服务对象类型<span
                                                style="color: red">(必填)</span></td>
                                        <td colspan="1">
                                            <div class="checkbox-list" style="padding-top: 7px">
                                                    <%-- <label class="checkbox-inline" style="padding-top: 10px">--%>
                                                <input style="padding-top: 10px" type="checkbox" name="sign"
                                                       value="1"/>自理老年人<%--</label>--%>
                                                    <%--<label class="checkbox-inline" style="padding-top: 10px">--%>
                                                <input style="padding-top: 10px" type="checkbox" name="sign"
                                                       value="2"/>半自理老年人<%--</label>--%>
                                                    <%--<label class="checkbox-inline" style="padding-top: 10px">--%>
                                                <input style="padding-top: 10px" type="checkbox" name="sign"
                                                       value="3"/>完全不能自理老年人<%--</label>--%>
                                                    <%-- <label class="checkbox-inline" style="padding-top: 10px">--%>
                                                <input style="padding-top: 10px" type="checkbox" name="sign"
                                                       value="4"/>智障老年人<%--</label>--%>
                                                    <%--<label class="checkbox-inline" style="padding-top: 10px">--%>
                                            </div>
                                        </td>
                                        <td style="text-align: center;vertical-align: middle">等级评定</td>
                                        <td style="text-align: center;vertical-align: middle" colspan="2">
                                            <lb:select value="${m.starClass}"
                                                       cssClass="selectpickershow-tick form-control"
                                                       name="starClass" disabled="disabled" readOnly="true">
                                                <lb:option value="">----</lb:option>
                                                <lb:option value="1">一星级</lb:option>
                                                <lb:option value="2">二星级</lb:option>
                                                <lb:option value="3">三星级</lb:option>
                                                <lb:option value="4">四星级</lb:option>
                                                <lb:option value="5">五星级</lb:option>
                                            </lb:select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle;">养老机构类别<span
                                                style="color: red">(必填)</span></td>
                                        <td style="text-align: center;vertical-align: middle;">
                                            <lb:select value="${m.institutionsCategory}"
                                                       cssClass="selectpickershow-tick form-control"
                                                       name="institutionsCategory" id="institutionsCategory">
                                                <lb:option value="" selected="true">请选择</lb:option>
                                                <lb:option value="1">公办养老机构</lb:option>
                                                <lb:option value="2">民办养老机构</lb:option>
                                                <lb:option value="3">公建民营机构</lb:option>
                                                <lb:option value="4">农村敬老院</lb:option>
                                                <lb:option value="5">农村中心敬老院</lb:option>
                                                <lb:option value="6">城市福利院</lb:option>
                                                <lb:option value="7">公建国营</lb:option>
                                                <lb:option value="8">公建民营</lb:option>
                                                <lb:option value="9">民办非营利性</lb:option>
                                                <lb:option value="10">民办营利性</lb:option>
                                            </lb:select></td>
                                        <td style="text-align: center;vertical-align: middle;">运营方式<span
                                                style="color: red">(必填)</span></td>
                                        <td style="text-align: center;vertical-align: middle;" colspan="2">
                                            <lb:select value="${m.runWay}"
                                                       cssClass="selectpickershow-tick form-control"
                                                       name="runWay" id="runWay">
                                                <lb:option value="" selected="true">请选择</lb:option>
                                                <lb:option value="1">公办公营</lb:option>
                                                <lb:option value="2">公办民营</lb:option>
                                                <lb:option value="3">民办民营</lb:option>
                                            </lb:select></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle;">医疗服务方式<span
                                                style="color: red">(必填)</span></td>
                                        <td style="text-align: center;vertical-align: middle;">
                                            <lb:select value="${m.medicalServiceMode}"
                                                       cssClass="selectpickershow-tick form-control"
                                                       name="medicalServiceMode" id="medicalServiceMode">
                                                <lb:option value="" selected="true">请选择</lb:option>
                                                <lb:option value="1">内设医务室</lb:option>
                                                <lb:option value="2">与医疗机构合作</lb:option>
                                                <lb:option value="3">未开展</lb:option>
                                                <lb:option value="4">其他</lb:option>
                                            </lb:select></td>
                                        <td style="text-align: center;vertical-align: middle;">是否具备医保定点资格</td>
                                        <td style="text-align: center;vertical-align: middle;" colspan="2">
                                            <lb:select value="${m.whetherHealthCareQualification}"
                                                       cssClass="selectpickershow-tick form-control"
                                                       name="whetherHealthCareQualification"
                                                       id="whetherHealthCareQualification">
                                                <lb:option value="" selected="true">请选择</lb:option>
                                                <lb:option value="1">否</lb:option>
                                                <lb:option value="2">是</lb:option>
                                            </lb:select></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle;">是否接收异地老年人<span
                                                style="color: red">(必填)</span></td>
                                        <td style="text-align: center;vertical-align: middle;">
                                            <lb:select value="${m.whetherToAcceptRemoteElderly}"
                                                       cssClass="selectpickershow-tick form-control"
                                                       name="whetherToAcceptRemoteElderly"
                                                       id="whetherToAcceptRemoteElderly">
                                                <lb:option value="" selected="true">请选择</lb:option>
                                                <lb:option value="1">否</lb:option>
                                                <lb:option value="2">是</lb:option>
                                            </lb:select></td>
                                        <td style="text-align: center;vertical-align: middle">联系电话<span
                                                style="color: red">(必填)</span></td>
                                        <td style="text-align: center;vertical-align: middle" colspan="2">
                                            <input class="form-control" type="text"
                                                   value="${m.mobile}" name="mobile"
                                                   id="moblie1"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">传真</td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input class="form-control" type="text"
                                                   value="${m.fax}" name="fax" id="fax">
                                        </td>
                                        <td style="text-align: center;vertical-align: middle">电子邮箱</td>
                                        <td style="text-align: center;vertical-align: middle" colspan="2">
                                            <input class="form-control" type="text"
                                                   value="${m.electronicMailbox}" name="electronicMailbox"
                                                   id="electronicMailbox">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">网址</td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input class="form-control" type="text"
                                                   value="${m.website}" name="website" id="website">
                                        </td>
                                        <td style="text-align: center;vertical-align: middle">房屋性质<span
                                                style="color: red">(必填)</span></td>
                                        <td style="text-align: center;vertical-align: middle" colspan="2">
                                            <lb:select value="${m.roomProp}"
                                                       cssClass="selectpickershow-tick form-control"
                                                       name="roomProp" id="roomProp">
                                                <lb:option value="" selected="true">请选择</lb:option>
                                                <lb:option value="1">自有产权</lb:option>
                                                <lb:option value="2">租赁</lb:option>
                                                <lb:option value="3">其他</lb:option>
                                            </lb:select></td>

                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">注册资金(万元)</td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input class="form-control" type="text"
                                                   value="${m.regCapital}" name="regCapital"
                                                   id="regCapital">
                                        </td>
                                        <td style="text-align: center;vertical-align: middle">租赁开始时间</td>
                                        <td style="text-align: center;vertical-align: middle" colspan="2">
                                            <input type="text" class="form-control date-picker"
                                                   value="${m.leaseCommencementTime}" name="leaseCommencementTime"
                                                   id="leaseCommencementTime" pattern="yyyy-MM-dd"
                                            ></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">租赁结束时间</td>
                                        <td style="text-align: center;vertical-align: middle" colspan="4">
                                            <input type="text" class="form-control date-picker"
                                                   value="${m.leaseEndTime}" name="leaseEndTime" id="leaseEndTime"
                                                   pattern="yyyy-MM-dd"
                                            ></td>
                                    </tr>
                                </table>
                                <table border="1"
                                       class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                       align="center" style="border-collapse: collapse;">
                                    <tr>
                                        <td colspan="7"
                                            style="text-align: center;vertical-align: middle;font-size: 18px">扩展信息
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle;width: 10%">
                                            所属区域<span style="color: red;">*</span>
                                        </td>
                                        <td style="text-align: center;vertical-align: middle;width: 25%">
                                            <input type="text" class="form-control"
                                                   value="${m.areaName}" data-toggle="modal"
                                                   data-target="#areaModal" id="areaName1"
                                                   name="areaName"
                                                   onclick="ServiceOrgDetail.selectMethod('edit');"/>
                                            <input type="hidden" id="areaId1" name="areaId">
                                            <input type="hidden" id="id" name="id"
                                                   value="${m.id}">
                                        </td>
                                        <td style="text-align: center;vertical-align: middle;width: 10%">选择logo</td>
                                        <td style="text-align: center;vertical-align: middle;width: 25%">
                                            <form id="fileUpload1" name="fileUpload" action=""
                                                  method="POST"
                                                  enctype="multipart/form-data"
                                                  target="impResult">
                                                <input type="hidden" name="photo" id="photo">
                                                <table class="table-container">
                                                    <tr>
                                                        <td style="text-align:center;width: 45%">
                                                            <input type="file" id="file"
                                                                   name="file" size="30"
                                                                   onchange="ServiceOrgDetail.logoUpload('file','msg')"/>
                                                        </td>
                                                        <td width="25%">
                                                            <span id="msg" class="label"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </form>
                                        </td>
                                        <td rowspan="5" colspan="3" style="text-align: center">
                                            <c:choose>
                                                <c:when test="${m.logoUrl!=null and m.logoUrl!=''}">
                                                    <img src="${pageContext.request.contextPath}${m.logoUrl}"
                                                         style="width: 210px;height: 210px;"
                                                         id="photoImg">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="" id="photoImg">
                                                    <input type="hidden" name="logoUrl" id="logoUrl">
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">建筑面积（㎡）</td>
                                        <td style="text-align: center;vertical-align: middle" colspan="1">
                                            <input type="text" class="form-control"
                                                   value="${m.landArea}" name="landArea" id="landArea">
                                        </td>

                                        <td style="text-align: center;vertical-align: middle">房产来源</td>
                                        <td style="text-align: center;vertical-align: middle" colspan="1">
                                            <input class="form-control" type="text" value="${m.sOfRealEstate}"
                                                   name="sOfRealEstate" id="sOfRealEstate">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle" colspan="1">注册类型<span
                                                style="color: red">*</span></td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <div class="edit_regTypeDictId">
                                                <div class="radio-list">
                                                    <label class="radio-inline">
                                                        <input type="radio" name="regTypeDictId"
                                                               value="1"
                                                               <c:if test="${m.regTypeDictId eq 1}">checked</c:if>
                                                        >民非
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="regTypeDictId"
                                                               value="2"
                                                               <c:if test="${m.regTypeDictId eq 2}">checked</c:if>
                                                        >工商
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="regTypeDictId"
                                                               value="3"
                                                               <c:if test="${m.regTypeDictId eq 3}">checked</c:if>
                                                        > 事业单位
                                                    </label>
                                                </div>
                                            </div>
                                        </td>


                                        <td style="text-align: center;vertical-align: middle">入住老人数（个）</td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input type="text" class="form-control" value="${m.elderNum}"
                                                   name="elderNum" id="elderNum"
                                            ></td>


                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">工作人员（人）</td>
                                        <td style="text-align: center;vertical-align: middle" colspan="1">
                                            <input type="text" class="form-control" value="${m.workNum}" name="workNum"
                                                   id="workNum"
                                            ></td>
                                        <td style="text-align: center;vertical-align: middle">其中护理人员（人）</td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input type="text" class="form-control" value="${m.nursingNum}"
                                                   name="nursingNum" id="nursingNum"
                                            ></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle;">
                                            等级
                                        </td>
                                        <td style="text-align: center;vertical-align: middle;">
                                            <input type="hidden" value="${roleId}" id="roleId">
                                            <lb:select value="${m.gradeDictId}"
                                                       cssClass="selectpickershow-tick form-control"
                                                       name="gradeDictId" disabled="disabled" readOnly="readonly">
                                                <lb:option value="">--请选择--</lb:option>
                                                <lb:option value="0">A级</lb:option>
                                                <lb:option value="1">AA级</lb:option>
                                                <lb:option value="2">AAA级</lb:option>
                                                <lb:option value="3">AAAA级</lb:option>
                                                <lb:option value="4">AAAAA级</lb:option>
                                            </lb:select>
                                        </td>
                                        <td style="text-align: center;vertical-align: middle">床位数（个）</td>
                                        <td style="text-align: center;vertical-align: middle" colspan="1">
                                            <input type="text" class="form-control"
                                                   value="${m.designBedCount}" name="designBedCount"
                                                   id="designBedCount"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">普通住宿床位(个)</td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input type="text" class="form-control"
                                                   value="${m.bedCount}" name="bedCount" id="bedCount1"></td>
                                        <td style="text-align: center;vertical-align: middle">护理床位(个)</td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input type="text" class="col-md-1 form-control"
                                                   value="${m.bedNurseCount}"
                                                   name="bedNurseCount" id="bedNurseCount1"></td>
                                        <td style="text-align: center;vertical-align: middle;width: 10%">日间照料床位(个)</td>
                                        <td style="text-align: center;vertical-align: middle" colspan="2">
                                            <input type="text" class=" form-control"
                                                   value="${m.bedCareCount}"
                                                   name="bedCareCount" id="bedCareCount1">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">空闲普通住宿床位(个)</td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input type="text" class="form-control"
                                                   value="${m.bedEmptyCount}" name="bedEmptyCount" id="bedEmptyCount1">
                                        </td>
                                        <td style="text-align: center;vertical-align: middle">空闲护理床位(个)</td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input type="text" class="col-md-1 form-control"
                                                   value="${m.bedNurseEmptyCount}"
                                                   name="bedNurseEmptyCount" id="bedNurseEmptyCount1"></td>
                                        <td style="text-align: center;vertical-align: middle">空闲日间照料床位(个)</td>
                                        <td style="text-align: center;vertical-align: middle" colspan="2">
                                            <input type="text" class=" form-control"
                                                   value="${m.bedCareEmptyCount}"
                                                   name="bedCareEmptyCount" id="bedCareEmptyCount1">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">联系人<span
                                                style="color: red">*</span></td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input class="form-control" type="text"
                                                   value="${m.applyName}" name="applyName" id="applyName">
                                        </td>
                                        <td style="text-align: center;vertical-align: middle">开户银行</td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input class="form-control" type="text"
                                                   value="${m.settlementBank}"
                                                   name="settlementBank">
                                        </td>
                                        <td style="text-align: center;vertical-align: middle">银行帐号</td>
                                        <td style="text-align: center;vertical-align: middle" colspan="2">
                                            <input class="form-control" type="text"
                                                   value="${m.settlementBankNo}"
                                                   name="settlementBankNo"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">普通住宿床位价格(元)</td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input type="text" class="form-control"
                                                   value="${m.bedMoney}" name="bedMoney" id="bedMoney1"></td>
                                        <td style="text-align: center;vertical-align: middle">护理床位价格(元)</td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input type="text" class="col-md-1 form-control"
                                                   value="${m.bedNurseMoney}"
                                                   name="bedNurseMoney" id="bedNurseMoney1"></td>
                                        <td style="text-align: center;vertical-align: middle">日间照料床位价格(元)</td>
                                        <td style="text-align: center;vertical-align: middle" colspan="2">
                                            <input type="text" class=" form-control"
                                                   value="${m.bedCareMoney}"
                                                   name="bedCareMoney" id="bedCareMoney1">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">是否具有养老许可证</td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <lb:select value="${m.isPensionPermit}"
                                                       cssClass="selectpickershow-tick form-control"
                                                       name="isPensionPermit" id="isPensionPermit">
                                                <lb:option value="0">否</lb:option>
                                                <lb:option value="1">是</lb:option>
                                            </lb:select></td>
                                        <td style="text-align: center;vertical-align: middle">是否具有食品安全许可证<span
                                                style="color: red">*</span></td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <lb:select value="${m.isFoodSafePermit}"
                                                       cssClass="selectpickershow-tick form-control"
                                                       name="isFoodSafePermit" id="isFoodSafePermit">
                                                <lb:option value="0">否</lb:option>
                                                <lb:option value="1">是</lb:option>
                                            </lb:select></td>
                                        <td style="text-align: center;vertical-align: middle">是否具有消防许可证<span
                                                style="color: red">*</span></td>
                                        <td style="text-align: center;vertical-align: middle" colspan="2">
                                            <lb:select value="${m.isFireLicense}"
                                                       cssClass="selectpickershow-tick form-control"
                                                       name="isFireLicense" id="isFireLicense">
                                                <lb:option value="否">否</lb:option>
                                                <lb:option value="是">是</lb:option>
                                            </lb:select></td>
                                    </tr>
                                    <tr>
                                            <%--    <td style="text-align: center;vertical-align: middle">组织机构代码</td>
                                                <td style="text-align: center;vertical-align: middle" >
                                                    <input class="form-control" type="text"
                                                           value="${m.orgCode}" name="orgCode"
                                                           id="orgCode1">
                                                </td>--%>
                                        <td style="text-align: center;vertical-align: middle">固话</td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input class="form-control" type="text"
                                                   value="${m.phone}" name="phone" id="phone1"></td>
                                        <td style="text-align: center;vertical-align: middle" colspan="1">服务项目<span
                                                style="color: red">*</span></td>
                                        <td style="text-align: center;vertical-align: middle" colspan="4">
                                            <select multiple="multiple" class="multi-select"
                                                    id="serviceProject" name="serviceProject">
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">服务时间</td>
                                        <td style="text-align: center;vertical-align: middle" colspan="1">
                                            <div style="float: left;width: 40%">
                                                <lb:select
                                                        value="${m.inServiceTimeAm}"
                                                        cssClass="selectpickershow-tick form-control"
                                                        name="inServiceTimeAm">
                                                    <lb:option value="">--请选择--</lb:option>
                                                    <lb:option value="0">00</lb:option>
                                                    <lb:option value="1">01</lb:option>
                                                    <lb:option value="2">02</lb:option>
                                                    <lb:option value="3">03</lb:option>
                                                    <lb:option value="4">04</lb:option>
                                                    <lb:option value="5">05</lb:option>
                                                    <lb:option value="6">06</lb:option>
                                                    <lb:option value="7">07</lb:option>
                                                    <lb:option value="8">08</lb:option>
                                                    <lb:option value="9">09</lb:option>
                                                    <lb:option value="10">10</lb:option>
                                                    <lb:option value="11">11</lb:option>
                                                    <lb:option value="12">12</lb:option>
                                                    <lb:option value="13">13</lb:option>
                                                    <lb:option value="14">14</lb:option>
                                                    <lb:option value="15">15</lb:option>
                                                    <lb:option value="16">16</lb:option>
                                                    <lb:option value="17">17</lb:option>
                                                    <lb:option value="18">18</lb:option>
                                                    <lb:option value="19">19</lb:option>
                                                    <lb:option value="20">20</lb:option>
                                                    <lb:option value="21">21</lb:option>
                                                    <lb:option value="22">22</lb:option>
                                                    <lb:option value="23">23</lb:option>
                                                </lb:select>
                                            </div>
                                            <div style="float: left;margin-top: 8px">~</div>
                                            <div style="float: left;width: 40%"><lb:select
                                                    value="${m.inServiceTimePm}"
                                                    cssClass="selectpickershow-tick form-control"
                                                    name="inServiceTimePm">
                                                <lb:option value="">--请选择--</lb:option>
                                                <lb:option value="0">00</lb:option>
                                                <lb:option value="1">01</lb:option>
                                                <lb:option value="2">02</lb:option>
                                                <lb:option value="3">03</lb:option>
                                                <lb:option value="4">04</lb:option>
                                                <lb:option value="5">05</lb:option>
                                                <lb:option value="6">06</lb:option>
                                                <lb:option value="7">07</lb:option>
                                                <lb:option value="8">08</lb:option>
                                                <lb:option value="9">09</lb:option>
                                                <lb:option value="10">10</lb:option>
                                                <lb:option value="11">11</lb:option>
                                                <lb:option value="12">12</lb:option>
                                                <lb:option value="13">13</lb:option>
                                                <lb:option value="14">14</lb:option>
                                                <lb:option value="15">15</lb:option>
                                                <lb:option value="16">16</lb:option>
                                                <lb:option value="17">17</lb:option>
                                                <lb:option value="18">18</lb:option>
                                                <lb:option value="19">19</lb:option>
                                                <lb:option value="20">20</lb:option>
                                                <lb:option value="21">21</lb:option>
                                                <lb:option value="22">22</lb:option>
                                                <lb:option value="23">23</lb:option>
                                            </lb:select></div>
                                            <div style="float:left;margin-top: 8px"></div>
                                        </td>
                                            <%--<td style="text-align: center;vertical-align: middle">服务范围</td>--%>
                                            <%--<td style="text-align: center;vertical-align: middle" colspan="2">--%>
                                            <%--<input type="text" class="form-control"--%>
                                            <%--value="${m.inServiceRangeName}"--%>
                                            <%--data-toggle="modal"--%>
                                            <%--data-target="#areaModal"--%>
                                            <%--id="inServiceRangeName"--%>
                                            <%--name="inServiceRangeName"--%>
                                            <%--onclick="ServiceOrgDetail.selectMethod('update');"/>--%>
                                            <%--<input type="hidden" id="inServiceRangeId"--%>
                                            <%--name="inServiceRangeId">--%>
                                        <td style="text-align: center;vertical-align: middle;">服务内容</td>
                                        <td style="text-align: center;vertical-align: middle;" colspan="4">
                                            <input type="text" name="serviceInfo" id="serviceInfo"
                                                   value="${m.serviceInfo}" class="form-control">
                                        </td>
                                        <c:if test="${not empty m.attach}">
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">相关证件展示</td>
                                        <td style="text-align: left;vertical-align: middle" colspan="4">
                                            <div class="col-md-8" id="attachDiv">
                                            </div>
                                        </td>
                                    </tr>
                                    </c:if>
                                    </tr>
                                </table>
                                <div class="form-actions">
                                    <div class="col-md-12">
                                        <div class="col-md-offset-8"
                                             style="float: left;">
                                            <button data-loading-text="提交中..."
                                                    type="button"
                                                    class="btn btn-circle green"
                                                    onclick="ServiceOrgDetail.submitEdit()"
                                                    disabled
                                                    name="editServiceOrg">
                                                保存
                                            </button>
                                            <span id="labelmsg" class="label"></span>
                                        </div>
                                        <div class="col-md-offset-11">
                                            <button onclick="window.parent.closeTab('tab_institution_info')"
                                                    class="btn btn-circle green"><i
                                                    class="fa">返回</i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>
        <!--area-->
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <!--timer-->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <!--fileUpload-->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
        <!--upload-->
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/uploadPreview.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/institution_detail.js?v=3."
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js?v=1.2"></script>
        <script>
            jQuery(document).ready(function () {
                var boxObj = $("input:checkbox[name='sign']");  //获取所有的复选框
                var expresslist = "${m.sign}"; //用el表达式获取在控制层存放的复选框的值为字符串类型
                var express = expresslist.split(','); //去掉它们之间的分割符“，”
                for (i = 0; i < boxObj.length; i++) {
                    for (j = 0; j < express.length; j++) {
                        if (boxObj[i].value == express[j])  //如果值与修改前的值相等
                        {
                            boxObj[i].checked = true;
                            break;
                        }
                    }
                }
                //时间位数
                $("#leaseEndTime").val($("#leaseEndTime").val().substring(0, 10));
                $("#beginTime").val($("#beginTime").val().substring(0, 10));
                $("#leaseCommencementTime").val($("#leaseCommencementTime").val().substring(0, 10));
                Metronic.init();
                Layout.init();
                AreaTree.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    format: 'yyyy-mm-dd',
                    autoclose: true
                });
                <c:if test="${method=='add'}">
                //上传文件显示
                $("input[name=attach]").change(function () {
                    var result = $(this).val();
                    if (result != null && result != "")
                        result = result.substr(result.lastIndexOf("\\") + 1, result.length - 1);
                    $("#file_path").html(result)
                })
                </c:if>
                ServiceOrgDetail.init();
                if ("${m.serviceProject}" != "") {
                    ServiceOrgDetail.setServiceProjectJG("${m.serviceProject}");
                }
                //附件展示
                if ("${m.attach}" != "") {
                    var str = "${m.attach}";
                    var attaches = str.split(",");
                    var html = "";
                    var fileCount = 1;
                    for (var i in attaches) {
                        if ((/\.(jpe?g|gif|png)$/i).test(attaches[i])) {
                            var path = attaches[i].substr(0, attaches[i].lastIndexOf(".")) + "_200_300" + attaches[i].substr(attaches[i].lastIndexOf("."))
                            html += "<a target='black' href='${pageContext.request.contextPath }" + attaches[i] + "'><img  src='${pageContext.request.contextPath }" + path + "'/></a>"
                        }
                        else {
                            html += "<a target='black'  href='${pageContext.request.contextPath }" + attaches[i] + "'>附件" + fileCount + "</a>"
                            fileCount++;
                        }
                    }
                    $("#attachDiv").html(html);
                }

            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>


