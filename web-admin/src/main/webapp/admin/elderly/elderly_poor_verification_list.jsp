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
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>特困人员供养年审列表</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">

        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">购买居家养老服务</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">特困人员供养年审列表</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption">
                            特困人员供养年审列表
                        </div>
                        <div class="tools">
                            <a href="" class="collapse">
                            </a>
                        </div>
                    </div>
                    <div id="searchDiv" class="portlet-body form" style="">
                        <%--<input type="hidden" id="region1" value="${region1}">--%>
                        <%--<input type="hidden" id="region2" value="${region2}">--%>
                        <%--<input type="hidden" id="region3" value="${region3}">--%>
                        <%--<table class="table table-bordered table-hover table-condensed table-responsive">--%>
                            <%--<tr>--%>
                                <%--<td style="vertical-align:middle;">--%>
                                    <%--审核结果--%>
                                <%--</td>--%>
                                <%--<td>--%>
                                    <%--<select name="result" id="result"  class="form-control"  <c:if--%>
                                            <%--test="${result>=0}"> disabled</c:if>>--%>
                                        <%--<option value="">--请选择--</option>--%>
                                        <%--<option value="0" <c:if test="${result==0}">selected</c:if>>审核中</option>--%>
                                        <%--<option value="1" <c:if test="${result==1}">selected</c:if>>审核通过</option>--%>
                                        <%--<option value="2" <c:if test="${result==2}">selected</c:if>>审核不通过</option>--%>
                                    <%--</select>--%>
                                <%--</td>--%>
                                <%--<td style="vertical-align:middle;">--%>
                                    <%--身份证--%>
                                <%--</td>--%>
                                <%--<td>--%>
                                    <%--<input name="idcardno" id="idcardno"  class="form-control">  </input>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td style="vertical-align:middle;">--%>
                                    <%--编号--%>
                                <%--</td>--%>
                                <%--<td>--%>
                                    <%--<input name="number" id="number"  class="form-control">  </input>--%>
                                <%--</td>--%>
                                <%--<td style="vertical-align:middle;">--%>
                                    <%--老人姓名--%>
                                <%--</td>--%>
                                <%--<td>--%>
                                    <%--<input name="name" id="name"  class="form-control">  </input>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                        <%--</table>--%>
                        <%--<div style="text-align: right">--%>
                            <%--<a id="search" class="btn btn-circle  green">--%>
                                <%--查询 </i>--%>
                            <%--</a>--%>
                        <%--</div>--%>
                    </div>
                </div>
                <div class="portlet">
                    <div class="portlet-body">
                        <div class="table-container">
                            <table class="table table-striped table-bordered table-hover"
                                   id="datatable_verification_list">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="3%">
                                        序号
                                    </th>
                                    <th width="7%">
                                        所在区域
                                    </th>
                                    <th width="10%">
                                        编号
                                    </th>
                                    <th width="10%">
                                        姓名
                                    </th>
                                    <th width="10%">
                                        身份证号
                                    </th>
                                    <th width="10%">
                                        状态
                                    </th>
                                    <th width="10%">
                                        操作
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                            <div class="table-actions-check-wrapper">
                                <div class="pagination-panel"> 页数 <input type="text" id="page"
                                                                         class="pagination-panel-input form-control input-mini input-inline input-sm"
                                                                         maxlenght="5"
                                                                         style="text-align:center; margin: 0 5px;">
                                    <button
                                            href="" id="goPage" class="btn btn-sm default "
                                            onclick="ElderMsgPoorVerificationList.goToPage()" title="GO">GO
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End: life time stats -->
            </div>
        </div>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/arrayValue.js?v=1.6"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/elderly/elderly_poor_verification_list.js?v=1.4"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                ElderMsgPoorVerificationList.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

