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
                        <span class="caption-subject font-red-sunglo bold uppercase">老人能力评估完成度配置</span>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="tabbable-line">
                        <form id="serviceOrgAddForm">
                            <table border="1"
                                   class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                   align="center" style="border-collapse: collapse;">
                                <input type="hidden" id="province" value="0">
                                <input type="hidden" id="type" value="2">
                                <tr>
                                    <td colspan="12">一、日常生活活动</td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        吃饭(能完成入口、咀嚼、吞咽等步骤)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="day_activity1" value="${m.day_activity1}" class="form-control input-sm" placeholder="吃饭得分" type="number">
                                    </td>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        穿衣(完成取衣、穿衣、系带、扣扣子等) <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="day_activity2" value="${m.day_activity2}" class="form-control input-sm" placeholder="穿衣得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        上下床(能完成洗脚、洗脸、上下床等步骤)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="day_activity3" value="${m.day_activity3}" class="form-control input-sm" placeholder="上下床得分" type="number">
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        如厕(如厕、便后能自理及整理衣裤)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="day_activity4" value="${m.day_activity4}" class="form-control input-sm" placeholder="如厕得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        室内走动(外出、上下楼正常)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="day_activity5" value="${m.day_activity5}" class="form-control input-sm" placeholder="室内走动得分" type="number">
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        洗澡(能完成洗澡的全部过程)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="day_activity6" value="${m.day_activity6}" class="form-control input-sm" placeholder="洗澡得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        控制大小便(能控制大小便)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="day_activity7" value="${m.day_activity7}" class="form-control input-sm" placeholder="控制大小便得分" type="number">
                                    </td>
                                    <td colspan="6" style="text-align: center;vertical-align: middle;width:50%;"></td>
                                </tr>

                                <tr>
                                    <td colspan="12">二、认知能力</td>
                                </tr>
                                <tr>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        近期记忆(能回想近期发生的事情)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="cognitive_ability1" value="${m.cognitive_ability1}" class="form-control input-sm" placeholder="	近期记忆得分" type="number">
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        程序记忆(完成洗衣、做饭、做菜等)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="cognitive_ability2" value="${m.cognitive_ability2}" class="form-control input-sm" placeholder="	程序记忆得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        定向记忆(外出、回家不迷路)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="cognitive_ability3" value="${m.cognitive_ability3}" class="form-control input-sm" placeholder="定向记忆得分" type="number">
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        判断能力(对日常事物的判断不违背常理)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="cognitive_ability4" value="${m.cognitive_ability4}" class="form-control input-sm" placeholder="判断能力得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="12">三、情绪行为</td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="text-align: center;vertical-align: middle;width:23%;">
                                        情绪(与人和睦相处，不偏激) <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        <input name="mood_action1" value="${m.mood_action1}" class="form-control input-sm" placeholder="	情绪得分" type="number">
                                    </td>
                                    <td colspan="3"style="text-align: center;vertical-align: middle;width:23%;">
                                        行为(动作行为表现是否异常) <span style="color:red"> *</span>
                                    </td>
                                    <td colspan="1" style="text-align: center;vertical-align: middle;width:9%;">
                                        <input name="mood_action2" value="${m.mood_action2}" class="form-control input-sm" placeholder="	行为得分" type="number">
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        沟通(在交流中能否互相理解)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:16%;">
                                        <input name="mood_action3" value="${m.mood_action3}" class="form-control input-sm" placeholder="沟通得分" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="12">四、视、听觉</td>
                                </tr>
                                <tr>
                                    <td colspan="4"style="text-align: center;vertical-align: middle;width:33%;">
                                        视觉(能正常看电视、读报等)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2" style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="audiovisual1" value="${m.audiovisual1}" class="form-control input-sm" placeholder="	视觉得分" type="number">
                                    </td>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">
                                        听觉(能正常接听电话、交谈)<span style="color:red"> *</span>
                                    </td>
                                    <td colspan="2"style="text-align: center;vertical-align: middle;width:17%;">
                                        <input name="audiovisual2" value="${m.audiovisual2}" class="form-control input-sm" placeholder="	听觉得分" type="number">
                                    </td>
                                </tr>
                            </table>
                            <div class="form-actions">
                                <div class="col-md-12">
                                    <div class="col-md-offset-4" style="margin-left: 48%;">
                                        <button data-loading-text="提交中..."
                                                type="button" class="btn btn-circle green"
                                                onclick="ServiceOrgDetail.submitAdd()">
                                            保存
                                        </button>
                                        <span id="labelmsg" class="label"></span>
                                    </div>
                                  <%--  <div class="col-md-offset-4">
                                        <button onclick="window.parent.closeTab('tab_institution_add')"
                                                class="btn btn-circle green"><i
                                                class="fa">返回</i>
                                        </button>
                                    </div>--%>
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
                Metronic.init();
                Layout.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    format:'yyyy-mm-dd',
                    autoclose: true
                });
                $("input[type=file]").change(function () {
                    var result = $(this).val();
                    if (result != null && result != "")
                        result = result.substr(result.lastIndexOf("\\") + 1, result.length - 1)
                    $("#file_path").html(result)
                })

                $("#addGovBuy .select").click(function () {
                    showModel("${zuzhiRoleId}");
                });

                $("#selectArea .add").click(function () {
                    var select = AreaTree.getSelectArea();
                    if (select != -1) {
                        $("#serviceOrgId").val(select);
                        $("#serviceOrgName").val(AreaTree.getSelectAreaName(select))

                        $("#selectArea").modal("hide");
                    }
                });


                $("#addGovBuy .search").click(function () {
                    var idcardno = $("#idcardno").val();
                    if (idcardno != null & idcardno != "") {
                        searchElder(idcardno);
                    }
                    else
                        alert("请输入身份证号码");
                });
                $(".addGovBuy").click(function () {
                    addGovbuy();
                });
            });

        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

