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
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>用户详情</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/themes/default/style.min.css"/>
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
                    <a href="${pageContext.request.contextPath }/admin/user/list">用户列表</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">用户详情</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet light">
                    <div class="portlet-title tabbable-line">
                        <div class="caption caption-md">
                            用户详情
                        </div>
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#tab_1_1" data-toggle="tab" aria-expanded="false">基本信息</a>
                            </li>
                            <c:if test="${userRole.id == 2 or userRole.id == 3  or userRole.id == 13  or userRole.id == 14 }">
                                <c:if test="${user.status==1}">
                                    <shiro:hasPermission name="perm_distribution">
                                        <li>
                                            <a href="#tab_1_2" data-toggle="tab" aria-expanded="true">设置权限</a>
                                        </li>
                                    </shiro:hasPermission>
                                </c:if>
                            </c:if>
                            <shiro:hasPermission name="user-resetPwd">
                                <li class="">
                                    <a href="#tab_1_3" data-toggle="tab" aria-expanded="true">重置密码</a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal form-bordered">
                            <div class="tab-content">
                                <!-- PERSONAL INFO TAB -->
                                <div class="tab-pane active" id="tab_1_1">
                                    <!-- PERSONAL INFO TAB -->
                                    <form id="updateUser">
                                        <div class="form-body">
                                            <div class="form-group">
                                                <div class="col-md-12 control-label" style="border-left:0px">
                                                    <c:if test="${user.status==0}">
                                                        <shiro:hasPermission name="user_audit">
                                                            <a class="btn btn-circle blue"
                                                               onclick="UserAdd.approved1();"><i
                                                                    class="fa">审核通过</i></a>
                                                            <a class="btn btn-circle red"
                                                               onclick="UserAdd.approved2();"><i
                                                                    class="fa">拒绝申请</i></a>
                                                        </shiro:hasPermission>
                                                    </c:if>
                                                    <c:if test="${user.status==1}">
                                                        <a class="btn btn-circle green"
                                                           onclick="UserAdd.allowEdit();"><i
                                                                class="fa">修改信息</i></a>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">所属角色
                                                    <span class="required">	* </span>
                                                </label>
                                                <div class="col-md-10">
                                                    <input name="roleName" type="text"
                                                           class="form-control input-xlarge"
                                                           readonly
                                                           value="${userRole.name}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">所在区域/组织
                                                    <span class="required">	* </span>
                                                </label>
                                                <div class="col-md-10">
                                                    <input name="areaName" type="text"
                                                           class="form-control input-xlarge"
                                                           readonly
                                                           value="${user.areaName}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">登陆账号
                                                    <span class="required">	* </span>
                                                </label>
                                                <div class="col-md-10">
                                                    <input name="login_name" type="text"
                                                           class="form-control input-xlarge"
                                                           readonly
                                                           value="${user.login_name}">
                                                    <input name="uid" type="hidden" value="${user.uid}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">昵称
                                                    <span class="required">	* </span>
                                                </label>
                                                <div class="col-md-10">
                                                    <div style="float: left">
                                                        <input id="nick" type="hidden" value="${user.nick_name}" />
                                                        <input name="nick_name" id="nick_name" type="text"
                                                               class="form-control input-xlarge"
                                                               value="${user.nick_name}" readonly
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
                                                           value="${user.queue}">
                                                </div>
                                            </div>
                                            <div class="form-group caller" id="disphoneShow" style="display: none">
                                                <label class="col-md-2 control-label">分机号
                                                </label>
                                                <div class="col-md-10">
                                                    <input name="disphone" type="text" class="form-control input-xlarge" id="disphone"
                                                           value="${user.disphone}">
                                                </div>
                                            </div>
                                            <div class="form-group caller" id="agentShow" style="display: none">
                                                <label class="col-md-2 control-label">工号
                                                </label>
                                                <div class="col-md-10">
                                                    <input name="agent" type="text" class="form-control input-xlarge" id="agent"
                                                           value="${user.agent}">
                                                </div>
                                            </div>
                                            <div class="form-group caller" id="pwdShow" style="display: none">
                                                <label class="col-md-2 control-label">工号密码
                                                </label>
                                                <div class="col-md-10">
                                                    <input name="pwd" type="text" class="form-control input-xlarge" id="pwd"
                                                           value="${user.pwd}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">联系人</label>
                                                <div class="col-md-10">
                                                    <input name="linkName" id="linkName" type="text"
                                                           class="form-control input-xlarge"
                                                           value="${user.linkName}" readonly>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">部职别</label>
                                                <div class="col-md-10">
                                                    <input name="unitAndDuty" id="unitAndDuty" type="text"
                                                           class="form-control input-xlarge"
                                                           value="${user.unitAndDuty}" readonly>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">手机号</label>
                                                <div class="col-md-10">
                                                    <input name="phone" id="phone" type="text"
                                                           class="form-control input-xlarge"
                                                           value="${user.phone}" readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${user.status==1}">
                                            <div class="form-actions">
                                                <div class="col-md-12">
                                                    <div class="col-md-10 " style="text-align: right">
                                                        <button id="btnPublish" type="button"
                                                                class="btn btn-circle green"
                                                                disabled data-loading-text="提交中..."
                                                                onclick="UserAdd.updateUser();">提交
                                                        </button>
                                                        <span id="labelmsg" class="label "></span>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <button onclick="window.parent.updateTab('user_list');window.parent.closeTab('sysUserInfo'); "
                                                                class="btn btn-circle green"><i
                                                                class="fa">返回</i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </form>
                                </div>
                                <!-- PERSONAL INFO TAB -->
                                <div class="tab-pane" id="tab_1_2">
                                    <div class="form-body">
                                        <div id="permission">
                                            <div id="jstree_demo" class="demo"
                                                 style="margin-top:1em; min-height:130px;"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button id="btnSavePerm" data-loading-text="保存中..." type="button"
                                                class="btn green">
                                            保存
                                        </button>
                                        <label class="label label-default" id="btnSaveMsg"></label>
                                    </div>
                                </div>
                                <!-- PERSONAL INFO TAB -->
                                <div class="tab-pane" id="tab_1_3">
                                    <div class="form-body">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">昵称
                                                <span class="required">	* </span>
                                            </label>
                                            <div class="col-md-10">
                                                <input name="nick_name" type="text" class="form-control input-xlarge"
                                                       value="${user.nick_name}" readonly>
                                                <input name="uid" id="uid" type="hidden" value="${user.uid}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <div class="col-md-12">
                                            <div class="col-md-offset-8" style="float: left">
                                                <button id="resetPwd" type="button" class="btn green"
                                                        onclick="UserAdd.resetPwd()">重置密码
                                                </button>
                                            </div>
                                            <div class="col-md-offset-11">
                                                <button onclick="window.history.back(-1)"
                                                        class="btn btn-circle green"><i
                                                        class="fa">返回</i>
                                                </button>
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

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/sys/user_add.js?v=1.5"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/jstree.min.js"
                type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();


                /**
                 * 获取权限树
                 */
                $('#jstree_demo').jstree({
                    'plugins': ["checkbox", "wholerow"],
                    "core": {
                        "multiple": true,
                        "animation": 0,
                        "check_callback": true,
                        "themes": {"stripes": true},
                        'data': {
                            'url': function (node) {
                                return window.apppath + '/admin/api/permission/list';
                            },
                            'data': function (node) {
                                return {'id': node.id};
                            },
                            'dataType': 'json'
                        }
                    },
                    "checkbox": {
                        "keep_selected_style": false
                    },
                    "types": {
                        "root": {
                            "icon": "https://www.jstree.com/static/3.3.1/assets/images/tree_icon.png",
                            "valid_children": ["default"]
                        },
                        "default": {
                            "icon": "fa fa-folder icon-state-warning icon-lg",
                            draggable: false  //设置节点不可拖拽
                        },
                        "file": {
                            "icon": "fa fa-file icon-state-warning icon-lg"
                        }
                    }
                }).on("loaded.jstree", function (e, data) {

                });


                /**
                 * 保存角色新权限
                 */
                $('#btnSavePerm').click(function () {
                    var $btn = $(this);
                    var node_checked = $('#jstree_demo').jstree('get_checked');//默认返回节点id,传full返回节点对象

                    var allNodes = [];
                    for (var i = 0; i < node_checked.length; i++) {

                        var sel_node = $('#jstree_demo').jstree('get_node', node_checked[i]);
                        //添加选中节点
                        allNodes.push(sel_node.id);
                        var is_leaf = $('#jstree_demo').jstree('is_leaf', sel_node);
                        if (is_leaf) {
                            //添加选中节点的所有父节点
                            var sel_node_parents = sel_node.parents;
                            allNodes = allNodes.concat(sel_node_parents);
                        }

                    }
                    if (allNodes.length == 0) {
                        return;
                    }
                    // 节点去重
                    var uniqueNodes = uniqueNodeIds(allNodes);
                });

                /**
                 * 节点去重
                 * @param arr
                 * @returns {Array}
                 */
                function uniqueNodeIds(arr) {
                    var result = [], hash = {};
                    for (var i = 0, elem; (elem = arr[i]) != null; i++) {
                        if (!hash[elem]) {
                            result.push(elem);
                            hash[elem] = true;
                        }
                    }
                    return result;
                }

                $("#updateUser").find("input:radio").attr("disabled", true);
                if($("input[name=roleName]").val().indexOf('坐席')!=-1){
                    $(".caller").show();
                }
            });
        </script>

    </tiles:putAttribute>
</tiles:insertDefinition>

