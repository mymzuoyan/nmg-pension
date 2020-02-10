<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>居家固定资产详情</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
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
                    <a href="#">居家固定资产详情</a>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <!-- Begin: life time stats -->
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">居家固定资产详情</span>

                        </div>
                        <div class="tools">
                            <%--<shiro:hasPermission name="fixedAssets-update">--%>
                                <%--<c:choose>--%>
                                    <%--<c:when test="${method=='edit'}">--%>
                                        <div style="float: right;margin-right: 15px;margin-top: 5px;margin-bottom: 5px;">
                                            <div style="width:80px;float:left;display: block;padding-right: 10px;">
                                                <a class="btn btn-circle green"
                                                   onclick="FixedAssetsDetail.allowEdit()"><i
                                                        class="fa">修改</i></a>
                                            </div>
                                        </div>
                                    <%--</c:when>--%>
                                <%--</c:choose>--%>
                            <%--</shiro:hasPermission>--%>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="form-horizontal">
                            <div class="form-body">
                                <div class="tab-content form">
                                    <div class="form-horizontal form-bordered">
                                        <form id="volunteerEditForm">
                                            <div class="form-body">
                                                <input type="hidden" id="id" value="${fixedAssets.id}">
                                                <input type="hidden" id="province" value="0">
                                                <input type="hidden" id="city" value="1">
                                                <input type="hidden" id="areaId" value="${fixedAssets.areaId}">
                                                <input type="hidden" id="serviceOrgId" value="${fixedAssets.serviceOrgId}">
                                                <div class="form-group">
                                                    <label class="control-label col-md-2"><span
                                                            class="required">*</span>所属区域: </label>
                                                    <div class="col-md-4">
                                                        <select name="area" class="form-control" id="county"
                                                                onChange="EographicArea.changeCounty();"
                                                                readonly="readonly">
                                                            <option value="">行政区，市，县</option>
                                                        </select>
                                                    </div>
                                                    <label class="control-label col-md-2"><span
                                                            class="required">*</span>所属街道: </label>
                                                    <div class="col-md-4">
                                                        <select name="street" class="form-control" id="town"
                                                                onChange="EographicArea.changeTown();"
                                                                readonly="readonly">
                                                            <option value="">街道，乡，镇</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-2"><span
                                                            class="required">*</span>所属社区: </label>
                                                    <div class="col-md-4">
                                                        <select name="community" class="form-control" id="village"
                                                                onChange="EographicArea.changeVillage();"

                                                                readonly="readonly">
                                                            <option value="0">社区，村</option>
                                                        </select>
                                                    </div>
                                                    <label class="control-label col-md-2"><span
                                                            class="required">*</span>所属组织: </label>
                                                    <div class="col-md-4">
                                                        <select name="serviceOrg" class="form-control" id="receiverId"
                                                                onChange="EographicArea.changeServiceOrg();"
                                                                readonly="readonly">
                                                            <option value="0">选择组织</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label"><span
                                                            class="required">*</span>资产分类 </label>
                                                    <div class="col-md-4">
                                                        <lb:select value="${fixedAssets.classification}"
                                                                   cssClass="selectpickershow-tick form-control"
                                                                   name="classification" disabled="disabled" readOnly="readonly">
                                                            <lb:option value="">--请选择--</lb:option>
                                                            <lb:option value="文体娱乐设施">文体娱乐设施</lb:option>
                                                            <lb:option value="医疗保健设施">医疗保健设施</lb:option>
                                                            <lb:option value="呼叫设施">呼叫设施</lb:option>
                                                            <lb:option value="监控设施">监控设施</lb:option>
                                                            <lb:option value="无障碍设施">无障碍设施</lb:option>
                                                            <lb:option value="餐饮设施">餐饮设施</lb:option>
                                                            <lb:option value="助浴设施">助浴设施</lb:option>
                                                            <lb:option value="家具家电">家具家电</lb:option>
                                                            <lb:option value="消毒设施">消毒设施</lb:option>
                                                            <lb:option value="电梯设施">电梯设施</lb:option>
                                                            <lb:option value="水暖设施">水暖设施</lb:option>
                                                            <lb:option value="供电设施">供电设施</lb:option>
                                                            <lb:option value="办公设施">办公设施</lb:option>
                                                            <lb:option value="消防设施">消防设施</lb:option>
                                                            <lb:option value="其他">其他</lb:option>
                                                        </lb:select>
                                                    </div>
                                                    <label class="col-md-2 control-label">名称 </label>
                                                    <div class="col-md-4">
                                                        <input class="form-control" type="text"
                                                               id="name" name="name" value="${fixedAssets.name}"
                                                        >
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">单位 </label>
                                                    <div class="col-md-4">
                                                        <input class="form-control" type="text"
                                                               value="${fixedAssets.unit}"
                                                               name="unit" id="unit"
                                                        >
                                                    </div>
                                                    <label class="col-md-2 control-label">数量 </label>
                                                    <div class="col-md-4">
                                                        <input class="form-control" type="text"
                                                               value="${fixedAssets.count}" name="count"
                                                               id="count"
                                                        >
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">型号 </label>
                                                    <div class="col-md-4">
                                                        <input class="form-control" type="text"
                                                               value="${fixedAssets.model}" id="model"
                                                               name="model"
                                                        >
                                                    </div>
                                                    <label class="col-md-2 control-label">金额 </label>
                                                    <div class="col-md-4">
                                                        <input class="form-control" type="text"
                                                               value="${fixedAssets.money}" name="money" id="money"
                                                        >
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">实物图片 </label>
                                                    <div class="col-md-4">
                                                        <input  id="foodPicture" name="foodPicture" type="hidden" class="form-control"
                                                                value="${fixedAssets.foodPicture}">
                                                        <div class="file-div">
                                                            <img src="${pageContext.request.contextPath}${fixedAssets.foodPicture}"
                                                                 style="padding-bottom: 10px">
                                                        </div>
                                                    </div>
                                                    <label class="col-md-2 control-label">发票图片 </label>
                                                    <div class="col-md-4">
                                                        <input  id="invoice" name="invoice" type="hidden" class="form-control"
                                                                value="${fixedAssets.invoice}">
                                                        <div class="file-div">
                                                            <img src="${pageContext.request.contextPath}${fixedAssets.invoice}"
                                                                 style="padding-bottom: 10px">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">备注 </label>
                                                    <div class="col-md-10">
                                                        <input class="form-control" type="text"
                                                               value="${fixedAssets.remarks}" name="remarks" id="remarks"
                                                        >
                                                    </div>
                                                </div>
                                                <div class="form-actions">
                                                    <div class="row">
                                                        <%--<shiro:hasPermission name="volunteer-update">--%>
                                                            <div class="col-md-offset-8 " style="float:left;">
                                                                <button data-loading-text="提交中..."
                                                                        type="button" class="btn btn-circle green"
                                                                        onclick="FixedAssetsDetail.submitEdit()"
                                                                        name="editVolunteer">
                                                                    提交
                                                                </button>
                                                                <span id="labelmsg1" class="label"></span>
                                                            </div>
                                                        <%--</shiro:hasPermission>--%>
                                                        <div class="col-md-offset-11">
                                                            <button onclick="window.parent.closeTab('tab_fixed_assets_info')"
                                                                    class="btn btn-circle green"><i
                                                                    class="fa">返回</i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
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
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js?v=1.1"></script>

        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/lrnlpg/fixedAssets_detail.js"
                type="text/javascript"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                EographicArea.initWith("${fixedAssets.areaName}");
                EographicArea.changeCity();
                FixedAssetsDetail.init();

                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });

            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>


