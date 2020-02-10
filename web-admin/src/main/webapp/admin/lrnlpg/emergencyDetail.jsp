<%--
  Created by IntelliJ IDEA.
  User: fan
  Date: 2019/6/30
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>
            突发事件详情
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
                              突发事件信息详情
                            </span>
                        </div>
                    </div>

                    <form id="serviceOrg-form" name="serviceOrg-form">
                        <div class="tab-content">

                            <!--ONE TAB BODY START-->
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        组织名称
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input name="serviceOrgName" type="text"  value="${m.serviceOrgName}" class="form-control" disabled/>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        事件类型
                                    </td>
                                    <td colspan="2" style="text-align:center;vertical-align:middle;">
                                        <select disabled style="width:100%;height: 38px" name="eventType" id="eventType" class="form-control" >
                                            <option  value="">--请选择--</option>
                                            <option value="1" <c:if test="${m.eventType==1}">selected</c:if>>自然灾害</option>
                                            <option value="2" <c:if test="${m.eventType==2}">selected</c:if>>事故灾难</option>
                                            <option value="3" <c:if test="${m.eventType==3}">selected</c:if>>公共卫生事件</option>
                                            <option value="4" <c:if test="${m.eventType==4}">selected</c:if>>社会安全事件</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        发生时间
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input name="occurrenceTime" type="text"  value="${m.occurrenceTime}" class="form-control" disabled/>
                                    </td>
                                    <td width="10%"
                                        style="text-align:center;vertical-align:middle;">
                                        事件描述
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="eventDescription"
                                               class="form-control" value="${m.eventDescription}" disabled/>
                                    </td>
                                </tr>
                                <tr>
                                    <td  style="text-align: center;vertical-align: middle;width: 9%">
                                        事件照片
                                    </td>
                                    <td  style="text-align: left;vertical-align: middle;width: 24%">
                                        <input  id="eventPhoto" name="eventPhoto" type="hidden" class="form-control"
                                                value="">

                                        <div class="file-div">
                                            <img src="${pageContext.request.contextPath}${m.eventPhoto}"
                                                 style="padding-bottom: 10px;width: 70px;height: 70px;">
                                        </div>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        处理人
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input name="dealPeople" type="text"  value="${m.dealPeople}" class="form-control" disabled/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10%"
                                        style="text-align:center;vertical-align:middle;">
                                        处理时间
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input type="text"  name="dealTime"
                                               class="form-control" value="${m.dealTime}" disabled/>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        处理结果
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input name="dealResult" type="text"  value="${m.dealResult}" class="form-control" disabled/>
                                    </td>
                                </tr>
                                <tr>
                                    <td  style="text-align: center;vertical-align: middle;width: 9%">
                                        处理照片
                                    </td>
                                    <td  style="text-align: left;vertical-align: middle;width: 24%">
                                        <input  id="activityName" name="dealPhoto" type="hidden" class="form-control"
                                                value="">

                                        <div class="file-div">
                                            <img src="${pageContext.request.contextPath}${m.dealPhoto}"
                                                 style="padding-bottom: 10px;width: 70px;height: 70px;">
                                        </div>
                                    </td>
                                </tr>
                            </table>
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
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/lrnlpg/emergency_list.js?v=2.7"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js?v=1.2"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    </tiles:putAttribute>
</tiles:insertDefinition>
