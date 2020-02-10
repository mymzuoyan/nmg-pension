<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/16
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>高龄补贴发放提醒</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/extensions/TableTools/css/dataTables.tableTools.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <style>
            a, a:hover {
                text-decoration: none;
            }

            table tr td {
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
                    <a href="#">高龄补贴发放管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">高龄补贴补发查询</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <!-- Begin: life time stats -->
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption">
                            高龄补贴发放提醒
                        </div>
                        <div class="tools">
                            <div style="float: left">

                            </div>
                            <a href="" class="collapse">
                            </a>
                        </div>
                    </div>
                    <div id="searchDiv" class="portlet-body form" style="">
                        <form id="elder-form" name="elder-form">
                        <table class="table table-bordered table-hover table-condensed table-responsive">
                            <tr>
                                <td width="10%" style="text-align:center;vertical-align:middle;">手机号码</td>
                                <td width="15%" style="text-align:center;vertical-align:middle;">
                                    <input name="phone" id="phone"
                                           class="form-control">  </input>
                                </td>
                                <td style="vertical-align: middle">
                                    老人姓名
                                </td>
                                <td>
                                    <input name="name" id="name"
                                           class="form-control">  </input>
                                </td>
                                <td style="vertical-align: middle">
                                    发放结果
                                </td>
                                <td>
                                    <select  name="state" id="state" class="form-control">
                                        <option>发送成功</option>
                                        <option>发送失败</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        </form>
                        <div style="text-align: right">
                            <a id="refresh" class="btn btn-circle  green">
                                <i> 刷新 </i>
                            </a>
                            <a id="search" class="btn btn-circle  green">
                                <i> 查询 </i>
                            </a>
                            <a id="reload" class="reload table-group-action-reload btn btn-circle btn-black"><i
                                    class="fa">重置</i></a>
                        </div>
                    </div>
                </div>
                <div class="portlet">
                    <div class="portlet-body">
                        <div class="table-container">
                            <table class="table table-striped table-bordered table-hover"
                                   id="table">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="1%">
                                        <input type="checkbox" class="group-checkable">
                                    </th>
                                    <th width="10%">
                                        发送时间
                                    </th>
                                    <th width="8%">
                                        手机号码
                                    </th>
                                    <th width="8%">
                                        老人姓名
                                    </th>
                                    <th width="14%">
                                        发送内容
                                    </th>
                                    <th width="7%">
                                        发送结果
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th width="1%">
                                        <input type="checkbox" class="group-checkable">
                                    </th>
                                   <td style="vertical-align: middle">2019-01-22 10:00:07</td>
                                   <td style="vertical-align: middle">13072525301</td>
                                   <td style="vertical-align: middle">吴秀兰</td>
                                   <td style="vertical-align: middle">尊敬的吴秀兰，由于您快到80高龄，可以领取高龄补贴了回复TD拒收</td>
                                   <td style="vertical-align: middle">发送成功</td>
                                </tr>
                                <tr>
                                    <th width="1%">
                                        <input type="checkbox" class="group-checkable">
                                    </th>
                                    <td style="vertical-align: middle">2019-01-22 10:20:07</td>
                                    <td style="vertical-align: middle">18913806238</td>
                                    <td style="vertical-align: middle">帅秀英</td>
                                    <td style="vertical-align: middle">尊敬的帅秀英，由于您快到80高龄，可以领取高龄补贴了回复TD拒收</td>
                                    <td style="vertical-align: middle">发送成功</td>
                                </tr>
                                <tr>
                                    <th width="1%">
                                        <input type="checkbox" class="group-checkable">
                                    </th>
                                    <td style="vertical-align: middle">2019-01-22 13:20:07</td>
                                    <td style="vertical-align: middle">18113803927</td>
                                    <td style="vertical-align: middle">吴秀梅</td>
                                    <td style="vertical-align: middle">尊敬的吴秀梅，由于您快到80高龄，可以领取高龄补贴了回复TD拒收</td>
                                    <td style="vertical-align: middle">发送成功</td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="table-actions-check-wrapper">
                                <div class="pagination-panel"> 页数 <input type="text" id="page"
                                                                         class="pagination-panel-input form-control input-mini input-inline input-sm"
                                                                         maxlenght="5"
                                                                         style="text-align:center; margin: 0 5px;">
                                    <button
                                            href="#" id="goPage" class="btn btn-sm default "
                                            title="GO">GO
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End: life time stats -->
        </div>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/gold/gold_send_goldReissueList.js?v=2.52"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
                $(".table-group-action-reload").click(function () {
                    $("#elder-form").find("input:text").val("");//找到form表单下的所有input标签并清空
                    $("#elder-form").find("input:hidden").val("");//找到form表单下的所有input标签并清空
                    $("#elder-form").find("select").val("");//找到form表单下的所有select标签并清空
                    $("#elder-form").find("input:checkbox").parent().removeClass("checked");//找到form表单下的所有checkbox标签并清空
                    $("#elder-form").find("input:checkbox").attr("checked", false);
                });
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

