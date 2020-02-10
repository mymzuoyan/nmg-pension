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
        <title>智能手环视图</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/view/css/alertStyle.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/view/css/completer.css"/>
        <style>
            .rt {
                float: right;
            }

            #needs_box {
                font-size: 14px;
                font-family: '微软雅黑';
                margin: 40px 45px;
                position: absolute;
                top: 0px;
                position: relative;
                width: 190px;
                height: 280px;
            }

            #needs_box .needs_nav {
                position: absolute;
                left: -40px;
                top: 0;
                height: 120px;
            }

            #needs_box .needs_nav span {
                writing-mode: vertical-lr;
                letter-spacing: 5px;
                display: block;
                width: 40px;
                height: 105px;
                background: #8F8F8F;
                color: #fff;
                border-top-left-radius: 4px;
                border-bottom-left-radius: 4px;
                text-align: center;
                line-height: 40px;
                margin-bottom: 5px;
                cursor: pointer;
            }

            #needs_box .needs_nav .active {
                background: #1589D9;
            }

            #needs_box .needs_info_box {
                padding: 10px 10px;
                position: relative;
                width: 210px;
                height: 215px;
                box-shadow: rgba(0, 0, 0, 0.498039) 0px 0px 10px 1px;
                background: rgba(255, 255, 255, 0.75);
                box-sizing: border-box;
            }

            #needs_box .needs_info p {
                line-height: 34px;
                color: #1589D9;
                font-size: 15px;
                margin: 5px;
            }

            #needs_box .box-btn {
                position: absolute;
                left: -34px;
                top: 218px;
                z-index: 0;
            }

            #needs_box .box-btn span {
                display: block;
                background: #1589D9;
                color: #fff;
                border-radius: 50px;
                width: 24px;
                height: 24px;
                text-align: center;
                line-height: 22px;
                font-size: 18px;
                font-weight: bold;
                cursor: pointer;

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
                    <a href="#">爱心手环管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">智能手环视图</a>
                </li>
            </ul>
        </div>
        <div class="row" style="height: 100% !important;">
            <div class="col-md-12" style="height: 100% !important;">
                <input type="text" id="suggestId" class="form-control input-inline input-sm"
                       placeholder="搜索地址..."
                       style="position: absolute; z-index: 1; margin: 5px;width: 250px;height: 30px;">
                <div style="margin-bottom:10px;text-align: right; z-index: 100;top: 10px; right: 20px;position: absolute;">
                    <button id="elderMap" style="color: white;" class="btn btn-sm btn-import">实时位置视图
                    </button>
                </div>
                <div id="allmap" style="height: 100% !important;"></div>
            </div>
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.full.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/view/js/completer.min.js"></script>
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="http://api.map.baidu.com/api?v=2.0&ak=UtTMI5ofPulxrOYjzLcEWHGXRlyAEfUB"></script>
        <script type="text/javascript" src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>
        <script type="text/javascript"
                src="https://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>
        <script type="text/javascript"
                src="https://api.map.baidu.com/library/EventWrapper/1.2/src/EventWrapper.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/view/js/MarkClusterer.js"></script>
        <!-- 自定义窗口 -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/view/js/InfoBox.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/arrayValue.js?v=1.3"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/bracelet/bracelet_view.js?v=3.8"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                BraceletView.init();
                BraceletView.addMarker();

            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

