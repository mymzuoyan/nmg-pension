<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/9/12
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>机构星级评定详情</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jquery-multi-select/css/multi-select.css?v=1.1"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
        <style>

            .remove {
                color: red;
                font-size: 17px;
                cursor: pointer;
                text-decoration: none;
            }

            .removeImg {
                z-index: 2;
                width: 10px;
                height: 10px;
                position: absolute;
                right: 0px;
                background-image: url("${pageContext.request.contextPath }/assets/global/img/delete.png");
                background-position: 50% 50%;
            }

            .file-box {
                position: relative;
                width: 80px;
                height: 80px;
                border: 1px solid #D9D9D9;
                background-image: url("${pageContext.request.contextPath }/assets/admin/pages/img/add.png");
            }

            .file-div {
                width: 80px;
                height: 80px;
                margin-right: 10px;
                display: inline-block;
                position: relative;
                vertical-align: text-bottom;
            }

            .file-div img {
                width: 100%;
                height: 100%;
            }

            .file-box input {
                position: absolute;
                z-index: 1;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                opacity: 0;
            }

            .file-box-list {
                vertical-align: top;
            }

            .score{
                color: red;
                font-size: 24px;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">
        <div class="row">
            <div class="col-md-12">
                <!-- Begin: life time stats -->
                    <div class="portlet-body">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-equalizer font-purple-plum hide"></i>
                                <span class="caption-subject font-red-sunglo bold uppercase">机构养老服务站星级评定标准列表详细列表</span>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <table id="starRate" border="1"
                               class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                               align="center" style="border-collapse: collapse;">
                            <tr>
                                <td colspan="3" style=" vertical-align:middle;text-align: center"><font
                                        color="red">*</font>评定机构名称
                                </td>
                                <td colspan="3" style="vertical-align:middle;">
                                    <input type="text" class="form-control"
                                           name="institutionName" value="${star.institutionName}"
                                           >
                                    <input type="hidden" name="serviceOrgId" id="serviceOrgId"
                                           value="${star.serviceOrgId}">
                                    <input type="hidden" name="starId" id="starId"
                                           value="${star.id}">
                                </td>
                                <td colspan="3" style="vertical-align:middle;text-align: center"><font
                                        color="red">*</font>所属区域
                                </td>
                                <td colspan="4" style="vertical-align:middle;">
                                    <input type="text" class="form-control"
                                           name="areaName" value="${star.areaName}"
                                           >
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="vertical-align:middle;text-align: center"><font
                                        color="red">*</font>星级
                                </td>
                                <td colspan="3" style="text-align: center;vertical-align: middle;">
                                    <lb:select value="${star.starClass}"
                                               cssClass="selectpickershow-tick form-control"
                                               name="starClass" disabled="disabled" readOnly="readonly">
                                        <lb:option value="">--请选择--</lb:option>
                                        <lb:option value="1">一星级</lb:option>
                                        <lb:option value="2">二星级</lb:option>
                                        <lb:option value="3">三星级</lb:option>
                                        <lb:option value="4">四星级</lb:option>
                                        <lb:option value="5">五星级</lb:option>
                                    </lb:select>
                                </td>
                                <td colspan="3" style="vertical-align:middle;text-align: center"><font
                                        color="red">*</font>评定总分数
                                </td>
                                <td colspan="4" style="vertical-align:middle;">
                                    <input type="text" class="form-control"
                                           name="totalScore" value="${star.totalScore}"
                                           readonly>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 40px; vertical-align:middle;text-align: center" colspan="13">
                                    <span class="score"><b>评分项（安全部分）300分</b></span></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    序号
                                </td>
                                <td colspan="5"
                                    style="text-align:center;vertical-align:middle;">
                                    标准要求
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    分值
                                </td>
                                <td colspan="5"
                                    style="text-align:center;vertical-align:middle;">
                                    评分标准
                                </td>
                                <td colspan="1" style="text-align: center">评分</td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    1
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction01s" name="fraction01s"
                                               value="${star.fraction01}">
                                        <label class="checkbox-inline" style="padding-left: 20px">
                                            <input type="checkbox" name="fraction01" data-score="0"
                                                   value="1"/>无<span style="display: none" class="thisSpan">20</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    20
                                </td>
                                <td colspan="5" style="vertical-align:middle;">年内无责任事故</td>
                                <td style="color:red;text-align: center" class="pf1" ></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    2
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction02s" name="fraction02s"
                                               value="${star.fraction02}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction02" data-score="6"
                                                   value="1"/>符合<span style="display: none" class="thisSpan">6</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    6
                                </td>
                                <td colspan="5" style="vertical-align:middle;">周边环境远离噪声、污染源；救护车、消防车可出入</td>
                                <td style="color:red;text-align: center" class="pf2" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    3
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction03s" name="fraction03s"
                                               value="${star.fraction03}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction03" data-score="6"
                                                   value="1"/>符合<span style="display: none" class="thisSpan">6</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    6
                                </td>
                                <td colspan="5" style="vertical-align:middle;">主要步行通道平坦、无高差；有无障碍设施，方便轮椅通行，配有夜间照明和标识</td>
                                <td style="color:red;text-align: center" class="pf3" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    4
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction04s" name="fraction04s"
                                               value="${star.fraction04}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction04" data-score="6"
                                                   value="1"/>(1)符合<span style="display: none" class="thisSpan">6</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction04" data-score="4"
                                                   value="2"/>(2)符合<span style="display: none" class="thisSpan">4</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">（1）室外地面平整；（2）室内地面选用平整、防滑、耐磨材料，厨房、卫生间、浴室地面选防滑材料</td>
                                <td style="color:red;text-align: center" class="pf4" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    5
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction05s"
                                               value="${star.fraction05}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction05" data-score="4"
                                                   value="1"/>(1)出入口不少于2处<span style="display: none" class="thisSpan">4</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction05" data-score="2"
                                                   value="2"/>(1)出入口有效宽度不小于1.20m（上一条满足的不选）<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction05" data-score="4"
                                                   value="3"/>(2)符合标准<span style="display: none" class="thisSpan">4</span></label>
                                        <label class="checkbox-inline" style="padding-left: 10px">
                                            <input type="checkbox" name="fraction05" data-score="4"
                                                   value="4"/>(3)出入口处平台与建筑室外采用缓步台阶和轮椅坡道过渡<span style="display: none" class="thisSpan">4</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction05" data-score="2"
                                                   value="5"/>(3)起止处有异色警示条（上一条满足的不选）<span style="display: none" class="thisSpan">2</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    12
                                </td>
                                <td colspan="5" style="vertical-align:middle;">（1）出入口不少于2处，有效宽度不小于1.20m；（2）出入口处内、外应有不小于1.50m×1.50m轮椅回转面积；（3）出入口处的平台与建筑室外采用缓步台阶和轮椅坡道过渡，起止处有异色警示条</td>
                                <td style="color:red;text-align: center" class="pf5" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    6
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction06s" name="fraction06s"
                                               value="${star.fraction06}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction06" data-score="5"
                                                   value="1"/>主要出入口的门选用旋转门、推拉门<span style="display: none" class="thisSpan">5</span></label>
                                        <label class="checkbox-inline" style="padding-left: 10px">
                                            <input type="checkbox" name="fraction06" data-score="5"
                                                   value="2"/>公共外门、重度照护室门净宽不小于1.10m；卧室、走道、卫生间、浴室、防火等门净宽不小于0.80m<span style="display: none" class="thisSpan">5</span></label>
                                        <label class="checkbox-inline" style="padding-left: 10px">
                                            <input type="checkbox" name="fraction06" data-score="5"
                                                   value="3"/>开向公共走道门不影响安全疏散；室内面积大于60m2时，门向疏散方向开启<span style="display: none" class="thisSpan">5</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction06" data-score="5"
                                                   value="4"/>（2）项不符合标准<span style="display: none" class="thisSpan">0</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    15
                                </td>
                                <td colspan="5" style="vertical-align:middle;">（1）主要出入口的门不选用旋转门、推拉门；公共外门、重度照护室门净宽不小于1.10m；卧室、走道、卫生间、浴室、防火等门净宽不小于0.80m；开向公共走道门不影响安全疏散；室内面积大于60m2时，门向疏散方向开启；（2）公共区域的门配有方便观察的玻璃</td>
                                <td style="color:red;text-align: center" class="pf6" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    7
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction07s" name="fraction07s"
                                               value="${star.fraction07}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction07" data-score="4"
                                                   value="1"/>（1）项符合<span style="display: none" class="thisSpan">4</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction07" data-score="4"
                                                   value="2"/>（2）项符合<span style="display: none" class="thisSpan">4</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction07" data-score="4"
                                                   value="3"/>（3）项符合<span style="display: none" class="thisSpan">4</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    12
                                </td>
                                <td colspan="5" style="vertical-align:middle;">（1）室内装饰材料符合消防环保要求；大面积使用玻璃材质时应有异色警示标识；（2）有漏电保护装置；（3）走廊墙面无突出物，灭火器和标识板等设置应不妨碍老年人正常通行</td>
                                <td style="color:red;text-align: center" class="pf7" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    8
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction08s" name="fraction08s"
                                               value="${star.fraction08}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction08" data-score="4"
                                                   value="1"/>（1）项符合<span style="display: none" class="thisSpan">4</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction08" data-score="6"
                                                   value="2"/>（2）项符合<span style="display: none" class="thisSpan">6</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction08" data-score="4"
                                                   value="3"/>（3）项符合<span style="display: none" class="thisSpan">4</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    14
                                </td>
                                <td colspan="5" style="vertical-align:middle;">（1）入口、大厅、楼层、电梯间、各类用房应设置标识；（2）安全出入口、紧急出口、上下楼梯、灭火器等应设置标识；（3）标识设置应醒目且有一定导向作用</td>
                                <td style="color:red;text-align: center" class="pf8" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    9
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction09s" name="fraction09s"
                                               value="${star.fraction09}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction09" data-score="20"
                                                   value="1"/>无维护保养记录<span style="display: none" class="thisSpan">0</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction09" data-score="0"
                                                   value="2"/>记录不规范不完整<span style="display: none" class="thisSpan">0</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction09" data-score="20"
                                                   value="3"/>符合<span style="display: none" class="thisSpan">20</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    20
                                </td>
                                <td colspan="5" style="vertical-align:middle;">消防设施做好维护保养，并有完整记录</td>
                                <td style="color:red;text-align: center" class="pf9" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction10s" name="fraction10s"
                                               value="${star.fraction10}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction10" data-score="15"
                                                   value="1"/>符合<span style="display: none" class="thisSpan">15</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    15
                                </td>
                                <td colspan="5" style="vertical-align:middle;">有明显标注，安全出口、疏散通道，应急照明设备</td>
                                <td style="color:red;text-align: center" class="pf10" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    11
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction11s" name="fraction11s"
                                               value="${star.fraction11}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction11" data-score="0"
                                                   value="1"/>无安全疏散指示图<span style="display: none" class="thisSpan">0</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction11" data-score="0"
                                                   value="2"/>设置不规范<span style="display: none" class="thisSpan">0</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction11" data-score="10"
                                                   value="3"/>符合<span style="display: none" class="thisSpan">10</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">老年人居住用房内及公共部位等区域的明显位置设置该区域的安全疏散指示图，指示图上应标明老年人容易识别的疏散路线、安全出口、人员所在位置和必要的文字说明</td>

                                <td style="color:red;text-align: center" class="pf11" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    12
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction12s" name="fraction12s"
                                               value="${star.fraction12}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction12" data-score="5"
                                                   value="1"/>符合<span style="display: none" class="thisSpan">5</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    5
                                </td>
                                <td colspan="5" style="vertical-align:middle;">防火门开启方向有明显标注（推、拉），如有常闭式防火门应处于关闭状态</td>

                                <td style="color:red;text-align: center" class="pf12" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    13
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction13s" name="fraction13s"
                                               value="${star.fraction13}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction13" data-score="20"
                                                   value="1"/>符合<span style="display: none" class="thisSpan">20</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    20
                                </td>
                                <td colspan="5" style="vertical-align:middle;">无裸露、老化的电线；禁止随意拉接和安装用电线路和设备；定期组织对电器产品及其线路、管路进行维护保养和检测；老年人居室未使用电热毯、热炉、热得快等大功率电气设备；未违规存放易燃易爆危险品</td>

                                <td style="color:red;text-align: center" class="pf13" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    14
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction14s" name="fraction14s"
                                               value="${star.fraction14}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction14" data-score="10"
                                                   value="1"/>符合<span style="display: none" class="thisSpan">10</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">设备放置安全，如：开水炉、氧气瓶、热水瓶、饮水机、微波炉等设备放置在安全位置，并处于受控状态</td>

                                <td style="color:red;text-align: center" class="pf14" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    15
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction15s" name="fraction15s"
                                               value="${star.fraction15}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction15" data-score="15"
                                                   value="1"/>符合<span style="display: none" class="thisSpan">15</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    15
                                </td>
                                <td colspan="5" style="vertical-align:middle;">划定吸烟区域，老人居室内严禁吸烟</td>

                                <td style="color:red;text-align: center" class="pf15" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    16
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction16s" name="fraction16s"
                                               value="${star.fraction16}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction16" data-score="0"
                                                   value="1"/>符合<span style="display: none" class="thisSpan">10</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">厨房管道燃气、液化气钢瓶等设施、设备的安装存放（液化气钢瓶）与使用应符合消防及燃气专业机构的要求，并出具检查验收合格证明</td>

                                <td style="color:red;text-align: center" class="pf16" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    17
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction17s" name="fraction17s"
                                               value="${star.fraction17}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction17" data-score="7"
                                                   value="1"/>（1）项符合要求<span style="display: none" class="thisSpan">7</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction17" data-score="7"
                                                   value="2"/>（2）生熟分开<span style="display: none" class="thisSpan">7</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction17" data-score="7"
                                                   value="3"/>（2）成品半成品分开制作、存储<span style="display: none" class="thisSpan">7</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction17" data-score="7"
                                                   value="4"/>（3）项食品留样时间足48小时<span style="display: none" class="thisSpan">7</span></label>
                                        <label class="checkbox-inline" style="padding-left: 10px">
                                            <input type="checkbox" name="fraction17" data-score="7"
                                                   value="5"/>（3）食品留样全<span style="display: none" class="thisSpan">7</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    35
                                </td>
                                <td colspan="5" style="vertical-align:middle;">（1）厨房做到明厨亮灶；（2）食堂生熟分开，成品与半成品分开制作、存储；（3）食品留样至少48小时且有留样记录</td>

                                <td style="color:red;text-align: center" class="pf17" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    18
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction18s" name="fraction18s"
                                               value="${star.fraction18}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction18" data-score="10"
                                                   value="1"/>有台账资料<span style="display: none" class="thisSpan">10</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">建立特种设施、设备台帐（电梯、空调、锅炉等）；特种设备定期接受专业单位检验</td>

                                <td style="color:red;text-align: center" class="pf18" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    19
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction19s" name="fraction19s"
                                               value="${star.fraction19}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction19" data-score="4"
                                                   value="1"/>有制定消防安全相关管理制度、预警机制及应急预案<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction19" data-score="2"
                                                   value="2"/>有特种设备设施安全相关管理制度、预警机制及应急预案<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 10px">
                                            <input type="checkbox" name="fraction19" data-score="2"
                                                   value="3"/>有食品安全相关管理制度、预警机制及应急预案<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction19" data-score="2"
                                                   value="4"/>有突发事件等相关管理制度、预警机制及应急预案<span style="display: none" class="thisSpan">2</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">制定消防安全、特种设备设施安全、食品安全、突发事件等相关管理制度、预警机制及应急预案</td>

                                <td style="color:red;text-align: center" class="pf18" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    20
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction20s" name="fraction20s"
                                               value="${star.fraction20}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction20" data-score="10"
                                                   value="1"/>组织员工安全培训及未进行“突发事件预案”演练<span style="display: none" class="thisSpan">15</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    15
                                </td>
                                <td colspan="5" style="vertical-align:middle;">每半年至少开展一次安全培训，针对本院所制定的各项“突发事件预案”开展定期演练，并有完整记录和照片</td>

                                <td style="color:red;text-align: center" class="pf20" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    21
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction21s" name="fraction21s"
                                               value="${star.fraction21}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction21" data-score="2"
                                                   value="1"/>每月组织一次安全工作自查<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction21" data-score="2"
                                                   value="2"/>安全工作自查记录规范完整<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction21" data-score="2"
                                                   value="3"/>有消防安全<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction21" data-score="2"
                                                   value="4"/>有食品采购安全<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 10px">
                                            <input type="checkbox" name="fraction21" data-score="2"
                                                   value="5"/>有安全设施安全<span style="display: none" class="thisSpan">2</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">每月组织一次安全工作自查，自查项目覆盖全院各项工作（如：消防安全、食品采购及安全设施等），安全工作自查记录完整</td>

                                <td style="color:red;text-align: center" class="pf21" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    22
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction22s" name="fraction22s"
                                               value="${star.fraction22}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction22" data-score="10"
                                                   value="1"/>符合配备有资质的专（兼）职消防管理人员<span style="display: none" class="thisSpan">10</span></label>
                                        <label class="checkbox-inline" style="padding-left: 10px">
                                            <input type="checkbox" name="fraction22" data-score="10"
                                                   value="2"/>符合建立微型消防站、并达到“三知四会一联通，处置要在三分钟”要求<span style="display: none" class="thisSpan">10</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    20
                                </td>
                                <td colspan="5" style="vertical-align:middle;">配备有资质的专（兼）职消防管理人员；建立微型消防站、并达到“三知四会一联通，处置要在三分钟”要求</td>

                                <td style="color:red;text-align: center" class="pf22" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="13"
                                    style="text-align: right;vertical-align: middle;font-size: 18px" class="caption-subject font-red bold uppercase">
                                    安全部分总评分数:<span id="all">0</span>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 40px; vertical-align:middle;text-align: center" colspan="13">
                                    <span class="score"><b>评分项（服务部分）350分</b></span></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    序号
                                </td>
                                <td colspan="5"
                                    style="text-align:center;vertical-align:middle;">
                                    标准要求
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    分值
                                </td>
                                <td colspan="5"
                                    style="text-align:center;vertical-align:middle;">
                                    评分标准
                                </td>
                                <td colspan="1" style="text-align: center">评分</td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    1
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction23s" name="fraction23s"
                                               value="${star.fraction23}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction23" data-score="6"
                                                   value="1"/>生活照料<span style="display: none" class="thisSpan">6</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction23" data-score="6"
                                                   value="2"/>短期托养<span style="display: none" class="thisSpan">6</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction23" data-score="6"
                                                   value="3"/>助医<span style="display: none" class="thisSpan">6</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction23" data-score="6"
                                                   value="4"/>助餐<span style="display: none" class="thisSpan">6</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction23" data-score="6"
                                                   value="5"/>助浴<span style="display: none" class="thisSpan">6</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction23" data-score="6"
                                                   value="6"/>助洁<span style="display: none" class="thisSpan">6</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction23" data-score="6"
                                                   value="7"/>助行<span style="display: none" class="thisSpan">6</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction23" data-score="6"
                                                   value="8"/>关怀访视<span style="display: none" class="thisSpan">6</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction23" data-score="6"
                                                   value="9"/>心理咨询<span style="display: none" class="thisSpan">6</span></label>
                                        <label class="checkbox-inline" style="padding-left: 10px">
                                            <input type="checkbox" name="fraction23" data-score="6"
                                                   value="10"/>应急救援<span style="display: none" class="thisSpan">6</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    60
                                </td>
                                <td colspan="5" style="vertical-align:middle;">开展居家养老服务，主要为老年人提供生活照料、短期托养、助医、助餐、助浴、助洁、助行、关怀访视、心理咨询和应急救援等服务</td>

                                <td style="color:red;text-align: center" class="pf23" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    2
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction24s" name="fraction24s"
                                               value="${star.fraction24}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction24" data-score="5"
                                                   value="1"/>建立评估制度<span style="display: none" class="thisSpan">5</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction24" data-score="5"
                                                   value="2"/>已对入住服务对象进行评估或评估等级与实际状况相符<span style="display: none" class="thisSpan">5</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">对每一位入住的服务对象进行入院评估，评估等级与实际状况相符</td>

                                <td style="color:red;text-align: center" class="pf24" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    3
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction25s" name="fraction25s"
                                               value="${star.fraction25}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction25" data-score="10"
                                                   value="1"/>照护内容的选择与评估等级相符<span style="display: none" class="thisSpan">10</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction25" data-score="5"
                                                   value="2"/>设置老年人照护服务项目卡<span style="display: none" class="thisSpan">5</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    15
                                </td>
                                <td colspan="5" style="vertical-align:middle;">根据服务对象的评估等级与实际状况选择照护服务项目，并设置老年人照护项目服务卡，注明该老年人所需服务项目、膳食要求、特殊体质等（如：糖尿病、严重骨质疏松等）</td>

                                <td style="color:red;text-align: center" class="pf25" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    4
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction26s" name="fraction26s"
                                               value="${star.fraction26}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction26" data-score="5"
                                                   value="1"/>有24小时当班值班服务记录、护理交接班记录<span style="display: none" class="thisSpan">5</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction26" data-score="5"
                                                   value="2"/>记录格式规范，记录内容完整规范<span style="display: none" class="thisSpan">5</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">有24小时当班、值班服务，护理交接班记录规范</td>

                                <td style="color:red;text-align: center" class="pf26" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    5
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction27s" name="fraction27s"
                                               value="${star.fraction27}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction27" data-score="0"
                                                   value="1"/>护理员培训率90%以上<span style="display: none" class="thisSpan">30</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction27" data-score="5"
                                                   value="2"/>培训率80%-89%<span style="display: none" class="thisSpan">25</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction27" data-score="10"
                                                   value="3"/>培训率70%-79%<span style="display: none" class="thisSpan">20</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction27" data-score="15"
                                                   value="4"/>培训率60%-69%<span style="display: none" class="thisSpan">15</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction27" data-score="20"
                                                   value="5"/>培训率50%-59%<span style="display: none" class="thisSpan">10</span></label>
                                        <label class="checkbox-inline" style="padding-left: 10px">
                                            <input type="checkbox" name="fraction27" data-score="30"
                                                   value="6"/>培训率50%以下<span style="display: none" class="thisSpan">0</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    30
                                </td>
                                <td colspan="5" style="vertical-align:middle;">开展护理员培训，提高护理员服务水平</td>

                                <td style="color:red;text-align: center" class="pf27" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    6
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction28s" name="fraction28s"
                                               value="${star.fraction28}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction28" data-score="0"
                                                   value="1"/>以现场询问、查勘为准<span style="display: none" class="thisSpan">10</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">护理员熟悉服务对象的照护等级，服务内容及各服务项目的流程</td>

                                <td style="color:red;text-align: center" class="pf28" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    7
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction29s" name="fraction29s"
                                               value="${star.fraction29}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction29" data-score="0"
                                                   value="1"/>收住失能、半失能老年人占比50%以上<span style="display: none" class="thisSpan">60</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction29" data-score="20"
                                                   value="2"/>占比40%-49%<span style="display: none" class="thisSpan">40</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction29" data-score="40"
                                                   value="3"/>占比30%-39%<span style="display: none" class="thisSpan">20</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction29" data-score="60"
                                                   value="4"/>占比30%以下<span style="display: none" class="thisSpan">0</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    60
                                </td>
                                <td colspan="5" style="vertical-align:middle;">提升护理型床位占比，重点为失能、半失能老年人提供养老护理服务</td>

                                <td style="color:red;text-align: center" class="pf29" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    8
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction30s" name="fraction30s"
                                               value="${star.fraction30}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction30" data-score="15"
                                                   value="1"/>（1）项符合<span style="display: none" class="thisSpan">5</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction30" data-score="5"
                                                   value="2"/>（2）制定压疮预防制度、压疮护理流程<span style="display: none" class="thisSpan">10</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    15
                                </td>
                                <td colspan="5" style="vertical-align:middle;">（1）老人2期及以上压疮在院新发生率应低于5%；（2）制定压疮预防制度、压疮护理流程</td>

                                <td style="color:red;text-align: center" class="pf30" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    9
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction31s" name="fraction31s"
                                               value="${star.fraction31}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction31" data-score="0"
                                                   value="1"/>居室内物品分类放置整齐有序，橱柜整洁欠规范<span style="display: none" class="thisSpan">5</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction31" data-score="3"
                                                   value="2"/>易造成伤害的利器等集中管理<span style="display: none" class="thisSpan">3</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction31" data-score="2"
                                                   value="3"/>有集中管理记录<span style="display: none" class="thisSpan">2</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">老人居室内物品分类放置整齐有序，及时清理保持橱柜整洁；对有认知缺失、情绪行为异常的被照护者，易造成伤害的利器等应集中管理且有记录</td>

                                <td style="color:red;text-align: center" class="pf31" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction32s" name="fraction32s"
                                               value="${star.fraction32}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction32" data-score="0"
                                                   value="1"/>符合<span style="display: none" class="thisSpan">10</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">各场所卫生状况良好；老人个人卫生状况良好</td>

                                <td style="color:red;text-align: center" class="pf32" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    11
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction33s" name="fraction33s"
                                               value="${star.fraction33}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction33" data-score="15"
                                                   value="1"/>制定消毒制度或实施消毒<span style="display: none" class="thisSpan">7</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction33" data-score="5"
                                                   value="2"/>实施分类消毒规范或消毒记录与实际消毒状况相符<span style="display: none" class="thisSpan">8</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    15
                                </td>
                                <td colspan="5" style="vertical-align:middle;">制定日常用品分类消毒制度，对老年人的日常用品（口杯、毛巾、衣、被等物）分类清洗消毒，不少于1次/周，且有记录</td>

                                <td style="color:red;text-align: center" class="pf33" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    12
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction34s" name="fraction34s"
                                               value="${star.fraction34}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction34" data-score="15"
                                                   value="1"/>制定消毒制度或实施消毒<span style="display: none" class="thisSpan">7</span></label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction34" data-score="5"
                                                   value="2"/>消毒处置程序规范或消毒记录与实际消毒状况相符<span style="display: none" class="thisSpan">8</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    15
                                </td>
                                <td colspan="5" style="vertical-align:middle;">制定出院、死亡后及疑似传染性疾病使用过的各类物品消毒制度，并按终、末消毒程序处置；按消毒隔离原则规范处置且有记录</td>

                                <td style="color:red;text-align: center" class="pf34" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    13
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction35s" name="fraction35s"
                                               value="${star.fraction35}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction35" data-score="10"
                                                   value="1"/>（1）项符合<span style="display: none" class="thisSpan">10</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction35" data-score="10"
                                                   value="2"/>（2）项建立老年人健康档案<span style="display: none" class="thisSpan">10</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction35" data-score="0"
                                                   value="3"/>档案记录规范或符合<span style="display: none" class="thisSpan">0</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    20
                                </td>
                                <td colspan="5" style="vertical-align:middle;">（1）每年至少为老年人体检1次；（2）为老年人建立健康档案；老年人在院期间健康状况动态变化记入健康档案，如无特殊情况每月记录一次，特殊情况随时记录</td>

                                <td style="color:red;text-align: center" class="pf35" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    14
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction36s" name="fraction36s"
                                               value="${star.fraction36}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction36" data-score="20"
                                                   value="1"/>“非内设医疗机构”药物的收、管、发及“特殊药物”管理、发放不符合要求任意一项<span style="display: none" class="thisSpan">0</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction36" data-score="0"
                                                   value="2"/>均符合<span style="display: none" class="thisSpan">20</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    20
                                </td>
                                <td colspan="5" style="vertical-align:middle;">“非内设医疗机构”外配药物发放须按约定进行，按医嘱接受收物且有规范登记；设置专用药柜，药品按规定储存、区分，且均在有效期内；药品有外包装，包装上标注用药老人姓名、床号；特殊药品（镇静类、抗精神病药品）专柜上锁保管；遵医嘱发放药品，设置服药单；特殊药物发放时送药到口或看服</td>

                                <td style="color:red;text-align: center" class="pf36" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    15
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction37s" name="fraction37s"
                                               value="${star.fraction37}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction37" data-score="2"
                                                   value="1"/>有歌舞<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction37" data-score="2"
                                                   value="2"/>有书画<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction37" data-score="2"
                                                   value="3"/>有手工<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction37" data-score="2"
                                                   value="4"/>有棋牌<span style="display: none" class="thisSpan">4</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">开展适合老年人身心特点的歌舞、书画、手工、棋牌等文化娱乐活动和康乐活动；活动有计划，组织实施有记录，活动中有防范措施</td>

                                <td style="color:red;text-align: center" class="pf37" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    16
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction38s" name="fraction38s"
                                               value="${star.fraction38}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction38" data-score="10"
                                                   value="1"/>每年组织两次以上的大型活动或未制定“大型活动突发事件预案”<span style="display: none" class="thisSpan">10</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">每年组织两次以上大型活动，活动有记录，制定大型活动突发事件预案</td>

                                <td style="color:red;text-align: center" class="pf38" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    17
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction39s" name="fraction39s"
                                               value="${star.fraction39}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction39" data-score="10"
                                                   value="1"/>制定消毒制度、实施消毒<span style="display: none" class="thisSpan">10</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">建立餐具及配、送餐用具（如：送餐车、送餐专用电梯等）消毒制度；实施消毒规范并记录完整</td>

                                <td style="color:red;text-align: center" class="pf39" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    18
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction40s" name="fraction40s"
                                               value="${star.fraction40}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction40" data-score="5"
                                                   value="1"/>公布食谱<span style="display: none" class="thisSpan">10</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">膳食荤素搭配合理，每周公布食谱，膳食符合地域、民族、宗教习惯</td>

                                <td style="color:red;text-align: center" class="pf40" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    18
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction41s" name="fraction41s"
                                               value="${star.fraction41}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction41" data-score="10"
                                                   value="1"/>有特殊膳食记录<span style="display: none" class="thisSpan">10</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">遵医嘱为需特殊膳食的老年人提供“特殊膳食”（如：低糖、低脂及酥、烂或流质膳食等），其膳食要求应有记录</td>

                                <td style="color:red;text-align: center" class="pf41" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="13"
                                    style="text-align: right;vertical-align: middle;font-size: 18px" class="caption-subject font-red bold uppercase">
                                    服务部分总评分数:<span id="all2">0</span>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 40px; vertical-align:middle;text-align: center" colspan="13">
                                    <span class="score"><b>评分项（管理部分）200分</b></span></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    1
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction42s" name="fraction42s"
                                               value="${star.fraction42}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction42" data-score="-6"
                                                   value="1"/>配备一名医护人员<span style="display: none" class="thisSpan">6</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction42" data-score="-12"
                                                   value="2"/>配备两名医护人员<span style="display: none" class="thisSpan">12</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    12
                                </td>
                                <td colspan="5" style="vertical-align:middle;">医护人员</td>

                                <td style="color:red;text-align: center" class="pf42" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    2
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction43s" name="fraction43s"
                                               value="${star.fraction43}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction43" data-score="-6"
                                                   value="1"/>配备一名专（兼）职社工或心理咨询师<span style="display: none" class="thisSpan">6</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction43" data-score="-10"
                                                   value="2"/>两名及以上专（兼）职社工或心理咨询师<span style="display: none" class="thisSpan">10</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">社工、心理咨询师</td>

                                <td style="color:red;text-align: center" class="pf43" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    3
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction44s" name="fraction44s"
                                               value="${star.fraction44}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction44" data-score="-2"
                                                   value="1"/>配备一名及以上兼职营养师<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction44" data-score="-4"
                                                   value="2"/>配备一名及以上专职营养师<span style="display: none" class="thisSpan">4</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    4
                                </td>
                                <td colspan="5" style="vertical-align:middle;">营养师</td>

                                <td style="color:red;text-align: center" class="pf44" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    4
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction45s" name="fraction45s"
                                               value="${star.fraction45}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction45" data-score="-2"
                                                   value="1"/>配备一名及以上兼职康复师<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction45" data-score="-4"
                                                   value="2"/>配备一名及以上专职康复师<span style="display: none" class="thisSpan">4</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    4
                                </td>
                                <td colspan="5" style="vertical-align:middle;">康复师</td>

                                <td style="color:red;text-align: center" class="pf45" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    5
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction46s" name="fraction46s"
                                               value="${star.fraction46}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction46" data-score="5"
                                                   value="1"/>6个月以内开展一次培训上<span style="display: none" class="thisSpan">5</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction46" data-score="10"
                                                   value="2"/>开展培训<span style="display: none" class="thisSpan">5</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">开展人员培训，培训内容包括以人为本、爱老尊老孝老服务理念、相关政策法规及管理服务技能</td>

                                <td style="color:red;text-align: center" class="pf46" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    6
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction47s" name="fraction47s"
                                               value="${star.fraction47}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction47" data-score="10"
                                                   value="1"/>有房间或防火巡查制度<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction47" data-score="5"
                                                   value="2"/>有房间或防火巡查制度，且有无巡查记录<span style="display: none" class="thisSpan">5</span></label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction47" data-score="5"
                                                   value="3"/>夜间防火巡查不少于2次<span style="display: none" class="thisSpan">3</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">每日开展房间及防火巡查，观察老年人的身心状况，特殊情况及时报告并协助处理，必要时通知监护人；夜间防火巡查不少于两次，并做好记录</td>

                                <td style="color:red;text-align: center" class="pf47" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    7
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction48s" name="fraction48s"
                                               value="${star.fraction48}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction48" data-score="5"
                                                   value="1"/>建立老人出入请销假<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction48" data-score="5"
                                                   value="2"/>建立家属探视<span style="display: none" class="thisSpan">3</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    5
                                </td>
                                <td colspan="5" style="vertical-align:middle;">建立老人出入请销假、家属探视等制度</td>

                                <td style="color:red;text-align: center" class="pf48" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    8
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction49s" name="fraction49s"
                                               value="${star.fraction49}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction49" data-score="5"
                                                   value="1"/>建立出入院流程<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction49" data-score="5"
                                                   value="2"/>建立无专人负责<span style="display: none" class="thisSpan">3</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    5
                                </td>
                                <td colspan="5" style="vertical-align:middle;">建有入出院流程，有专人负责并按规定执行</td>

                                <td style="color:red;text-align: center" class="pf49" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    9
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction50s" name="fraction50s"
                                               value="${star.fraction50}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction50" data-score="5"
                                                   value="1"/>及时与监护人沟通或未修改相关服务内容<span style="display: none" class="thisSpan">5</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    5
                                </td>
                                <td colspan="5" style="vertical-align:middle;">当老年人的状况和需求发生变化或机构提供的服务有更改时，应及时与监护人沟通，并再次确认和修订相关服务内容</td>

                                <td style="color:red;text-align: center" class="pf50" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction51s" name="fraction51s"
                                               value="${star.fraction51}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction51" data-score="0"
                                                   value="1"/>有宣传栏和手册<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction51" data-score="2"
                                                   value="2"/>有执业证照<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction51" data-score="2"
                                                   value="3"/>有人员资质<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction51" data-score="2"
                                                   value="4"/>有相关证照<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction51" data-score="2"
                                                   value="5"/>有地理位置<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction51" data-score="2"
                                                   value="6"/>有收费标准<span style="display: none" class="thisSpan">1</span></label>
                                        <label class="checkbox-inline" style="padding-left: 10px">
                                            <input type="checkbox" name="fraction51" data-score="2"
                                                   value="7"/>有照护服务项目<span style="display: none" class="thisSpan">1</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    12
                                </td>
                                <td colspan="5" style="vertical-align:middle;">有介绍机构的宣传栏或手册，公开与机构服务相关的信息，包括：执业证照、人员资质、相关证照、地理位置、收费标准、照护服务项目</td>

                                <td style="color:red;text-align: center" class="pf51" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    11
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction52s" name="fraction52s"
                                               value="${star.fraction52}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction52" data-score="20"
                                                   value="1"/>建立老年人入住档案<span style="display: none" class="thisSpan">4</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction52" data-score="5"
                                                   value="2"/>有评估等级告知单<span style="display: none" class="thisSpan">4</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction52" data-score="5"
                                                   value="3"/>有养老服务合同<span style="display: none" class="thisSpan">4</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction52" data-score="5"
                                                   value="4"/>有养体检报告<span style="display: none" class="thisSpan">4</span></label>
                                        <label class="checkbox-inline" style="padding-left: 10px">
                                            <input type="checkbox" name="fraction52" data-score="5"
                                                   value="5"/>有户口簿首页及本人页复印件<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction52" data-score="5"
                                                   value="6"/>有担保人的身份证复印件及联系方式<span style="display: none" class="thisSpan">2</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    20
                                </td>
                                <td colspan="5" style="vertical-align:middle;">建立入住老年人档案，档案资料应包括：入住（离院）登记、评估等级告知单、养老服务合同、体检报告、老年人身份证复印件、户口簿首页及本人页复印件、担保人的身份证复印件及联系方式</td>

                                <td style="color:red;text-align: center" class="pf52" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    12
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction53s" name="fraction53s"
                                               value="${star.fraction53}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction53" data-score="10"
                                                   value="1"/>制定部门岗位职责<span style="display: none" class="thisSpan">5</span></label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction53" data-score="10"
                                                   value="2"/>建立完整的规章制度<span style="display: none" class="thisSpan">5</span></label>>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">制订各部门岗位职责，有完整的各项规章制度且有资料可查</td>

                                <td style="color:red;text-align: center" class="pf53" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    13
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction54s" name="fraction54s"
                                               value="${star.fraction54}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction54" data-score="10"
                                                   value="1"/>有考核制度、有实施考核工作<span style="display: none" class="thisSpan">10</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">建立员工考核制度，制订各部门、各岗位考核细则，确保各职能部门每月考核且有记录可查</td>

                                <td style="color:red;text-align: center" class="pf54" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    14
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction55s" name="fraction55s"
                                               value="${star.fraction55}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction55" data-score="5"
                                                   value="1"/>有老人代表制度或活动记录<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction55" data-score="2"
                                                   value="2"/>有一次活动记录<span style="display: none" class="thisSpan">1</span></label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction55" data-score="2"
                                                   value="3"/>有两次活动记录<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction55" data-score="2"
                                                   value="4"/>有三次活动记录<span style="display: none" class="thisSpan">3</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    5
                                </td>
                                <td colspan="5" style="vertical-align:middle;">建立入住老人代表会议制度，每年活动不少于4次，且有记录可查</td>

                                <td style="color:red;text-align: center" class="pf55" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    15
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction56s" name="fraction56s"
                                               value="${star.fraction56}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction56" data-score="10"
                                                   value="1"/>设多渠道的投诉途径<span style="display: none" class="thisSpan">5</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction56" data-score="6"
                                                   value="2"/>对投诉有处理、记录、整改、反馈<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction56" data-score="2"
                                                   value="3"/>指定专人负责<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction56" data-score="2"
                                                   value="4"/>有相关记录<span style="display: none" class="thisSpan">1</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">设有多渠道的投诉途径，投诉渠道通畅并张贴于机构醒目处。对投诉处理有专人负责，信息的核实、处理、整改、反馈及时并有记录</td>

                                <td style="color:red;text-align: center" class="pf56" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    16
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction57s" name="fraction57s"
                                               value="${star.fraction57}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction57" data-score="10"
                                                   value="1"/>建立自评分析制度、自评分析<span style="display: none" class="thisSpan">10</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">建立服务绩效的自评分析机制。必要时采取预防和纠正措施，自评分析（服务差错、意外事件、对象投诉、压疮发生率、服务满意度测评等）有记录</td>

                                <td style="color:red;text-align: center" class="pf57" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    17
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction58s" name="fraction58s"
                                               value="${star.fraction58}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction58" data-score="5"
                                                   value="1"/>听取服务对象及家属对服务质量的评价<span style="display: none" class="thisSpan">3</span></label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction58" data-score="2"
                                                   value="2"/>参与者人数超过10%<span style="display: none" class="thisSpan">2</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    5
                                </td>
                                <td colspan="5" style="vertical-align:middle;">多渠道（家属代表座谈会或个别访谈等）听取服务对象及家属对服务质量的评价与改进，确保每年参与者为服务对象的10%，且有记录可查</td>

                                <td style="color:red;text-align: center" class="pf58" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    18
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction59s" name="fraction59s"
                                               value="${star.fraction59}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction59" data-score="5"
                                                   value="1"/>已开展<span style="display: none" class="thisSpan">5</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    5
                                </td>
                                <td colspan="5" style="vertical-align:middle;">院部对全年服务质量评价和改进情况有总结并向全院通报</td>

                                <td style="color:red;text-align: center" class="pf59" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    18
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction60s" name="fraction60s"
                                               value="${star.fraction60}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction60" data-score="8"
                                                   value="1"/>建立捐赠物品登记明细表、分配登记表<span style="display: none" class="thisSpan">4</span></label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction60" data-score="4"
                                                   value="2"/>记录规范<span style="display: none" class="thisSpan">4</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    8
                                </td>
                                <td colspan="5" style="vertical-align:middle;">建立捐赠物品登记明细表、分配登记表，且有记录可查</td>

                                <td style="color:red;text-align: center" class="pf60" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    20
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction61s" name="fraction61s"
                                               value="${star.fraction61}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction61" data-score="20"
                                                   value="1"/>提供财务年度审计报告<span style="display: none" class="thisSpan">5</span></label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction61" data-score="20"
                                                   value="2"/>财务人员持证上岗<span style="display: none" class="thisSpan">5</span></label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction61" data-score="20"
                                                   value="3"/>出纳、会计不只是一人兼任<span style="display: none" class="thisSpan">5</span></label>
                                        <label class="checkbox-inline" style="padding-left: 10px" >
                                            <input type="checkbox" name="fraction61" data-score="20"
                                                   value="4"/>制定财务管理制度，财务账目规范，财务收入做到单人核<span style="display: none" class="thisSpan">5</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    20
                                </td>
                                <td colspan="5" style="vertical-align:middle;">提供财务年度审计报告；财务人员须持证上岗；出纳、会计不能一人兼任；制定财务管理制度，财务账目规范，财务收入做到单人核算</td>

                                <td style="color:red;text-align: center" class="pf61" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    21
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction62s" name="fraction62s"
                                               value="${star.fraction62}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction62" data-score="0"
                                                   value="1"/>符合<span style="display: none" class="thisSpan">20</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    20
                                </td>
                                <td colspan="5" style="vertical-align:middle;">遵守《中华人民共和国劳动法》，保护员工合法权益，建立员工激励机制</td>

                                <td style="color:red;text-align: center" class="pf62" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="13"
                                    style="text-align: right;vertical-align: middle;font-size: 18px" class="caption-subject font-red bold uppercase">
                                    管理部分总评分数:<span id="all3">0</span>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 40px; vertical-align:middle;text-align: center" colspan="13">
                                    <span class="score"><b>评分项（设施部分）150分</b></span></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    序号
                                </td>
                                <td colspan="5"
                                    style="text-align:center;vertical-align:middle;">
                                    标准要求
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    分值
                                </td>
                                <td colspan="5"
                                    style="text-align:center;vertical-align:middle;">
                                    评分标准
                                </td>
                                <td colspan="1" style="text-align: center">评分</td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    1
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction63s" name="fraction63s"
                                               value="${star.fraction63}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction63" data-score="15"
                                                   value="1"/>人员住宿和主要活动场所使用易燃可燃装饰装修材料<span style="display: none" class="thisSpan">10</span></label>
                                        <label class="checkbox-inline" style="padding-left: 10px">
                                            <input type="checkbox" name="fraction63" data-score="15"
                                                   value="2"/>有人居住或者活动的建筑采用夹芯材料燃烧性能低于A级的彩钢板搭建<span style="display: none" class="thisSpan">5</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    15
                                </td>
                                <td colspan="5" style="vertical-align:middle;">人员住宿和主要活动场所不使用易燃可燃装饰装修材料，有人居住或者活动的建筑不采用夹芯材料燃烧性能低于A级的彩钢板搭建</td>

                                <td style="color:red;text-align: center" class="pf63" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    2
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction64s" name="fraction64s"
                                               value="${star.fraction64}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction64" data-score="5"
                                                   value="1"/>有坡道<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction64" data-score="2"
                                                   value="2"/>（1）项符合<span style="display: none" class="thisSpan">1</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction64" data-score="1"
                                                   value="3"/>（2）项符合<span style="display: none" class="thisSpan">1</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction64" data-score="2"
                                                   value="4"/>（3）项符合<span style="display: none" class="thisSpan">1</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    5
                                </td>
                                <td colspan="5" style="vertical-align:middle;">（1）独立设置室外坡道且有效宽度不小于1.50m；（2）坡道的起止点有≥1.50m×1.50m回转面积（3）坡道、过厅、走廊设置双侧扶手</td>

                                <td style="color:red;text-align: center" class="pf64" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    3
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction65s" name="fraction65s"
                                               value="${star.fraction65}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction65" data-score="2"
                                                   value="1"/>楼梯设置双侧扶手<span style="display: none" class="thisSpan">1</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction65" data-score="2"
                                                   value="2"/>采用弧形楼梯和螺旋楼梯<span style="display: none" class="thisSpan">1</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction65" data-score="2"
                                                   value="3"/>楼段通行净宽不小于1.2m<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction65" data-score="2"
                                                   value="4"/>各级踏步一致<span style="display: none" class="thisSpan">2</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    6
                                </td>
                                <td colspan="5" style="vertical-align:middle;">楼梯设置双侧扶手，不采用弧形楼梯和螺旋楼梯，楼段通行净宽不小于1.2m，各级踏步均匀一致</td>

                                <td style="color:red;text-align: center" class="pf65" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    4
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction66s" name="fraction66s"
                                               value="${star.fraction66}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction66" data-score="5"
                                                   value="1"/>设置电梯或电梯设置符合相关规定<span style="display: none" class="thisSpan">5</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    5
                                </td>
                                <td colspan="5" style="vertical-align:middle;">三层及以上建筑物至少应设置一部电梯，并应符合有关规定。电梯井不应与卧室、起居室贴邻设置</td>

                                <td style="color:red;text-align: center" class="pf66" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    5
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction67s" name="fraction67s"
                                               value="${star.fraction67}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction67" data-score="0"
                                                   value="1"/>符合<span style="display: none" class="thisSpan">5</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    5
                                </td>
                                <td colspan="5" style="vertical-align:middle;">老年人居室不设置在地下室、半地下室，有自然通风和采光条件，室内净高不低于2.6m</td>

                                <td style="color:red;text-align: center" class="pf67" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    6
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction68s" name="fraction68s"
                                               value="${star.fraction68}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction68" data-score="0"
                                                   value="1"/>符合<span style="display: none" class="thisSpan">15</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    15
                                </td>
                                <td colspan="5" style="vertical-align:middle;">每间老年人居室床位数不大于4张，重度照护居室床位数不多于6张</td>

                                <td style="color:red;text-align: center" class="pf68" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    7
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction69s" name="fraction69s"
                                               value="${star.fraction69}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction69" data-score="0"
                                                   value="1"/>符合<span style="display: none" class="thisSpan">10</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">老年人居室内留有轮椅回转空间，不设门槛，主要通道的净宽不小于1m，床边留有护理、急救操作空间，相邻床位的长边间距不小于0.8m</td>

                                <td style="color:red;text-align: center" class="pf69" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    8
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction70s" name="fraction70s"
                                               value="${star.fraction70}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction70" data-score="0"
                                                   value="1"/>符合<span style="display: none" class="thisSpan">10</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">餐饮区域空间布置满足餐车进出、送餐到位服务的需求</td>

                                <td style="color:red;text-align: center" class="pf70" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    9
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction71s" name="fraction71s"
                                               value="${star.fraction71}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction71" data-score="0"
                                                   value="1"/>符合<span style="display: none" class="thisSpan">8</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    8
                                </td>
                                <td colspan="5" style="vertical-align:middle;">每个楼层设置公用卫生间；坐便器旁设安全扶手</td>

                                <td style="color:red;text-align: center" class="pf71" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction72s" name="fraction72s"
                                               value="${star.fraction72}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction72" data-score="5"
                                                   value="1"/>（1）项符合<span style="display: none" class="thisSpan">4</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction72" data-score="3"
                                                   value="2"/>（2）项符合<span style="display: none" class="thisSpan">4</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    8
                                </td>
                                <td colspan="5" style="vertical-align:middle;">（1）配有洗衣机等设施，操作场所布局合理，洁污分开、通风良好；（2）设置污染衣物预洗和消毒水池</td>

                                <td style="color:red;text-align: center" class="pf72" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    11
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction73s" name="fraction73s"
                                               value="${star.fraction73}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction73" data-score="2"
                                                   value="1"/>（1）项符合<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction73" data-score="2"
                                                   value="2"/>（2）项符合<span style="display: none" class="thisSpan">2</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    4
                                </td>
                                <td colspan="5" style="vertical-align:middle;">（1）文娱与健身区域总面积不小于2m2/床；（2）文娱与健身区域不对老年人居室产生干扰</td>

                                <td style="color:red;text-align: center" class="pf73" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    12
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction74s" name="fraction74s"
                                               value="${star.fraction74}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction74" data-score="0"
                                                   value="1"/>符合<span style="display: none" class="thisSpan">10</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">配备医务室且使用面积不小于10m2，空间满足开展基本医疗服务的需求</td>

                                <td style="color:red;text-align: center" class="pf74" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    13
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction75s" name="fraction75s"
                                               value="${star.fraction75}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction75" data-score="5"
                                                   value="1"/>有交流活动、康复用房<span style="display: none" class="thisSpan">5</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction75" data-score="5"
                                                   value="2"/>设备配置齐全<span style="display: none" class="thisSpan">5</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">配置老年人交流、活动用房，康复用房；配置有空调、彩电、橱柜等相应设备及康复器材</td>

                                <td style="color:red;text-align: center" class="pf75" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    14
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction76s" name="fraction76s"
                                               value="${star.fraction76}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction76" data-score="0"
                                                   value="1"/>符合<span style="display: none" class="thisSpan">8</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    8
                                </td>
                                <td colspan="5" style="vertical-align:middle;">公用浴室空间便于轮椅进出，留有助浴空间，地面无高差</td>

                                <td style="color:red;text-align: center" class="pf76" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    15
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction77s" name="fraction77s"
                                               value="${star.fraction77}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction77" data-score="10"
                                                   value="1"/>厨房无虫害迹象或操作区域不存在大量积水或设施设备清洁状况符合食品加工基本要求<span style="display: none" class="thisSpan">10</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    10
                                </td>
                                <td colspan="5" style="vertical-align:middle;">厨房无虫害迹象，如蟑螂、老鼠或老鼠排泄物；厨房操作区域地面无大量积水，设备设施的清洁状况满足食品加工的基本要求</td>

                                <td style="color:red;text-align: center" class="pf77" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    16
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction78s" name="fraction78s"
                                               value="${star.fraction78}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction78" data-score="16"
                                                   value="1"/>（1）设置呼叫装置<span style="display: none" class="thisSpan">4</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction78" data-score="8"
                                                   value="2"/>（1）呼叫装置设置规范或到位<span style="display: none" class="thisSpan">4</span></label>
                                        <label class="checkbox-inline" style="padding-left: 0px">
                                            <input type="checkbox" name="fraction78" data-score="4"
                                                   value="3"/>（2）呼叫装置与每个楼层招呼站相连<span style="display: none" class="thisSpan">4</span></label>
                                        <label class="checkbox-inline" style="padding-left: 10px">
                                            <input type="checkbox" name="fraction78" data-score="4"
                                                   value="4"/>（3）有显示屏<span style="display: none" class="thisSpan">4</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    16
                                </td>
                                <td colspan="5" style="vertical-align:middle;">（1）卧室、卫生间、浴室、公用浴室、公用卫生间、公共活动区域需安装呼叫装置且触摸方便；（2）呼叫装置终端与每个楼层照护站相连；（3）每个楼层有视线可及的显示屏</td>

                                <td style="color:red;text-align: center" class="pf78" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    17
                                </td>
                                <td colspan="5">
                                    <div class="checkbox-list">
                                        <input type="hidden" id="fraction79s" name="fraction79s"
                                               value="${star.fraction79}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="fraction79" data-score="3"
                                                   value="1"/>（1）项设置照明设备或照明设备配备到位<span style="display: none" class="thisSpan">2</span></label>
                                        <label class="checkbox-inline" style="padding-left: 10px">
                                            <input type="checkbox" name="fraction79" data-score="2"
                                                   value="2"/>（2）项出入口内、外平台或阳台、走道、楼梯等公共部位设置照明设备或照明设备配备到位<span style="display: none" class="thisSpan">3</span></label>
                                    </div>
                                </td>
                                <td colspan="1"
                                    style="text-align:center;vertical-align:middle;">
                                    5
                                </td>
                                <td colspan="5" style="vertical-align:middle;">（1）老人居室设置顶灯、床头灯、脚灯等照明设备；（2）出入口内、外及平台、阳台、走道、楼梯等公共部位设有照明设备</td>

                                <td style="color:red;text-align: center" class="pf79" style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td colspan="13"
                                    style="text-align: right;vertical-align: middle;font-size: 18px" class="caption-subject font-red bold uppercase">
                                    设施部分总评分数:<span id="all4">0</span>
                                </td>
                            </tr>
                        </table>
                        <div class="form-actions">
                            <div class="row">
                                <c:if test="${apply.status==0}">

                                    <div class="col-md-offset-4" style="float: left">
                                        <button data-loading-text="提交中..." id="applyBtn"
                                                type="button" class="btn btn-circle green"
                                        >
                                            审核
                                        </button>
                                    </div>
                                </c:if>
                                <div id="update" class="col-md-12">
                                    <div class="col-md-offset-11">
                                        <button onclick="window.parent.closeTab('tab-serviceOrg-subsidy-apply-info');
                                                        window.parent.updateTab('side-serviceOrg-subsidy-list')"
                                                class="btn btn-circle green"><i
                                                class="fa">返回</i>
                                        </button>
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
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>
        <!--area-->
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/jstree.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/star_common.js?v=1.7"
                type="text/javascript"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                init();
                StarRateCommon.show();

            });


            function modify() {
                $("#starRate").find("input:text").prop("disabled", false);//找到form表单下的所有input标签并置为可编辑
                $("#starRate").find("select").prop("disabled", false);//找到form表单下的所有select标签并置为可编辑
                $("#starRate").find("input:checkbox").prop("disabled", false);//找到form表单下的所有checkbox标签并置为可编辑
                $("#starRate").find("input:radio").prop("disabled", false);//找到form表单下的所有checkbox标签并置为可编辑
                $("#starRate").find("input:file").prop("disabled", false);//找到form表单下的所有checkbox标签并置为可编辑
                $("#update").find("button[name=updateStar]").prop("disabled", false);
            }

            function init() {
                $("#starRate").find("input:text").prop("disabled", true);//找到form表单下的所有input标签并置为不可编辑
                $("#starRate").find("select").prop("disabled", true);//找到form表单下的所有select标签并置为不可编辑
                $("#starRate").find("input:checkbox").prop("disabled", true);//找到form表单下的所有checkbox标签并置为不可编辑
                $("#starRate").find("input:radio").prop("disabled", true);//找到form表单下的所有radio标签并置为不可编辑
                $("#starRate").find("input:file").prop("disabled", true);//找到form表单下的所有file标签并置为不可编辑
                $("#starRate").find("button[name=certificateDelete]").prop("disabled", true);//找到form表单下的所有file标签并置为不可编辑
                $("#starRate").find("input[name=verifyContent]").prop("disabled", false);//找到form表单下的所有file标签并置为不可编辑
                $(function () {
                    $("label").click();
                })
            }

            function checkSave() {
                var status = $("#status").val();
                if (status == null || status == "") {
                    alert("请选择审核结果");
                    return false;
                }
                return true;
            }

            var obj1_1_1 = "";
            var obj1_1_1_score = 0;
            var obj2_2_2 = "";
            var obj2_2_2_score = 0;
            var obj3_3_3 = "";
            var obj3_3_3_score = 0;
            var obj4_4_4 = "";
            var obj4_4_4_score = 0;
            var obj5_5_5 = "";
            var obj5_5_5_score = 0;
            var obj6_6_6 = "";
            var obj6_6_6_score = 0;
            var obj7_7_7 = "";
            var obj7_7_7_score = 0;
            var obj8_8_8 = "";
            var obj8_8_8_score = 0;
            var obj9_9_9 = "";
            var obj9_9_9_score = 0;
            var obj10_10_10 = "";
            var obj10_10_10_score = 0;
            var obj11_11_11 = "";
            var obj11_11_11_score = 0;
            var obj12_12_12 = "";
            var obj12_12_12_score = 0;
            var obj13_13_13 = "";
            var obj13_13_13_score = 0;
            var obj14_14_14 = "";
            var obj14_14_14_score = 0;
            var obj15_15_15 = "";
            var obj15_15_15_score = 0;
            var obj16_16_16 = "";
            var obj16_16_16_score = 0;
            var obj17_17_17 = "";
            var obj17_17_17_score = 0;
            var obj18_18_18 = "";
            var obj18_18_18_score = 0;
            var obj19_19_19 = "";
            var obj19_19_19_score = 0;
            var obj20_20_20 = "";
            var obj20_20_20_score = 0;
            var obj21_21_21 = "";
            var obj21_21_21_score = 0;
            var obj22_22_22 = "";
            var obj22_22_22_score = 0;
            var obj23_23_23 = "";
            var obj23_23_23_score = 0;
            var obj24_24_24 = "";
            var obj24_24_24_score = 0;
            var obj25_25_25 = "";
            var obj25_25_25_score = 0;
            var obj26_26_26 = "";
            var obj26_26_26_score = 0;
            var obj27_27_27 = "";
            var obj27_27_27_score = 0;
            var obj28_28_28 = "";
            var obj28_28_28_score = 0;
            var obj29_29_29 = "";
            var obj29_29_29_score = 0;
            var obj30_30_30 = "";
            var obj30_30_30_score = 0;
            var obj31_31_31 = "";
            var obj31_31_31_score = 0;
            var obj32_32_32 = "";
            var obj32_32_32_score = 0;
            var obj33_33_33 = "";
            var obj33_33_33_score = 0;
            var obj34_34_34 = "";
            var obj34_34_34_score = 0;
            var obj35_35_35 = "";
            var obj35_35_35_score = 0;
            var obj36_36_36 = "";
            var obj36_36_36_score = 0;
            var obj37_37_37 = "";
            var obj37_37_37_score = 0;
            var obj38_38_38 = "";
            var obj38_38_38_score = 0;
            var obj39_39_39 = "";
            var obj39_39_39_score = 0;
            var obj40_40_40 = "";
            var obj40_40_40_score = 0;
            var obj41_41_41 = "";
            var obj41_41_41_score = 0;
            var obj42_42_42 = "";
            var obj42_42_42_score = 0;
            var obj43_43_43 = "";
            var obj43_43_43_score = 0;
            var obj44_44_44 = "";
            var obj44_44_44_score = 0;
            var obj45_45_45 = "";
            var obj45_45_45_score = 0;
            var obj46_46_46 = "";
            var obj46_46_46_score = 0;
            var obj47_47_47 = "";
            var obj47_47_47_score = 0;
            var obj48_48_48 = "";
            var obj48_48_48_score = 0;
            var obj49_49_49 = "";
            var obj49_49_49_score = 0;
            var obj50_50_50 = "";
            var obj50_50_50_score = 0;
            var obj51_51_51 = "";
            var obj51_51_51_score = 0;
            var obj52_52_52 = "";
            var obj52_52_52_score = 0;
            var obj53_53_53 = "";
            var obj53_53_53_score = 0;
            var obj54_54_54 = "";
            var obj54_54_54_score = 0;
            var obj55_55_55 = "";
            var obj55_55_55_score = 0;
            var obj56_56_56 = "";
            var obj56_56_56_score = 0;
            var obj57_57_57 = "";
            var obj57_57_57_score = 0;
            var obj58_58_58 = "";
            var obj58_58_58_score = 0;
            var obj59_59_59 = "";
            var obj59_59_59_score = 0;
            var obj60_60_60 = "";
            var obj60_60_60_score = 0;
            var obj61_61_61 = "";
            var obj61_61_61_score = 0;
            var obj62_62_62 = "";
            var obj62_62_62_score = 0;
            var obj63_63_63 = "";
            var obj63_63_63_score = 0;
            var obj64_64_64 = "";
            var obj64_64_64_score = 0;
            var obj65_65_65 = "";
            var obj65_65_65_score = 0;
            var obj66_66_66 = "";
            var obj66_66_66_score = 0;
            var obj67_67_67 = "";
            var obj67_67_67_score = 0;
            var obj68_68_68 = "";
            var obj68_68_68_score = 0;
            var obj69_69_69 = "";
            var obj69_69_69_score = 0;
            var obj70_70_70 = "";
            var obj70_70_70_score = 0;
            var obj71_71_71 = "";
            var obj71_71_71_score = 0;
            var obj72_72_72 = "";
            var obj72_72_72_score = 0;
            var obj73_73_73 = "";
            var obj73_73_73_score = 0;
            var obj74_74_74 = "";
            var obj74_74_74_score = 0;
            var obj75_75_75 = "";
            var obj75_75_75_score = 0;
            var obj76_76_76 = "";
            var obj76_76_76_score = 0;
            var obj77_77_77 = "";
            var obj77_77_77_score = 0;
            var obj78_78_78 = "";
            var obj78_78_78_score = 0;
            var obj79_79_79 = "";
            var obj79_79_79_score = 0;


            $("label").click(function () {
                var obj1 = document.getElementsByName("fraction01");
                var obj1_1 = "";
                var obj1_1_score = "";
                for (var i = 0; i < obj1.length; i++) {
                    if (obj1[i].checked) {
                        obj1_1 += obj1[i].value + ",";
                        obj1_1_score += $(obj1[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj1_1_score += "0,";
                    }
                }
                var arr1 = obj1_1_score.split(",");
                obj1_1_1 = obj1_1;
                $(this).parent().parent().parent().find(".pf1").html(parseInt(arr1[0]));
                obj1_1_1_score = parseInt(arr1[0]);

                var obj2 = document.getElementsByName("fraction02");
                var obj2_2 = "";
                var obj2_2_score = "";
                for (var i = 0; i < obj2.length; i++) {
                    if (obj2[i].checked) {
                        obj2_2 += obj2[i].value + ",";
                        obj2_2_score += $(obj2[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj2_2_score += "0,";
                    }
                }
                var arr2 = obj2_2_score.split(",");
                obj2_2_2 = obj2_2;
                $(this).parent().parent().parent().find(".pf2").html(parseInt(arr2[0]));
                obj2_2_2_score = parseInt(arr2[0]);

                var obj3 = document.getElementsByName("fraction03");
                var obj3_3 = "";
                var obj3_3_score = "";
                for (var i = 0; i < obj3.length; i++) {
                    if (obj3[i].checked) {
                        obj3_3 += obj3[i].value + ",";
                        obj3_3_score += $(obj3[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj3_3_score += "0,";
                    }
                }
                var arr3 = obj3_3_score.split(",");
                obj3_3_3 = obj3_3;
                $(this).parent().parent().parent().find(".pf3").html(parseInt(arr3[0]));
                obj3_3_3_score = parseInt(arr3[0]);

                var obj4 = document.getElementsByName("fraction04");
                var obj4_4 = "";
                var obj4_4_score = "";
                for (var i = 0; i < obj4.length; i++) {
                    if (obj4[i].checked) {
                        obj4_4 += obj4[i].value + ",";
                        obj4_4_score += $(obj4[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj4_4_score += "0,";
                    }
                }
                var arr4 = obj4_4_score.split(",");
                obj4_4_4 = obj4_4;
                $(this).parent().parent().parent().find(".pf4").html(parseInt(arr4[0]) + parseInt(arr4[1]));
                obj4_4_4_score = parseInt(arr4[0]) + parseInt(arr4[1]);

                var obj5 = document.getElementsByName("fraction05");
                var obj5_5 = "";
                var obj5_5_score = "";
                for (var i = 0; i < obj5.length; i++) {
                    if (obj5[i].checked) {
                        obj5_5 += obj5[i].value + ",";
                        obj5_5_score += $(obj5[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj5_5_score += "0,";
                    }
                }
                var arr5 = obj5_5_score.split(",");
                obj5_5_5 = obj5_5;
                $(this).parent().parent().parent().find(".pf5").html(parseInt(arr5[0]) + parseInt(arr5[1]) + parseInt(arr5[2]) + parseInt(arr5[3]) + parseInt(arr5[4]));
                obj5_5_5_score = parseInt(arr5[0]) + parseInt(arr5[1]) + parseInt(arr5[2]) + parseInt(arr5[3]) + parseInt(arr5[4]);
                if(obj5_5_5_score >= 12){
                    obj5_5_5_score = 12;
                }


                var obj6 = document.getElementsByName("fraction06");
                var obj6_6 = "";
                var obj6_6_score = "";
                for (var i = 0; i < obj6.length; i++) {
                    if (obj6[i].checked) {
                        obj6_6 += obj6[i].value + ",";
                        obj6_6_score += $(obj6[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj6_6_score += "0,";
                    }
                }
                var arr6 = obj6_6_score.split(",");
                obj6_6_6 = obj6_6;
                $(this).parent().parent().parent().find(".pf6").html(parseInt(arr6[0]) + parseInt(arr6[1]) + parseInt(arr6[2]) + parseInt(arr6[3]));
                obj6_6_6_score = parseInt(arr6[0]) + parseInt(arr6[1]) + parseInt(arr6[2]) + parseInt(arr6[3]);

                var obj7 = document.getElementsByName("fraction07");
                var obj7_7 = "";
                var obj7_7_score = "";
                for (var i = 0; i < obj7.length; i++) {
                    if (obj7[i].checked) {
                        obj7_7 += obj7[i].value + ",";
                        obj7_7_score += $(obj7[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj7_7_score += "0,";
                    }
                }
                var arr7 = obj7_7_score.split(",");
                obj7_7_7 = obj7_7;
                $(this).parent().parent().parent().find(".pf7").html(parseInt(arr7[0]) + parseInt(arr7[1]) + parseInt(arr7[2]));
                obj7_7_7_score = parseInt(arr7[0]) + parseInt(arr7[1]) + parseInt(arr7[2]);

                var obj8 = document.getElementsByName("fraction08");
                var obj8_8 = "";
                var obj8_8_score = "";
                for (var i = 0; i < obj8.length; i++) {
                    if (obj8[i].checked) {
                        obj8_8 += obj8[i].value + ",";
                        obj8_8_score += $(obj8[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj8_8_score += "0,";
                    }
                }
                var arr8 = obj8_8_score.split(",");
                obj8_8_8 = obj8_8;
                $(this).parent().parent().parent().find(".pf8").html(parseInt(arr8[0]) + parseInt(arr8[1]) + parseInt(arr8[2]));
                obj8_8_8_score = parseInt(arr8[0]) + parseInt(arr8[1]) + parseInt(arr8[2]);

                var obj9 = document.getElementsByName("fraction09");
                var obj9_9 = "";
                var obj9_9_score = "";
                for (var i = 0; i < obj9.length; i++) {
                    if (obj9[i].checked) {
                        obj9_9 += obj9[i].value + ",";
                        obj9_9_score += $(obj9[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj9_9_score += "0,";
                    }
                }
                var arr9 = obj9_9_score.split(",");
                obj9_9_9 = obj9_9;
                $(this).parent().parent().parent().find(".pf9").html(parseInt(arr9[0]) + parseInt(arr9[1]) + parseInt(arr9[2]));
                obj9_9_9_score = parseInt(arr9[0]) + parseInt(arr9[1]) + parseInt(arr9[2]);

                var obj10 = document.getElementsByName("fraction10");
                var obj10_10 = "";
                var obj10_10_score = "";
                for (var i = 0; i < obj10.length; i++) {
                    if (obj10[i].checked) {
                        obj10_10 += obj10[i].value + ",";
                        obj10_10_score += $(obj10[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj10_10_score += "0,";
                    }
                }
                var arr10 = obj10_10_score.split(",");
                obj10_10_10 = obj10_10;
                $(this).parent().parent().parent().find(".pf10").html(parseInt(arr10[0]));
                obj10_10_10_score = parseInt(arr10[0]);

                var obj11 = document.getElementsByName("fraction11");
                var obj11_11 = "";
                var obj11_11_score = "";
                for (var i = 0; i < obj11.length; i++) {
                    if (obj11[i].checked) {
                        obj11_11 += obj11[i].value + ",";
                        obj11_11_score += $(obj11[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj11_11_score += "0,";
                    }
                }
                var arr11 = obj11_11_score.split(",");
                obj11_11_11 = obj11_11;
                $(this).parent().parent().parent().find(".pf11").html(parseInt(arr11[0]) + parseInt(arr11[1]) + parseInt(arr11[2]));
                obj11_11_11_score = parseInt(arr11[0]) + parseInt(arr11[1]) + parseInt(arr11[2]);

                var obj12 = document.getElementsByName("fraction12");
                var obj12_12 = "";
                var obj12_12_score = "";
                for (var i = 0; i < obj12.length; i++) {
                    if (obj12[i].checked) {
                        obj12_12 += obj12[i].value + ",";
                        obj12_12_score += $(obj12[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj12_12_score += "0,";
                    }
                }
                var arr12 = obj12_12_score.split(",");
                obj12_12_12 = obj12_12;
                $(this).parent().parent().parent().find(".pf12").html(parseInt(arr12[0]));
                obj12_12_12_score = parseInt(arr12[0]);

                var obj13 = document.getElementsByName("fraction13");
                var obj13_13 = "";
                var obj13_13_score = "";
                for (var i = 0; i < obj13.length; i++) {
                    if (obj13[i].checked) {
                        obj13_13 += obj13[i].value + ",";
                        obj13_13_score += $(obj13[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj13_13_score += "0,";
                    }
                }
                var arr13 = obj13_13_score.split(",");
                obj13_13_13 = obj13_13;
                $(this).parent().parent().parent().find(".pf13").html(parseInt(arr13[0]));
                obj13_13_13_score = parseInt(arr13[0]);

                var obj14 = document.getElementsByName("fraction14");
                var obj14_14 = "";
                var obj14_14_score = "";
                for (var i = 0; i < obj14.length; i++) {
                    if (obj14[i].checked) {
                        obj14_14 += obj14[i].value + ",";
                        obj14_14_score += $(obj14[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj14_14_score += "0,";
                    }
                }
                var arr14 = obj14_14_score.split(",");
                obj14_14_14 = obj14_14;
                $(this).parent().parent().parent().find(".pf14").html(parseInt(arr14[0]));
                obj14_14_14_score = parseInt(arr14[0]);

                var obj15 = document.getElementsByName("fraction15");
                var obj15_15 = "";
                var obj15_15_score = "";
                for (var i = 0; i < obj15.length; i++) {
                    if (obj15[i].checked) {
                        obj15_15 += obj15[i].value + ",";
                        obj15_15_score += $(obj15[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj15_15_score += "0,";
                    }
                }
                var arr15 = obj15_15_score.split(",");
                obj15_15_15 = obj15_15;
                $(this).parent().parent().parent().find(".pf15").html(parseInt(arr15[0]));
                obj15_15_15_score = parseInt(arr15[0]);

                var obj16 = document.getElementsByName("fraction16");
                var obj16_16 = "";
                var obj16_16_score = "";
                for (var i = 0; i < obj16.length; i++) {
                    if (obj16[i].checked) {
                        obj16_16 += obj16[i].value + ",";
                        obj16_16_score += $(obj16[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj16_16_score += "0,";
                    }
                }
                var arr16 = obj16_16_score.split(",");
                obj16_16_16 = obj16_16;
                $(this).parent().parent().parent().find(".pf16").html(parseInt(arr16[0]));
                obj16_16_16_score = parseInt(arr16[0]);

                var obj17 = document.getElementsByName("fraction17");
                var obj17_17 = "";
                var obj17_17_score = "";
                for (var i = 0; i < obj17.length; i++) {
                    if (obj17[i].checked) {
                        obj17_17 += obj17[i].value + ",";
                        obj17_17_score += $(obj17[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj17_17_score += "0,";
                    }
                }
                var arr17 = obj17_17_score.split(",");
                obj17_17_17 = obj17_17;
                $(this).parent().parent().parent().find(".pf17").html(parseInt(arr17[0]) + parseInt(arr17[1]) + parseInt(arr17[2]) + parseInt(arr17[3]) + parseInt(arr17[4]));
                obj17_17_17_score = parseInt(arr17[0]) + parseInt(arr17[1]) + parseInt(arr17[2]) + parseInt(arr17[3]) + parseInt(arr17[4]);

                var obj18 = document.getElementsByName("fraction18");
                var obj18_18 = "";
                var obj18_18_score = "";
                for (var i = 0; i < obj18.length; i++) {
                    if (obj18[i].checked) {
                        obj18_18 += obj18[i].value + ",";
                        obj18_18_score += $(obj18[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj18_18_score += "0,";
                    }
                }
                var arr18 = obj18_18_score.split(",");
                obj18_18_18 = obj18_18;
                $(this).parent().parent().parent().find(".pf18").html(parseInt(arr18[0]));
                obj18_18_18_score = parseInt(arr18[0]);


                var obj19 = document.getElementsByName("fraction19");
                var obj19_19 = "";
                var obj19_19_score = "";
                for (var i = 0; i < obj19.length; i++) {
                    if (obj19[i].checked) {
                        obj19_19 += obj19[i].value + ",";
                        obj19_19_score += $(obj19[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj19_19_score += "0,";
                    }
                }
                var arr19 = obj19_19_score.split(",");
                obj19_19_19 = obj19_19;
                $(this).parent().parent().parent().find(".pf19").html(parseInt(arr19[0]) + parseInt(arr19[1]) + parseInt(arr19[2]) + parseInt(arr19[3]));
                obj19_19_19_score = parseInt(arr19[0]) + parseInt(arr19[1]) + parseInt(arr19[2]) + parseInt(arr19[3]);


                var obj20 = document.getElementsByName("fraction20");
                var obj20_20 = "";
                var obj20_20_score = "";
                for (var i = 0; i < obj20.length; i++) {
                    if (obj20[i].checked) {
                        obj20_20 += obj20[i].value + ",";
                        obj20_20_score += $(obj20[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj20_20_score += "0,";
                    }
                }
                var arr20 = obj20_20_score.split(",");
                obj20_20_20 = obj20_20;
                $(this).parent().parent().parent().find(".pf20").html(parseInt(arr20[0]));
                obj20_20_20_score = parseInt(arr20[0]);

                var obj21 = document.getElementsByName("fraction21");
                var obj21_21 = "";
                var obj21_21_score = "";
                for (var i = 0; i < obj21.length; i++) {
                    if (obj21[i].checked) {
                        obj21_21 += obj21[i].value + ",";
                        obj21_21_score += $(obj21[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj21_21_score += "0,";
                    }
                }
                var arr21 = obj21_21_score.split(",");
                obj21_21_21 = obj21_21;
                $(this).parent().parent().parent().find(".pf21").html(parseInt(arr21[0]) + parseInt(arr21[1]) + parseInt(arr21[2]) + parseInt(arr21[3]) + parseInt(arr21[4]));
                obj21_21_21_score = parseInt(arr21[0]) + parseInt(arr21[1]) + parseInt(arr21[2]) + parseInt(arr21[3]) + parseInt(arr21[4]);

                var obj22 = document.getElementsByName("fraction22");
                var obj22_22 = "";
                var obj22_22_score = "";
                for (var i = 0; i < obj22.length; i++) {
                    if (obj22[i].checked) {
                        obj22_22 += obj22[i].value + ",";
                        obj22_22_score += $(obj22[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj22_22_score += "0,";
                    }
                }
                var arr22 = obj22_22_score.split(",");
                obj22_22_22 = obj22_22;
                $(this).parent().parent().parent().find(".pf22").html(parseInt(arr22[0]) + parseInt(arr22[1]));
                obj22_22_22_score = parseInt(arr22[0]) + parseInt(arr22[1]);


                $("#all").html(obj1_1_1_score+obj2_2_2_score+obj3_3_3_score+obj4_4_4_score+obj5_5_5_score+obj6_6_6_score+obj7_7_7_score+obj8_8_8_score+obj9_9_9_score+obj10_10_10_score+obj11_11_11_score+obj12_12_12_score
                    +obj13_13_13_score+obj14_14_14_score+obj15_15_15_score+obj16_16_16_score+obj17_17_17_score+obj18_18_18_score+obj19_19_19_score+obj20_20_20_score+obj21_21_21_score+obj22_22_22_score);


                var obj23 = document.getElementsByName("fraction23");
                var obj23_23 = "";
                var obj23_23_score = "";
                for (var i = 0; i < obj23.length; i++) {
                    if (obj23[i].checked) {
                        obj23_23 += obj23[i].value + ",";
                        obj23_23_score += $(obj23[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj23_23_score += "0,";
                    }
                }
                var arr23 = obj23_23_score.split(",");
                obj23_23_23 = obj23_23;
                $(this).parent().parent().parent().find(".pf23").html(parseInt(arr23[0]) + parseInt(arr23[1]) + parseInt(arr23[2]) + parseInt(arr23[3]) + parseInt(arr23[4]) + parseInt(arr23[5]) + parseInt(arr23[6]) + parseInt(arr23[7]) + parseInt(arr23[8]) + parseInt(arr23[9]));
                obj23_23_23_score = parseInt(arr23[0]) + parseInt(arr23[1]) + parseInt(arr23[2]) + parseInt(arr23[3]) + parseInt(arr23[4]) + parseInt(arr23[5]) + parseInt(arr23[6]) + parseInt(arr23[7]) + parseInt(arr23[8]) + parseInt(arr23[9]);


                var obj24 = document.getElementsByName("fraction24");
                var obj24_24 = "";
                var obj24_24_score = "";
                for (var i = 0; i < obj24.length; i++) {
                    if (obj24[i].checked) {
                        obj24_24 += obj24[i].value + ",";
                        obj24_24_score += $(obj24[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj24_24_score += "0,";
                    }
                }
                var arr24 = obj24_24_score.split(",");
                obj24_24_24 = obj24_24;
                $(this).parent().parent().parent().find(".pf24").html(parseInt(arr24[0]) + parseInt(arr24[1]));
                obj24_24_24_score = parseInt(arr24[0]) + parseInt(arr24[1]);

                var obj25 = document.getElementsByName("fraction25");
                var obj25_25 = "";
                var obj25_25_score = "";
                for (var i = 0; i < obj25.length; i++) {
                    if (obj25[i].checked) {
                        obj25_25 += obj25[i].value + ",";
                        obj25_25_score += $(obj25[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj25_25_score += "0,";
                    }
                }
                var arr25 = obj25_25_score.split(",");
                obj25_25_25 = obj25_25;
                $(this).parent().parent().parent().find(".pf25").html(parseInt(arr25[0]) + parseInt(arr25[1]));
                obj25_25_25_score = parseInt(arr25[0]) + parseInt(arr25[1]);

                var obj26 = document.getElementsByName("fraction26");
                var obj26_26 = "";
                var obj26_26_score = "";
                for (var i = 0; i < obj26.length; i++) {
                    if (obj26[i].checked) {
                        obj26_26 += obj26[i].value + ",";
                        obj26_26_score += $(obj26[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj26_26_score += "0,";
                    }
                }
                var arr26 = obj26_26_score.split(",");
                obj26_26_26 = obj26_26;
                $(this).parent().parent().parent().find(".pf26").html(parseInt(arr26[0]) + parseInt(arr26[1]));
                obj26_26_26_score = parseInt(arr26[0]) + parseInt(arr26[1]);

                var obj27 = document.getElementsByName("fraction27");
                var obj27_27 = "";
                var obj27_27_score = "";
                for (var i = 0; i < obj27.length; i++) {
                    if (obj27[i].checked) {
                        obj27_27 += obj27[i].value + ",";
                        obj27_27_score += $(obj27[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj27_27_score += "0,";
                    }
                }
                var arr27 = obj27_27_score.split(",");
                obj27_27_27 = obj27_27;
                $(this).parent().parent().parent().find(".pf27").html(parseInt(arr27[0]) + parseInt(arr27[1]) + parseInt(arr27[2]) + parseInt(arr27[3]) + parseInt(arr27[4]) + parseInt(arr27[5]));
                obj27_27_27_score = parseInt(arr27[0]) + parseInt(arr27[1]) + parseInt(arr27[2]) + parseInt(arr27[3]) + parseInt(arr27[4]) + parseInt(arr27[5]);
                if(obj27_27_27_score >= 30){
                    obj27_27_27_score = 30;
                }

                var obj28 = document.getElementsByName("fraction28");
                var obj28_28 = "";
                var obj28_28_score = "";
                for (var i = 0; i < obj28.length; i++) {
                    if (obj28[i].checked) {
                        obj28_28 += obj28[i].value + ",";
                        obj28_28_score += $(obj28[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj28_28_score += "0,";
                    }
                }
                var arr28 = obj28_28_score.split(",");
                obj28_28_28 = obj28_28;
                $(this).parent().parent().parent().find(".pf28").html(parseInt(arr28[0]));
                obj28_28_28_score = parseInt(arr28[0]);

                var obj29 = document.getElementsByName("fraction29");
                var obj29_29 = "";
                var obj29_29_score = "";
                for (var i = 0; i < obj29.length; i++) {
                    if (obj29[i].checked) {
                        obj29_29 += obj29[i].value + ",";
                        obj29_29_score += $(obj29[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj29_29_score += "0,";
                    }
                }
                var arr29 = obj29_29_score.split(",");
                obj29_29_29 = obj29_29;
                $(this).parent().parent().parent().find(".pf29").html(parseInt(arr29[0]) + parseInt(arr29[1]) + parseInt(arr29[2]) + parseInt(arr29[3]));
                obj29_29_29_score = parseInt(arr29[0]) + parseInt(arr29[1]) + parseInt(arr29[2]) + parseInt(arr29[3]);


                var obj30 = document.getElementsByName("fraction30");
                var obj30_30 = "";
                var obj30_30_score = "";
                for (var i = 0; i < obj30.length; i++) {
                    if (obj30[i].checked) {
                        obj30_30 += obj30[i].value + ",";
                        obj30_30_score += $(obj30[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj30_30_score += "0,";
                    }
                }
                var arr30 = obj30_30_score.split(",");
                obj30_30_30 = obj30_30;
                $(this).parent().parent().parent().find(".pf30").html(parseInt(arr30[0]) + parseInt(arr30[1]));
                obj30_30_30_score = parseInt(arr30[0]) + parseInt(arr30[1]);

                var obj31 = document.getElementsByName("fraction31");
                var obj31_31 = "";
                var obj31_31_score = "";
                for (var i = 0; i < obj31.length; i++) {
                    if (obj31[i].checked) {
                        obj31_31 += obj31[i].value + ",";
                        obj31_31_score += $(obj31[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj31_31_score += "0,";
                    }
                }
                var arr31 = obj31_31_score.split(",");
                obj31_31_31 = obj31_31;
                $(this).parent().parent().parent().find(".pf31").html(parseInt(arr31[0]) + parseInt(arr31[1]) + parseInt(arr31[2]));
                obj31_31_31_score = parseInt(arr31[0]) + parseInt(arr31[1])  + parseInt(arr31[2]);

                var obj32 = document.getElementsByName("fraction32");
                var obj32_32 = "";
                var obj32_32_score = "";
                for (var i = 0; i < obj32.length; i++) {
                    if (obj32[i].checked) {
                        obj32_32 += obj32[i].value + ",";
                        obj32_32_score += $(obj32[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj32_32_score += "0,";
                    }
                }
                var arr32 = obj32_32_score.split(",");
                obj32_32_32 = obj32_32;
                $(this).parent().parent().parent().find(".pf32").html(parseInt(arr32[0]));
                obj32_32_32_score = parseInt(arr32[0]);

                var obj33 = document.getElementsByName("fraction33");
                var obj33_33 = "";
                var obj33_33_score = "";
                for (var i = 0; i < obj33.length; i++) {
                    if (obj33[i].checked) {
                        obj33_33 += obj33[i].value + ",";
                        obj33_33_score += $(obj33[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj33_33_score += "0,";
                    }
                }
                var arr33 = obj33_33_score.split(",");
                obj33_33_33 = obj33_33;
                $(this).parent().parent().parent().find(".pf33").html(parseInt(arr33[0]) + parseInt(arr33[1]));
                obj33_33_33_score = parseInt(arr33[0]) + parseInt(arr33[1]);

                var obj34 = document.getElementsByName("fraction34");
                var obj34_34 = "";
                var obj34_34_score = "";
                for (var i = 0; i < obj34.length; i++) {
                    if (obj34[i].checked) {
                        obj34_34 += obj34[i].value + ",";
                        obj34_34_score += $(obj34[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj34_34_score += "0,";
                    }
                }
                var arr34 = obj34_34_score.split(",");
                obj34_34_34 = obj34_34;
                $(this).parent().parent().parent().find(".pf34").html(parseInt(arr34[0]) + parseInt(arr34[1]));
                obj34_34_34_score = parseInt(arr34[0]) + parseInt(arr34[1]);


                var obj35 = document.getElementsByName("fraction35");
                var obj35_35 = "";
                var obj35_35_score = "";
                for (var i = 0; i < obj35.length; i++) {
                    if (obj35[i].checked) {
                        obj35_35 += obj35[i].value + ",";
                        obj35_35_score += $(obj35[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj35_35_score += "0,";
                    }
                }
                var arr35 = obj35_35_score.split(",");
                obj35_35_35 = obj35_35;
                $(this).parent().parent().parent().find(".pf35").html(parseInt(arr35[0]) + parseInt(arr35[1]));
                obj35_35_35_score = parseInt(arr35[0]) + parseInt(arr35[1]);

                var obj36 = document.getElementsByName("fraction36");
                var obj36_36 = "";
                var obj36_36_score = "";
                for (var i = 0; i < obj36.length; i++) {
                    if (obj36[i].checked) {
                        obj36_36 += obj36[i].value + ",";
                        obj36_36_score += $(obj36[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj36_36_score += "0,";
                    }
                }
                var arr36 = obj36_36_score.split(",");
                obj36_36_36 = obj36_36;
                $(this).parent().parent().parent().find(".pf36").html(parseInt(arr36[0]) + parseInt(arr36[1]));
                obj36_36_36_score = parseInt(arr36[0]) + parseInt(arr36[1]);


                var obj37 = document.getElementsByName("fraction37");
                var obj37_37 = "";
                var obj37_37_score = "";
                for (var i = 0; i < obj37.length; i++) {
                    if (obj37[i].checked) {
                        obj37_37 += obj37[i].value + ",";
                        obj37_37_score += $(obj37[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj37_37_score += "0,";
                    }
                }
                var arr37 = obj37_37_score.split(",");
                obj37_37_37 = obj37_37;
                $(this).parent().parent().parent().find(".pf37").html(parseInt(arr37[0]) + parseInt(arr37[1]) + parseInt(arr37[2]) + parseInt(arr37[3]));
                obj37_37_37_score = parseInt(arr37[0]) + parseInt(arr37[1]) + parseInt(arr37[2]) + parseInt(arr37[3]);


                var obj38 = document.getElementsByName("fraction38");
                var obj38_38 = "";
                var obj38_38_score = "";
                for (var i = 0; i < obj38.length; i++) {
                    if (obj38[i].checked) {
                        obj38_38 += obj38[i].value + ",";
                        obj38_38_score += $(obj38[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj38_38_score += "0,";
                    }
                }
                var arr38 = obj38_38_score.split(",");
                obj38_38_38 = obj38_38;
                $(this).parent().parent().parent().find(".pf38").html(parseInt(arr38[0]));
                obj38_38_38_score = parseInt(arr38[0]);


                var obj39 = document.getElementsByName("fraction39");
                var obj39_39 = "";
                var obj39_39_score = "";
                for (var i = 0; i < obj39.length; i++) {
                    if (obj39[i].checked) {
                        obj39_39 += obj39[i].value + ",";
                        obj39_39_score += $(obj39[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj39_39_score += "0,";
                    }
                }
                var arr39 = obj39_39_score.split(",");
                obj39_39_39 = obj39_39;
                $(this).parent().parent().parent().find(".pf39").html(parseInt(arr39[0]));
                obj39_39_39_score = parseInt(arr39[0]);


                var obj40 = document.getElementsByName("fraction40");
                var obj40_40 = "";
                var obj40_40_score = "";
                for (var i = 0; i < obj40.length; i++) {
                    if (obj40[i].checked) {
                        obj40_40 += obj40[i].value + ",";
                        obj40_40_score += $(obj40[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj40_40_score += "0,";
                    }
                }
                var arr40 = obj40_40_score.split(",");
                obj40_40_40 = obj40_40;
                $(this).parent().parent().parent().find(".pf40").html(parseInt(arr40[0]));
                obj40_40_40_score = parseInt(arr40[0]);

                var obj41 = document.getElementsByName("fraction41");
                var obj41_41 = "";
                var obj41_41_score = "";
                for (var i = 0; i < obj41.length; i++) {
                    if (obj41[i].checked) {
                        obj41_41 += obj41[i].value + ",";
                        obj41_41_score += $(obj41[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj41_41_score += "0,";
                    }
                }
                var arr41 = obj41_41_score.split(",");
                obj41_41_41 = obj41_41;
                $(this).parent().parent().parent().find(".pf41").html(parseInt(arr41[0]));
                obj41_41_41_score = parseInt(arr41[0]);


                $("#all2").html(obj23_23_23_score+obj24_24_24_score+obj25_25_25_score+obj26_26_26_score+obj27_27_27_score+obj28_28_28_score+obj29_29_29_score+obj30_30_30_score+obj31_31_31_score+obj32_32_32_score+obj33_33_33_score+obj34_34_34_score
                    +obj35_35_35_score+obj36_36_36_score+obj37_37_37_score+obj38_38_38_score+obj39_39_39_score+obj40_40_40_score+obj41_41_41_score);


                var obj42 = document.getElementsByName("fraction42");
                var obj42_42 = "";
                var obj42_42_score = "";
                for (var i = 0; i < obj42.length; i++) {
                    if (obj42[i].checked) {
                        obj42_42 += obj42[i].value + ",";
                        obj42_42_score += $(obj42[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj42_42_score += "0,";
                    }
                }
                var arr42 = obj42_42_score.split(",");
                obj42_42_42 = obj42_42;
                $(this).parent().parent().parent().find(".pf42").html(parseInt(arr42[0]) + parseInt(arr42[1]));
                obj42_42_42_score = parseInt(arr42[0]) + parseInt(arr42[1]);
                if(obj42_42_42_score >= 12){
                    obj42_42_42_score = 12;
                }

                var obj43 = document.getElementsByName("fraction43");
                var obj43_43 = "";
                var obj43_43_score = "";
                for (var i = 0; i < obj43.length; i++) {
                    if (obj43[i].checked) {
                        obj43_43 += obj43[i].value + ",";
                        obj43_43_score += $(obj43[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj43_43_score += "0,";
                    }
                }
                var arr43 = obj43_43_score.split(",");
                obj43_43_43 = obj43_43;
                $(this).parent().parent().parent().find(".pf43").html(parseInt(arr43[0]) + parseInt(arr43[1]));
                obj43_43_43_score = parseInt(arr43[0]) + parseInt(arr43[1]);
                if(obj43_43_43_score >= 10){
                    obj43_43_43_score = 10;
                }

                var obj44 = document.getElementsByName("fraction44");
                var obj44_44 = "";
                var obj44_44_score = "";
                for (var i = 0; i < obj44.length; i++) {
                    if (obj44[i].checked) {
                        obj44_44 += obj44[i].value + ",";
                        obj44_44_score += $(obj44[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj44_44_score += "0,";
                    }
                }
                var arr44 = obj44_44_score.split(",");
                obj44_44_44 = obj44_44;
                $(this).parent().parent().parent().find(".pf44").html(parseInt(arr44[0]) + parseInt(arr44[1]));
                obj44_44_44_score = parseInt(arr44[0]) + parseInt(arr44[1]);
                if(obj44_44_44_score >= 4){
                    obj44_44_44_score = 4;
                }


                var obj45 = document.getElementsByName("fraction45");
                var obj45_45 = "";
                var obj45_45_score = "";
                for (var i = 0; i < obj45.length; i++) {
                    if (obj45[i].checked) {
                        obj45_45 += obj45[i].value + ",";
                        obj45_45_score += $(obj45[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj45_45_score += "0,";
                    }
                }
                var arr45 = obj45_45_score.split(",");
                obj45_45_45 = obj45_45;
                $(this).parent().parent().parent().find(".pf45").html(parseInt(arr45[0]) + parseInt(arr45[1]));
                obj45_45_45_score = parseInt(arr45[0]) + parseInt(arr45[1]);
                if(obj45_45_45_score >= 4){
                    obj45_45_45_score = 4;
                }

                var obj46 = document.getElementsByName("fraction46");
                var obj46_46 = "";
                var obj46_46_score = "";
                for (var i = 0; i < obj46.length; i++) {
                    if (obj46[i].checked) {
                        obj46_46 += obj46[i].value + ",";
                        obj46_46_score += $(obj46[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj46_46_score += "0,";
                    }
                }
                var arr46 = obj46_46_score.split(",");
                obj46_46_46 = obj46_46;
                $(this).parent().parent().parent().find(".pf46").html(parseInt(arr46[0]) + parseInt(arr46[1]));
                obj46_46_46_score = parseInt(arr46[0]) + parseInt(arr46[1]);


                var obj47 = document.getElementsByName("fraction47");
                var obj47_47 = "";
                var obj47_47_score = "";
                for (var i = 0; i < obj47.length; i++) {
                    if (obj47[i].checked) {
                        obj47_47 += obj47[i].value + ",";
                        obj47_47_score += $(obj47[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj47_47_score += "0,";
                    }
                }
                var arr47 = obj47_47_score.split(",");
                obj47_47_47 = obj47_47;
                $(this).parent().parent().parent().find(".pf47").html(parseInt(arr47[0]) + parseInt(arr47[1]) + parseInt(arr47[2]));
                obj47_47_47_score = parseInt(arr47[0]) + parseInt(arr47[1])  + parseInt(arr47[2]);


                var obj48 = document.getElementsByName("fraction48");
                var obj48_48 = "";
                var obj48_48_score = "";
                for (var i = 0; i < obj48.length; i++) {
                    if (obj48[i].checked) {
                        obj48_48 += obj48[i].value + ",";
                        obj48_48_score += $(obj48[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj48_48_score += "0,";
                    }
                }
                var arr48 = obj48_48_score.split(",");
                obj48_48_48 = obj48_48;
                $(this).parent().parent().parent().find(".pf48").html(parseInt(arr48[0]) + parseInt(arr48[1]));
                obj48_48_48_score = parseInt(arr48[0]) + parseInt(arr48[1]);


                var obj49 = document.getElementsByName("fraction49");
                var obj49_49 = "";
                var obj49_49_score = "";
                for (var i = 0; i < obj49.length; i++) {
                    if (obj49[i].checked) {
                        obj49_49 += obj49[i].value + ",";
                        obj49_49_score += $(obj49[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj49_49_score += "0,";
                    }
                }
                var arr49 = obj49_49_score.split(",");
                obj49_49_49 = obj49_49;
                $(this).parent().parent().parent().find(".pf49").html(parseInt(arr49[0]) + parseInt(arr49[1]));
                obj49_49_49_score = parseInt(arr49[0]) + parseInt(arr49[1]);


                var obj50 = document.getElementsByName("fraction50");
                var obj50_50 = "";
                var obj50_50_score = "";
                for (var i = 0; i < obj50.length; i++) {
                    if (obj50[i].checked) {
                        obj50_50 += obj50[i].value + ",";
                        obj50_50_score += $(obj50[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj50_50_score += "0,";
                    }
                }
                var arr50 = obj50_50_score.split(",");
                obj50_50_50 = obj50_50;
                $(this).parent().parent().parent().find(".pf50").html(parseInt(arr50[0]));
                obj50_50_50_score = parseInt(arr50[0]);

                var obj51 = document.getElementsByName("fraction51");
                var obj51_51 = "";
                var obj51_51_score = "";
                for (var i = 0; i < obj51.length; i++) {
                    if (obj51[i].checked) {
                        obj51_51 += obj51[i].value + ",";
                        obj51_51_score += $(obj51[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj51_51_score += "0,";
                    }
                }
                var arr51 = obj51_51_score.split(",");
                obj51_51_51 = obj51_51;
                $(this).parent().parent().parent().find(".pf51").html(parseInt(arr51[0]) + parseInt(arr51[1]) + parseInt(arr51[2]) + parseInt(arr51[3]) + parseInt(arr51[4]) + parseInt(arr51[5]) + parseInt(arr51[6]));
                obj51_51_51_score = parseInt(arr51[0]) + parseInt(arr51[1]) + parseInt(arr51[2]) + parseInt(arr51[3]) + parseInt(arr51[4]) + parseInt(arr51[5]) + parseInt(arr51[6]);

                var obj52 = document.getElementsByName("fraction52");
                var obj52_52 = "";
                var obj52_52_score = "";
                for (var i = 0; i < obj52.length; i++) {
                    if (obj52[i].checked) {
                        obj52_52 += obj52[i].value + ",";
                        obj52_52_score += $(obj52[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj52_52_score += "0,";
                    }
                }
                var arr52 = obj52_52_score.split(",");
                obj52_52_52 = obj52_52;
                $(this).parent().parent().parent().find(".pf52").html(parseInt(arr52[0]) + parseInt(arr52[1]) + parseInt(arr52[2]) + parseInt(arr52[3]) + parseInt(arr52[4]) + parseInt(arr52[5]));
                obj52_52_52_score = parseInt(arr52[0]) + parseInt(arr52[1]) + parseInt(arr52[2]) + parseInt(arr52[3]) + parseInt(arr52[4]) + parseInt(arr52[5]);

                var obj53 = document.getElementsByName("fraction53");
                var obj53_53 = "";
                var obj53_53_score = "";
                for (var i = 0; i < obj53.length; i++) {
                    if (obj53[i].checked) {
                        obj53_53 += obj53[i].value + ",";
                        obj53_53_score += $(obj53[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj53_53_score += "0,";
                    }
                }
                var arr53 = obj53_53_score.split(",");
                obj53_53_53 = obj53_53;
                $(this).parent().parent().parent().find(".pf53").html(parseInt(arr53[0]) + parseInt(arr53[1]));
                obj53_53_53_score = parseInt(arr53[0]) + parseInt(arr53[1]);


                var obj54 = document.getElementsByName("fraction54");
                var obj54_54 = "";
                var obj54_54_score = "";
                for (var i = 0; i < obj54.length; i++) {
                    if (obj54[i].checked) {
                        obj54_54 += obj54[i].value + ",";
                        obj54_54_score += $(obj54[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj54_54_score += "0,";
                    }
                }
                var arr54 = obj54_54_score.split(",");
                obj54_54_54 = obj54_54;
                $(this).parent().parent().parent().find(".pf54").html(parseInt(arr54[0]));
                obj54_54_54_score = parseInt(arr54[0]);


                var obj55 = document.getElementsByName("fraction55");
                var obj55_55 = "";
                var obj55_55_score = "";
                for (var i = 0; i < obj55.length; i++) {
                    if (obj55[i].checked) {
                        obj55_55 += obj55[i].value + ",";
                        obj55_55_score += $(obj55[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj55_55_score += "0,";
                    }
                }
                var arr55 = obj55_55_score.split(",");
                obj55_55_55 = obj55_55;
                $(this).parent().parent().parent().find(".pf55").html(parseInt(arr55[0]) + parseInt(arr55[1]) + parseInt(arr55[2]) + parseInt(arr55[3]));
                obj55_55_55_score = parseInt(arr55[0]) + parseInt(arr55[1]) + parseInt(arr55[2]) + parseInt(arr55[3]);
                if(obj55_55_55_score>=5){
                    obj55_55_55_score=5;
                }


                var obj56 = document.getElementsByName("fraction56");
                var obj56_56 = "";
                var obj56_56_score = "";
                for (var i = 0; i < obj56.length; i++) {
                    if (obj56[i].checked) {
                        obj56_56 += obj56[i].value + ",";
                        obj56_56_score += $(obj56[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj56_56_score += "0,";
                    }
                }
                var arr56 = obj56_56_score.split(",");
                obj56_56_56 = obj56_56;
                $(this).parent().parent().parent().find(".pf56").html(parseInt(arr56[0]) + parseInt(arr56[1]) + parseInt(arr56[2]) + parseInt(arr56[3]));
                obj56_56_56_score = parseInt(arr56[0]) + parseInt(arr56[1]) + parseInt(arr56[2]) + parseInt(arr56[3]);

                var obj57 = document.getElementsByName("fraction57");
                var obj57_57 = "";
                var obj57_57_score = "";
                for (var i = 0; i < obj57.length; i++) {
                    if (obj57[i].checked) {
                        obj57_57 += obj57[i].value + ",";
                        obj57_57_score += $(obj57[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj57_57_score += "0,";
                    }
                }
                var arr57 = obj57_57_score.split(",");
                obj57_57_57 = obj57_57;
                $(this).parent().parent().parent().find(".pf57").html(parseInt(arr57[0]));
                obj57_57_57_score = parseInt(arr57[0]);

                var obj58 = document.getElementsByName("fraction58");
                var obj58_58 = "";
                var obj58_58_score = "";
                for (var i = 0; i < obj58.length; i++) {
                    if (obj58[i].checked) {
                        obj58_58 += obj58[i].value + ",";
                        obj58_58_score += $(obj58[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj58_58_score += "0,";
                    }
                }
                var arr58 = obj58_58_score.split(",");
                obj58_58_58 = obj58_58;
                $(this).parent().parent().parent().find(".pf58").html(parseInt(arr58[0])+parseInt(arr58[1]));
                obj58_58_58_score = parseInt(arr58[0])+parseInt(arr58[1]);

                var obj59 = document.getElementsByName("fraction59");
                var obj59_59 = "";
                var obj59_59_score = "";
                for (var i = 0; i < obj59.length; i++) {
                    if (obj59[i].checked) {
                        obj59_59 += obj59[i].value + ",";
                        obj59_59_score += $(obj59[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj59_59_score += "0,";
                    }
                }
                var arr59 = obj59_59_score.split(",");
                obj59_59_59 = obj59_59;
                $(this).parent().parent().parent().find(".pf59").html(parseInt(arr59[0]));
                obj59_59_59_score = parseInt(arr59[0]);


                var obj60 = document.getElementsByName("fraction60");
                var obj60_60 = "";
                var obj60_60_score = "";
                for (var i = 0; i < obj60.length; i++) {
                    if (obj60[i].checked) {
                        obj60_60 += obj60[i].value + ",";
                        obj60_60_score += $(obj60[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj60_60_score += "0,";
                    }
                }
                var arr60 = obj60_60_score.split(",");
                obj60_60_60 = obj60_60;
                $(this).parent().parent().parent().find(".pf60").html(parseInt(arr60[0])+parseInt(arr60[1]));
                obj60_60_60_score = parseInt(arr60[0])+parseInt(arr60[1]);


                var obj61 = document.getElementsByName("fraction61");
                var obj61_61 = "";
                var obj61_61_score = "";
                for (var i = 0; i < obj61.length; i++) {
                    if (obj61[i].checked) {
                        obj61_61 += obj61[i].value + ",";
                        obj61_61_score += $(obj61[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj61_61_score += "0,";
                    }
                }
                var arr61 = obj61_61_score.split(",");
                obj61_61_61 = obj61_61;
                $(this).parent().parent().parent().find(".pf61").html(parseInt(arr61[0])+parseInt(arr61[1])+parseInt(arr61[2])+parseInt(arr61[3]));
                obj61_61_61_score = parseInt(arr61[0])+parseInt(arr61[1])+parseInt(arr61[2])+parseInt(arr61[3]);

                var obj62 = document.getElementsByName("fraction62");
                var obj62_62 = "";
                var obj62_62_score = "";
                for (var i = 0; i < obj62.length; i++) {
                    if (obj62[i].checked) {
                        obj62_62 += obj62[i].value + ",";
                        obj62_62_score += $(obj62[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj62_62_score += "0,";
                    }
                }
                var arr62 = obj62_62_score.split(",");
                obj62_62_62 = obj62_62;
                $(this).parent().parent().parent().find(".pf62").html(parseInt(arr62[0]));
                obj62_62_62_score = parseInt(arr62[0]);

                $("#all3").html(obj42_42_42_score+obj43_43_43_score+obj44_44_44_score+obj45_45_45_score+obj46_46_46_score+obj47_47_47_score+obj48_48_48_score+obj49_49_49_score+obj50_50_50_score+obj51_51_51_score+obj52_52_52_score+obj53_53_53_score
                    +obj54_54_54_score+obj55_55_55_score+obj56_56_56_score+obj57_57_57_score+obj58_58_58_score+obj59_59_59_score+obj60_60_60_score+obj61_61_61_score+obj62_62_62_score);


                var obj63 = document.getElementsByName("fraction63");
                var obj63_63 = "";
                var obj63_63_score = "";
                for (var i = 0; i < obj63.length; i++) {
                    if (obj63[i].checked) {
                        obj63_63 += obj63[i].value + ",";
                        obj63_63_score += $(obj63[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj63_63_score += "0,";
                    }
                }
                var arr63 = obj63_63_score.split(",");
                obj63_63_63 = obj63_63;
                $(this).parent().parent().parent().find(".pf63").html(parseInt(arr63[0])+parseInt(arr63[1]));
                obj63_63_63_score = parseInt(arr63[0])+parseInt(arr63[1]);

                var obj64 = document.getElementsByName("fraction64");
                var obj64_64 = "";
                var obj64_64_score = "";
                for (var i = 0; i < obj64.length; i++) {
                    if (obj64[i].checked) {
                        obj64_64 += obj64[i].value + ",";
                        obj64_64_score += $(obj64[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj64_64_score += "0,";
                    }
                }
                var arr64 = obj64_64_score.split(",");
                obj64_64_64 = obj64_64;
                $(this).parent().parent().parent().find(".pf64").html(parseInt(arr64[0])+parseInt(arr64[1])+parseInt(arr64[2])+parseInt(arr64[3]));
                obj64_64_64_score = parseInt(arr64[0])+parseInt(arr64[1])+parseInt(arr64[2])+parseInt(arr64[3]);


                var obj65 = document.getElementsByName("fraction65");
                var obj65_65 = "";
                var obj65_65_score = "";
                for (var i = 0; i < obj65.length; i++) {
                    if (obj65[i].checked) {
                        obj65_65 += obj65[i].value + ",";
                        obj65_65_score += $(obj65[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj65_65_score += "0,";
                    }
                }
                var arr65 = obj65_65_score.split(",");
                obj65_65_65 = obj65_65;
                $(this).parent().parent().parent().find(".pf65").html(parseInt(arr65[0])+parseInt(arr65[1])+parseInt(arr65[2])+parseInt(arr65[3]));
                obj65_65_65_score = parseInt(arr65[0])+parseInt(arr65[1])+parseInt(arr65[2])+parseInt(arr65[3]);


                var obj66 = document.getElementsByName("fraction66");
                var obj66_66 = "";
                var obj66_66_score = "";
                for (var i = 0; i < obj66.length; i++) {
                    if (obj66[i].checked) {
                        obj66_66 += obj66[i].value + ",";
                        obj66_66_score += $(obj66[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj66_66_score += "0,";
                    }
                }
                var arr66 = obj66_66_score.split(",");
                obj66_66_66 = obj66_66;
                $(this).parent().parent().parent().find(".pf66").html(parseInt(arr66[0]));
                obj66_66_66_score = parseInt(arr66[0]);


                var obj67 = document.getElementsByName("fraction67");
                var obj67_67 = "";
                var obj67_67_score = "";
                for (var i = 0; i < obj67.length; i++) {
                    if (obj67[i].checked) {
                        obj67_67 += obj67[i].value + ",";
                        obj67_67_score += $(obj67[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj67_67_score += "0,";
                    }
                }
                var arr67 = obj67_67_score.split(",");
                obj67_67_67 = obj67_67;
                $(this).parent().parent().parent().find(".pf67").html(parseInt(arr67[0]));
                obj67_67_67_score = parseInt(arr67[0]);


                var obj68 = document.getElementsByName("fraction68");
                var obj68_68 = "";
                var obj68_68_score = "";
                for (var i = 0; i < obj68.length; i++) {
                    if (obj68[i].checked) {
                        obj68_68 += obj68[i].value + ",";
                        obj68_68_score += $(obj68[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj68_68_score += "0,";
                    }
                }
                var arr68 = obj68_68_score.split(",");
                obj68_68_68 = obj68_68;
                $(this).parent().parent().parent().find(".pf68").html(parseInt(arr68[0]));
                obj68_68_68_score = parseInt(arr68[0]);


                var obj69 = document.getElementsByName("fraction69");
                var obj69_69 = "";
                var obj69_69_score = "";
                for (var i = 0; i < obj69.length; i++) {
                    if (obj69[i].checked) {
                        obj69_69 += obj69[i].value + ",";
                        obj69_69_score += $(obj69[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj69_69_score += "0,";
                    }
                }
                var arr69 = obj69_69_score.split(",");
                obj69_69_69 = obj69_69;
                $(this).parent().parent().parent().find(".pf69").html(parseInt(arr69[0]));
                obj69_69_69_score = parseInt(arr69[0]);

                var obj70 = document.getElementsByName("fraction70");
                var obj70_70 = "";
                var obj70_70_score = "";
                for (var i = 0; i < obj70.length; i++) {
                    if (obj70[i].checked) {
                        obj70_70 += obj70[i].value + ",";
                        obj70_70_score += $(obj70[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj70_70_score += "0,";
                    }
                }
                var arr70 = obj70_70_score.split(",");
                obj70_70_70 = obj70_70;
                $(this).parent().parent().parent().find(".pf70").html(parseInt(arr70[0]));
                obj70_70_70_score = parseInt(arr70[0]);


                var obj71 = document.getElementsByName("fraction71");
                var obj71_71 = "";
                var obj71_71_score = "";
                for (var i = 0; i < obj71.length; i++) {
                    if (obj71[i].checked) {
                        obj71_71 += obj71[i].value + ",";
                        obj71_71_score += $(obj71[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj71_71_score += "0,";
                    }
                }
                var arr71 = obj71_71_score.split(",");
                obj71_71_71 = obj71_71;
                $(this).parent().parent().parent().find(".pf71").html(parseInt(arr71[0]));
                obj71_71_71_score = parseInt(arr71[0]);

                var obj72 = document.getElementsByName("fraction72");
                var obj72_72 = "";
                var obj72_72_score = "";
                for (var i = 0; i < obj72.length; i++) {
                    if (obj72[i].checked) {
                        obj72_72 += obj72[i].value + ",";
                        obj72_72_score += $(obj72[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj72_72_score += "0,";
                    }
                }
                var arr72 = obj72_72_score.split(",");
                obj72_72_72 = obj72_72;
                $(this).parent().parent().parent().find(".pf72").html(parseInt(arr72[0])+parseInt(arr72[1]));
                obj72_72_72_score = parseInt(arr72[0])+parseInt(arr72[1]);

                var obj73 = document.getElementsByName("fraction73");
                var obj73_73 = "";
                var obj73_73_score = "";
                for (var i = 0; i < obj73.length; i++) {
                    if (obj73[i].checked) {
                        obj73_73 += obj73[i].value + ",";
                        obj73_73_score += $(obj73[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj73_73_score += "0,";
                    }
                }
                var arr73 = obj73_73_score.split(",");
                obj73_73_73 = obj73_73;
                $(this).parent().parent().parent().find(".pf73").html(parseInt(arr73[0])+parseInt(arr73[1]));
                obj73_73_73_score = parseInt(arr73[0])+parseInt(arr73[1]);

                var obj74 = document.getElementsByName("fraction74");
                var obj74_74 = "";
                var obj74_74_score = "";
                for (var i = 0; i < obj74.length; i++) {
                    if (obj74[i].checked) {
                        obj74_74 += obj74[i].value + ",";
                        obj74_74_score += $(obj74[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj74_74_score += "0,";
                    }
                }
                var arr74 = obj74_74_score.split(",");
                obj74_74_74 = obj74_74;
                $(this).parent().parent().parent().find(".pf74").html(parseInt(arr74[0]));
                obj74_74_74_score = parseInt(arr74[0]);

                var obj75 = document.getElementsByName("fraction75");
                var obj75_75 = "";
                var obj75_75_score = "";
                for (var i = 0; i < obj75.length; i++) {
                    if (obj75[i].checked) {
                        obj75_75 += obj75[i].value + ",";
                        obj75_75_score += $(obj75[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj75_75_score += "0,";
                    }
                }
                var arr75 = obj75_75_score.split(",");
                obj75_75_75 = obj75_75;
                $(this).parent().parent().parent().find(".pf75").html(parseInt(arr75[0])+parseInt(arr75[1]));
                obj75_75_75_score = parseInt(arr75[0])+parseInt(arr75[1]);

                var obj76 = document.getElementsByName("fraction76");
                var obj76_76 = "";
                var obj76_76_score = "";
                for (var i = 0; i < obj76.length; i++) {
                    if (obj76[i].checked) {
                        obj76_76 += obj76[i].value + ",";
                        obj76_76_score += $(obj76[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj76_76_score += "0,";
                    }
                }
                var arr76 = obj76_76_score.split(",");
                obj76_76_76 = obj76_76;
                $(this).parent().parent().parent().find(".pf76").html(parseInt(arr76[0]));
                obj76_76_76_score = parseInt(arr76[0]);


                var obj77 = document.getElementsByName("fraction77");
                var obj77_77 = "";
                var obj77_77_score = "";
                for (var i = 0; i < obj77.length; i++) {
                    if (obj77[i].checked) {
                        obj77_77 += obj77[i].value + ",";
                        obj77_77_score += $(obj77[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj77_77_score += "0,";
                    }
                }
                var arr77 = obj77_77_score.split(",");
                obj77_77_77 = obj77_77;
                $(this).parent().parent().parent().find(".pf77").html(parseInt(arr77[0]));
                obj77_77_77_score = parseInt(arr77[0]);

                var obj78 = document.getElementsByName("fraction78");
                var obj78_78 = "";
                var obj78_78_score = "";
                for (var i = 0; i < obj78.length; i++) {
                    if (obj78[i].checked) {
                        obj78_78 += obj78[i].value + ",";
                        obj78_78_score += $(obj78[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj78_78_score += "0,";
                    }
                }
                var arr78 = obj78_78_score.split(",");
                obj78_78_78 = obj78_78;
                $(this).parent().parent().parent().find(".pf78").html(parseInt(arr78[0])+parseInt(arr78[1])+parseInt(arr78[2])+parseInt(arr78[3]));
                obj78_78_78_score = parseInt(arr78[0])+parseInt(arr78[1])+parseInt(arr78[2])+parseInt(arr78[3]);

                var obj79 = document.getElementsByName("fraction79");
                var obj79_79 = "";
                var obj79_79_score = "";
                for (var i = 0; i < obj79.length; i++) {
                    if (obj79[i].checked) {
                        obj79_79 += obj79[i].value + ",";
                        obj79_79_score += $(obj79[i]).parent().parent().parent().find(".thisSpan").html() + ",";
                    }else {
                        obj79_79_score += "0,";
                    }
                }
                var arr79 = obj79_79_score.split(",");
                obj79_79_79 = obj79_79;
                $(this).parent().parent().parent().find(".pf79").html(parseInt(arr79[0])+parseInt(arr79[1]));
                obj79_79_79_score = parseInt(arr79[0])+parseInt(arr79[1]);

                $("#all4").html(obj63_63_63_score+obj64_64_64_score+obj65_65_65_score+obj66_66_66_score+obj67_67_67_score+obj68_68_68_score+obj69_69_69_score+obj70_70_70_score+obj71_71_71_score+obj72_72_72_score+obj73_73_73_score
                    +obj74_74_74_score+obj75_75_75_score+obj76_76_76_score+obj77_77_77_score+obj78_78_78_score+obj79_79_79_score);


            });



        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

