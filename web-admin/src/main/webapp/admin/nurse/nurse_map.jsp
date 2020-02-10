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
        <title>组织地图</title>
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
                    <a href="#">服务资源管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">组织地图</a>
                </li>
            </ul>
        </div>
        <div class="row" style="height: 100% !important;">
            <div class="col-md-12" style="height: 100% !important;">
                <input type="text" id="suggestId" class="form-control input-inline input-sm"
                       placeholder="搜索地址..."
                       style="position: absolute; z-index: 1; margin: 5px;width: 250px;height: 30px;">
                <div style="margin-bottom:10px;text-align: right; z-index: 100;top: 10px; right: 20px;position: absolute;">
                    <button id="elderMap" style="color: white;" class="btn btn-sm btn-circle btn-import ">老人实时位置视图
                    </button>
                </div>
                <div id="allmap" style="height: 100% !important;"></div>
            </div>
        </div>
        <div id="needs_box" style="position: absolute">
            <div class="box-btn">
                <span>&lt;</span>
                <span style="display: none">&gt;</span>
            </div>

            <div class="needs_info_box">
                <div class="needs_info">
                    <p>
                        <span>警告数量</span>
                        <span class="rt"><span id="all_count_all">0</span>个</span>
                    </p>
                    <p>
                        <span>围栏告警</span>
                        <span class="rt"><span id="all_count_0">0</span>个</span>
                    </p>
                    <p>
                        <span>SOS告警</span>
                        <span class="rt"><span id="all_count_1">0</span>个</span>
                    </p>
                    <p>
                        <span>体征告警</span>
                        <span class="rt"><span id="all_count_2">0</span>个</span>
                    </p>
                    <p>
                        <span>异常告警</span>
                        <span class="rt"><span id="all_count_3">0</span>个</span>
                    </p>
                </div>
                <div class="needs_info" style="display: none"><p>
                    <span>警告数量</span>
                    <span class="rt"><span id="today_count_all">0</span>个</span>
                </p>
                    <p>
                        <span>围栏告警</span>
                        <span class="rt"><span id="today_count_0">0</span>个</span>
                    </p>
                    <p>
                        <span>SOS告警</span>
                        <span class="rt"><span id="today_count_1">0</span>个</span>
                    </p>
                    <p>
                        <span>体征告警</span>
                        <span class="rt"><span id="today_count_2">0</span>个</span>
                    </p>
                    <p>
                        <span>异常告警</span>
                        <span class="rt"><span id="today_count_3">0</span>个</span>
                    </p>
                </div>
            </div>

            <div class="needs_nav">
                <span class="active">历史记录</span>
                <span class="">当日记录</span>
            </div>
        </div>
        <%--<div style="    position: absolute;    bottom: 10px;    right: 20px;    color: #1589d9;    background-color: rgba(255, 255, 255, 0.75); font-size: 15px;">--%>
        <%--<span><img src="${pageContext.request.contextPath }/assets/global/icon/icon_anull.png">：无等级的组织</span>--%>
        <%--<span><img src="${pageContext.request.contextPath }/assets/global/icon/icon_a1.png">：1A组织</span>--%>
        <%--<span><img src="${pageContext.request.contextPath }/assets/global/icon/icon_a2.png">：2A组织</span>--%>
        <%--<span><img src="${pageContext.request.contextPath }/assets/global/icon/icon_a3.png">：3A组织</span>--%>
        <%--<span><img src="${pageContext.request.contextPath }/assets/global/icon/icon_a4.png">：4A组织</span>--%>
        <%--<span><img src="${pageContext.request.contextPath }/assets/global/icon/icon_a5.png">：5A组织</span>--%>
        <%--</div>--%>
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
        <script type="text/javascript"
                src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>
        <!-- 自定义窗口 -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/view/js/InfoBox.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/arrayValue.js?v=1.3"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/nurse/nurse_map.js?v=4.6"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                NurseMap.init();

                $(".needs_nav span").click(function () {
                    $(this).addClass('active').siblings().removeClass('active');
                    $(".needs_info_box .needs_info").eq($(this).index()).show().siblings().hide();
                });
                //  需求显隐
                $(".box-btn span").click(function () {
                    if ($(this).index() == 0) {
                        $(this).hide().siblings().show().parent('.box-btn').siblings().hide();
                    } else {
                        $(this).hide().siblings().show().parent('.box-btn').siblings().show();
                    }
                });
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

