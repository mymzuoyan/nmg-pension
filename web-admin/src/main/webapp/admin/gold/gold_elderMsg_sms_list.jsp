<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>人员信息登记</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
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
                    <a href="#">80岁以上高龄补贴</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">短信发送列表</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <!-- Begin: life time stats -->
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption">
                            短信查询
                        </div>
                        <div class="tools">
                            <div style="float: left">
                                <shiro:hasPermission name="elderly-sendmsg-add">
                                    <a class="table-group-action-add btn btn-circle btn-add" data-toggle="modal" data-target="#addModal"><i class="fa">新增</i></a>
                                </shiro:hasPermission>
                            </div>
                            <a href="" class="collapse">
                            </a>
                        </div>
                    </div>
                    <div id="searchDiv" class="portlet-body form" style="">
                        <table class="table table-bordered table-hover table-condensed table-responsive">
                            <tr>
                                <td style="vertical-align: middle">
                                   手机号码
                                </td>
                                <td>
                                    <input name="telPhone" id="telPhone"
                                           class="form-control">  </input>
                                </td>
                                <td style="vertical-align: middle">
                                    老人姓名
                                </td>
                                <td>
                                    <input name="elderName" id="elderName"
                                           class="form-control">  </input>
                                </td>
                                <td style="vertical-align: middle">
                                    发送结果
                                </td>
                                <td>
                                    <select id="result" class="form-control"
                                            name="result">
                                        <option value="">--请选择--</option>
                                        <option value="0">发送失败</option>
                                        <option value="1">发送成功</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
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
                                   id="datatable_sms_list">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="20%">
                                        发送时间
                                    </th>
                                    <th width="20%">
                                        手机号码
                                    </th>
                                    <th width="10%">
                                        老人姓名
                                    </th>
                                    <th width="20%">
                                        发送内容
                                    </th>
                                    <th width="20%">
                                        发送结果
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
                                            onclick="ElderMsgSmsList.goToPage()" title="GO">GO
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End: life time stats -->
        </div>
        <!-- 新增模态框（Modal） -->
        <div class="modal fade" id="addModal" tabindex="" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;
                        </button>
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <i class="fa fa-table" style="color: #0c91e5;font-size: 23px;margin-right: 8px;"></i><span id="addModalLabel" style="color: #0c91e5;font-size: 25px;">信息发送新增</span>
                        </div>
                        <%--<h4 class="modal-title" id="addModalLabel">信息发送新增</h4>--%>
                    </div>
                    <div class="modal-body" style="margin-left: 5%;">
                        <span style="font-size: 18px">老人姓名:</span><input style="width: 50%;margin-top: 5px;"  class="form-control" type="text" id="elderName_add" name="elderName_add"><br>
                        <span style="font-size: 18px">手机号码:</span><input  style="width: 50%;margin-top: 5px;"  class="form-control" type="text" id="telPhone_add" name="telPhone_add"><br>
                        <span style="font-size: 18px">发送内容:</span><input  style="width: 50%;margin-top: 5px;"  class="form-control" type="text" id="sendContent_add" name="sendContent_add"><br>
                        <span style="font-size: 18px">发送时间:</span><input  class="form-control  date-picker" style="width: 50%;margin-top: 5px;"    data-date-format="yyyy-mm-dd hh:ii:ss" type="text" id="sendTime_add" name="sendTime_add" readonly><br>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-circle  green" onclick="saveMsg()"
                                >保存
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
        <!-- 详情模态框（Modal） -->
        <div class="modal fade" id="impModal" tabindex="" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;
                        </button>
                        <h4 class="modal-title" id="impModalLabel">信息发送详情</h4>
                    </div>
                    <div class="modal-body">
                        <label>老人姓名:</label><span></span><br>
                        <label>手机号码:</label><span></span><br>
                        <label>发送内容:</label><span></span><br>
                        <label>发送时间:</label><span></span><br>
                        <label>发送结果:</label><span></span><br>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
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
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/gold/gold_elderMsg_sms_list.js?v=2.71"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                $('.date-picker').datetimepicker({
                    format: 'yyyy-mm-dd hh:ii:ss',
                    language : 'zh-CN',
                    autoclose : true,
                    clearBtn : true,
                    todayHighlight : true,
                    minView: 0,
                    minuteStep:1,
                    // rtl: Metronic.isRTL(),
                     orientation: "right",
                    // autoclose: true
                });
                $("#addTab").click(function () {
                    var href = $(this).attr("data");
                    window.parent.addTab("gold_elderly_add", "人员登记信息新增", href);
                })
                ElderMsgSmsList.init();
            });

            /**
             * 新增保存
             */
            function saveMsg () {
                $.post(window.apppath + "/admin/api/sms/add", {
                    elderName:$("#elderName_add").val().trim(),
                    telPhone:$("#telPhone_add").val().trim(),
                    sendContent:$("#sendContent_add").val().trim(),
                    luanchTime:$("#sendTime_add").val().trim(),
                }, function (res) {
                    if (res.success) {
                        alert(res.message);
                        window.location.reload();
                    }
                    else {
                        alert(res.message);
                    }
                }, 'json');
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
