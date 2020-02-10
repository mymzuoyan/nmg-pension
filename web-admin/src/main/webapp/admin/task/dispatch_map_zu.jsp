<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>服务资源调度系统</title>
        <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/favicon.ico"/>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/alertStyle.css"/>
        <style>
            ol, ul {
                list-style: none;
            }
            .rt {
                float: right;
            }

            #statics {
                position: absolute;
                right: 20px;
                top: 10px;
            }

            #needs_box {
                font-size: 14px;
                font-family: '微软雅黑';
                margin: 22px 60px;
                position: absolute;
                top: 0px;
                position: relative;
                width: 190px;
                height: 180px;
            }

            #needs_box .needs_nav {
                position: absolute;
                left: -40px;
                top: 0;
                height: 180px;
            }

            #needs_box .needs_nav span {
                writing-mode: vertical-lr;
                letter-spacing: 2px;
                display: block;
                width: 40px;
                height: 90px;
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
                padding: 20px 10px;
                position: relative;
                width: 190px;
                height: 180px;
                box-shadow: rgba(0, 0, 0, 0.498039) 0px 0px 10px 1px;
                background: rgba(255, 255, 255, 0.75);
                box-sizing: border-box;
            }

            #needs_box .needs_info p {
                line-height: 34px;
                color: #1589D9;
                font-size: 15px;
                margin: 0px;
            }

            #needs_box .box-btn {
                position: absolute;
                left: -34px;
                top: 153px;
                z-index: 10;
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

            #today_task_div {
                padding: 10px;
                width: 133px;
                height: 109px;
                box-shadow: rgba(0, 0, 0, 0.498039) 0px 0px 10px 1px;
                background: rgba(255, 255, 255, 0.75);
                box-sizing: border-box;
                top: 25px;
                left: 202px;
                position: absolute;
                color: #1589D9;
            }

            /*箭头向左*/
            .arrow-left {
                position: absolute;
                width: 0;
                height: 0;
                border-top: 10px solid transparent;
                border-bottom: 10px solid transparent;
                border-right: 10px solid #1589D9;
                top: 70px;
                left: 191px;
                display: none;
            }

             .MapLocation_con_list img {
                vertical-align: top;
                height: 16px;
                margin-top: 2px;
            }

             .MapLocation_con_list p {
                display: inline-block;
                margin-left: 8px;
            }

            .MapLocation_con_list strong {
                font-weight: 400;
                color: #333333;
            }

            .about4_main ul li {
                padding-left: 25px;
                font-size: 14px;
                color: #333333;
                line-height: 30px;
                margin-bottom: 5px;
                background: url(${pageContext.request.contextPath}/assets/admin/pages/img/about4_icon.png) left center no-repeat;
            }

            .about4_main ul li:last-child {
                margin-bottom: 0px;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">
        <!-- BEGIN CONTENT -->
        <!-- BEGIN PAGE HEADER-->
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">服务资源调度系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row" style="height: 100% !important;">
            <div class="col-md-12" style="height: 100% !important;padding: 0px;">
                <div id="dispatchMap" style="height: 100% !important;"></div>
                <a target="_blank" href="${pageContext.request.contextPath }/admin/dispatch/map" title="全屏"><img
                        style="width: 30px;height:30px;cursor: pointer"
                        src="${pageContext.request.contextPath }/assets/admin/pages/img/list.png" id="statics"/></a>
            </div>
        </div>
        <div class="modal" id="taskInfoDiv" tabindex="" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" style="width: 900px">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">工单详情</h4>
                    </div>
                    <div class="modal-body">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary"
                                data-dismiss="modal">确定
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
        <div id="needs_box" style="position: absolute;">
            <div class="box-btn">
                <span>&lt;</span>
                <span style="display: none">&gt;</span>
            </div>

            <div class="needs_info_box">
                <div class="needs_info">
                    <p>
                        <span>需求服务</span>
                        <span class="rt"><span id="allCount">0</span>个</span>
                    </p>
                    <p>
                        <span>未响应</span>
                        <span class="rt"><span id="undo">0</span>个</span>
                    </p>
                    <p>
                        <span>已响应</span>
                        <span class="rt"><span id="doing">0</span>个</span>
                    </p>
                    <p>
                        <span>已完成</span>
                        <span class="rt"><span id="done">0</span>个</span>
                    </p>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="http://api.map.baidu.com/api?v=2.0&ak=UtTMI5ofPulxrOYjzLcEWHGXRlyAEfUB"></script>
        <script type="text/javascript" src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>
        <script type="text/javascript"
                src="http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>
        <script type="text/javascript"
                src="http://api.map.baidu.com/library/EventWrapper/1.2/src/EventWrapper.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/view/js/MarkClusterer.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/task/dispatch_map_zu.js?v=5.5"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/task/task_all_list.js?v=5.4"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/view/js/InfoBox.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/json2.js"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                DispatchMap.init();
                var serviceOrgId="${sessionScope.login_user.serviceOrgId}";
                DispatchMap.getServiceOrgLocation(serviceOrgId);
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

