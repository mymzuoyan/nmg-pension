<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shoir" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>高龄补贴发放金额修改</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <style>
            a, a:hover {
                text-decoration: none;
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
                    <a href="#">数据字典</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">高龄补贴发放标准额修改</a>
                </li>
            </ul>
        </div>
        <div class="row">
        <div class="col-md-12">
            <div class="portlet ">
                <div class="portlet-title">
                    <div class="caption">
                        高龄补贴发标准额修改
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <!-- PERSONAL INFO TAB -->
                        <div class="form-body">
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">行政区
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-6">
                                            <input type="hidden" value="0" id="province">
                                            <input type="hidden" value="1" id="city">
                                            <select name="county" class="form-control" id="county"
                                                    onChange="EographicArea.changeCounty();"
                                                    readonly="readonly">
                                                <option value="">行政区，市，县</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">街道
                                            <span class="required">	* </span>
                                        </label>
                                        <div class="col-md-6">
                                            <select name="street" class="form-control" id="town"
                                                    onChange="EographicArea.changeTown();"
                                                    readonly="readonly">
                                                <option value="">街道，乡，镇</option>
                                            </select>
                                        </div>
                                    </div>
                            <div class="form-group">
                                <input type="hidden" id="id" name="id" value="${gss.id}">
                                <label class="col-md-2 control-label">申请类别
                                    <span class="required">	* </span>
                                </label>
                                <div class="col-md-6">
                                <select id="applyType" class="form-control"
                                        name="applyType" value="${gss.applyType}">
                                    <option value="">--全部--</option>
                                    <option value="0" <c:if test="${gss.applyType=='0'}">selected </c:if>>80-89周岁</option>
                                    <option value="1" <c:if test="${gss.applyType=='1'}">selected </c:if>>90-94周岁</option>
                                    <option value="2" <c:if test="${gss.applyType=='2'}">selected </c:if>>95-99周岁</option>
                                    <option value="3" <c:if test="${gss.applyType=='3'}">selected </c:if>>100周岁以上</option>
                                </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">发放金额(元)
                                    <span class="required">	* </span>
                                </label>
                                <div class="col-md-6">
                                    <input name="moneyStandard" type="text" class="form-control"
                                           value="${gss.moneyStandard}"
                                    >
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-4 col-md-8">
                                        <button id="btnPublish" type="submit" class="btn green"
                                                data-loading-text="保存中...">保存
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

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/uploadPreview.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js?v=1.2"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                /*$("input").attr("disabled", "true");
                 $("select").attr("disabled", "true");*/
                Layout.init();

                EographicArea.initWith("${gss.areaName}");
                EographicArea.changeProvince();

                $("#btnPublish").click(function (e) {
                    $("#labelmsg").text('').removeClass("label-danger");
                    var areaName = EographicArea.getPosition2();
                    if ($("#town").val()==""||$("#town").val()=="") {
                        $("#labelmsg").text('请选择街道').addClass("label-danger");
                        return false;
                    }
                    var applyType = $("select[name=applyType]").val();
                    if (( applyType == null || applyType == "")) {
                        $("#labelmsg").text('请输入申请类别').addClass("label-danger");
                        return false;
                    }
                    var moneyStandard = $("input[name=moneyStandard]").val();
                    if (( moneyStandard == null || moneyStandard == "")) {
                        $("#labelmsg").text('请输入发放金额').addClass("label-danger");
                        return false;
                    }
                    $("#btnPublish").button("loading");
                    var id = $("input[name=id]").val();
                    $.post(window.apppath + "/admin/api/gold/sendStandard/update", {
                        id:id,
                        areaId: EographicArea.getSelectId(),
                        areaName:areaName,
                        applyType:applyType,
                        moneyStandard:moneyStandard
                    }, function (data) {
                        console.log(data);
                        if (data.success) {
                            $("#labelmsg").text(data.message).addClass("label-success");
                            alert(data.message, function () {
                                window.location.reload();
                            });
                        }
                    }, "json");
                });
            });

        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

