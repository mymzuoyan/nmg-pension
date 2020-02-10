<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
    <title>老人能力评估</title>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>老人能力评估</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
    <!-- The styles -->
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" Stype="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
    <!-- The fav icon -->
    <style type="text/css">

        td.selected{
            background-color:#f6d48a;
        }

        .enlarge:hover{
            font-size: 22px;
            color: #2F84C8;
        }
    </style>
        <style>
        label{
        font-weight: normal;
        }
        </style>

    </tiles:putAttribute>

    <tiles:putAttribute name="page_content">
        <div class="col-md-12">
            <!-- Begin: life time stats -->
            <div class="portlet " style="padding-top: 0px !important;">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-equalizer font-purple-plum hide"></i>
                        <span class="caption-subject font-red-sunglo bold uppercase">老人能力评估分值配置</span>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="tabbable-line">
                        <form id="servicePowerAddForm">
                            <table border="1"
                                   class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                   align="center" style="border-collapse: collapse;">
                                <input name="id" value="${m.id}" class="form-control input-sm"  type="hidden">
                                <tr>
                                    <td colspan="12">一、日常生活活动</td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">项目</td><td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">正常</td><td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">轻丧失</td><td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">中丧失</td><td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">完全丧失</td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        吃饭(能完成入口、咀嚼、吞咽等步骤)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="cfNormal" value="${m.cfNormal}" class="form-control input-sm" placeholder="吃饭得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="cfLightloss" value="${m.cfLightloss}" class="form-control input-sm" placeholder="吃饭得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="cfMiddleloss" value="${m.cfMiddleloss}" class="form-control input-sm" placeholder="吃饭得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="cfCompletelyloss" value="${m.cfCompletelyloss}" class="form-control input-sm" placeholder="吃饭得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        穿衣(完成取衣、穿衣、系带、扣扣子等) <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="cyNormal" value="${m.cyNormal}" class="form-control input-sm" placeholder="穿衣得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="cyLightloss" value="${m.cyLightloss}" class="form-control input-sm" placeholder="穿衣得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="cyMiddleloss" value="${m.cyMiddleloss}" class="form-control input-sm" placeholder="穿衣得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="cyCompletelyloss" value="${m.cyCompletelyloss}" class="form-control input-sm" placeholder="穿衣得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        如厕(如厕、便后能自理及整理衣裤)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="rcNormal" value="${m.rcNormal}" class="form-control input-sm" placeholder="如厕得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="rcLightloss" value="${m.rcLightloss}" class="form-control input-sm" placeholder="如厕得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="rcMiddleloss" value="${m.rcMiddleloss}" class="form-control input-sm" placeholder="如厕得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="rcCompletelyloss" value="${m.rcCompletelyloss}" class="form-control input-sm" placeholder="如厕得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        室内走动(外出、上下楼正常)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="snzdNormal" value="${m.snzdNormal}" class="form-control input-sm" placeholder="室内走动得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="snzdLightloss" value="${m.snzdLightloss}" class="form-control input-sm" placeholder="室内走动得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="snzdMiddleloss" value="${m.snzdMiddleloss}" class="form-control input-sm" placeholder="室内走动得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="snzdCompletelyloss" value="${m.snzdCompletelyloss}" class="form-control input-sm" placeholder="室内走动得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        洗澡(能完成洗澡的全部过程)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="xzNormal" value="${m.xzNormal}" class="form-control input-sm" placeholder="洗澡得分" type="number">
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="xzLightloss" value="${m.xzLightloss}" class="form-control input-sm" placeholder="洗澡得分" type="number">
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="xzMiddleloss" value="${m.xzMiddleloss}" class="form-control input-sm" placeholder="洗澡得分" type="number">
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="xzCompletelyloss" value="${m.xzCompletelyloss}" class="form-control input-sm" placeholder="洗澡得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        控制大小便(能控制大小便)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="dxbNormal" value="${m.dxbNormal}" class="form-control input-sm" placeholder="控制大小便得分" type="number">
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="dxbLightloss" value="${m.dxbLightloss}" class="form-control input-sm" placeholder="控制大小便得分" type="number">
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="dxbMiddleloss" value="${m.dxbMiddleloss}" class="form-control input-sm" placeholder="控制大小便得分" type="number">
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="dxbCompletelyloss" value="${m.dxbCompletelyloss}" class="form-control input-sm" placeholder="控制大小便得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="12">二、认知能力</td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">项目</td><td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">正常</td><td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">轻丧失</td><td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">中丧失</td><td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">完全丧失</td>
                                </tr>
                                <tr>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        近期记忆(能回想近期发生的事情)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="jqjyNormal" value="${m.jqjyNormal}" class="form-control input-sm" placeholder="近期记忆得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="jqjyLightloss" value="${m.jqjyLightloss}" class="form-control input-sm" placeholder="近期记忆得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="jqjyMiddleloss" value="${m.jqjyMiddleloss}" class="form-control input-sm" placeholder="近期记忆得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="jqjyCompletelyloss" value="${m.jqjyCompletelyloss}" class="form-control input-sm" placeholder="近期记忆得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        程序记忆(完成洗衣、做饭、做菜等)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="cxjyNormal" value="${m.cxjyNormal}" class="form-control input-sm" placeholder="程序记忆得分" type="number">
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="cxjyLightloss" value="${m.cxjyLightloss}" class="form-control input-sm" placeholder="程序记忆得分" type="number">
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="cxjyMiddleloss" value="${m.cxjyMiddleloss}" class="form-control input-sm" placeholder="程序记忆得分" type="number">
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="cxjyCompletelyloss" value="${m.cxjyCompletelyloss}" class="form-control input-sm" placeholder="程序记忆得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        定向记忆(外出、回家不迷路)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="dxjyNormal" value="${m.dxjyNormal}" class="form-control input-sm" placeholder="定向记忆得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="dxjyLightloss" value="${m.dxjyLightloss}" class="form-control input-sm" placeholder="定向记忆得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="dxjyMiddleloss" value="${m.dxjyMiddleloss}" class="form-control input-sm" placeholder="定向记忆得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="dxjyCompletelyloss" value="${m.dxjyCompletelyloss}" class="form-control input-sm" placeholder="定向记忆得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        判断能力(对日常事物的判断不违背常理)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="pdnlNormal" value="${m.pdnlNormal}" class="form-control input-sm" placeholder="判断能力得分" type="number">
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="pdnlLightloss" value="${m.pdnlLightloss}" class="form-control input-sm" placeholder="判断能力得分" type="number">
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="pdnlMiddleloss" value="${m.pdnlMiddleloss}" class="form-control input-sm" placeholder="判断能力得分" type="number">
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="pdnlCompletelyloss" value="${m.pdnlCompletelyloss}" class="form-control input-sm" placeholder="判断能力得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="12">三、情绪行为</td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">项目</td><td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">正常</td><td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">轻丧失</td><td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">中丧失</td><td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">完全丧失</td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:23%;">
                                        情绪(与人和睦相处，不偏激) <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:9%;">
                                        <input name="qxNormal" value="${m.qxNormal}" class="form-control input-sm" placeholder="情绪得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:9%;">
                                        <input name="qxLightloss" value="${m.qxLightloss}" class="form-control input-sm" placeholder="情绪得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:9%;">
                                        <input name="qxMiddleloss" value="${m.qxMiddleloss}" class="form-control input-sm" placeholder="情绪得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:9%;">
                                        <input name="qxCompletelyloss" value="${m.qxCompletelyloss}" class="form-control input-sm" placeholder="情绪得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:23%;">
                                        行为(动作行为表现是否异常) <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:9%;">
                                        <input name="xwNormal" value="${m.xwNormal}" class="form-control input-sm" placeholder="行为得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:9%;">
                                        <input name="xwLightloss" value="${m.xwLightloss}" class="form-control input-sm" placeholder="行为得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:9%;">
                                        <input name="xwMiddleloss" value="${m.xwMiddleloss}" class="form-control input-sm" placeholder="行为得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:9%;">
                                        <input name="xwCompletelyloss" value="${m.xwCompletelyloss}" class="form-control input-sm" placeholder="行为得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:17%;">
                             n           沟通(在交流中能否互相理解)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:16%;">
                                        <input name="gtNormal" value="${m.gtNormal}" class="form-control input-sm" placeholder="沟通得分" type="number">
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:16%;">
                                        <input name="gtLightloss" value="${m.gtLightloss}" class="form-control input-sm" placeholder="沟通得分" type="number">
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:16%;">
                                        <input name="gtMiddleloss" value="${m.gtMiddleloss}" class="form-control input-sm" placeholder="沟通得分" type="number">
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:16%;">
                                        <input name="gtCompletelyloss" value="${m.gtCompletelyloss}" class="form-control input-sm" placeholder="沟通得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="12">四、视、听觉</td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">项目</td><td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">正常</td><td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">轻丧失</td><td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">中丧失</td><td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">完全丧失</td>
                                </tr>
                                <tr>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        视觉(能正常看电视、读报等)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="sjNormal" value="${m.sjNormal}" class="form-control input-sm" placeholder="视觉得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="sjLightloss" value="${m.sjLightloss}" class="form-control input-sm" placeholder="视觉得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="sjMiddleloss" value="${m.sjMiddleloss}" class="form-control input-sm" placeholder="视觉得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="sjCompletelyloss" value="${m.sjCompletelyloss}" class="form-control input-sm" placeholder="视觉得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        听觉(能正常接听电话、交谈)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="tjNormal" value="${m.tjNormal}" class="form-control input-sm" placeholder="听觉得分" type="number">
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="tjLightloss" value="${m.tjLightloss}" class="form-control input-sm" placeholder="听觉得分" type="number">
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="tjMiddleloss" value="${m.tjMiddleloss}" class="form-control input-sm" placeholder="听觉得分" type="number">
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="tjCompletelyloss" value="${m.tjCompletelyloss}" class="form-control input-sm" placeholder="听觉得分" type="number">
                                    </td>
                                </tr>
                            </table>
                            <div class="form-actions">
                                <div class="col-md-12">
                                    <div class="col-md-offset-4" style="margin-left: 48%;">
                                        <button data-loading-text="提交中..."
                                                type="button" class="btn btn-circle green"
                                                onclick="save()">
                                            保存
                                        </button>
                                        <span id="labelmsg" class="label"></span>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"></script>
        <script>
            jQuery(document).ready(function () {
                window.apppath = "${pageContext.request.contextPath }";
                Metronic.init();
                Layout.init();
            });
            function save()
            {
                $.post(window.apppath + "/admin/power/ability/create", {
                    id:$.trim($("input[name=id]").val()),
                    cfNormal: $.trim($("input[name=cfNormal]").val()),
                    cfLightloss: $.trim($("input[name=cfLightloss]").val()),
                    cfMiddleloss: $.trim($("input[name=cfMiddleloss]").val()),
                    cfCompletelyloss: $.trim($("input[name=cfCompletelyloss]").val()),
                    cyNormal: $.trim($("input[name=cyNormal]").val()),
                    cyLightloss: $.trim($("input[name=cyLightloss]").val()),
                    cyMiddleloss: $.trim($("input[name=cyMiddleloss]").val()),
                    cyCompletelyloss: $.trim($("input[name=cyCompletelyloss]").val()),
                    rcNormal: $.trim($("input[name=rcNormal]").val()),
                    rcLightloss: $.trim($("input[name=rcLightloss]").val()),
                    rcMiddleloss: $.trim($("input[name=rcMiddleloss]").val()),
                    rcCompletelyloss: $.trim($("input[name=rcCompletelyloss]").val()),
                    snzdNormal: $.trim($("input[name=snzdNormal]").val()),
                    snzdLightloss: $.trim($("input[name=snzdLightloss]").val()),
                    snzdMiddleloss: $.trim($("input[name=snzdMiddleloss]").val()),
                    snzdCompletelyloss: $.trim($("input[name=snzdCompletelyloss]").val()),
                    xzNormal: $.trim($("input[name=xzNormal]").val()),
                    xzLightloss: $.trim($("input[name=xzLightloss]").val()),
                    xzMiddleloss: $.trim($("input[name=xzMiddleloss]").val()),
                    xzCompletelyloss: $.trim($("input[name=xzCompletelyloss]").val()),
                    dxbNormal: $.trim($("input[name=dxbNormal]").val()),
                    dxbLightloss: $.trim($("input[name=dxbLightloss]").val()),
                    dxbMiddleloss: $.trim($("input[name=dxbMiddleloss]").val()),
                    dxbCompletelyloss: $.trim($("input[name=dxbCompletelyloss]").val()),
                    jqjyNormal: $.trim($("input[name=jqjyNormal]").val()),
                    jqjyLightloss: $.trim($("input[name=jqjyLightloss]").val()),
                    jqjyMiddleloss: $.trim($("input[name=jqjyMiddleloss]").val()),
                    jqjyCompletelyloss: $.trim($("input[name=jqjyCompletelyloss]").val()),
                    cxjyNormal: $.trim($("input[name=cxjyNormal]").val()),
                    cxjyLightloss: $.trim($("input[name=cxjyLightloss]").val()),
                    cxjyMiddleloss: $.trim($("input[name=cxjyMiddleloss]").val()),
                    cxjyCompletelyloss: $.trim($("input[name=cxjyCompletelyloss]").val()),
                    dxjyNormal: $.trim($("input[name=dxjyNormal]").val()),
                    dxjyLightloss: $.trim($("input[name=dxjyLightloss]").val()),
                    dxjyMiddleloss: $.trim($("input[name=dxjyMiddleloss]").val()),
                    dxjyCompletelyloss: $.trim($("input[name=dxjyCompletelyloss]").val()),
                    pdnlNormal: $.trim($("input[name=pdnlNormal]").val()),
                    pdnlLightloss: $.trim($("input[name=pdnlLightloss]").val()),
                    pdnlMiddleloss: $.trim($("input[name=pdnlMiddleloss]").val()),
                    pdnlCompletelyloss: $.trim($("input[name=pdnlCompletelyloss]").val()),
                    qxNormal: $.trim($("input[name=qxNormal]").val()),
                    qxLightloss: $.trim($("input[name=qxLightloss]").val()),
                    qxMiddleloss: $.trim($("input[name=qxMiddleloss]").val()),
                    qxCompletelyloss: $.trim($("input[name=qxCompletelyloss]").val()),
                    xwNormal: $.trim($("input[name=xwNormal]").val()),
                    xwLightloss: $.trim($("input[name=xwLightloss]").val()),
                    xwMiddleloss: $.trim($("input[name=xwMiddleloss]").val()),
                    xwCompletelyloss: $.trim($("input[name=xwCompletelyloss]").val()),
                    gtNormal: $.trim($("input[name=gtNormal]").val()),
                    gtLightloss: $.trim($("input[name=gtLightloss]").val()),
                    gtMiddleloss: $.trim($("input[name=gtMiddleloss]").val()),
                    gtCompletelyloss: $.trim($("input[name=gtCompletelyloss]").val()),
                    sjNormal: $.trim($("input[name=sjNormal]").val()),
                    sjLightloss: $.trim($("input[name=sjLightloss]").val()),
                    sjMiddleloss: $.trim($("input[name=sjMiddleloss]").val()),
                    sjCompletelyloss: $.trim($("input[name=sjCompletelyloss]").val()),
                    tjNormal: $.trim($("input[name=tjNormal]").val()),
                    tjLightloss: $.trim($("input[name=tjLightloss]").val()),
                    tjMiddleloss: $.trim($("input[name=tjMiddleloss]").val()),
                    tjCompletelyloss: $.trim($("input[name=tjCompletelyloss]").val())
                }, function (res) {
                    if (res.success) {
                        $("#labelmsg").text(res.message).addClass("label-success");
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000);
                    } else {
                        $("#labelmsg").text(res.message).addClass("label-danger");
                    }
                }, "json");
            }


        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

