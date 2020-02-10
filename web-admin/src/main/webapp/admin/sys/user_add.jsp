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
        <title>添加用户</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
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
                    <a href="#">用户管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">添加用户</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            添加用户
                        </div>

                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal form-bordered">
                            <!-- PERSONAL INFO TAB -->
                            <div class="form-body">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">所属角色
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <select class="form-control input-xlarge" id="role">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label" id="area-zuzhi-label">所在区域
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <input name="areaId" type="hidden" class="form-control input-xlarge" readonly
                                               value="">
                                        <input name="areaName" type="text" class="form-control input-xlarge"
                                               onclick="UserAdd.showModel()" readonly
                                               value="">
                                        <input type="hidden" name="fuwuId" id="fuwuId">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">登陆账号
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <input name="login_name" type="text" class="form-control input-xlarge"
                                               value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">昵称
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <div style="float: left">
                                            <input name="nick_name" id="nick_name" type="text"
                                                   class="form-control input-xlarge"
                                                   onblur="UserAdd.judgeNickName();">
                                        </div>
                                        <div>
                                            <span class="required" style="color: red;margin-left: 10px;"
                                                  id="same"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group caller" id="queueShow" style="display: none">
                                    <label class="col-md-2 control-label">队列号
                                    </label>
                                    <div class="col-md-10">
                                        <input name="queue" type="text" class="form-control input-xlarge" id="queue"
                                               value="">
                                    </div>
                                </div>
                                <div class="form-group caller" id="disphoneShow" style="display: none">
                                    <label class="col-md-2 control-label">分机号
                                    </label>
                                    <div class="col-md-10">
                                        <input name="disphone" type="text" class="form-control input-xlarge" id="disphone"
                                               value="">
                                    </div>
                                </div>
                                <div class="form-group caller" id="agentShow" style="display: none">
                                    <label class="col-md-2 control-label">工号
                                    </label>
                                    <div class="col-md-10">
                                        <input name="agent" type="text" class="form-control input-xlarge" id="agent"
                                               value="">
                                    </div>
                                </div>
                                <div class="form-group caller" id="pwdShow" style="display: none">
                                    <label class="col-md-2 control-label">工号密码
                                    </label>
                                    <div class="col-md-10">
                                        <input name="pwd" type="text" class="form-control input-xlarge" id="pwd"
                                               value="">
                                    </div>
                                </div>
                                <div class="form-group" id="phoneShow" style="display: none">
                                    <label class="col-md-2 control-label">手机号
                                    </label>
                                    <div class="col-md-10">
                                        <input name="phone" type="text" class="form-control input-xlarge" id="phone"
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


        <div class="modal" id="selectArea" tabindex="-1" role="basic" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">选中所在区域</h4>
                    </div>
                    <div class="modal-body">
                        <div id="areaTree" class="tree-demo"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn blue add">添加</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

        <%--选择服务人员--%>
        <div class="modal" id="selectUserFuwu" tabindex="-1" role="basic" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">选择服务人员</h4>
                    </div>
                    <div class="modal-body">
                        <div class="portlet">
                            <div id="searchDiv" class="portlet-body form">
                                <input type="hidden" name="serviceOrgId" value="${user.serviceOrgId}">
                                <input type="hidden" name="areaName" value="${user.areaName}">
                                <table class="table table-bordered table-hover table-condensed table-responsive">
                                    <tr>
                                        <td width="10%" style="text-align:center;vertical-align:middle;">姓名</td>
                                        <td width="40%" style="text-align:center;vertical-align:middle;">
                                            <input name="name" class="form-control"
                                                   type="text"/>
                                        </td>
                                        <td width="10%" style="text-align:center;vertical-align:middle;">身份<br/>证号</td>
                                        <td width="40%" style="text-align:center;vertical-align:middle;">
                                            <input name="idcardno" class="form-control" type="text"/>
                                        </td>
                                    </tr>
                                </table>
                                <div style="text-align: right">
                                    <a id="search" class="btn btn-circle  green">
                                        查询 </i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="portlet">
                            <div class="portlet-body">
                                <div class="table-container">
                                    <table class="table table-striped table-bordered table-hover"
                                           id="datatable_userfuwu_list">
                                        <thead>
                                        <tr role="row" class="heading">
                                            <th width="10%">
                                                    <%--<input type="checkbox" class="group-checkable">--%>
                                                选择
                                            </th>
                                            <th width="30%">
                                                所属组织
                                            </th>
                                            <th width="30%">
                                                姓名
                                            </th>
                                            <th width="30%">
                                                联系方式
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn blue add" onclick="UserAdd.selectUserFuwu()">确定
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/sys/user_add.js?v=1.4"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js?v=2.5"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                var sysRoles = "${sysRoles}";
                UserAdd.init();
                if (sysRoles == "") {
                    $.post(window.apppath + "/admin/api/user/getCanCreateRoles", {}, function (res) {
                            if (res) {
                                var optionHtml = '<option value="-1">请选择</option>';
                                for (var i in res) {
                                    optionHtml += '<option  value="' + res[i].id + '">' + res[i].name + '</option>';
                                }
                                $('#role').html(optionHtml);
                            }
                        }
                        ,
                        'json'
                    );
                }
            })
            ;
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

