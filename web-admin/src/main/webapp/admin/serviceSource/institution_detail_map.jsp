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
        <title>养老机构定位</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/view/css/alertStyle.css"/>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">

        <div class="row" style="height: 100% !important;">
            <div class="col-md-12" style="height: 100% !important;">
                <div class="portlet " style="height: 90% !important;">
                    <div class="portlet-title">
                        <div class="caption tabbable-line" style="padding: 0px">
                            <ul class="nav nav-tabs">
                                <li>
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/institution/detail/${id}'"
                                       data-toggle="tab" aria-expanded="false">养老机构信息</a>
                                </li>
                                <li class="">
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/institution/putOnRecord/${id}'"
                                       data-toggle="tab" aria-expanded="true">建档内容</a>
                                </li>
                                <li class="active">
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/institution/map/${id}'"
                                       data-toggle="tab" aria-expanded="true">养老机构定位
                                    </a>
                                </li>
                                <li class="">
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/institution/${id}/elderly/list'"
                                       data-toggle="tab" aria-expanded="true">入住老人管理</a>
                                </li>

                            </ul>
                        </div>
                        <button type="button" class="btn blue addLocation" style="float: right">提交
                        </button>
                    </div>
                    <div class="portlet-body" style="height: 100% !important;">
                        <input type="text" id="suggestId" class="form-control input-inline input-sm"
                               placeholder="搜索地址..." style="position: absolute; z-index: 1; margin: 5px">
                        <div id="allmap" style="height:100% !important;"></div>
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
                src="http://api.map.baidu.com/api?v=2.0&ak=UtTMI5ofPulxrOYjzLcEWHGXRlyAEfUB"></script>
        <script type="text/javascript" src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>
        <!-- 自定义窗口 -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/view/js/InfoBox.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/institution_map.js?v=2.5"></script>
        <!--加载鼠标绘制工具-->
        <script type="text/javascript"
                src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
        <link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css"/>
        <!--加载检索信息窗口-->
        <script type="text/javascript"
                src="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.js"></script>
        <link rel="stylesheet"
              href="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.css"/>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                //初始化
                InstitutionMap.init();
                InstitutionMap.setUpdate(true);
                InstitutionMap.showMarker("", "${id}", "1");
                /**
                 * 定位
                 */
                $(" .addLocation").click(function () {
                    var overlay = InstitutionMap.lastOverlay;
                    if (InstitutionMap.flag) {
                        confirm2("是否确定更新为当前位置信息？", function () {
                            $.post(window.apppath + "/admin/api/serviceOrg/updateLocation",
                                    {
                                        serviceOrgId: "${id}",
                                        lng: overlay.getPosition().lng,
                                        lat: overlay.getPosition().lat,
                                        type: 1
                                    }, function (res) {
                                        if (res.success) {
                                            alertSuccess("提交信息","提交成功",function () {
                                                InstitutionMap.showMarker("", "${id}", "1");
                                            });
                                        } else {
                                            showMetroMessage(res.message);
                                        }
                                    }, "json");
                        });
                    }
                });

            });
            function showMetroMessage(messageContent) {
                Metronic.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: messageContent,
                    place: 'prepend'
                });
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

