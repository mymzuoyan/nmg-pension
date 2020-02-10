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
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>健康档案列表</title>
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
                    <a href="#">健康服务</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">健康档案列表</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption">
                            健康档案列表
                        </div>
                            <%--<div class="tools">--%>
                            <%--<a href="" class="collapse">--%>
                            <%--</a>--%>
                            <%--</div>--%>
                    </div>
                        <%--<div id="searchDiv" class="portlet-body form" style="">--%>
                        <%--<table class="table table-bordered table-hover table-condensed table-responsive">--%>
                        <%--<tr>--%>

                        <%--</tr>--%>
                        <%--</table>--%>
                        <%--<div style="text-align: right">--%>
                        <%--<a id="search" class="btn btn-circle  green">--%>
                        <%--查询 </i>--%>
                        <%--</a>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                </div>
                <div class="portlet">
                    <div class="portlet-body">
                        <div class="table-container">
                            <table class="table table-striped table-bordered table-hover"
                                   id="datatable_apply_list">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="3%">
                                        序号
                                    </th>
                                    <th width="7%">
                                        用户姓名
                                    </th>
                                    <th width="10%">
                                        年龄
                                    </th>
                                    <th width="10%">
                                        性别
                                    </th>
                                    <th width="10%">
                                        检测项目
                                    </th>
                                    <th width="10%">
                                        检测结果
                                    </th>
                                    <th width="10%">
                                        检测时间
                                    </th>
                                    <th width="10%">
                                        机构组织
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td align="center">
                                        14035
                                    </td>
                                    <td align="center">蔡苏萍</td>
                                    <td align="center">75</td>
                                    <td align="center">女</td>
                                    <td align="center">血压</td>
                                    <td align="center">当前血压:102mmHg</td>
                                    <td align="center">2019-01-22 18:17:08</td>
                                    <td align="center">南京市鼓楼区心贴心老年人服务中心</td>
                                </tr>

                                <tr>
                                    <td align="center">
                                        14034
                                    </td>
                                    <td align="center">叶儒生</td>
                                    <td align="center">77</td>
                                    <td align="center">男</td>
                                    <td align="center">血压</td>
                                    <td align="center">当前血压:101mmHg</td>
                                    <td align="center">2019-01-22 18:15:02</td>
                                    <td align="center">南京市鼓楼区心贴心老年人服务中心</td>
                                </tr>

                                <tr>
                                    <td align="center">
                                        14032
                                    </td>
                                    <td align="center">林淑芳</td>
                                    <td align="center">80</td>
                                    <td align="center">女</td>
                                    <td align="center">血压</td>
                                    <td align="center">当前血压:99mmHg</td>
                                    <td align="center">2019-01-22 18:11:28</td>
                                    <td align="center">南京市鼓楼区心贴心老年人服务中心</td>
                                </tr>

                                <tr>
                                    <td align="center">
                                        14031
                                    </td>
                                    <td align="center">林桂淼</td>
                                    <td align="center">87</td>
                                    <td align="center">男</td>
                                    <td align="center">血压</td>
                                    <td align="center">当前血压:106mmHg</td>
                                    <td align="center">2019-01-22 18:07:01</td>
                                    <td align="center">南京市鼓楼区心贴心老年人服务中心</td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="table-actions-check-wrapper">
                                <div style="float: left;margin-left: 2%">共4条记录&nbsp;&nbsp;&nbsp;&nbsp;共1页</div>
                                <div class="pagination-panel" style="float: right;"> 页数 <input type="text" id="page"
                                                                                               class="pagination-panel-input form-control input-mini input-inline input-sm"
                                                                                               maxlenght="5"
                                                                                               style="text-align:center; margin: 0 5px;">
                                    <button
                                            href="" id="goPage" class="btn btn-sm default "
                                            onclick="ElderMsgGovBuyApplyList.goToPage()" title="GO">GO
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
                src="${pageContext.request.contextPath }/assets/global/scripts/arrayValue.js?v=1.1"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/elderly/elderly_govbuy_apply_list.js?v=1.4"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                // ElderMsgGovBuyApplyList.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

