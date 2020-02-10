<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>社会服务企业</title>
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
                width: 200px;
            }

            #attachDiv a {
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
        <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
        <!-- BEGIN PAGE HEADER-->
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">服务资源管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">社会服务企业</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">社会服务企业信息</a>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <!-- Begin: life time stats -->
                <div class="portlet " style="padding-top: 0px !important;">
                    <div class="portlet-title">
                        <div class="caption tabbable-line" style="padding: 0px">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/providesDetail/${m.id}'"
                                       data-toggle="tab" aria-expanded="false">社会服务企业信息</a>
                                </li>
                                <c:if test="${m.status!=0}">
                                    <li class="">
                                        <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/providersDetailMap/${m.id}'"
                                           data-toggle="tab" aria-expanded="true">社会服务企业定位</a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                        <div class="tools" style="padding: 12px 0 8px 0;">
                            <shiro:hasPermission name="serviceOrg-update">
                                <c:if test="${m.status==2}">
                                    <div style="float: right;margin-right: 15px;margin-top: 5px;margin-bottom: 5px;">
                                        <div style="width:80px;float:left;display: block;padding-right: 10px;">
                                            <a class="btn btn-circle green"
                                               onclick="ServiceOrgDetail.allowEdit()"><i
                                                    class="fa">修改</i></a>
                                        </div>
                                    </div>
                                </c:if>
                            </shiro:hasPermission>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form id="serviceOrgEditForm">
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
                                            组织类型<span style="color:red"> *</span>
                                        </td>
                                        <td style="text-align: left;vertical-align: middle">
                                            <div class="td2 checkbox-list">
                                                <input type="hidden" id="institutionTypeDictId"
                                                       value="${m.institutionTypeDictId}">
                                                <label class="checkbox-inline">
                                                    <input type="checkbox"
                                                           name="institutionTypeDictId"
                                                           value="7"
                                                    />社会服务企业
                                                </label>

                                            </div>
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
                                                   value=""
                                            />
                                        </td>
                                    </tr>
                                </table>
                                <div class="form-actions">
                                    <div class="col-md-12">
                                        <div class="col-md-offset-4" style="float:left;">
                                            <c:if test="${approve == 1}">

                                                <button data-loading-text="审核中..."
                                                        type="button" class="btn btn-circle green" style="margin-right: 50px"
                                                        onclick="ServiceOrgDetail.verify(1,1)" id="verify1">
                                                    审核通过
                                                </button>
                                                <button data-loading-text="审核中..."
                                                        type="button" class="btn btn-circle red" style="margin-right: 50px"
                                                        onclick="ServiceOrgDetail.verify(3,1)" id="verify3">
                                                    审核不通过
                                                </button>
                                            </c:if>
                                            <button onclick="window.parent.closeTab('providerInfo')"
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
                                            colspan="5">
                                            基础信息
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle;width: 10%">
                                            所属区域<span style="color: red;">*</span>
                                        </td>
                                        <td style="text-align: center;vertical-align: middle;width: 35%">
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
                                        <td style="text-align: center;vertical-align: middle;width: 30%">
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
                                        <td rowspan="4">
                                            <c:choose>
                                                <c:when test="${m.logoUrl!=null and m.logoUrl!=''}">
                                                    <img src="${pageContext.request.contextPath}${m.logoUrl}"
                                                         style="width: 168px;height: 164px;"
                                                         id="photoImg">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="" id="photoImg">
                                                    <input type="hidden" name="logoUrl" id="logoUrl">
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr style="">
                                        <td style="text-align: center;vertical-align: middle">
                                            组织类型<span style="color: red;">*</span>
                                        </td>
                                        <td style="text-align: left;vertical-align: middle" colspan="3">
                                            <div class="td2 checkbox-list">
                                                <input type="hidden" id="institutionTypeDictId"
                                                       value="${m.institutionTypeDictId}">
                                                <label class="checkbox-inline">
                                                    <input type="checkbox"
                                                           name="institutionTypeDictId"
                                                           value="7" checked
                                                    />社会服务企业
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">
                                            单位名称 <span style="color: red;">*</span>
                                        </td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input type="text" class="form-control"
                                                   value="${m.institutionName}"
                                                   name="institutionName" id="institutionName1"
                                                   onchange="ServiceOrgDetail.judgeInstitutionName('institutionName1','same1')"
                                            /><span class="required" id="same1"
                                                    style="color: red"></span>
                                        </td>
                                        <td style="text-align: center;vertical-align: middle">单位地址<span
                                                style="color: red">*</span></td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input class="form-control" type="text"
                                                   id="address1" value="${m.address}" name="address">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">注册类型<span
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
                                        <td style="text-align: center;vertical-align: middle">注册资金(万)</td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input class="form-control" type="text"
                                                   value="${m.regCapital}" name="regCapital"
                                                   id="regCapital">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">邮编</td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input class="form-control" type="text"
                                                   value="${m.postcode}" name="postcode" id="postcode">
                                        </td>
                                        <td style="text-align: center;vertical-align: middle">组织机构代码</td>
                                        <td style="text-align: center;vertical-align: middle" colspan="2">
                                            <input class="form-control" type="text"
                                                   value="${m.orgCode}" name="orgCode"
                                                   id="orgCode1">
                                        </td>
                                    </tr>
                                    <tr>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">法人代表</td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input class="form-control" type="text"
                                                   value="${m.legalRepresentatives}"
                                                   name="legalRepresentatives"
                                                   id="legalRepresentatives1"></td>
                                        <td style="text-align: center;vertical-align: middle">联系人<span
                                                style="color: red">*</span></td>
                                        <td style="text-align: center;vertical-align: middle" colspan="2">
                                            <input class="form-control" type="text"
                                                   value="${m.applyName}" name="applyName" id="applyName">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;vertical-align: middle">固话</td>
                                        <td style="text-align: center;vertical-align: middle">
                                            <input class="form-control" type="text"
                                                   value="${m.phone}" name="phone" id="phone1"></td>
                                        <td style="text-align: center;vertical-align: middle">手机号码<span
                                                style="color: red">*</span></td>
                                        <td style="text-align: center;vertical-align: middle" colspan="2">
                                            <input class="form-control" type="text"
                                                   value="${m.mobile}" name="mobile"
                                                   id="moblie1"></td>
                                    </tr>
                                    <tr>
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
                                        <td style="text-align: center;vertical-align: middle">服务时间</td>
                                        <td style="text-align: center;vertical-align: middle" colspan="4">
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
                                    </tr>
                                    <c:if test="${not empty m.attach}">
                                        <tr>
                                            <td style="text-align: center;vertical-align: middle">相关证件展示</td>
                                            <td style="text-align: left;vertical-align: middle" colspan="4">
                                                <div class="col-md-8" id="attachDiv">
                                                </div>
                                            </td>
                                        </tr>
                                    </c:if>
                                </table>
                                <c:if test="${serOrgType1==1}">
                                    <table border="1"
                                           class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                           align="center" style="border-collapse: collapse;">
                                        <tr>
                                            <td colspan="6"
                                                style="text-align: center;vertical-align: middle;font-size: 18px">扩展信息
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center;vertical-align: middle;width: 15%">实际运营的<br/>民营组织名称
                                            </td>
                                            <td style="text-align: center;vertical-align: middle;width: 20%">
                                                <input class="form-control" type="text" value="${m.regTypeRemark}"
                                                       name="regTypeRemark">
                                            </td>
                                            <td style="text-align: center;vertical-align: middle;width: 15%">单位性质<span
                                                    style="color: red">*</span></td>
                                            <td style="text-align: center;vertical-align: middle;width: 20%">
                                                <lb:select value="${m.instProp}"
                                                           cssClass="selectpickershow-tick form-control"
                                                           name="instProp" id="instProp">
                                                    <lb:option value="4">公助民营</lb:option>
                                                    <lb:option value="5">公办民营</lb:option>
                                                    <lb:option value="1">民办民营</lb:option>
                                                    <lb:option value="6">公建民营</lb:option>
                                                    <lb:option value="2">公办公营I</lb:option>
                                                    <lb:option value="3">公办公营II</lb:option>
                                                </lb:select></td>
                                            <td style="text-align: center;vertical-align: middle;width: 15%">等级</td>
                                            <td style="text-align: center;vertical-align: middle;width: 15%">
                                                <input type="hidden" value="${roleId}" id="roleId">
                                                <lb:select value="${m.gradeDictId}"
                                                           cssClass="selectpickershow-tick form-control"
                                                           name="gradeDictId" disabled="disabled">
                                                    <lb:option value="">--请选择--</lb:option>
                                                    <lb:option value="0">A级</lb:option>
                                                    <lb:option value="1">AA级</lb:option>
                                                    <lb:option value="2">AAA级</lb:option>
                                                    <lb:option value="3">AAAA级</lb:option>
                                                    <lb:option value="4">AAAAA级</lb:option>
                                                </lb:select>
                                            </td>
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
                                            <td style="text-align: center;vertical-align: middle">日间照料床位(个)</td>
                                            <td style="text-align: center;vertical-align: middle">
                                                <input type="text" class=" form-control"
                                                       value="${m.bedCareCount}"
                                                       name="bedCareCount" id="bedCareCount1">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center;vertical-align: middle">用房属性<span
                                                    style="color: red">*</span></td>
                                            <td style="text-align: center;vertical-align: middle">
                                                <lb:select value="${m.roomProp}"
                                                           cssClass="selectpickershow-tick form-control"
                                                           name="roomProp" id="roomProp">
                                                    <lb:option value="1">街道</lb:option>
                                                    <lb:option value="2">租赁</lb:option>
                                                    <lb:option value="3">公益</lb:option>
                                                </lb:select></td>
                                            <td style="text-align: center;vertical-align: middle">使用面积</br>(平方米)</td>
                                            <td style="text-align: center;vertical-align: middle">
                                                <input type="text" class="form-control"
                                                       value="${m.landArea}" name="landArea" id="landArea"></td>
                                            <td style="text-align: center;vertical-align: middle">服务项目<span
                                                    style="color: red">*</span></td>
                                            <td style="text-align: center;vertical-align: middle;">
                                                <select multiple="multiple" class="multi-select"
                                                        id="serviceProject" name="serviceProject">
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center;vertical-align: middle;">服务项目其他</td>
                                            <td style="text-align: center;vertical-align: middle;" colspan="5">
                                                <input type="text" name="serviceInfo" id="serviceInfo"
                                                       value="${m.serviceInfo}" class="form-control">
                                            </td>
                                        </tr>
                                    </table>
                                </c:if>
                                <c:if test="${serOrgType3==1}">
                                    <table border="1"
                                           class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                           align="center" style="border-collapse: collapse;">
                                        <tr>
                                            <td colspan="2"
                                                style="text-align: center;vertical-align: middle;font-size: 18px">
                                                公益志愿者扩展信息
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center;vertical-align: middle;width: 15%">
                                                实际运营的<br/>民营组织名称
                                            </td>
                                            <td style="text-align: center;vertical-align: middle;width: 85%">
                                                <input class="form-control" type="text" value="${m.regTypeRemark}"
                                                       name="regTypeRemark">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center;vertical-align: middle">
                                                志愿者人数
                                            </td>
                                            <td style="text-align: center;vertical-align: middle">
                                                <input class="form-control" type="text" value="${m.volunteerCount}"
                                                       name="volunteerCount">
                                            </td>
                                        </tr>
                                    </table>
                                </c:if>
                                <div class="form-actions">
                                    <div class="col-md-12">
                                        <shiro:hasPermission name="serviceOrg-update">
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
                                        </shiro:hasPermission>
                                        <div class="col-md-offset-11">
                                            <button onclick="window.parent.closeTab('providerInfo')"
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
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/service_org_providers_detail_community_service.js?v=1.5"
                type="text/javascript"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                AreaTree.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
                <c:if test="${method=='add'}">
                EographicArea.init();
                EographicArea.changeProvince();
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
                    ServiceOrgDetail.setServiceProject("${m.serviceProject}");
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


