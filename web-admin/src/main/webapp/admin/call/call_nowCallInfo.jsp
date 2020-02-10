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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>当前来电</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/view/css/alertStyle.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jquery-multi-select/css/multi-select.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <style>
            .alert_wrap {
                display: table;
                position: fixed;
                padding: 0px 10px;
                top: initial;
                left: inherit;
                right: 144px;
                bottom: 0;
                width: 500px;
                height: auto;
                background: none;
            }

            .elderData {
                width: 600px;
            }

            .elderData .alert_head_wrap {
                line-height: 48px;
                height: 48px;
                font-size: 14px
            }

            .elderData table td {
                padding: 10px 0;
            }

            .elderData table span {
                background: #EAEAEA;
                padding: 2px 5px;
                margin: 0 5px;
                display: inline-block;
            }

            .tablOlder {
                width: 310px;
                display: inline-block;
                border-right: 1px solid #cecece;
                float: left;
                padding: 10px
            }

            .tableGX {
                float: right;
                width: 50%px;
                height: 200px;
                display: table;
                text-align: center
            }

            .tableGX {
                float: right;
                width: 48%;
                height: 200px;
                display: table;
                text-align: center
            }

            .tableGX_info {
                display: table-cell;
                vertical-align: middle;
            }
            ol, ul {
                list-style: none;
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
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">呼叫系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">当前来电</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            当前来电客户信息
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <c:if test="${empty callInfo.callerId}">
                                <div class="form-body">
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">暂无响应的呼叫
                                        </label>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${ not empty callInfo.callerId}">
                                <div class="form-body">
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">呼叫类型
                                        </label>
                                        <div class="col-md-4">
                                            <input name="callInfoId" type="hidden"
                                                   value="${callInfo.id}" readonly>
                                            <input name="queueName" type="text" class="form-control"
                                                   value="
                                                             " readonly>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">呼叫时间
                                        </label>
                                        <div class="col-md-4">
                                            <input name="callerName" type="text" class="form-control"
                                                   value="${createTimeStr}
                                                   " readonly>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">呼叫号码
                                        </label>
                                        <div class="col-md-4">
                                            <input name="callerId" type="text" class="form-control"
                                                   value="${callInfo.callerId}" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">坐席工号
                                        </label>
                                        <div class="col-md-4">
                                            <input name="monitorName" type="text" class="form-control"
                                                   value="${sessionScope.login_user.login_name}" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">坐席昵称
                                        </label>
                                        <div class="col-md-4">
                                            <input name="monitorName" type="text" class="form-control"
                                                   value="${sessionScope.login_user.nick_name}" readonly>
                                        </div>
                                    </div>
                                    <c:if test="${callInfo.type==3}">
                                        <%--回访--%>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">回访结果
                                            </label>
                                            <div class="col-md-4">
                                                <select id="visitResult" class="form-control">
                                                    <option value="0">未接听</option>
                                                    <option value="1" selected>已回访</option>
                                                </select>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${callInfo.type<3}">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">需求类型
                                            </label>
                                            <div class="col-md-4">
                                                <select id="requestType" class="form-control">
                                                    <option value="0">暂无数据</option>
                                                    <option value="1">紧急救援</option>
                                                    <option value="2">咨询服务</option>
                                                    <option value="3">服务转介</option>
                                                    <option value="4">投诉监管</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div id="requestTypeDiv1" class="form-group" style="display: none">
                                            <label class="col-md-2 control-label">需求内容
                                            </label>
                                            <div class="col-md-4">
                                                <select id="request1" class="form-control">
                                                    <option value="1">120</option>
                                                    <option value="2">119</option>
                                                    <option value="3">110</option>
                                                    <option value="4">三级救援体系</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div id="requestTypeDiv2" class="form-group" style="display: none">
                                            <label class="col-md-2 control-label">需求内容
                                            </label>
                                            <div class="col-md-4">
                                                <select id="request2" class="form-control">
                                                    <option value="1">政策法规咨询</option>
                                                    <option value="2">七助服务咨询</option>
                                                    <option value="3">心理咨询</option>
                                                    <option value="4">生活咨询</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div id="requestTypeDiv4" class="form-group" style="display: none">
                                            <label class="col-md-2 control-label">需求内容
                                            </label>
                                            <div class="col-md-4">
                                                <select id="request4" class="form-control">
                                                    <option value="1">受理反馈投诉</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div id="requestTypeDiv3" class="form-group" style="display: none">
                                            <label class="col-md-2 control-label">需求内容
                                            </label>
                                            <div class="col-md-4">
                                                <select id="request3" class="form-control select2" multiple>
                                                    <optgroup label="助餐">
                                                        <option value="11">上门送餐</option>
                                                        <option value="12">送餐</option>
                                                        <option value="13">其他</option>
                                                    </optgroup>
                                                    <optgroup label="助医">
                                                        <option value="21">陪看病，去医院取药</option>
                                                        <option value="22">医护服务：上门鼻饲，更换导尿管</option>
                                                        <option value="23">康复：运动治疗，言语治疗</option>
                                                        <option value="24">其他</option>
                                                    </optgroup>
                                                    <optgroup label="助购">
                                                        <option value="31">代购物品</option>
                                                        <option value="32">代购药品</option>
                                                        <option value="33">其他</option>
                                                    </optgroup>
                                                    <optgroup label="助浴">
                                                        <option value="41">上门洗浴（半失能老人）</option>
                                                        <option value="42">上门洗浴（失能老人）</option>
                                                        <option value="43">陪同前往浴室洗浴（自理老人）</option>
                                                        <option value="44">点上洗澡</option>
                                                        <option value="45">上门洗澡</option>
                                                        <option value="46">其他</option>
                                                    </optgroup>
                                                    <optgroup label="助急">
                                                        <option value="51">110</option>
                                                        <option value="52">120</option>
                                                        <option value="53">其他</option>
                                                    </optgroup>
                                                    <optgroup label="助洁">
                                                        <option value="61">上门洗头</option>
                                                        <option value="62">保洁</option>
                                                        <option value="63">理发</option>
                                                        <option value="64">刮脸</option>
                                                        <option value="65">修脚</option>
                                                        <option value="66">洗衣</option>
                                                        <option value="67">其他</option>
                                                    </optgroup>
                                                    <optgroup label="助行">
                                                        <option value="71">叫车服务</option>
                                                        <option value="72">其他</option>
                                                    </optgroup>
                                                    <option value="81">助学</option>
                                                    <option value="91">助乐</option>
                                                    <option value="101">助聊</option>
                                                    <option value="111">其他</option>
                                                </select>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">是否需要回拨
                                        </label>
                                        <div class="col-md-4">
                                            <select id="returnVisit" class="form-control">
                                                <option value="0" selected>不需要</option>
                                                <option value="1">需要</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">处理情况
                                        </label>
                                        <div class="col-md-4">
                                            <textarea id="content" name="content" type="text" rows="5"
                                                      class="form-control"
                                            ></textarea>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-1 col-md-6">
                                                <button id="transfer" type="button" class="btn red"
                                                >客户评价
                                                </button>
                                                <button id="transferOther" type="button" class="btn yellow"
                                                >转接
                                                </button>
                                                <button id="sendTask" type="button" class="btn blue"
                                                >需求调度
                                                </button>
                                                <button id="btnPublish" type="submit" class="btn green"
                                                        data-loading-text="记录中...">完成
                                                </button>

                                                <span id="labelmsg" class="label "></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <form class="form-body" id="sendTaskForm" style="display: none">
                                        <%--需求调度--%>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">标题
                                        </label>
                                        <div class="col-md-10">
                                            <input name="title" type="text" class="form-control "
                                                   value="新的工单">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">服务老人
                                            <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input name="elderName" type="text" class="form-control "
                                                   value="${customer.elderName}" readonly>
                                            <input name="elderId" type="hidden" class="form-control "
                                                   value="${customer.id}">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">服务项目
                                            <span class="required">*</span>
                                        </label>
                                        <div class="col-md-10">
                                            <select id="serviceType" name="serviceType" type="text"
                                                    class="form-control ">
                                            </select>
                                        </div>
                                    </div>
                                    <div id="serviceNameDiv" class="form-group" style="display: none;">
                                        <label class="col-md-2 control-label">服务项目
                                            <span class="required">*</span>
                                        </label>
                                        <div class="col-md-10">
                                            <select id="serviceName" name="serviceName" type="text"
                                                    class="form-control ">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">接收组织
                                            <span class="required">*</span>
                                        </label>
                                        <div class="col-md-3">
                                            <c:if test="${sessionScope.login_user.areaId>1}">
                                                <input type="hidden" id="areaName0"
                                                       value="${sessionScope.login_user.areaName}">
                                            </c:if>
                                            <select id="province" class="form-control"
                                                    onChange="EographicArea.changeProvince();" style="display: none">
                                                <option value="0" selected>江苏省</option>
                                            </select>
                                            <select name="city" class="form-control" id="city"
                                                    onChange="EographicArea.changeCity();"
                                                    <c:if test="${sessionScope.login_user.areaId>1}">disabled</c:if>
                                            >
                                                <option value="">直辖市，地级市</option>
                                                <option value="1">西宁市</option>
                                                <option value="2000">非西宁户籍</option>
                                            </select>
                                        </div>
                                        <div class="col-md-3">
                                            <select name="area" class="form-control" id="county"
                                                    onChange="TaskSend.changeCounty();"
                                                    readonly="readonly"
                                                    <c:if test="${sessionScope.login_user.areaId>1}">disabled</c:if>
                                            >
                                                <option value="">行政区，市，县</option>
                                            </select>
                                        </div>
                                        <div class="col-md-4">
                                            <%--<select id="receiverId" class="form-control select2me"--%>
                                                    <%--onChange="TaskSend.changeServiceOrg();">--%>
                                            <%--</select>--%>
                                            <select name="receiverId" class="form-control select2me" id="receiverId"
                                                    onChange="EographicArea.changeTown();"
                                                    readonly="readonly">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">工单定价
                                        </label>
                                        <div class="col-md-10">
                                            <input type="hidden" class="form-control" name="priceInfo" id="priceInfo"
                                                   disabled>
                                            <input type="text" class="form-control" name="priceInfoInput"
                                                   id="priceInfoInput" disabled>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">服务时间
                                            <span class="required">*</span>
                                        </label>
                                        <div class="col-md-10">
                                            <div class="input-group">
                                                <input name="date" class="form-control date-picker"
                                                       data-date-start-date="+0d"
                                                       style="float: left;width: 65%; margin-right: 5px" type="text"
                                                       value="" readonly/>
                                                <input name="time" type="text"
                                                       class="form-control timepicker timepicker-24"
                                                       style="width: 30%;float: right;" readonly>
                                                <span class="input-group-btn">
                                                <button class="btn default" type="button"><i
                                                        class="fa fa-clock-o"></i></button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">备注
                                        </label>
                                        <div class="col-md-10">
                                            <textarea name="content" class="form-control " rows="5"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-4 col-md-8">
                                                <button id="sendTaskBtn" type="button" class="btn green"
                                                        data-loading-text="发送中...">发送
                                                </button>
                                                <span id="sendTaskMsg" class="label "></span>
                                                <button id="cancel" type="button" class="btn blue"
                                                >取消
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--selectElder--%>
        <div class="modal" id="selectElder" tabindex="-1" role="basic" aria-hidden="true">
            <div class="modal-dialog" style="width: 900px">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">选择老人</h4>
                    </div>
                    <div class="modal-body">
                        <div class="portlet">
                            <div class="portlet-body" style="padding-top: 0px !important;">
                                <form id="elder-form" name="elder-form">
                                    <table class="table table-bordered table-hover table-condensed table-responsive">
                                        <tr>
                                            <td colspan="4" style="text-align: center;font-size: 15px">
                                                <span class="caption-helper">基本信息</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="20%" style="text-align:center;vertical-align:middle;">所属区域</td>
                                            <td style="text-align:center;vertical-align:middle;"
                                            >
                                                <input name="areaName" id="areaName" onclick="TaskSend.selectArea();"
                                                       style=" width: 100%;"
                                                       type="text" value="${sessionScope.login_user.areaName}"
                                                       readonly/>
                                                <input type="hidden" value="${sessionScope.login_user.areaId}"
                                                       name="areaId" id="areaId" style=" width: 100%;"/>
                                            </td>
                                            <td width="20%" style="text-align:center;vertical-align:middle;">
                                                姓&nbsp;&nbsp;名
                                            </td>
                                            <td width="30%" style="text-align:center;vertical-align:middle;">
                                                <input name="elderName" style=" width: 100%;"/>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                                <div class="right" style="text-align: right">
                                    <div class="right" style="text-align: right">
                                        <a class="table-group-action-submit btn btn-circle btn-import"><i
                                                class="fa">查询</i></a>
                                        <a class="reload table-group-action-reload btn btn-circle btn-black"><i
                                                class="fa">重置</i></a>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="portlet" style="">
                            <div class="table-container">
                                <table class="table table-striped table-bordered table-hover" id="datatable_event_list">
                                    <thead>
                                    <tr role="row" class="heading">
                                        <th width="20%">
                                            选择
                                        </th>
                                        <th width="30%">
                                            姓名
                                        </th>
                                        <th width="10%">
                                            年龄
                                        </th>
                                        <th width="40%">
                                            居住地址
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn blue add" onclick="TaskSend.selectElder()">确定</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- 地区模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">请选择...</h4>
                    </div>
                    <div class="modal-body">
                        <!-- BEGIN PAGE CONTENT-->
                        <div id="areaTree" class="tree-demo"></div>
                        <!-- END PAGE CONTENT-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary"
                                onclick="TaskSend.getAreaValue(AreaTree.getAllAreaName(AreaTree.getSelectArea()),AreaTree.getSelectArea());">
                            确定
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
        <%--model--%>
        <div class="modal" id="otherMonitors" tabindex="-1" role="basic" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">选择需要转接的坐席</h4>
                    </div>
                    <div class="modal-body">
                        <table class="table table-striped table-bordered table-hover" id="datatable_monitor_status">
                            <thead>
                            <tr role="row" class="heading">
                                <th width="10%">
                                    序号
                                </th>
                                <th width="10%">
                                    座机号
                                </th>
                                <th width="10%">
                                    账号
                                </th>
                                <th width="10%">
                                    名称
                                </th>
                                <th width="15%">
                                    状态
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
                    <div class="modal-footer">
                        <button type="button" class="btn blue default" data-dismiss="modal">取消</button>
                            <%--<button type="button" class="btn blue">确定</button>--%>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <%--弹出老人基本信息--%>
        <div id="fixed" class='alert_wrap' style="display: none">
            <div class="alert_main">
                <div class="alert_wrap_con elderData">
                    <div class="alert_head_wrap">
                        <h2 style="margin: 0px; padding:10px ">求救老人信息</h2>
                        <a href="javascript:void(0)">×</a>
                    </div>
                    <div style="margin: 5px">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#tab_1_1" data-toggle="tab">
                                    基本信息 </a>
                            </li>
                            <li>
                                <a href="#tab_1_2" data-toggle="tab">
                                    健康信息 </a>
                            </li>
                            <li>
                                <a onclick="mapInit()" href="#tab_1_3" data-toggle="tab">
                                    定位信息 </a>
                            </li>
                            <li>
                                <a href="#tab_1_4" data-toggle="tab">
                                    电子围栏 </a>
                            </li>
                            <li>
                                <a href="#tab_1_5" data-toggle="tab">
                                    服务计划 </a>
                            </li>
                            <li>
                                <a href="#tab_1_6" data-toggle="tab">
                                    预警信息 </a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade active in" id="tab_1_1">
                            <div style="padding: 0px 10px;border:0px;border-bottom:  1px solid #cecece; ">
                                <table>
                                    <tr>
                                        <td rowspan="3">
                                            <img src="${pageContext.request.contextPath }/assets/global/img/1503996959836.png"
                                                 style="width: 130px" alt=""/></td>
                                        <td><span>姓名</span></td>
                                        <td width="48px">${customer.elderName}</td>
                                        <td><span>身份证号</span></td>
                                        <td>${customer.idcardno} </td>
                                        <td><span>性别</span></td>
                                        <td><c:choose>
                                            <c:when test="${customer.sexDictId==0}">
                                                保密
                                            </c:when>
                                            <c:when test="${customer.sexDictId==1}">
                                                男
                                            </c:when>
                                            <c:when test="${customer.sexDictId==2}">
                                                女
                                            </c:when>
                                        </c:choose></td>
                                    </tr>
                                    <tr>
                                        <td><span>区域</span></td>
                                        <td colspan="5"> ${customer.beeperAddress}</td>
                                    </tr>
                                    <tr>
                                        <td><span>详细地址</span></td>
                                        <td colspan="5">${customer.beeperMoreAddress}</td>
                                    </tr>
                                </table>
                            </div>
                            <div style="overflow: hidden">
                                <table class="tablOlder" style="">
                                    <tr>
                                        <td colspan="4">求救家人信息</td>
                                    </tr>
                                    <tr>
                                        <td><span>姓名</span></td>
                                        <td>${customerRelate.linkName}</td>
                                        <td><span>与老人关系</span></td>
                                        <td>${customerRelate.relationship}</td>
                                    </tr>
                                    <tr>
                                        <td><span>手机</span></td>
                                        <td colspan="3">${customerRelate.linkTel}</td>
                                    </tr>
                                    <tr>
                                        <td width="70px"><span>是否有钥匙</span></td>
                                        <td colspan="3">${customerRelate.haveKey}</td>
                                    </tr>
                                </table>
                                <div class="tableGX">
                                    <div class="tableGX_info">
                                        <img src="${pageContext.request.contextPath }/assets/admin/pages/img/map.png"
                                             style="width: 100%;"
                                             alt=""/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade  in" id="tab_1_2">
                            <table border="1"
                                   class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                   align="center" style="border-collapse: collapse;">
                                <tr>
                                    <td style="vertical-align:middle;text-align: center;width: 15%">健康状况
                                    </td>
                                    <td style="vertical-align:middle;width: 15%"><%--0:健康,1:患有疾病--%>
                                        <lb:select name="healthStatus" cssClass="form-control"
                                                   value="${elderlyMsg.healthStatus}">
                                            <lb:option value="">暂无数据</lb:option>
                                            <lb:option value="0">健康</lb:option>
                                            <lb:option value="1">患有疾病</lb:option>
                                        </lb:select>
                                    </td>
                                    <td style="vertical-align:middle;text-align: center;width: 15%">心理状况
                                    </td>
                                    <td style="vertical-align:middle;width: 20%">
                                        <lb:select name="psychologicDictId" cssClass="form-control"
                                                   value="${elderlyMsg.psychologicDictId}">
                                            <lb:option value="">暂无数据</lb:option>
                                            <lb:option value="1">正常</lb:option>
                                            <lb:option value="2">偶尔有孤独感</lb:option>
                                            <lb:option value="3">经常觉得孤独</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align:middle;text-align: center;width: 15%">老年疾病
                                    </td>
                                    <td style="vertical-align:middle;width: 20%">
                                        <input name="elderDisease" maxlength="150" type="text" Class="form-control"
                                               value="${elderlyMsg.elderDisease}">
                                    </td>
                                    <td style="vertical-align:middle;text-align: center;">生活自理能力</td>
                                    <td style="vertical-align:middle;">
                                        <lb:select name="selfcareAbility" cssClass="form-control"
                                                   value="${elderlyMsg.selfcareAbility}">
                                            <lb:option value="">暂无数据</lb:option>
                                            <lb:option value="0">失能</lb:option>
                                            <lb:option value="1">半失能</lb:option>
                                            <lb:option value="2">自理</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align:middle;text-align: center;">药物过敏史</td>
                                    <td style="vertical-align:middle;">
                                        <input name="drugAllergy" type="text" Class="form-control"
                                               value="${elderlyMsg.drugAllergy}">
                                    </td>
                                    <td style="vertical-align:middle;text-align: center;">其他慢性病</td>
                                    <td style="vertical-align:middle;">
                                        <input maxlength="150" name="otherSlowplus" type="text" Class="form-control"
                                               value="${elderlyMsg.otherSlowplus}">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align:middle;text-align: center;">慢性疾病</td>
                                    <td style="vertical-align:middle;">
                                        <lb:select name="otherSlow" cssClass="form-control"
                                                   value="${elderlyMsg.otherSlow}">
                                            <lb:option value="">暂无数据</lb:option>
                                            <lb:option value="1">高血压</lb:option>
                                            <lb:option value="2">心脏病/冠心病</lb:option>
                                            <lb:option value="3">糖尿病</lb:option>
                                            <lb:option value="7">脑血管病（含中风）</lb:option>
                                            <lb:option value="6">肾脏疾病</lb:option>
                                            <lb:option value="4">肝脏疾病</lb:option>
                                            <lb:option value="5">结核病</lb:option>
                                            <lb:option value="8">类风湿</lb:option>
                                            <lb:option value="9">颈/腰椎病</lb:option>
                                            <lb:option value="10">关节炎</lb:option>
                                            <lb:option value="11">乳腺疾病</lb:option>
                                            <lb:option value="12">生殖系统疾病</lb:option>
                                            <lb:option value="13">前列腺疾病</lb:option>
                                            <lb:option value="14">泌尿系统疾病</lb:option>
                                            <lb:option value="15">青光眼/白内障</lb:option>
                                            <lb:option value="16">癌症/肿瘤</lb:option>
                                            <lb:option value="17">阿尔茨海默症</lb:option>
                                            <lb:option value="18">慢性支气管炎</lb:option>
                                            <lb:option value="19">骨质疏松</lb:option>
                                            <lb:option value="20">神经系统病</lb:option>
                                            <lb:option value="21">胃肠炎</lb:option>
                                            <lb:option value="22">其他消化系统病</lb:option>
                                            <lb:option value="23">帕金森氏症</lb:option>
                                            <lb:option value="24">耳聋</lb:option>
                                            <lb:option value="25">其他慢性病</lb:option>
                                        </lb:select>
                                    </td>
                                    <td style="vertical-align:middle;text-align: center;">肢体残疾</td>
                                    <td style="vertical-align:middle;">
                                        <lb:select name="bodyDictId" cssClass="form-control"
                                                   value="${elderlyMsg.bodyDictId}">
                                            <lb:option value="">暂无数据</lb:option>
                                            <lb:option value="352">一级</lb:option>
                                            <lb:option value="353">二级</lb:option>
                                            <lb:option value="354">三级</lb:option>
                                            <lb:option value="355">四级</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align:middle;text-align: center">智力残疾</td>
                                    <td style="vertical-align:middle;">
                                        <lb:select name="inteDisabled" cssClass="form-control"
                                                   value="${elderlyMsg.inteDisabled}">
                                            <lb:option value="">暂无数据</lb:option>
                                            <lb:option value="362">一级</lb:option>
                                            <lb:option value="363">二级</lb:option>
                                            <lb:option value="364">三级</lb:option>
                                            <lb:option value="365">四级</lb:option>
                                        </lb:select>
                                    </td>
                                    <td style="vertical-align:middle;text-align: center">听力残疾</td>
                                    <td style="vertical-align:middle;">
                                        <lb:select name="listenDictId" cssClass="form-control"
                                                   value="${elderlyMsg.listenDictId}">
                                            <lb:option value="">暂无数据</lb:option>
                                            <lb:option value="372">一级</lb:option>
                                            <lb:option value="373">二级</lb:option>
                                            <lb:option value="374">三级</lb:option>
                                            <lb:option value="375">四级</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align:middle;text-align: center">多重残疾</td>
                                    <td style="vertical-align:middle;">
                                        <lb:select name="manyDictId" cssClass="form-control"
                                                   value="${elderlyMsg.manyDictId}">
                                            <lb:option value="">暂无数据</lb:option>
                                            <lb:option value="382">一级</lb:option>
                                            <lb:option value="383">二级</lb:option>
                                            <lb:option value="384">三级</lb:option>
                                            <lb:option value="385">四级</lb:option>
                                        </lb:select>
                                    </td>
                                    <td style="vertical-align:middle;text-align: center">精神残疾</td>
                                    <td style="vertical-align:middle;">
                                        <lb:select name="spiritDictId" cssClass="form-control"
                                                   value="${elderlyMsg.spiritDictId}">
                                            <lb:option value="">暂无数据</lb:option>
                                            <lb:option value="357">一级</lb:option>
                                            <lb:option value="358">二级</lb:option>
                                            <lb:option value="359">三级</lb:option>
                                            <lb:option value="360">四级</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align:middle;text-align: center">言语残疾</td>
                                    <td style="vertical-align:middle;">
                                        <lb:select name="speakDictId" cssClass="form-control"
                                                   value="${elderlyMsg.speakDictId}">
                                            <lb:option value="">暂无数据</lb:option>
                                            <lb:option value="367">一级</lb:option>
                                            <lb:option value="368">二级</lb:option>
                                            <lb:option value="369">三级</lb:option>
                                            <lb:option value="370">四级</lb:option>
                                        </lb:select>
                                    </td>
                                    <td style="vertical-align:middle;text-align: center">视力残疾</td>
                                    <td style="vertical-align:middle;">
                                        <lb:select name="visionDictId" cssClass="form-control"
                                                   value="${elderlyMsg.visionDictId}">
                                            <lb:option value="">暂无数据</lb:option>
                                            <lb:option value="377">一级</lb:option>
                                            <lb:option value="378">二级</lb:option>
                                            <lb:option value="379">三级</lb:option>
                                            <lb:option value="380">四级</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="vertical-align:middle;text-align: center">特殊对象</td>
                                    <td colspan="2" style="vertical-align:middle;">
                                        <lb:select name="specialDictIds" cssClass="form-control"
                                                   value="${elderlyMsg.specialDictIds}">
                                            <lb:option value="">暂无数据</lb:option>
                                            <lb:option value="522">颈椎病</lb:option>
                                            <lb:option value="523">腰椎病</lb:option>
                                            <lb:option value="524">双膝关节退变</lb:option>
                                            <lb:option value="525">关节置换术后</lb:option>
                                            <lb:option value="526">关节炎</lb:option>
                                            <lb:option value="527">骨折后</lb:option>
                                        </lb:select>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane fade  in" id="tab_1_3">
                            <div id="locateInfo" style="height: 383px;width: 100%">
                            </div>
                        </div>
                        <div class="tab-pane fade  in" id="tab_1_4">
                            <img src="${pageContext.request.contextPath }/assets/global/img/dianziweilan.png"
                                 style="height: 383px;width: 100%" alt=""/></td>
                        </div>
                        <div class="tab-pane fade  in" id="tab_1_5">
                            <div class="about4_main">
                                <ul style="text-align: left">
                                    <li>6：00 ：帮助老人起床，洗漱</li>
                                    <li>6：30 ：帮助老人晨练</li>
                                    <li>7：30 ：帮助老人吃早饭</li>
                                    <li>8：00 - 11：00 ：随意活动</li>
                                    <li>11：30 ：帮助老人吃中饭</li>
                                    <li>12：00 - 1：00 ：午休</li>
                                    <li>1：30 - 5：00 ：随意活动</li>
                                    <li>6：30 ：帮助老人吃完饭</li>
                                    <li>7：30 ：卧床休息</li>
                                </ul>
                            </div>
                        </div>
                        <div class="tab-pane fade  in" id="tab_1_6"  style="height: 383px;text-align: left;padding: 20px">
                                该老人是失能老人，需要家务料理 ，以及康复保健的服务需求，患有慢性病，高血压、糖尿病、冠心病，多多注意老人的血压情况。
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
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/task/task_send.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js?v=1"></script>
        <script type="text/javascript"
                src="http://api.map.baidu.com/api?v=2.0&ak=UtTMI5ofPulxrOYjzLcEWHGXRlyAEfUB"></script>

        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                $(".alert_head_wrap a").click(function () {
                    $(this).parentsUntil('.alert_wrap').hide();
                });
                var initFlag = false;
                var grid = null;
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: 'yyyy-mm-dd'
                });
                $('.timepicker-24').timepicker({
                    autoclose: true,
                    minuteStep: 5,
                    showSeconds: false,
                    showMeridian: false
                });
                $('.timepicker').parent('.input-group').on('click', '.input-group-btn', function (e) {
                    e.preventDefault();
                    $(this).parent('.input-group').find('.timepicker').timepicker('showWidget');
                });
                var queueName = "${callInfo.queueName}";
                if (queueName == "200") {
                    $("input[name=queueName]").val("12349热线");
                }
                else if (queueName == "201") {
                    $("input[name=queueName]").val("综合服务");
                }
                else if (queueName == "202") {
                    $("input[name=queueName]").val("紧急呼叫");
                }
                else if (queueName == "out") {
                    $("input[name=queueName]").val("回拨");
                }

                var customer = "${customer.elderName}";
                if (customer.length > 0) {
                    $("#fixed").show();
                }

                $("#requestType").change(function () {
                    var id = $("#requestType option:selected").val();
                    initRequestDiv();
                    if (parseInt(id) > 0) {
                        $("#requestTypeDiv" + id).css("display", "block");
                        if (id == 3) {
                            $('#request3').select2({
                                placeholder: "选择需求类型",
                                allowClear: true
                            });
                        }
                    }
                })
                //
                //提交处理情况
                $("#btnPublish").click(function () {
                    var content = $("#content").val();
                    var request = $("#requestType").val();
                    var requestName = "";
                    $("#request" + request + " option:selected").each(function () {
                        if ($(this).attr("selected") == "selected") {
                            requestName += $(this).html() + ",";
                        }
                    });
                    if (requestName.length > 1) {
                        requestName = requestName.substr(0, requestName.length - 1);
                    }
                    $.post(window.apppath + "/admin/call/api/callInfo/addHandle", {
                        id: $("input[name=callInfoId]").val(),
                        handleContent: content,
                        visitResult: $("#visitResult").val(),
                        returnVisit: $("#returnVisit").val(),
                        request: request,
                        requestName: requestName
                    }, function (res) {
                        $("#btnPublish").button('reset');
                        if (res.success) {
                            $("#labelmsg").text(res.message).addClass("label-success");
                            window.parent.changeData("nowCallInfo", window.apppath + "/admin/call/nowCallInfo");
                            //更新列表
                            window.parent.updateTab("call_list");
                            setTimeout(function () {
                                window.parent.closeTab("nowCallInfo");
                            }, 1000);
                        } else {
                            $("#labelmsg").text(res.message).addClass("label-danger");
                        }
                    }, "json");
                })

                //评价
                $("#transfer").click(function () {
                    var extension = window.parent.getExtension();
                    var id = "${callInfo.id}";
                    var _this = this;
                    $.post(window.apppath + "/admin/call/api/callInfo/transfer2score", {
                        extension: extension
                    }, function (res) {
                        if (res.success) {
                            $(_this).hide();
                        }
                        else {
                            alert("对方已挂断");
                            $(_this).hide();
                        }
                    }, "json");
                });

                //驻留
                $("#hold").click(function () {
                    var extension = window.parent.getExtension();
                    var _this = this;
                    $.post(window.apppath + "/admin/call/api/callInfo/hold", {
                        extension: extension
                    }, function (res) {
                        if (res.success) {
                            $(_this).hide();
                            $("#resume").show();
                        }
                        else {
                            alert("对方已挂断");
                            $(_this).hide();
                        }
                    }, "json");
                });


                //转接
                $("#transferOther").click(function () {
                    if (initFlag) {
                        grid.getDataTable().ajax.reload();
                    }
                    else
                        tableInit();
                    $("#otherMonitors").modal("show");
                });

                //需求调度
                $("#sendTask").click(function () {
                    $("#sendTaskForm").show();
                    $("body").animate({scrollTop: '500px'}, 200);
                    TaskSend.init();
                    EographicArea.initWith("${sessionScope.login_user.areaName}");
                    EographicArea.changeProvince();
                });

                //取消调度
                $("#cancel").click(function () {
                    $("#sendTaskForm").hide();
                    $("body").animate({scrollTop: '0px'}, 200);
                });

                $("#closeFixed").click(function () {
                    $("#fixed").fadeOut();
                })

                function tableInit() {
                    grid = new Datatable();
                    grid.init({
                        src: $("#datatable_monitor_status"),
                        onSuccess: function (grid, res) {
                        },
                        onError: function (grid) {
                            // execute some code on network or other general error
                        },
                        loadingMessage: '加载中...',
                        dataTable: {
                            "ajax": function (params, callback, obj) {
                                $.post(window.apppath + "/admin/call/api/monitor/status", {
                                    length: params.length,
                                    start: params.start,
                                    isShow: "0",
                                    type: "0"
                                }, function (res) {
                                    initFlag = true;
                                    if (res) {
                                        callback(res);
                                    } else {
                                        callback({
                                            data: null,
                                            recordsFiltered: 0
                                        });
                                    }
                                }, 'json');
                            },
                            "sDom": "<'row'<'col-md-4 col-sm-12'<'table-group-actions'> ><'col-md-8 col-sm-12'>r><'table-scrollable't><'row'<'col-md-8 col-sm-12'p><'col-md-4 col-sm-12' <'table-group-actions-check pull-right'>>>", // datatable layout
                            "searching": false,
                            "ordering": false,
                            // deferLoading: 0,
                            "columns": [
                                {
                                    "data": "id", render: function (data, type, row, meta) {
                                    return data;
                                }
                                },
                                {
                                    "data": "extension"
                                },
                                {
                                    "data": "account"
                                },
                                {
                                    "data": "name"
                                },
                                {
                                    "data": "status", render: function (data, type, row, meta) {
                                    var names = [
                                        '<span style="color: blue">就绪</span>',
                                        '<span style="color: red">通话中</span>',
                                        '振铃',
                                        '整理',
                                        '私事暂休',
                                        '离席',
                                        '外拨工作',
                                        '代接电话',
                                        '振铃超时',
                                        '暂休超时']
                                    if (data == -1)
                                        return "未登录";
                                    else
                                        return names[data];
                                }
                                },
                                {
                                    "data": "id", render: function (data, type, row, meta) {
                                    var columnHtml = '';
                                    if (row.status == 0 && row.account != "${sessionScope.login_user.login_name}") {
                                        //通话中
                                        columnHtml += '<button  data-extension="' + row.extension + '" data-account="' + row.account + '"  class="btn default btn-xs green-stripe  transferCall">转接</button>';
                                    }
                                    return columnHtml;
                                }
                                }
                            ]
                        }
                    });
                    grid.getTable().on("click", "button.transferCall", function (e) {
                        var extension = window.parent.getExtension();
                        var external = "${callInfo.callerId}";
                        var dest = $(this).data("extension");
                        var account = $(this).data("account");
                        if (external != "") {
                            $.post(window.apppath + "/admin/call/api/callInfo/transferCall", {
                                external: external,
                                extension: extension,
                                dest: dest,
                            }, function (res) {
                                if (res.success) {
                                    alert("转接成功");
                                    $("#content").val($("#content").val() + "/n" + "已转接给坐席" + account);
                                }
                                else {
                                    alert("转接失败");
                                }
                                $("#otherMonitors").modal("hide");
                            }, "json");
                        }
                    })


                }

                function initRequestDiv() {
                    $("#requestTypeDiv1").css("display", "none");
                    $("#requestTypeDiv2").css("display", "none");
                    $("#requestTypeDiv3").css("display", "none");
                    $("#requestTypeDiv4").css("display", "none");
                }
            });
            
            function mapInit() {
                //定位信息
                var map = new BMap.Map("locateInfo", {enableMapClick: false});    // 创建Map实例
                map.centerAndZoom(new BMap.Point(101.777547,36.628714), 15);  // 初始化地图,设置中心点坐标和地图级别
                map.setCurrentCity("西宁");
                map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
                var marker = new BMap.Marker(new BMap.Point(101.777547,36.628714));  // 创建标注
                map.addOverlay(marker);

            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

