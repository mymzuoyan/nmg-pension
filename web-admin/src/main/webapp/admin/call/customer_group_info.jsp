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
        <title>群组详情</title>
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
                    <a href="#">呼叫客户管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">群组详情</a>
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
                                    <a id="tab_listA" href="#tab_info" data-toggle="tab">
                                        群组信息 </a>
                                </li>
                                <li>
                                    <a id="tab_addA" href="#tab_list" data-toggle="tab">
                                        群组客户 </a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab_info">
                                    <div class="col-md-12">
                                        <div class="portlet light">
                                            <div class="portlet-body form">
                                                <div class="form-horizontal">
                                                    <!-- PERSONAL INFO TAB -->
                                                    <div class="form-body">
                                                        <div class="form-group">
                                                            <label class="col-md-2 control-label">机构名称
                                                                <span class="required">	* </span>
                                                            </label>
                                                            <div class="col-md-4">
                                                                <input name="id" type="hidden"
                                                                       class="form-control"
                                                                       value="${group.id}">
                                                                <input name="name" type="text"
                                                                       class="form-control"
                                                                       value="${group.name}">
                                                            </div>
                                                            <label class="col-md-2 control-label">类型
                                                                <span class="required">	* </span>
                                                            </label>
                                                            <div class="col-md-4">
                                                                <select id="type" class="form-control">
                                                                    <option value="">请选择...</option>
                                                                    <option value="未知">未知</option>
                                                                    <option value="政府机关">政府机关</option>
                                                                    <option value="国有企业">国有企业</option>
                                                                    <option value="事业单位">事业单位</option>
                                                                    <option value="民营企业">民营企业</option>
                                                                    <option value="教育机构">教育机构</option>
                                                                    <option value="社会福利">社会福利</option>
                                                                    <option value="金融机构">金融机构</option>
                                                                    <option value="行业组织">行业组织</option>
                                                                    <option value="民间团体">民间团体</option>
                                                                    <option value="其它">其它</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-2 control-label">办公电话
                                                            </label>
                                                            <div class="col-md-4">
                                                                <input name="tel" type="text"
                                                                       class="form-control"
                                                                       value="${group.tel}">
                                                            </div>
                                                            <label class="col-md-2 control-label">传真
                                                            </label>
                                                            <div class="col-md-4">
                                                                <input name="fax" type="text"
                                                                       class="form-control "
                                                                       value="${group.fax}">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-2 control-label">邮编
                                                            </label>
                                                            <div class="col-md-4">
                                                                <input name="zip" type="text"
                                                                       class="form-control "
                                                                       value="${group.zip}">
                                                            </div>
                                                            <label class="col-md-2 control-label">联系地址
                                                            </label>
                                                            <div class="col-md-4">
                                                                <input name="addr" type="text"
                                                                       class="form-control"
                                                                       value="${group.addr}">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-2 control-label">联系人
                                                            </label>
                                                            <div class="col-md-4">
                                                                <input name="contactName" type="text"
                                                                       class="form-control "
                                                                       value="${group.contactName}">
                                                            </div>
                                                            <label class="col-md-2 control-label">联系方式
                                                            </label>
                                                            <div class="col-md-4">
                                                                <input name="contactPhone" type="text"
                                                                       class="form-control"
                                                                       value="${group.contactPhone}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="portlet-title">
                                                <div class="caption">
                                                    隶属区域
                                                </div>
                                            </div>
                                            <div class="portlet-body form">
                                                <div class="form-horizontal">
                                                    <!-- PERSONAL INFO TAB -->
                                                    <div class="form-body">
                                                        <div class="form-group" >
                                                            <label class="col-md-1 control-label">省份
                                                                <span class="required">	* </span>
                                                            </label>
                                                            <div class="col-md-3">
                                                                <select id="province" class="form-control" value="${group.province}"
                                                                        onChange="EographicArea.changeProvince();">
                                                                    <option value="-1">省，自治区</option>
                                                                    <option value="0">江苏省</option>
                                                                </select>
                                                            </div>
                                                            <label class="col-md-1 control-label">城市
                                                                <span class="required">	* </span>
                                                            </label>
                                                            <div class="col-md-3">
                                                                <select name="city" class="form-control"
                                                                        id="city"
                                                                        onChange="EographicArea.changeCity();"
                                                                        disabled="disabled">
                                                                    <option value="-1">直辖市，地级市</option>
                                                                </select>
                                                            </div>
                                                            <label class="col-md-1 control-label">行政区
                                                            </label>
                                                            <div class="col-md-3">
                                                                <select name="area" class="form-control"
                                                                        id="county"
                                                                        onChange="EographicArea.changeCounty();"
                                                                        disabled="disabled">
                                                                    <option value="-1">行政区，市，县</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-1 control-label">街道
                                                            </label>
                                                            <div class="col-md-3">
                                                                <select name="street" class="form-control"
                                                                        id="town"
                                                                        onChange="EographicArea.changeTown();"
                                                                        disabled="disabled">
                                                                    <option value="0">街道，乡，镇</option>
                                                                </select>
                                                            </div>
                                                            <label class="col-md-1 control-label">社区
                                                            </label>
                                                            <div class="col-md-3">
                                                                <select name="community" class="form-control"
                                                                        id="village"
                                                                        onChange="EographicArea.changeVillage();"
                                                                        disabled="disabled" >
                                                                    <option value="0">社区，村</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-actions">
                                            <div class="row">
                                                <div class="col-md-offset-4 col-md-8">
                                                    <shior:hasPermission name="call-customer-group-update">
                                                        <button id="update" type="button" class="btn btn-circle green"
                                                        >修改
                                                        </button>
                                                        <button id="btnPublish" type="submit" class="btn btn-circle green"
                                                                style="display: none;"
                                                                data-loading-text="保存中...">保存
                                                        </button>
                                                    </shior:hasPermission>
                                                    <span id="labelmsg" class="label "></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane from" id="tab_list">
                                    <div class="table-container">
                                        <table class="table table-striped table-bordered table-hover"
                                               id="datatable_group_customer">
                                            <thead>
                                            <tr role="row" class="heading">
                                                <th width="10%">
                                                    姓名
                                                </th>
                                                <th width="10%">
                                                    性别
                                                </th>
                                                <th width="10%">
                                                    首个号码
                                                </th>
                                                <th width="10%">
                                                    号码数量
                                                </th>
                                                <th width="20%">
                                                    行政区划
                                                </th>
                                                <th width="20%">
                                                    用户地址
                                                </th>
                                                <th width="20%">
                                                    操作
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
                    </div>
                </div>
            </div>
        </div>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js?v=1"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/call/customerGroup_info.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                CustomerGroupInfo.init("${group.id}");
                $("input").attr("disabled", "disabled");
                $("select").attr("disabled", "disabled");
                //初始化input
                $("#type").val("${group.type}");
                //初始化省份

                EographicArea.initWith("${group.province}" + " ${group.city}" + " ${group.area}" + " ${group.street}" + " ${group.community}");
                $("#province option").each(function () {
                    if ($(this).text() == '${group.province}') {
                        $(this).attr('selected', true);
                        EographicArea.changeProvince();
                        return 0;
                    }
                });

                $("#update").click(function () {
                    $("#btnPublish").show();
                    $("input").removeAttr("disabled");
                    $("select").removeAttr("disabled");
                    $(this).hide();
                })
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

