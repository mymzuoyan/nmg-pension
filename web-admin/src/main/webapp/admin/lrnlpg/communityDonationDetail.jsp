<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>
            消费订单详情
        </title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <style>

            .file-box {
                position: relative;
                width: 80px;
                height: 80px;
                border: 1px solid #D9D9D9;
                background-image: url("${pageContext.request.contextPath }/assets/admin/pages/img/add.png");
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
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <div class="portlet " style="padding-top: 0px !important;padding-bottom: 0px !important;">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">
                              社会捐赠信息详情
                            </span>
                        </div>
                    </div>

                    <form id="serviceOrg-form" name="serviceOrg-form">
                        <div class="tab-content">

                            <!--ONE TAB BODY START-->
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                               <%-- <tr>
                                    <td width="10%"
                                        style="text-align:center;vertical-al
                                        活动名称
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="donorPic"
                                               class="form-control" value="${m.donorPic}" disabled/>
                                    </td>
                                    <td width="10%"
                                        style="text-align:center;vertical-align:middle;">
                                        活动描述
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="organizationName"
                                               class="form-control" value="${m.organizationName}" disabled/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10%"
                                        style="text-align:center;vertical-align:middle;">
                                        活动负责人
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="activityLeader"
                                               class="form-control" value="${m.activityLeader}" disabled/>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        开始时间
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input name="beginTime" type="text"  value="${m.beginTime}" class="form-control" disabled/>
                                    </td>
                                </tr>--%>
                                <tr>
                                   <%-- <td width="10%"
                                        style="text-align:center;vertical-align:middle;">
                                        结束时间
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="endTime"
                                               class="form-control" value="${m.endTime}" disabled/>
                                    </td>--%>
                                       <td style="text-align:center;vertical-align:middle;">
                                           捐赠人
                                       </td>
                                       <td style="text-align:center;vertical-align:middle;">
                                           <input name="donorName" type="text"  value="${m.donorName}" class="form-control" disabled/>
                                       </td>
                                       <td style="text-align:center;vertical-align:middle;">
                                           捐赠类型（资金、物品）
                                       </td>
                                     <%--  <td style="text-align:center;vertical-align:middle;">
                                           <input name="donorType" type="text"  value="${m.donorType}" class="form-control" disabled/>
                                       <td colspan="1" style="text-align:center;vertical-align:middle;"><font color="red">*</font>性别</td>--%>
                                       <td colspan="2" style="text-align:center;vertical-align:middle;">
                                           <select disabled style="width:100%;height: 38px" name="gender" id="gender" class="form-control" >
                                               <option  value="">--请选择--</option>
                                               <option value="1" <c:if test="${m.donorType==1}">selected</c:if>>资金</option>
                                               <option value="2" <c:if test="${m.donorType==2}">selected</c:if>>物品</option>
                                           </select>
                                       </td>



                                       </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        捐赠金额（或物品折合价值）
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input name="money" type="text"  value="${m.money}" class="form-control" disabled/>
                                    </td>
                                    <td width="10%"
                                        style="text-align:center;vertical-align:middle;">
                                        捐赠对象
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="remarks"
                                               class="form-control" value="${m.remarks}" disabled/>
                                    </td>


                                </tr>
                                <tr>
                                    <td width="10%"
                                        style="text-align:center;vertical-align:middle;">
                                        地址
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="address"
                                               class="form-control" value="${m.address}" disabled/>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        城市
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input name="city" type="text"  value="${m.city}" class="form-control" disabled/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10%"
                                        style="text-align:center;vertical-align:middle;">
                                        省/自治区
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="provinceBurg"
                                               class="form-control" value="${m.provinceBurg}" disabled/>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        捐赠人联系方式
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input name="phone" type="text"  value="${m.phone}" class="form-control" disabled/>
                                    </td>
                                </tr>
                                <tr>
                                    <td  style="text-align: center;vertical-align: middle;width: 9%">
                                        <%--<span style="color:red"> *</span>--%>捐赠人照片
                                    </td>
                                    <td  style="text-align: left;vertical-align: middle;width: 24%">
                                        <input  id="donorPic" name="donorPic" type="hidden" class="form-control"
                                                value="">
                                       <%-- <c:if test="${m.photoFlag == 2}">--%>
                                     <%--   <c:forEach items="${donorPic}" var="donorPic"
                                                   varStatus="i">--%>
                                       <%-- <c:forEach items="${oldManPhotothumbnails}"
                                                   var="oldManPhotothumbnail" varStatus="j">--%>
                                      <%--  <c:if test="${i.index == j.index}">--%>
                                      <%--  <a href="${pageContext.request.contextPath}${oldManPhotothumbnail}"--%>
                                          <%-- target="_blank">--%>
                                            <div class="file-div">
                                                <img src="${pageContext.request.contextPath}${m.donorPic}"
                                                     style="padding-bottom: 10px">
                                            </div>
                                       <%-- </a>--%>
                                     <%--   </c:if>--%>
                                       <%-- </c:forEach>--%>
                                        <%--</c:forEach>--%>
                                        <%--</c:if>--%>
                                    <td style="text-align:center;vertical-align:middle;">
                                        组织名称
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input name="organizationName" type="text"  value="${m.organizationName}" class="form-control" disabled/>
                                    </td>
                                </tr>
                                    </table>
                        </div>
                        <div class="form-actions">
                            <div class="col-md-offset-6">
                                <button onclick="window.parent.closeTab('tab_bill_info')"
                                        class="btn btn-circle green"><i
                                        class="fa">返回</i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js?v=1.2"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    </tiles:putAttribute>
</tiles:insertDefinition>

