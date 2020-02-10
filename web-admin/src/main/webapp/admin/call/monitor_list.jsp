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
        <title>坐席列表</title>
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
                    <a href="#">坐席管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">坐席列表</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">坐席列表</span>
                        </div>
                        <div class="tools">
                            <a onclick="syncAgentInfo()" class="table-group-action-import btn btn-circle btn-import" style="height: 35px;margin-top: -28px;">同步坐席数据</a>
                            <a href="" class="expand"></a>
                        </div>
                    </div>
                    <div id="searchDiv" class="portlet-body form" >
                        <table class="table table-bordered table-hover table-condensed table-responsive">
                            <tr>
                                <td width="13%" style="text-align:center;vertical-align:middle;">坐席名称：</td>
                                <td width="20%" style="text-align:center;vertical-align:middle;" >
                                    <input id="name" name="name" class="form-control"
                                           type="text"/>
                                </td>
                                <td width="14%" style="text-align:center;vertical-align:middle;">
                                    座席分机号：
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input id="extension" name="extension" class="form-control"/>
                                </td>
                                <td width="13%" style="text-align:center;vertical-align:middle;">
                                    外线号码:
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input id="pstnnumber" name="pstnnumber" class="form-control"
                                           type="text"/>
                                </td>
                            </tr>
                            <tr>
                                <td width="13%" style="text-align:center;vertical-align:middle;">坐席组名称：</td>
                                <td width="20%" style="text-align:center;vertical-align:middle;" >
                                    <%--<input name="groupName" class="form-control"--%>
                                           <%--type="text"/>--%>
                                    <select id="groupName" name="groupName" class="form-control">

                                    </select>
                                </td>
                                <td width="13%" style="text-align:center;vertical-align:middle;">
                                    系统用户:
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <input id="account"  name="account" class="form-control"
                                           type="text"/>
                                </td>
                                <td width="13%" style="text-align:center;vertical-align:middle;">
                                    是否是组长:
                                </td>
                                <td width="20%" style="text-align:center;vertical-align:middle;">
                                    <div class="radio-list">
                                        <label class="radio-inline">
                                            <input type="radio" name="isLeader"  value="0" > 不是</label>
                                        <label class="radio-inline">
                                            <input type="radio" name="isLeader" value="1"> 是 </label>
                                    </div>

                                </td>
                            </tr>
                        </table>
                        <div style="text-align: right">
                            <a id="search" class="btn btn-circle  green">
                                查询 </i>
                            </a>
                            <a class="reload table-group-action-reload btn btn-circle btn-black"><i
                                    class="fa">重置</i></a>
                        </div>
                    </div>
                </div>
                <div class="table-container">
                    <table class="table table-striped table-bordered table-hover" id="datatable_monitor_list">
                        <thead>
                        <tr role="row" class="heading">
                            <%--<th width="10%">--%>
                                <%--序号--%>
                            <%--</th>--%>
                            <th width="17%">
                                坐席分机号
                            </th>
                            <th width="17%">
                                坐席名称
                            </th>
                            <th width="17%">
                                坐席组名称
                            </th>
                                <th width="17%">
                                    外线号码
                                </th>
                             <th width="17%">
                                 系统用户
                             </th>
                            <th width="15%">
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
                                    onclick="AdvertisementList.goToPage()" title="GO">GO
                            </button>
                        </div>
                    </div>
                </div>
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
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/call/monitor_list.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js?v=1"></script>

        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                EographicArea.init();
                MonitorList.init("${id}");
            });

            function syncAgentInfo(){
                var tableContainer = $("#datatable_monitor_list").parents(".table-container");
                Metronic.blockUI({
                    message: '同步中...',
                    target: tableContainer,
                    overlayColor: 'none',
                    cenrerY: true,
                    boxed: true
                });
                $.post(window.apppath + "/admin/call/api/monitor/syncAgent", {}, function (res) {
                    Metronic.unblockUI(tableContainer);
                    if (res.success) {
                        console.log(res)
                        location.href = location.href;
                    } else {
                        this.showMetroMessage(res.message);
                    }
                }, "json");
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

