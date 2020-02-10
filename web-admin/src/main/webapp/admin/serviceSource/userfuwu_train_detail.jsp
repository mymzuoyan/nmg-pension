
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shoir" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>从业人员培训信息详情</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jquery-multi-select/css/multi-select.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
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
                    <a href="#">居家养老信息管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">从业人员培训信息详情</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            <span class="caption-subject font-red-sunglo bold uppercase">从业人员培训信息详情</span>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <form class="form-body" id="addGovBuy">
                                <table colspan="6" id="train" class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="app_list_search_caption" style="text-align:center;vertical-align:middle;">
                                            身份证号<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" class="form-control" value="${userFuWuTrain.idcardno}" id="idcardno" name="idcardno"
                                                   maxlength="18"/>
                                            <input type="hidden" class="form-control" value="${userFuWuTrain.id}" id="id" name="id"/>
                                        </td>
                                        <td style="text-align:center;vertical-align:middle;" class="app_list_search_caption">
                                            姓名<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td" >
                                            <input disabled type="text" class="form-control" value="${userFuWuTrain.name}" id="name" name="name" value=""  placeholder="姓名"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:center;vertical-align:middle;" class="app_list_search_caption">
                                            培训机构<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td" >
                                            <input type="text" class="form-control" value="${userFuWuTrain.trainingInstitutions}" id="trainingInstitutions" name="trainingInstitutions" value="" placeholder="培训机构"
                                                   maxlength="18"/>
                                        </td>
                                        <td style="text-align:center;vertical-align:middle;" class="app_list_search_caption">
                                            培训内容<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td" >
                                            <input type="text" class="form-control" value="${userFuWuTrain.trainingContents}" id="trainingContents" name="trainingContents" value="" placeholder="培训内容"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:center;vertical-align:middle;" class="app_list_search_caption">
                                            培训时间<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" value="${userFuWuTrain.trainingTime}" id="trainingTime" name="trainingTime" value=""
                                                   class="form-control date-picker" />
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <div class="modal-footer">
                                <shior:hasPermission name="employee-train-update">
                                <button id="update"  style="" type="button" class="btn blue update">修改</button>
                                </shior:hasPermission>
                                <button type="button" class="btn blue trainAdd" disabled>保存</button>
                                <span id="labelmsg" class="label"></span>
                                <button onclick="window.parent.closeTab('tab_train_detail')" class="btn btn-default">返回
                                </button>
                            </div>
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
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script>
            jQuery(document).ready(function () {
                $("input,select").attr("disabled","true");
                var boxObj = $("input:checkbox[name='sign']");  //获取所有的复选框
                var expresslist = "${m.sign}"; //用el表达式获取在控制层存放的复选框的值为字符串类型
                var express = expresslist.split(','); //去掉它们之间的分割符“，”
                for(i=0;i<boxObj.length;i++){
                    for(j=0;j<express.length;j++){
                        if(boxObj[i].value == express[j])  //如果值与修改前的值相等
                        {
                            boxObj[i].checked= true;
                            break;
                        }
                    }
                }
                Metronic.init();
                Layout.init();
                $("#update").click(function () {
                    $("input").removeAttr("disabled");
                    $("#train").find("input[name=idcardno]").prop("disabled", true);
                    $("select").removeAttr("disabled");
                    $("#update").hide();
                    $(".trainAdd").removeAttr("disabled");
                });

                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    format: 'yyyy-mm-dd',
                    autoclose: true
                });

                $(".trainAdd").click(function () {
                    var name = $("input[name=name]").val();
                    var idcardno = $("input[name=idcardno]").val();
                    var trainingInstitutions = $("input[name=trainingInstitutions]").val();
                    var trainingContents = $("input[name=trainingContents]").val();
                    var trainingTime = $("input[name=trainingTime]").val();

                    if(name=="" || name==null){
                        $("#labelmsg").text('姓名不能为空！').addClass("label-danger");
                        return;
                    }else if(idcardno=="" || idcardno==null){
                        $("#labelmsg").text('身份证号不能为空！').addClass("label-danger");
                        return;
                    }else if(trainingInstitutions=="" || trainingInstitutions==null){
                        $("#labelmsg").text('培训机构不能为空！').addClass("label-danger");
                        return;
                    }else if(trainingContents=="" || trainingContents==null){
                        $("#labelmsg").text('培训内容不能为空！').addClass("label-danger");
                        return;
                    }else if(trainingTime=="" || trainingTime==null){
                        $("#labelmsg").text('培训时间不能为空！').addClass("label-danger");
                        return;
                    }
                    trainAdd();
                });

                function trainAdd() {
                    $.post(window.apppath + "/admin/api/user/fuwu/trainUpdate", {
                        id: $("input[name=id]").val(),
                        name: $("input[name=name]").val(),
                        trainingContents: $("input[name=trainingContents]").val(),
                        idcardno: $("input[name=idcardno]").val(),
                        trainingInstitutions: $("input[name=trainingInstitutions]").val(),
                        trainingTime: $("input[name=trainingTime]").val()
                    }, function (res) {
                        if (res.success) {
                            alert(res.message);
                            window.location.reload();
                        }
                        else {
                            alert(res.message);
                        }
                    },'json');
                }
            });


        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

