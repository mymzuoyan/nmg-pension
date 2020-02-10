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
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>考核项目统计管理</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>

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
                    <a href="#">数据字典</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">考核项目统计管理</a>
                </li>
            </ul>
        </div>
        <div class="row">
        <div class="col-md-12">
            <div class="portlet ">
                <div class="portlet-body">
                    <div class="tabbable-line">
                        <ul class="nav nav-tabs ">
                            <li class="active">
                                <a id="tab_listA" href="#tab_list" data-toggle="tab">
                                    项目 </a>
                            </li>
                            <li>
                                <a id="tab_addA" href="#tab_add" data-toggle="tab">
                                    添加项目 </a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab_list">
                                <div class="table-container">
                                    <table class="table table-striped table-bordered table-hover"
                                           id="datatable_assess_project">
                                        <thead>
                                        <tr role="row" class="heading">
                                            <th width="20%">
                                                id
                                            </th>
                                            <th width="25%">
                                                项目名称
                                            </th>
                                            <th width="30%">
                                                操作
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane from" id="tab_add">
                                <div class="row">
                                    <div class="form-horizontal">
                                        <div class="form-body">
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">类型名称
                                                    <span class="required">	* </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <input name="name" type="text"
                                                           class="form-control "
                                                           value="">
                                                </div>
                                                <label class="col-md-2 control-label">资金管理
                                                    <span class="required">	* </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <label for="isMoneyManage1" style="vertical-align:sub">是</label>
                                                    <input id="isMoneyManage1" name="isMoneyManage" type="radio"
                                                           class="form-control" checked
                                                           value="1">
                                                    <label for="isMoneyManage2" style="vertical-align:sub">否</label>
                                                    <input id="isMoneyManage2" name="isMoneyManage" type="radio"
                                                           class="form-control"
                                                           value="0">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <input name="moduleId" type="hidden"
                                                       class="form-control "
                                                       value="">
                                                <label class="col-md-2 control-label">重点任务
                                                    <span class="required">	* </span>
                                                </label>
                                                <div class="col-md-10">
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox"
                                                               name="taskType"
                                                               value="1"
                                                        />市重点任务
                                                    </label>
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox"
                                                               name="taskType"
                                                               value="2"
                                                        />中央试点任务
                                                    </label>
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox"
                                                               name="taskType"
                                                               value="3"
                                                        />省重点任务
                                                    </label>
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox"
                                                               name="taskType"
                                                               value="4"
                                                        />省现代民政指标
                                                    </label>
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox"
                                                               name="taskType"
                                                               value="5"
                                                        />市政府民生实事
                                                    </label>
                                                    <label class="checkbox-inline" style="padding-left: 48px">
                                                        <input type="checkbox"
                                                               name="taskType"
                                                               value="6"
                                                        />市民政局蓝皮书项目

                                                    </label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">TabId
                                                    <span class="required">	* </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <input name="tabId" type="text"
                                                           class="form-control "
                                                           value="">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">Tab标题
                                                    <span class="required">	* </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <input name="tabTitle" type="text"
                                                           class="form-control "
                                                           value="">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">Tab链接地址
                                                    <span class="required">	* </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <input name="tabUrl" type="text"
                                                           class="form-control "
                                                           value="">
                                                </div>
                                            </div>
                                            <div class="form-actions">
                                                <div class="row">
                                                    <div class="col-md-offset-4 col-md-8">
                                                        <button id="btnPublish" type="submit" class="btn green"
                                                                data-loading-text="添加中...">添加
                                                        </button>
                                                        <span id="labelmsg" class="label "></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 弹出框 -->
        <div id="updateProject" class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" style="margin-top:150px; width: 800px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title">
                        更新服务类型
                    </h4>
                </div>
                <div class="modal-body form-horizontal from">
                    <div class="form-body">
                        <div class="form-group">
                            <input name="id" type="hidden"
                                   class="form-control "
                                   value="">
                            <label class="col-md-2 control-label">类型名称
                                <span class="required">	* </span>
                            </label>
                            <div class="col-md-4">
                                <input name="name" type="text"
                                       class="form-control "
                                       value="">
                            </div>
                            <label class="col-md-2 control-label">资金管理
                                <span class="required">	* </span>
                            </label>
                            <div class="col-md-4">
                                <label for="isMoneyManage11" style="vertical-align:sub">是</label>
                                <input id="isMoneyManage11" name="isMoneyManage" type="radio"
                                       class="form-control" checked
                                       value="1">
                                <label for="isMoneyManage22" style="vertical-align:sub">否</label>
                                <input id="isMoneyManage22" name="isMoneyManage" type="radio"
                                       class="form-control"
                                       value="0">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">重点任务
                                <span class="required">	* </span>
                            </label>
                            <div class="col-md-10">
                                <label class="checkbox-inline">
                                    <input type="checkbox"
                                           name="taskType"
                                           value="1"
                                    />市重点任务
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox"
                                           name="taskType"
                                           value="2"
                                    />中央试点任务
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox"
                                           name="taskType"
                                           value="3"
                                    />省重点任务
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox"
                                           name="taskType"
                                           value="4"
                                    />省现代民政指标
                                </label>
                                <br/>
                                <label class="checkbox-inline">
                                    <input type="checkbox"
                                           name="taskType"
                                           value="5"
                                    />市政府民生实事
                                </label>
                                <label class="checkbox-inline" style="padding-left: 48px">
                                    <input type="checkbox"
                                           name="taskType"
                                           value="6"
                                    />市民政局蓝皮书项目

                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">TabId
                                <span class="required">	* </span>
                            </label>
                            <div class="col-md-4">
                                <input name="tabId" type="text"
                                       class="form-control "
                                       value="">
                            </div>
                        </div>
                        <div class="form-group">
                        <label class="col-md-2 control-label">Tab标题
                                <span class="required">	* </span>
                            </label>
                            <div class="col-md-4">
                                <input name="tabTitle" type="text"
                                       class="form-control "
                                       value="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Tab链接地址
                                <span class="required">	* </span>
                            </label>
                            <div class="col-md-4">
                                <input name="tabUrl" type="text"
                                       class="form-control "
                                       value="">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn blue btnUpdate">更新</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.弹出框 -->
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/dictionary/assess_project_statistic_list.js?v=1.2"></script>

        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                AssessProjectStatisticList.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

