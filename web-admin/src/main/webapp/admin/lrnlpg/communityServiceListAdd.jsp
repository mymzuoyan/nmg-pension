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
                    <a href="#">社会服务信息新增</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                              <span class="caption-subject font-red-sunglo bold uppercase">
                            添加社会服务信息
                              </span>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <form class="form-body" id="addGovBuy">
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 组织名称
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="organizationName" name="organizationName" value="${sessionScope.login_user.serviceOrgName}"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 服务项目
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="serviceItem" name="serviceItem" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 负责人
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="principal" name="principal" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 服务开始时间
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="serviceStartTime" name="serviceStartTime" value=""
                                                   class="form-control date-picker" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 服务结束时间
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="serviceEndTime" name="serviceEndTime" value=""
                                                   class="form-control date-picker" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 服务日记
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="serviceDiary" name="serviceDiary" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>

                                    </tr>
                                </table>
                            </form>
                            <div class="modal-footer">
                                <button type="button" class="btn blue addHappy">保存</button>
                                <span id="labelmsg" class="label"></span>
                                    <button onclick="window.parent.closeTab('tab_community_service_add')" class="btn btn-default">返回
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
                    var serviceItem = $("input[name=serviceItem]").val();
                    var principal = $("input[name=principal]").val();
                    var serviceStartTime = $("input[name=serviceStartTime]").val();
                    var serviceDiary = $("input[name=serviceDiary]").val();
                    var serviceEndTime = $("input[name=serviceEndTime]").val();
                    var organizationName = $("input[name=organizationName]").val();

                    if(organizationName=="" || organizationName==null){
                        $("#labelmsg").text('组织名称不能为空！').addClass("label-danger");
                        return;
                    }else if(serviceItem=="" || serviceItem==null){
                        $("#labelmsg").text('服务项目不能为空！').addClass("label-danger");
                        return;
                    }else if(principal=="" || principal==null){
                        $("#labelmsg").text('负责人不能为空！').addClass("label-danger");
                        return;
                    }else if(serviceStartTime=="" || serviceStartTime==null){
                        $("#labelmsg").text('服务开始时间不能为空！').addClass("label-danger");
                        return;
                    }else if(serviceEndTime=="" || serviceEndTime==null){
                        $("#labelmsg").text('服务结束时间不能为空！').addClass("label-danger");
                        return;
                    }else if(serviceDiary=="" || serviceDiary==null){
                        $("#labelmsg").text('服务日记不能为空！').addClass("label-danger");
                        return;
                    }
                    addHappy();
                });

                function addHappy() {
                    $.post(window.apppath + "/admin/api/elderly/govbuy/addCommunityService", {
                        serviceItem: $("input[name=serviceItem]").val(),
                        principal: $("#principal").val(),
                        serviceStartTime: $("#serviceStartTime").val(),
                        serviceDiary: $("input[name=serviceDiary]").val(),
                        serviceEndTime: $("input[name=serviceEndTime]").val(),
                        organizationName: $("input[name=organizationName]").val()
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

