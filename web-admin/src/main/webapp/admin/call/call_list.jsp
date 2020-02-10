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
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>历史服务详情</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link href="${pageContext.request.contextPath}/assets/admin/pages/css/todo.css" rel="stylesheet"
              type="text/css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>

        <style>
            .handleTitle {
                margin: -8px -8px 8px;
                padding: 5px;
                height: 40px;
                line-height: 29px;
                background: #fdfae8;
            }
            .callBackA
            {
                text-decoration: none;
            }
            .modal-title
            {
                margin-right: 25px;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">
        <shiro:hasRole name="monitoradmin">
            <input type="hidden" id="updateHandlePression" value="1">
        </shiro:hasRole>
        <div class="page-bar" style="margin-bottom: 0px">
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
                    <a href="#">历史服务详情</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet">
                    <div class="portlet" id="newSearch">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-equalizer font-purple-plum hide"></i>
                                <span class="caption-subject font-red-sunglo bold uppercase">记录查询</span>
                            </div>
                            <div class="tools">
                                <a  id="show" style="vertical-align: sub;width: 88px;">
                                   <img  style="width: 100% "src="${pageContext.request.contextPath}/assets/global/img/portlet-collapse-icon.png">
                                </a>
                            </div>
                        </div>
                        <div id="searchDiv" class="portlet-body form" style="display: none">
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td width="13%" style="text-align:center;vertical-align:middle;">呼叫号码：</td>
                                    <td width="20%" style="text-align:center;vertical-align:middle;">
                                        <input name="callerId" class="form-control"
                                               type="text"/>
                                    </td>
                                    <td width="13%" style="text-align:center;vertical-align:middle;">
                                        客户名称:
                                    </td>
                                    <td width="20%" style="text-align:center;vertical-align:middle;">
                                        <input name="callerName" class="form-control"/>
                                    </td>
                                    <td width="14%" style="text-align:center;vertical-align:middle;">
                                        身份证：
                                    </td>
                                    <td width="20%" style="text-align:center;vertical-align:middle;">
                                        <input name="callerCardId" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="13%" style="text-align:center;vertical-align:middle;">
                                        客户群组：
                                    </td>
                                    <td width="20%" style="text-align:center;vertical-align:middle;"
                                        >
                                        <select id="customerGroup" class="form-control">

                                        </select>
                                    </td>
                                    <td width="13%" style="text-align:center;vertical-align:middle;">
                                        呼叫类型：
                                    </td>
                                    <td width="20%" style="text-align:center;vertical-align:middle;"
                                        >
                                        <select id="queueName" class="form-control">
                                            <option value="">--请选择--</option>
                                            <option value="200">88012349热线</option>
                                            <option value="201">综合服务</option>
                                            <option value="202">紧急呼叫</option>
                                        </select>
                                    </td>
                                    <td width="13%" style="text-align:center;vertical-align:middle;">
                                        电话类型：
                                    </td>
                                    <td width="20%" style="text-align:center;vertical-align:middle;"
                                        >
                                        <select id="type" class="form-control">
                                            <option value="">--请选择--</option>
                                            <option value="1">接入</option>
                                            <option value="2">呼出</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="text-align:center;vertical-align:middle;">
                                        是否需要回拨：
                                    </td>
                                    <td colspan="3" style="text-align:center;vertical-align:middle;"
                                    >
                                        <select id="returnVisit" class="form-control">
                                            <option value="">--请选择--</option>
                                            <option value="0">不需要</option>
                                            <option value="1">需要</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <span class="caption-helper">按呼叫处理查询</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="13%" style="text-align:center;vertical-align:middle;">工单编号：</td>
                                    <td width="20%" style="text-align:center;vertical-align:middle;">
                                        <input name="id" class="form-control"
                                               type="text"/>
                                    </td>
                                    <td width="13%" style="text-align:center;vertical-align:middle;">
                                        座席工号:
                                    </td>
                                    <td width="20%" style="text-align:center;vertical-align:middle;">
                                        <input name="monitorName" class="form-control"/>
                                    </td>
                                    <td width="13%" style="text-align:center;vertical-align:middle;">
                                        处理包含：
                                    </td>
                                    <td width="20%" style="text-align:center;vertical-align:middle;">
                                        <input name="content" class="form-control"/>
                                    </td>
                                </tr>
                                <%--<tr>--%>
                                    <%--<td colspan="6">--%>
                                        <%--<span class="caption-helper">按地域范围查询</span>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                                <%--<tr>--%>
                                    <%--<td width="13%" style="text-align:center;vertical-align:middle;">省份：</td>--%>
                                    <%--<td width="20%" style="text-align:center;vertical-align:middle;">--%>
                                        <%--<select id="province" class="form-control"--%>
                                                <%--onChange="EographicArea.changeProvince();">--%>
                                            <%--<option value="">省，自治区</option>--%>
                                            <%--<option value="0">江苏省</option>--%>
                                        <%--</select>--%>
                                    <%--</td>--%>
                                    <%--<td width="13%" style="text-align:center;vertical-align:middle;">--%>
                                        <%--城市:--%>
                                    <%--</td>--%>
                                    <%--<td width="20%" style="text-align:center;vertical-align:middle;">--%>
                                        <%--<select name="city" class="form-control" id="city"--%>
                                                <%--onChange="EographicArea.changeCity();"--%>
                                                <%--readonly="readonly">--%>
                                            <%--<option value="">直辖市，地级市</option>--%>
                                        <%--</select>--%>
                                    <%--</td>--%>
                                    <%--<td width="13%" style="text-align:center;vertical-align:middle;">--%>
                                        <%--行政区：--%>
                                    <%--</td>--%>
                                    <%--<td width="20%" style="text-align:center;vertical-align:middle;">--%>
                                        <%--<select name="area" class="form-control" id="county"--%>
                                                <%--onChange="EographicArea.changeCounty();"--%>
                                                <%--readonly="readonly">--%>
                                            <%--<option value="">行政区，市，县</option>--%>
                                        <%--</select>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                                <%--<tr>--%>
                                    <%--<td width="13%" style="text-align:center;vertical-align:middle;">街道：</td>--%>
                                    <%--<td width="20%" style="text-align:center;vertical-align:middle;">--%>
                                        <%--<select name="street" class="form-control" id="town"--%>
                                                <%--onChange="EographicArea.changeTown();"--%>
                                                <%--readonly="readonly">--%>
                                            <%--<option value="">街道，乡，镇</option>--%>
                                        <%--</select>--%>
                                    <%--</td>--%>
                                    <%--<td width="13%" style="text-align:center;vertical-align:middle;">--%>
                                        <%--社区:--%>
                                    <%--</td>--%>
                                    <%--<td width="20%" style="text-align:center;vertical-align:middle;">--%>
                                        <%--<select name="community" class="form-control" id="village"--%>
                                                <%--readonly="readonly">--%>
                                            <%--<option value="">社区，村</option>--%>
                                        <%--</select>--%>
                                    <%--</td>--%>
                                    <%--<td width="13%" style="text-align:center;vertical-align:middle; "--%>
                                        <%--colspan="2">--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                                <tr>
                                    <td colspan="6">
                                        <span class="caption-helper">按呼叫时间查询</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="13%" style="text-align:center;vertical-align:middle;">起始时间：</td>
                                    <td width="20%" style="text-align:center;vertical-align:middle;"
                                        colspan="2">
                                        <div class="input-group">
                                            <input name="startDate" class="form-control date-picker"
                                                   style="float: left;width: 65%; margin-right: 5px" type="text"
                                                   value=""/>
                                            <input name="startTime" type="text"
                                                   class="form-control timepicker timepicker-24 timepicker-no-seconds"
                                                   style="width: 30%;float: right;">
                                            <span class="input-group-btn">
                                            <button class="btn default" type="button"><i
                                                    class="fa fa-clock-o"></i></button>
                                            </span>
                                        </div>
                                    </td>
                                    <td width="13%" style="text-align:center;vertical-align:middle;">
                                        结束时间:
                                    </td>
                                    <td width="20%" style="text-align:center;vertical-align:middle;"
                                        colspan="2">
                                        <div class="input-group">
                                            <input name="endDate" class="form-control date-picker"
                                                   style="float: left;width: 65%; margin-right: 5px" type="text"
                                                   value=""/>
                                            <input name="endTime" type="text"
                                                   class="form-control timepicker timepicker-24  timepicker-no-seconds"
                                                   style="width: 30%;float: right;">
                                            <span class="input-group-btn">
                                            <button class="btn default" type="button"><i
                                                    class="fa fa-clock-o"></i></button>
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <div style="text-align: right">
                                <a id="search" class="btn btn-circle  green">
                                    查询 </i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div id="rowContent" >
                    </div>
                    <div style="text-align: right">
                        <div id="allCount" style="float: left;margin-top: 10px; font-size: 15px">一共0条数据</div>
                        <ul class="pagination" id="pagination" style="vertical-align: top;"></ul>
                        <div class="pagination-panel"> 页数 <input type="text" id="page"
                                                                 class="pagination-panel-input form-control input-mini input-inline input-sm"
                                                                 maxlenght="5"
                                                                 style="text-align:center; margin: 0 5px;">
                            <button
                                    href="" id="goPage" class="btn btn-sm default "
                                    onclick="CallInfoList.goToPage()"
                                    title="GO">GO
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 弹出框 -->
        <div id="addMoreHandle" class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" style="margin-top:150px; width: 800px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title">
                            追加处理
                            <label style="float: right;">服务编号：No.<span class="noSpan"></span></label>
                        </h4>
                    </div>
                    <div class="modal-body form-horizontal from">
                        <div class="form-body">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="hidden" id="callInfoId">
                                    <textarea name="content" type="text"
                                              class="form-control " rows="5" placeholder="请填写要追加的跟踪处理的内容..."
                                    ></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-circle blue add">确定保存</button>
                        <button type="button" class="btn btn-circle btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.弹出框 -->
        </div>
        <!-- 弹出框 -->
        <div id="updateRequestModal" class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" style="margin-top:150px; width: 800px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title">
                            更新需求类型
                            <label style="float: right;">服务编号：No.<span class="noSpan"></span></label>
                        </h4>
                    </div>
                    <div class="modal-body form-horizontal from">
                        <div class="form-body">
                            <input type="hidden" name="callInfoId">
                            <div class="form-group">
                                <label class="col-md-2 control-label">服务类型
                                </label>
                                <div class="col-md-4">
                                    <select id="requestType" class="form-control">
                                        <option value="0">--请选择--</option>
                                        <option value="1">紧急救援</option>
                                        <option value="2">咨询服务</option>
                                        <option value="3">服务转介</option>
                                        <option value="4">投诉监管</option>
                                    </select>
                                </div>
                            </div>
                            <div id="requestTypeDiv1"  class="form-group" style="display: none">
                                <label class="col-md-2 control-label">服务内容
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
                            <div id="requestTypeDiv2"  class="form-group" style="display: none">
                                <label class="col-md-2 control-label">咨询服务
                                </label>
                                <div class="col-md-4">
                                    <select id="request2" class="form-control">
                                        <option value="1">政策法规咨询</option>
                                        <option value="2">十助服务咨询</option>
                                        <option value="3">心理咨询</option>
                                        <option value="4">生活咨询</option>
                                    </select>
                                </div>
                            </div>
                            <div id="requestTypeDiv4"  class="form-group" style="display: none">
                                <label class="col-md-2 control-label">投诉监管
                                </label>
                                <div class="col-md-4">
                                    <select id="request4" class="form-control">
                                        <option value="1">受理反馈投诉</option>
                                        <option value="2">定期电话抽查</option>
                                        <option value="3">逐一服务回访</option>
                                    </select>
                                </div>
                            </div>
                            <div id="requestTypeDiv3" class="form-group" style="display: none">
                                <label class="col-md-2 control-label">服务内容
                                </label>
                                <div class="col-md-4">
                                    <select id="request3" class="form-control select2" multiple>
                                        <optgroup label="助餐">
                                            <option value="11">上门送餐</option>
                                            <option  value="12">送餐</option>
                                            <option  value="13">其他</option>
                                        </optgroup>
                                        <optgroup label="助医">
                                            <option value="21">陪看病，去医院取药</option>
                                            <option  value="22">医护服务：上门鼻饲，更换导尿管</option>
                                            <option  value="23">康复：运动治疗，言语治疗</option>
                                            <option  value="24">其他</option>
                                        </optgroup>
                                        <optgroup label="助购">
                                            <option value="31">代购物品</option>
                                            <option  value="32">代购药品</option>
                                            <option  value="33">其他</option>
                                        </optgroup>
                                        <optgroup label="助浴">
                                            <option value="41">上门洗浴（半失能老人）</option>
                                            <option value="42">上门洗浴（失能老人）</option>
                                            <option  value="43">陪同前往浴室洗浴（自理老人）</option>
                                            <option  value="44">点上洗澡</option>
                                            <option  value="45">上门洗澡</option>
                                            <option  value="46">其他</option>
                                        </optgroup>
                                        <optgroup label="助急">
                                            <option value="51">110</option>
                                            <option value="52">120</option>
                                            <option  value="53">其他</option>
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
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-circle blue update">确定保存</button>
                        <button type="button" class="btn btn-circle btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.弹出框 -->
        </div>
        <div id="confirm" class="js-alt">
            <div>
                <img src="${pageContext.request.contextPath }/assets/admin/pages/img/info.png" alt=""/>
                <input type="hidden" name="callerId">
                <input type="hidden" name="linkedId">
                <p>
                    确认回拨号码：<span class="callNum"></span>吗？
                </p>
                <a class="btn callback sure">确定</a>
                <a class="btn cancel ">取消</a>
            </div>
        </div>
        <div id="endCallModal" class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">确认框</h4>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="infoId">
                        <p>
                            该工单确认结束？
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button class="btn default" data-dismiss="modal" aria-hidden="true">取消</button>
                        <button data-dismiss="modal" class="btn blue btnEndCall">确定</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="deleteCallModal" class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">确认框</h4>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="infoId">
                        <p>
                            该工单确认删除？
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button class="btn default" data-dismiss="modal" aria-hidden="true">取消</button>
                        <button data-dismiss="modal" class="btn blue btnDeleteCall">确定</button>
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
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/call/callInfo_list.js?v=2.9"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/raty/lib/jquery.raty.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/jqPaginator.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js?v=1"></script>

        <%--jquery.raty.js--%>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: 'yyyy-mm-dd',
                });

                $('#request3').select2({
                    placeholder: "选择需求类型",
                    allowClear: true
                });

                $('.timepicker').click(function () {
                    $(this).timepicker({
                        minuteStep: 5,
                        showSeconds: true,
                        showMeridian: false
                    });
                })
                $('.timepicker').parent('.input-group').on('click', '.input-group-btn', function (e) {
                    e.preventDefault();
                    $(this).parent('.input-group').find('.timepicker').timepicker({
                        minuteStep: 5,
                        showSeconds: false,
                        showMeridian: false
                    });
                });

                $.post(window.apppath + "/admin/call/api/customer/group/list", {}, function (res) {
                    if (res.data != null) {
                        var data = res.data;
                        var optionHtml = '<option value="">--请选择--</option>';
                        for (var i in data) {
                            optionHtml += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
                        }
                        $("#customerGroup").html(optionHtml);
                    }
                }, "json");

                $("#show").click(function () {
                    if($("#searchDiv").css("display")=="none")
                    {
                        $("#searchDiv").show();
                    }
                    else
                        $("#searchDiv").hide();
                    
                })

                EographicArea.init();
                CallInfoList.setAreaName("${sessionScope.login_user.areaName}");
                CallInfoList.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

