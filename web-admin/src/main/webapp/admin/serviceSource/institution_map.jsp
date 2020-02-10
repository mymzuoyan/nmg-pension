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
        <title>机构地图</title>
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
                height: 280px;
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
                top: 250px;
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
                    <a href="#">养老机构系统管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">机构地图</a>
                </li>
            </ul>
        </div>
        <div class="row" style="height: 100% !important;">
            <div class="col-md-12" style="height: 100% !important;">
                <div style="margin-bottom:10px;text-align: right; z-index: 100;top: 10px; right: 20px;position: absolute;">
                    <select id="area1" style="display: none"
                            class="table-group-action-input form-control input-inline input-small input-sm">
                    </select>
                    <select id="area2"
                            class="table-group-action-input form-control input-inline input-small input-sm">
                    </select>
                    <select id="institutionTypeDictId"
                            class="table-group-action-input form-control input-inline input-small input-sm">
                        <option value=''>星级类型</option>
                        <option value='1'>一星级</option>
                        <option value='2'>二星级</option>
                        <option value='3'>三星级</option>
                        <option value='4'>四星级</option>
                        <option value='5'>五星级</option>
                    </select>
                    <input id="name" placeholder="机构名称"
                           class="table-group-action-input form-control input-inline input-small input-sm">
                    </input>
                    <button id="search" class="btn btn-sm btn-circle btn-import "><i class="fa fa-check"></i>查询
                    </button>
                    <a target="_blank" href="${pageContext.request.contextPath }/admin/serviceOrgShow/map"
                       title="全屏"><img style="width: 30px;height:30px;cursor: pointer"
                                       src="${pageContext.request.contextPath }/assets/admin/pages/img/list.png"
                                       id="statics"/></a>
                </div>
                <input type="text" id="suggestId" class="form-control input-inline input-sm"
                       placeholder="搜索地址..."
                       style="position: absolute; z-index: 1; margin: 5px;width: 250px;height: 30px;">
                <div id="allmap" style="height: 100% !important;"></div>
            </div>
        </div>
        <div id="needs_box" style="position: absolute">
            <div class="box-btn">
                <span>&lt;</span>
                <span style="display: none">&gt;</span>
            </div>

            <div class="needs_info_box" style="width:290px">
                <div class="needs_info">
                    <p>
                        <span>一星级</span>
                        <span class="rt"><span id="type1">0</span>个</span>
                    </p>
                    <p>
                        <span>二星级</span>
                        <span class="rt"><span id="type2">0</span>个</span>
                    </p>
                    <p>
                        <span>三星级</span>
                        <span class="rt"><span id="type3">0</span>个</span>
                    </p>
                    <p>
                        <span>四星级</span>
                        <span class="rt"><span id="type4">0</span>个</span>
                    </p>
                    <p>
                        <span>五星级</span>
                        <span class="rt"><span id="type5">0</span>个</span>
                    </p>
                </div>
            </div>

            <div class="needs_nav">
                <span class="active">星级类型</span>
            </div>
        </div>
        <div style="    position: absolute;    bottom: 10px;    right: 20px;    color: #1589d9;    background-color: rgba(255, 255, 255, 0.75); font-size: 15px;">
            <span><img src="${pageContext.request.contextPath }/assets/global/icon/icon_anull.png">：无等级的机构</span>
            <span><img src="${pageContext.request.contextPath }/assets/global/icon/icon_a1.png">：A机构</span>
            <span><img src="${pageContext.request.contextPath }/assets/global/icon/icon_a2.png">：AA机构</span>
            <span><img src="${pageContext.request.contextPath }/assets/global/icon/icon_a3.png">：AAA机构</span>
            <span><img src="${pageContext.request.contextPath }/assets/global/icon/icon_a4.png">：AAAA机构</span>
            <span><img src="${pageContext.request.contextPath }/assets/global/icon/icon_a5.png">：AAAAA机构</span>
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
        <script type="text/javascript"
                src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>
        <!-- 自定义窗口 -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/view/js/InfoBox.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/institution_map.js?v=3.8"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                InstitutionMap.init();
                InstitutionMap.searchInit();
                //初始化添加所有marker
                InstitutionMap.addMarker("")
                //赋予点击事件
                $("#search").click(function () {
                    InstitutionMap.searchArea();
                });
                //获取数量
                $.post(window.apppath + "/admin/api/institution/getInstitutionStarClass", {}, function (res) {
                    if (res != null && res != "") {
                        for (var i in res) {
                            var data = res[i];
                            if (i == "各机构星级数量统计情况") {
                                var flag=0;
                                for (var j in data) {
                                    $("#type"+flag).html(data[j]);
                                    flag++;
                                }
                            }
                        }
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
                    }
                    //    需求切换
                }, "json");
                //获取区级以上的区域
                $.post(window.apppath + "/admin/api/area/getAreaLessLevel", {
                        level: 2
                    },
                    function (res) {
                        if (res != null) {
                            var area1Html = "";
                            var area2Html = "<option value='-1'>行政区</option>";
                            for (var i in res) {
                                if (res[i].level == 1) {
                                    area1Html += '<option value="' + res[i].id + '">' + res[i].name + '</option>';
                                }
                                else {
                                    area2Html += '<option value="' + res[i].id + '">' + res[i].name + '</option>';
                                }
                            }
                            $("#area1").html(area1Html);
                            $("#area2").html(area2Html);
                        }
                    }, 'json');
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

