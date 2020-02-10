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
        <title>机构群组创建</title>
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
                    <a href="#">机构群组创建</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            机构群组
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <div class="form-body">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">机构名称
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-4">
                                        <input name="name" type="text" class="form-control"
                                               value="">
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
                                        <input name="tel" type="text" class="form-control"
                                               value="">
                                    </div>
                                    <label class="col-md-2 control-label">传真
                                    </label>
                                    <div class="col-md-4">
                                        <input name="fax" type="text" class="form-control "
                                               value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">邮编
                                    </label>
                                    <div class="col-md-4">
                                        <input name="zip" type="text" class="form-control "
                                               value="">
                                    </div>
                                    <label class="col-md-2 control-label">联系地址
                                    </label>
                                    <div class="col-md-4">
                                        <input name="addr" type="text" class="form-control"
                                               value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">联系人
                                    </label>
                                    <div class="col-md-4">
                                        <input name="contactName" type="text" class="form-control "
                                               value="">
                                    </div>
                                    <label class="col-md-2 control-label">联系方式
                                    </label>
                                    <div class="col-md-4">
                                        <input name="contactPhone" type="text" class="form-control"
                                               value="">
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
                                <div class="form-group">
                                    <label class="col-md-1 control-label">省份
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-3">
                                        <select id="province" class="form-control"
                                                onChange="EographicArea.changeProvince();">
                                            <option value="-1">省，自治区</option>
                                            <option value="0">江苏省</option>
                                        </select>
                                    </div>
                                    <label class="col-md-1 control-label">城市
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-3">
                                        <select name="city" class="form-control" id="city"
                                                onChange="EographicArea.changeCity();" readonly="readonly">
                                            <option value="-1">直辖市，地级市</option>
                                        </select>
                                    </div>
                                    <label class="col-md-1 control-label">行政区
                                    </label>
                                    <div class="col-md-3">
                                        <select name="area" class="form-control" id="county"
                                                onChange="EographicArea.changeCounty();" readonly="readonly">
                                            <option value="-1">行政区，市，县</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">街道
                                    </label>
                                    <div class="col-md-3">
                                        <select name="street" class="form-control" id="town"
                                                onChange="EographicArea.changeTown();" readonly="readonly">
                                            <option value="0">街道，乡，镇</option>
                                        </select>
                                    </div>
                                    <label class="col-md-1 control-label">社区
                                    </label>
                                    <div class="col-md-3">
                                        <select name="community" class="form-control" id="village"
                                                onChange="EographicArea.changeVillage();"

                                                readonly="readonly">
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
                            <button id="btnPublish" type="submit" class="btn green"
                                    data-loading-text="保存中...">保存
                            </button>
                            <span id="labelmsg" class="label "></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/call/customerGroup_add.js?v=1.1"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                CustomerGroupAdd.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

