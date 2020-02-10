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
        <title>养老机构统计</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">
        <!-- BEGIN CONTENT -->

        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">养老机构管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">养老机构统计</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet">
                    <div class="portlet-title tabbable-line">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <i class="fa fa-table"></i>养老机构统计
                        </div>
                        <ul class="nav nav-tabs">
                            <li class="active ">
                                <a href="#tab_1_1" data-toggle="tab" aria-expanded="false">各区各等级统计情况</a>
                            </li>
                            <li class="">
                                <a href="#tab_1_2" data-toggle="tab" aria-expanded="false">各区各单位性质统计情况</a>
                            </li>
                        </ul>
                    </div>
                    <div class="portlet-body">
                        <div class="tab-content">
                            <!-- PERSONAL INFO TAB -->
                            <div class="tab-pane active" id="tab_1_1">
                                <div class="">
                                    <div id="bar4" class="bar" style="width: 750px;height: 400px"></div>
                                    <hr/>
                                    <div class="form-group" style="margin:10px;text-align: right ">
                                        <label style="float: left">多个区各等级所占比查看:</label>
                                        <select id="area1"
                                                class=" form-control input-inline  input-large select2" multiple>
                                            <option value="2">海陵区</option>
                                            <option value="3">高港区</option>
                                            <option value="4">姜堰区</option>
                                            <option value="5">兴化市</option>
                                            <option value="6">靖江市</option>
                                            <option value="7">泰兴市</option>
                                        </select>
                                        <button id="showPie1" class="btn green " style="margin-left: 10px"><i class="fa fa-check"></i>查询
                                        </button>
                                    </div>
                                    <div id="pie1" class="pie" style="width: 750px;height: 400px"></div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab_1_2">
                                <div class="">
                                    <div id="bar5" class="bar" style="width: 750px;height: 400px"></div>
                                    <div class="form-group" style="margin:10px;text-align: right ">
                                        <label style="float: left">多个区各单位性质所占比查看:</label>
                                        <select id="area2"
                                                class=" form-control input-inline  input-large select2" multiple>
                                            <option value="2">海陵区</option>
                                            <option value="3">高港区</option>
                                            <option value="4">姜堰区</option>
                                            <option value="5">兴化市</option>
                                            <option value="6">靖江市</option>
                                            <option value="7">泰兴市</option>
                                        </select>
                                        </select>
                                        <button id="showPie2" class="btn green " style="margin-left: 10px"><i class="fa fa-check"></i>查询
                                        </button>
                                    </div>
                                    <div id="pie2" class="pie" style="width: 750px;height: 400px"></div>
                                </div>
                            </div>
                        </div>
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
        <script src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/echarts.min.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/institution_statistics.js?v=1.2"
                type="text/javascript"></script>

        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                $('.select2').select2({
                    placeholder: "选择区域",
                });
                InstitutionStatistics.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

