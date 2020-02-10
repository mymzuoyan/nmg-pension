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
        <title>待响应的呼叫</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
    <style>
        th{
            text-align: center;
        }
    </style>
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
                    <a href="#">呼叫系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">待响应的呼叫</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet box blue">
                    <div class="portlet-title">
                        <div class="caption">
                            待响应的呼叫
                        </div>
                    </div>
                    <div class="portlet-body" style="height: 230px;overflow: auto">
                        <div class="table-scrollable">
                            <table class="table table-bordered table-hover" style="text-align: center;">
                                <thead>
                                <tr>
                                    <th style="width: 4%;">
                                        编号
                                    </th>
                                    <th>
                                        客户号码
                                    </th>
                                    <th>
                                        是否VIP客户
                                    </th>
                                    <th>
                                        呼叫时间
                                    </th>
                                    <th>
                                        等待时长(s)
                                    </th>
                                    <th>
                                        操作
                                    </th>
                                </tr>
                                </thead>
                                <tbody id="table_abandonedList">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption">
                            我响应处理的呼叫
                        </div>
                    </div>
                    <div class="portlet-body" style="height: 230px;overflow-y: auto;">
                        <div class="table-scrollable">
                            <table class="table table-bordered table-hover"  style="text-align: center;">
                                <thead>
                                <tr style="text-align: center;">
                                    <th style="width: 4%;">
                                        编号
                                    </th>
                                    <th>
                                        呼叫类型
                                    </th>
                                    <th>
                                        呼叫号码
                                    </th>
                                    <th>
                                        呼叫开始时间
                                    </th>
                                    <th>
                                        呼叫结束时间
                                    </th>
                                    <th>
                                        录音
                                    </th>
                                </tr>
                                </thead>
                                <tbody id="table_needCallBackList">
                                </tbody>
                            </table>
                        </div>
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
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/call/callAbandoned_list.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                CallAbandonedList.init();
            });
            function getList() {
                CallAbandonedList.getList();
            }

            function removeList()
            {
                $("#table_abandonedList").html("");
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

