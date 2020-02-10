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
<%@ taglib prefix="shoir" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>文娱信息新增</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jquery-multi-select/css/multi-select.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
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
                    <a href="#">居家养老信息管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">文娱活动信息新增</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            <span class="caption-subject font-red-sunglo bold uppercase">
                            添加文娱活动
                            </span>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <form class="form-body" id="addGovBuy">
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 组织名称
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="organizationName" name="organizationName" value="${sessionScope.login_user.serviceOrgName}"
                                                   maxlength="18" disabled/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 活动名称
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="activityName" name="activityName" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 活动时间
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="activityTime" name="activityTime" value=""
                                                   class="form-control date-picker" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 参与人数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="participantsNumber" name="participantsNumber" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 活动内容
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="activityContent" name="activityContent" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 组织者
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="organizer" name="organizer" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 活动地址
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="address" name="address" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 活动时长
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="duration" name="duration" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    </tr>
                                </table>
                            </form>
                            <div class="modal-footer">
                                <button type="button" class="btn blue addHappy">保存</button>
                                <span id="labelmsg" class="label"></span>
                                <button onclick="window.parent.closeTab('tab_happy_add')" class="btn btn-default">返回
                                </button>
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
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();

                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    format: 'yyyy-mm-dd',
                    autoclose: true
                });

                $(".addHappy").click(function () {
                    var activityName = $("input[name=activityName]").val();
                    var activityTime = $("input[name=activityTime]").val();
                    var participantsNumber = $("input[name=participantsNumber]").val();
                    var activityContent = $("input[name=activityContent]").val();
                    var organizationName = $("input[name=organizationName]").val();



                    if(organizationName=="" || organizationName==null){
                        $("#labelmsg").text('组织名称不能为空！').addClass("label-danger");
                        return;
                    }else if(activityName=="" || activityName==null){
                        $("#labelmsg").text('活动名称不能为空！').addClass("label-danger");
                        return;
                    }else if(activityTime=="" || activityTime==null){
                        $("#labelmsg").text('活动时间不能为空！').addClass("label-danger");
                        return;
                    }else if(participantsNumber=="" || participantsNumber==null){
                        $("#labelmsg").text('参与人数不能为空！').addClass("label-danger");
                        return;
                    }else if(activityContent=="" || activityContent==null){
                        $("#labelmsg").text('活动内容不能为空！').addClass("label-danger");
                        return;
                    }
                    addHappy();
                });

                function addHappy() {
                    $.post(window.apppath + "/admin/api/elderly/govbuy/addHappy", {
                        activityName: $("input[name=activityName]").val(),
                        activityTime: $("#activityTime").val(),
                        participantsNumber: $("#participantsNumber").val(),
                        activityContent: $("input[name=activityContent]").val(),
                        organizer: $("input[name=organizer]").val(),
                        address: $("input[name=address]").val(),
                        organizationName: $("input[name=organizationName]").val(),

                        duration: $("input[name=duration]").val()
                    }, function (res) {
                        if (res.success) {
                            alert(res.message);
                            window.location.reload();
                        }
                        else {
                            alert(res.message);
                        }
                    },'json');
                }
            });

        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

