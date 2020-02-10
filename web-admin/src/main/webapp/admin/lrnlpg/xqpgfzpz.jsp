<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
    <title>老人需求评估</title>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>老人需求评估</title>
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
                        <span class="caption-subject font-red-sunglo bold uppercase">老人需求评估分值配置</span>
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
                                    <td colspan="12"style="font-weight:bold;">一、经济条件</td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align: center;vertical-align: middle;width:33%;">分类</td><td colspan="6" style="text-align: center;vertical-align: middle;width:17%;">判断评分</td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align: center;vertical-align: middle;width:33%;">特困对象</td><td colspan="6" style="text-align: center;vertical-align: middle;width:17%;"><input name="impoverishedObject" value="${m.impoverishedObject}" class="form-control input-sm" placeholder="特困对象得分" type="number"></td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align: center;vertical-align: middle;width:33%;">低保对象</td><td colspan="6" style="text-align: center;vertical-align: middle;width:17%;"><input name="subsistenceObject" value="${m.subsistenceObject}" class="form-control input-sm" placeholder="低保对象得分" type="number"></td>
                                </tr>
                                <tr>
                                    <td colspan="12" style="text-align: left;vertical-align: middle;width:33%;">
                                        1.特困对象：是指无劳动能力、无生活来源且无法定赡养、抚养、抚养义务人，或其法定义务人是无履行义务能力的老人，其申请评估时应提供证明的原件及复印件。
                                        <br>2.低保对象：是指持有《最低生活保障证》的人，其申请评估时应提供证明的原件及复印件。
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="12"style="font-weight:bold;">二、居住情况</td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align: center;vertical-align: middle;width:33%;">分类</td><td colspan="6" style="text-align: center;vertical-align: middle;width:17%;">判断评分</td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align: center;vertical-align: middle;width:33%;">孤寡、独居</td><td colspan="6" style="text-align: center;vertical-align: middle;width:17%;"><input name="liveAlone" value="${m.liveAlone}" class="form-control input-sm" placeholder="孤寡、独居得分" type="number"></td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align: center;vertical-align: middle;width:33%;">空巢</td><td colspan="6" style="text-align: center;vertical-align: middle;width:17%;"><input name="emptyNest" value="${m.emptyNest}" class="form-control input-sm" placeholder="空巢得分" type="number"></td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align: center;vertical-align: middle;width:33%;">与子女亲友共住</td><td colspan="6" style="text-align: center;vertical-align: middle;width:17%;"><input name="livingChildren" value="${m.livingChildren}" class="form-control input-sm" placeholder="与子女亲友共住得分" type="number"></td>
                                </tr>
                                <tr>
                                    <td colspan="12" style="text-align: left;vertical-align: middle;width:33%;">
                                        1.孤寡老人：指无配偶，无子女，无人照顾，年龄超过60周岁的人。
                                        <br>2.独居老人：指一人独居一处（无配偶、丧偶或离异），与子女分开生活的老人。城市社区，与子女不住在一起的老人，认定为独居老人。农村社区，已分户并不在一起居住的认定为独居老人，已分户但同住在一个院子里不认定为独居，没有分户即使不居住在一起的不认定为独居。
                                        <br>3.空巢老人：是仅与配偶同住，与子女分开生活的老人。独居老人与空巢老人的区别在于是一人还是与配偶同住，其认定条件相同。
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="12"style="font-weight:bold;">三、年龄情况</td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align: center;vertical-align: middle;width:33%;">现年龄</td><td colspan="6" style="text-align: center;vertical-align: middle;width:17%;">判断评分</td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align: center;vertical-align: middle;width:33%;">90岁以上</td><td colspan="6" style="text-align: center;vertical-align: middle;width:17%;"><input name="agaa" value="${m.agaa}" class="form-control input-sm" placeholder="90岁以上得分" type="number"></td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align: center;vertical-align: middle;width:33%;">80-89岁</td><td colspan="6" style="text-align: center;vertical-align: middle;width:17%;"><input name="ageb" value="${m.ageb}" class="form-control input-sm" placeholder="80-89岁得分" type="number"></td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align: center;vertical-align: middle;width:33%;">70-79岁</td><td colspan="6" style="text-align: center;vertical-align: middle;width:17%;"><input name="agec" value="${m.agec}" class="form-control input-sm" placeholder="70-79岁得分" type="number"></td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align: center;vertical-align: middle;width:33%;">60-69岁</td><td colspan="6" style="text-align: center;vertical-align: middle;width:17%;"><input name="aged" value="${m.aged}" class="form-control input-sm" placeholder="60-69岁得分" type="number"></td>
                                </tr>
                                <tr>
                                    <td colspan="12" style="text-align: left;vertical-align: middle;width:33%;">
                                        1.年龄以身份证为准。
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="12" style="font-weight:bold;">四、特殊贡献</td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align: center;vertical-align: middle;width:33%;">分类</td><td colspan="6" style="text-align: center;vertical-align: middle;width:17%;">判断评分</td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align: center;vertical-align: middle;width:33%;">市（州）级以上劳模</td><td colspan="6" style="text-align: center;vertical-align: middle;width:17%;"><input name="modelWorker" value="${m.modelWorker}" class="form-control input-sm" placeholder="市（州）级以上劳模得分" type="number"></td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align: center;vertical-align: middle;width:33%;">重点优抚对象</td><td colspan="6" style="text-align: center;vertical-align: middle;width:17%;"><input name="preferentialObject" value="${m.preferentialObject}" class="form-control input-sm" placeholder="重点优抚对象得分" type="number"></td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align: center;vertical-align: middle;width:33%;">计生特扶对象</td><td colspan="6" style="text-align: center;vertical-align: middle;width:17%;"><input name="planObject" value="${m.planObject}" class="form-control input-sm" placeholder="计生特扶对象得分" type="number"></td>
                                </tr>

                                <tr>
                                    <td colspan="12" style="text-align: left;vertical-align: middle;width:33%;">
                                        1.重点优抚对象，包括烈士遗属、因公牺牲军人遗属、病故军人遗属，残疾军人，复员军人（指1954年10月30日之前入伍，后经批准从部队复员的人员），带病回乡退伍军人。
                                        <br>2.独生子女家庭中独生子女死亡或伤残（3级及以上）的老人。
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="12"style="text-align: center;vertical-align: middle;font-weight:bold;">需求档次分值标准</td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">档次分类</td><td colspan="4" style="text-align: center;vertical-align: middle;width:17%;">最低分</td><td colspan="4" style="text-align: center;vertical-align: middle;width:17%;">最高分</td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">一档</td><td colspan="4" style="text-align: center;vertical-align: middle;width:17%;"><input name="minimumScore" value="${m.minimumScore}" class="form-control input-sm" placeholder="一档最低分" type="number"></td><td colspan="4" style="text-align: center;vertical-align: middle;width:17%;"><input name="highestScore" value="${m.highestScore}" class="form-control input-sm" placeholder="一档最高分" type="number"></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;vertical-align: middle;width:33%;">二档</td><td colspan="4" style="text-align: center;vertical-align: middle;width:17%;"><input name="secondMinimumScore" value="${m.secondMinimumScore}" class="form-control input-sm" placeholder="二档最低分" type="number"></td><td colspan="4" style="text-align: center;vertical-align: middle;width:17%;"><input name="secondHighestScore" value="${m.secondHighestScore}" class="form-control input-sm" placeholder="二档最高分" type="number"></td>
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
                $.post(window.apppath + "/admin/api/power/wcdfzsz/create", {
                    id:$.trim($("input[name=id]").val()),
                    impoverishedObject: $.trim($("input[name=impoverishedObject]").val()),
                    subsistenceObject: $.trim($("input[name=subsistenceObject]").val()),
                    liveAlone: $.trim($("input[name=liveAlone]").val()),
                    emptyNest: $.trim($("input[name=emptyNest]").val()),
                    livingChildren: $.trim($("input[name=livingChildren]").val()),
                    agaa: $.trim($("input[name=agaa]").val()),
                    ageb: $.trim($("input[name=ageb]").val()),
                    agec: $.trim($("input[name=agec]").val()),
                    aged: $.trim($("input[name=aged]").val()),
                    modelWorker: $.trim($("input[name=modelWorker]").val()),
                    preferentialObject: $.trim($("input[name=preferentialObject]").val()),
                    planObject: $.trim($("input[name=planObject]").val()),
                    minimumScore: $.trim($("input[name=minimumScore]").val()),
                    highestScore: $.trim($("input[name=highestScore]").val()),
                    secondMinimumScore: $.trim($("input[name=secondMinimumScore]").val()),
                    secondHighestScore: $.trim($("input[name=secondHighestScore]").val()),
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

