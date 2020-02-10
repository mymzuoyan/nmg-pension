<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>组织视频监控</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <style>
            #selectIcon img {
                width: 30px;
                height: 30px;
                margin: 2.5px;
                padding: 2.5px;
            }

            #selectIcon img:hover {
                background-color: #ccc;
                cursor: pointer;
            }
        </style>
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
            <a href="#">服务资源管理</a>
            <i class="fa fa-angle-right"></i>
        </li>
        <li>
            <a href="#">视频通道</a>
        </li>
    </ul>
</div>
<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
    <div class="col-md-12">
        <div class="portlet " style="padding-top: 0px !important;padding-bottom: 0px !important;">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-equalizer font-purple-plum hide"></i>
                    <span class="caption-subject font-red-sunglo bold uppercase">${orgName}</span>
                </div>
                <div class="tools">
                    <div style="float: left">
                        <a class="btn btn-circle btn-add"><i class="fa">新增</i></a>
                    </div>
                    <a href="" class="collapse"></a>
                </div>
            </div>
            <div class="portlet-body" style="padding-top: 0px !important;display: block">
                <form id="searchDiv" name="searchDiv">
                    <table class="table table-bordered table-hover table-condensed table-responsive">
                        <tr>
                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                视频通道ID
                            </td>
                            <td style="width:80%;text-align:center;vertical-align:middle;">
                                <input class="form-control" name="channelId" placeholder="请输入视频通道ID"
                                       style="width: 100%">
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
            <div class="portlet">
                <div class="portlet-body">
                    <div class="table-container">
                        <div class="table-group-actions-wrapper">
                        </div>
                        <table class="table table-striped table-bordered table-hover"
                               id="datatable_List">
                            <thead>
                            <tr role="row" class="heading">
                                <th width="1%">
                                    <input type="checkbox" class="group-checkable">
                                </th>
                                <th width="50%">
                                    通道ID
                                </th>
                                <th width="49%">
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
                                        onclick="VideoChannelList.goToPage()" title="GO">GO
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 导入模态框（Modal） -->
<div class="modal fade" id="addVideoModal" tabindex="-1"
     role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal"
                        aria-hidden="true"></button>
                <h4 class="modal-title"
                    id="addModalLabel">添加视频源</h4>
            </div>
            <div class="modal-body">
                <input id="orgId" type="hidden" name="orgId">
                <div class="form-group" style="padding-bottom: 25px;">
                    <label class="col-md-2 control-label">通道ID
                    </label>
                    <div class="col-md-10">
                        <input id="channelId" name="channelId" value="" class="form-control">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <span id="labelmsg" class="label "></span>
                <button id="saveButton" type="button" class="btn blue"
                        onclick="VideoChannelList.extSave()">
                    确定
                </button>
                <button type="button"
                        class="btn default"
                        data-dismiss="modal">关闭
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="modal fade" id="updateVideoModal" tabindex="-1"
     role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal"
                        aria-hidden="true"></button>
                <h4 class="modal-title"
                    id="updateModalLabel">更新视频源</h4>
            </div>
            <div class="modal-body">
                <input type="hidden" name="id" id="id">
                <input type="hidden" name="orgId">
                <div class="form-group" style="padding-bottom: 25px;">
                    <label class="col-md-2 control-label">通道ID
                    </label>
                    <div class="col-md-10">
                        <input name="channelId" value="" class="form-control">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <span id="labelmsg" class="label "></span>
                <button type="button" class="btn blue"
                        onclick="VideoChannelList.update()">
                    确定
                </button>
                <button type="button"
                        class="btn default"
                        data-dismiss="modal">关闭
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<div id="alertModal" class="js-alt">
    <div>
        <img src="/assets/admin/pages/img/info.png" alt=""/>
        <p class="alertModalMes">
        </p>
        <a class="btn cancel" style="width: 80%; background: #20ABFF;">确定</a>
    </div>
</div>
<div id="confirmModal" class="js-alt">
    <div>
        <img src="/assets/admin/pages/img/info.png" alt=""/>
        <p class="confirmModal">
        </p>
        <a class="btn sureBtn sure">确定</a>
        <a class="btn cancel ">取消</a>
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
<script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/video_channel_list.js?v=1.12"
        type="text/javascript"></script>
<script>
    jQuery(document).ready(function () {
        Metronic.init();
        Layout.init();
        AreaTree.init();
        VideoChannelList.init(${orgId});
    });
</script>
    </tiles:putAttribute>
</tiles:insertDefinition>