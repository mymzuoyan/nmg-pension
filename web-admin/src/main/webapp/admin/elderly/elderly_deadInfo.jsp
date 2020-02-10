<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>殡葬信息</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">

        <!-- BEGIN PAGE HEADER-->
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">老人信息管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">殡葬信息</a>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <div class="portlet" style="padding-top: 0px !important; padding-bottom: 0px !important;">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">殡葬信息</span>
                        </div>
                        <div class="tools">
                            <shiro:hasPermission name="elderDeadInfo-import">
                                <div style="float: left">
                                    <a class="table-group-action-import btn btn-circle btn-import"><i
                                            class="fa">导入</i></a>
                                </div>
                            </shiro:hasPermission>
                            <a href="" class="collapse"></a>
                        </div>
                    </div>
                    <div class="portlet-body" style="padding-top: 0px !important;">
                        <form id="dead-form" name="dead-form">
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td colspan="4" onclick="ElderlyDeadInfo.showTbody1();">
                                        <span class="caption-helper">基本信息</span>
                                    </td>
                                </tr>
                                <tbody id="tbody1" style="border-bottom:0px solid #eee;">
                                <tr>
                                    <td width="20%" style="text-align:center;vertical-align:middle;">
                                        姓&nbsp;&nbsp;名
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="elderName"/>
                                    </td>
                                    <td width="20%" style="text-align:center;vertical-align:middle;">
                                        身份证号
                                    </td>
                                    <td width="30%" style="text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="idcardno"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        去世时间
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input class="form-control date-picker"
                                               name="deathTimeString"
                                               data-date-format="yyyy-mm-dd"
                                        >
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        火化时间
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input class="form-control date-picker" type="text"
                                               name="cremationTimeString"
                                               data-date-format="yyyy-mm-dd"
                                        >
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <div class="right" style="text-align: right">
                            <a class="table-group-action-submit btn btn-circle btn-import"><i class="fa">查询</i></a>
                            <a class="reload table-group-action-reload btn btn-circle btn-black"><i
                                    class="fa">重置</i></a>
                        </div>
                    </div>

                </div>
                <shiro:hasPermission name="elderly-elderlyMsg-elderDeadInfo-list">
                    <input type="hidden" id="elderDeadInfoList" value="1"/>
                </shiro:hasPermission>
                <div class="portlet" style="padding-top: 0px !important;">
                    <div class="table-container">
                        <table class="table table-striped table-bordered table-hover" id="datatable_event_list">
                            <thead>
                            <tr role="row" class="heading">
                                <th width="1%">
                                    <input type="checkbox" class="group-checkable">
                                </th>
                                <th width="8%">
                                    所属区域
                                </th>
                                <th width="8%">
                                    姓名
                                </th>
                                <th width="15%">
                                    身份证号
                                </th>
                                <th width="5%">
                                    性别
                                </th>
                                <th width="5%">
                                    卒年
                                </th>
                                <th width="12%">
                                    居住地址
                                </th>
                                <th width="15%">
                                    火化单位
                                </th>
                                <th width="15%">
                                    火化时间
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
                                        onclick="ElderlyDeadInfo.goToPage()"
                                        title="GO">GO
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 地区模态框（Modal） -->
                <div class="modal fade" id="myModal" tabindex="" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel">选择操作行为</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <form id="caozuoForm" class="form-body form-horizontal">
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">操作
                                                </label>
                                                <div class="col-md-10">
                                                    <select id="reason" class=" form-control">
                                                        <option value="0">--请选择--</option>
                                                        <option value="1">迁出</option>
                                                        <shiro:hasPermission name="elderly-elderlyMsg-elderDeadInfo-delete">
                                                            <option value="2">死亡</option>
                                                        </shiro:hasPermission>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="qianchuDiv" style="display: none">
                                                <input type="hidden" id="province" value="0">
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">城市
                                                    </label>
                                                    <div class="col-md-10">
                                                        <select name="city" class="form-control" id="city"
                                                                onChange="EographicArea.changeCity();"
                                                                readonly="readonly">
                                                            <option value="">直辖市，地级市</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">行政区
                                                    </label>
                                                    <div class="col-md-10">
                                                        <select name="area" class="form-control" id="county"
                                                                onChange="EographicArea.changeCounty();"
                                                                readonly="readonly">
                                                            <option value="">行政区，市，县</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">街道
                                                    </label>
                                                    <div class="col-md-10">
                                                        <select name="street" class="form-control" id="town"
                                                                onChange="EographicArea.changeTown();"
                                                                readonly="readonly">
                                                            <option value="">街道，乡，镇</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default"
                                        data-dismiss="modal">关闭
                                </button>
                                <button type="button" class="btn btn- submit"
                                >
                                    确定
                                </button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>


                <!-- 导入模态框（Modal） -->
                <div class="modal fade" id="impModal" tabindex="" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;
                                </button>
                                <h4 class="modal-title" id="impModalLabel">请选择...</h4>
                            </div>
                            <div class="modal-body">
                                <!-- BEGIN PAGE CONTENT-->
                                <form id="fileUpload" name="fileUpload" action="" method="POST"
                                      enctype="multipart/form-data" target="impResult">
                                    <table class="table-container">
                                        <tr>
                                            <td width="20%">
                                                导入文件：
                                            </td>
                                            <td style="text-align:center;width: 20%">
                                                <input type="file" id="file" name="file" size="30"/>
                                            </td>
                                            <td width="10%">
                                                <input type="button" onclick="ElderlyDeadInfo.importFile('file')"
                                                       value="导入">
                                            </td>
                                            <td width="25%">
                                                <span id="msg" class="label"></span>
                                            </td>
                                            <td width="25%">
                                                <a href="${pageContext.request.contextPath}/file/excel/download/deadInfo/deadInfo2.xls"/>&nbsp;Excel模板下载</a>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                                <!-- END PAGE CONTENT-->
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default"
                                        data-dismiss="modal">关闭
                                </button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>

            </div>
            <!-- END PAGE CONTENT-->
        </div>

        <!-- END CONTENT -->
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/elderly/elderly_deadList.js?v=1.7"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js?v=1"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                EographicArea.init();
                ElderlyDeadInfo.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
