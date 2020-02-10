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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>坐席详情</title>
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
                    <a href="#">坐席详情</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">坐席账号</span>
                        </div>
                        <shior:hasPermission name="call-monitor-update">
                            <a onclick="updateModel()" class="btn btn-circle  green pull-right" >
                                修改 </i>
                            </a>
                        </shior:hasPermission>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <div class="form-body">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">坐席组名称
                                        <span class="required">	* </span>
                                    </label>
                                    <input name="userId" type="hidden" class="form-control input-xlarge"
                                           value="${monitor.userId}" readonly>
                                    <div class="col-md-10">
                                        <input name="groupName" type="text" class="form-control input-xlarge"
                                               value="${monitor.groupName}" readonly />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">坐席名称
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <input name="nick_name" type="text" class="form-control input-xlarge"
                                               value="${monitor.name}" readonly />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">分机号
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <input name="extension" type="text" class="form-control input-xlarge"
                                               value="${monitor.extension}" readonly />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">是否是组长
                                    </label>
                                    <div class="col-md-10">
                                        <div class="radio-list">
                                            <label class="radio-inline">
                                                <input type="radio" name="isLeader" value="false" disabled
                                                       <c:if test="${monitor.isLeader==0}">checked</c:if>>
                                                不是</label>
                                            <label class="radio-inline">
                                                <input type="radio" name="isLeader" value="true" disabled
                                                       <c:if test="${monitor.isLeader==1}">checked</c:if>> 是 </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">外线号码</label>
                                    <div class="col-md-10">
                                        <input id="pstnnumber" type="text" class="form-control input-xlarge"
                                               value="${monitor.pstnnumber}"  readonly />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">队列
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <input id="queueName" value="${monitor.queueName}" type="text" class="form-control input-xlarge" readonly />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">系统用户
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <input type="text" id="account" class="form-control input-xlarge" autocomplete="off" list="accounts" style="width: 190px;" value="${monitor.account}" readonly />
                                        <datalist id="accounts">
                                            <c:forEach items="${users}" var="user">
                                                <option id="${user.uid}">${user.nick_name}—${user.login_name}—${user.areaName}</option>
                                            </c:forEach>
                                        </datalist>
                                        <input type="hidden" id="userId" value="${monitor.userId}"  />
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <shior:hasPermission name="call-monitor-update">
                                        <div class="col-md-offset-4 col-md-8">
                                            <button id="btnPublish" type="submit" class="btn green" style="display:none"
                                                    data-loading-text="更新中...">更新
                                            </button>
                                            <span id="labelmsg" class="label "></span>
                                        </div>
                                    </shior:hasPermission>
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
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                $("#btnPublish").click(function () {
                    if (checkInput()) {
                        $.post(window.apppath + "/admin/call/api/monitor/update", {
                            uid: $.trim($("#userId").val()),
                            id:'${monitor.id}',
                            queueName:$.trim($("#queueName").val()),
                            pstnnumber:$.trim($("#pstnnumber").val())
                            // groupId: $("#groupId").val(),
                            // oldGroupId: oldGroupId,
                            // groupName: $("#groupId  option:selected").text(),
                            // login_name: $.trim($("input[name=login_name]").val()),
                            // nick_name: $.trim($("input[name=nick_name]").val()),
                            // extension: $.trim($("input[name=extension]").val()),
                            // oldIsLeader: oldIsLeader,
                            // isLeader: $.trim($("input[name=isLeader]:checked").val()),
                            // status: 1
                        }, function (res) {
                            $("#btnPublish").button('reset');
                            if (res.success) {
                                $("#labelmsg").text(res.message).addClass("label-success");
                                setTimeout(function () {
                                    window.location.reload();
                                }, 1000);
                            } else {
                                $("#labelmsg").text(res.message).addClass("label-danger");
                            }
                        }, "json");
                    }
                })

                function checkInput() {
                    var groupId = $("#groupId").val();
                    var account = $.trim($("#account").val());
                    if($('#queueName').val()==''){
                        $("#labelmsg").text('请选择队列').addClass("label-danger");
                        return false;
                    }
                    if (account == null || account == "") {
                        // $("#labelmsg").text('请选择系统用户').addClass("label-danger");
                        $('#userId').val('');
                        return true;
                    }else{
                        var userId = $('#userId').val();
                        if(userId!=''){
                            if($('#'+userId).html().trim()==account){
                                return true;
                            }
                        }
                        var users = $('#accounts').find('option');
                        for(var i=0;i<users.length;i++){
                            if(users.eq(i).html().trim()==account||users.eq(i).html().trim().split('—')[0]==account){
                                userId = users.eq(i).attr('id');
                                $('#userId').val(userId);
                                return true;
                            }
                        }
                        $("#labelmsg").text('选择的用户在系统中不存在').addClass("label-danger");
                        return false;
                    }

                }


            });

            function updateModel(){
                $('#pstnnumber').prop('readonly',false);
                $('#queueName').prop('readonly',false);
                $('#account').prop('readonly',false);
                $("#btnPublish").show();
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

