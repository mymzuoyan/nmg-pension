
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shoir" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>从业人员健康记录详情</title>
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
                    <a href="#">从业人员健康记录详情</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            <span class="caption-subject font-red-sunglo bold uppercase">从业人员健康记录详情</span>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <form class="form-body" id="addGovBuy">
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="6"
                                            style="text-align: center;vertical-align: middle;font-size: 18px">
                                            <span class="caption-subject font-red bold uppercase">
                                                 从业人员基本信息</span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="1" style="text-align:center;vertical-align:middle;" class="app_list_search_caption">
                                            <font color="red">*</font> 姓名
                                        </td>
                                        <td colspan="2" class="app_list_search_td" >
                                            <input readonly="true" type="text" class="form-control" id="name" name="name" value="${m.name}" placeholder="请输入姓名"
                                                   maxlength="18"/>
                                            <input class="form-control" id="id" name="id" value="${m.id}" type="hidden" />
                                        </td>
                                        <td colspan="1" style="text-align:center;vertical-align:middle;" class="app_list_search_caption">
                                            <font color="red">*</font> 年龄
                                        </td>
                                        <td colspan="2" class="app_list_search_td" >
                                            <input readonly="true" type="text" class="form-control" id="age" name="age" value="${m.age}" placeholder="请输入年龄"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="1" style="text-align:center;vertical-align:middle;"><font color="red">*</font>性别</td>
                                        <td colspan="2" style="text-align:center;vertical-align:middle;">
                                            <select style="width:100%;height: 38px" name="gender" id="gender" class="form-control" >
                                                <option  value="">--请选择--</option>
                                                <option value="1" <c:if test="${m.gender==1}">selected</c:if>>男</option>
                                                <option value="2" <c:if test="${m.gender==2}">selected</c:if>>女</option>
                                            </select>
                                        </td>
                                        <td colspan="1" style="text-align:center;vertical-align:middle;" class="app_list_search_caption">
                                            <font color="red">*</font> 记录时间
                                        </td>
                                        <td colspan="2" class="app_list_search_td">
                                            <input type="text" id="clock" name="clock" value="${time.clock}"
                                                   class="form-control date-picker" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6"
                                            style="text-align: center;vertical-align: middle;font-size: 18px">
                                            <span class="caption-subject font-red bold uppercase">
                                                 既往病史患病时间(非必填项)</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="1" style="text-align:center;vertical-align:middle;" class="app_list_search_caption">
                                             肝炎患病时间
                                        </td>
                                        <td colspan="2" class="app_list_search_td">
                                            <input type="text" id="hepatitis" name="hepatitis" value="${time.hepatitis}" placeholder="请选择肝炎患病时间"
                                                   class="form-control date-picker" />
                                        </td>
                                        <td colspan="1" style="text-align:center;vertical-align:middle;" class="app_list_search_caption">
                                             痢疾患病时间
                                        </td>
                                        <td colspan="2" style="text-align:center;vertical-align:middle;" class="app_list_search_td">
                                            <input type="text" id="dysentery" name="dysentery" value="${time.dysentery}" placeholder="请选择痢疾患病时间"
                                                   class="form-control date-picker" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="1" style="text-align:center;vertical-align:middle;" class="app_list_search_caption">
                                             伤寒患病时间
                                        </td>
                                        <td colspan="2" class="app_list_search_td">
                                            <input type="text" id="typhia" name="typhia" value="${time.typhia}" placeholder="请选择伤寒患病时间"
                                                   class="form-control date-picker" />
                                        </td>
                                        <td colspan="1" style="text-align:center;vertical-align:middle;" class="app_list_search_caption">
                                             肺结核患病时间
                                        </td>
                                        <td colspan="2" class="app_list_search_td">
                                            <input type="text" id="tuberculosis" name="tuberculosis" value="${time.tuberculosis}" placeholder="请选择肺结核患病时间"
                                                   class="form-control date-picker" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="1" style="text-align:center;vertical-align:middle;" class="app_list_search_caption">
                                             皮肤病患病时间
                                        </td>
                                        <td colspan="2" class="app_list_search_td">
                                            <input type="text" id="tetter" name="tetter" value="${time.tetter}" placeholder="请选择皮肤病患病时间"
                                                   class="form-control date-picker" />
                                        </td>
                                        <td colspan="1" style="text-align:center;vertical-align:middle;" class="app_list_search_caption">
                                             其他病史选填项
                                        </td>
                                        <td colspan="2" class="app_list_search_td" >
                                            <input type="text" class="form-control" id="rests" name="rests" value="${m.rests}" placeholder="请输入其他病史"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6"
                                            style="text-align: center;vertical-align: middle;font-size: 18px">
                                            <span class="caption-subject font-red bold uppercase">
                                                 体征选项</span>
                                        </td>
                                    </tr>

                                    <tr class="tiZheng">
                                        <td colspan="1"  style="text-align:center;vertical-align:middle;"><font color="red">*</font>心功能</td>
                                        <td colspan="2" style="text-align:center;vertical-align:middle;">
                                            <select style="width:100%;height: 38px" name="heart" class="form-control">
                                                <option value="">--请选择--</option>
                                                <option value="1" <c:if test="${m.heart==1}">selected</c:if>>正常</option>
                                                <option value="2" <c:if test="${m.heart==2}">selected</c:if>>非正常</option>
                                            </select>
                                        </td>
                                        <td colspan="1" style="text-align:center;vertical-align:middle;"><font color="red">*</font>肝功能</td>
                                        <td colspan="2" style="text-align:center;vertical-align:middle;">
                                            <select style="width:100%;height: 38px" name="liver" id="liver" class="form-control">
                                                <option value="">--请选择--</option>
                                                <option value="1" <c:if test="${m.liver==1}">selected</c:if>>正常</option>
                                                <option value="2" <c:if test="${m.liver==2}">selected</c:if>>非正常</option>
                                            </select>
                                        </td>

                                    </tr>
                                    <tr class="tiZheng">
                                        <td colspan="1" style="text-align:center;vertical-align:middle;"><font color="red">*</font>脾功能</td>
                                        <td colspan="2" style="text-align:center;vertical-align:middle;">
                                            <select style="width:100%;height: 38px" name="spleen" id="spleen" class="form-control">
                                                <option value="">--请选择--</option>
                                                <option value="1" <c:if test="${m.spleen==1}">selected</c:if>>正常</option>
                                                <option value="2" <c:if test="${m.spleen==2}">selected</c:if>>非正常</option>
                                            </select>
                                        </td>
                                        <td colspan="1" style="text-align:center;vertical-align:middle;"><font color="red">*</font>肺功能</td>
                                        <td colspan="2" style="text-align:center;vertical-align:middle;">
                                            <select style="width:100%;height: 38px" name="lung" id="lung" class="form-control">
                                                <option value="">--请选择--</option>
                                                <option value="1" <c:if test="${m.lung==1}">selected</c:if>>正常</option>
                                                <option value="2" <c:if test="${m.lung==2}">selected</c:if>>非正常</option>
                                            </select>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td colspan="1" style="text-align:center;vertical-align:middle;">单/多选选填项</td>
                                        <td colspan="5">
                                            <div class="checkbox-list">
                                               <%-- <label class="checkbox-inline" style="padding-top: 10px">--%>
                                                    <input style="padding-top: 10px" type="checkbox" name="sign"
                                                           value="1"/>皮肤<%--</label>--%>
                                                <%--<label class="checkbox-inline" style="padding-top: 10px">--%>
                                                    <input style="padding-top: 10px" type="checkbox" name="sign"
                                                           value="2"/>手癣<%--</label>--%>
                                                <%--<label class="checkbox-inline" style="padding-top: 10px">--%>
                                                    <input style="padding-top: 10px" type="checkbox" name="sign"
                                                           value="3"/>银屑（或鳞屑）病<%--</label>--%>
                                               <%-- <label class="checkbox-inline" style="padding-top: 10px">--%>
                                                    <input style="padding-top: 10px" type="checkbox" name="sign"
                                                           value="4"/>渗出性皮肤病<%--</label>--%>
                                                <%--<label class="checkbox-inline" style="padding-top: 10px">--%>
                                                    <input style="padding-top: 10px" type="checkbox" name="sign"
                                                           value="5"/>化脓性皮肤病<%--</label>--%>
                                            </div>
                                        </td>
                                    </tr>

                                    </tr>
                                </table>
                            </form>
                            <div class="modal-footer">
                                <shior:hasPermission name="health-records-update">
                                <button id="update"  style="" type="button" class="btn blue update">修改</button>
                                </shior:hasPermission>
                                <button type="button" class="btn blue healthRecordsAdd" disabled>保存</button>
                                <span id="labelmsg" class="label"></span>
                                <button onclick="window.parent.closeTab('tab_health_recordsAdd_detail')" class="btn btn-default">返回
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
                    $(".tiZheng select").removeAttr("disabled");
                 /*   $(this).hide();*/
                    $("#update").hide();
                    $(".healthRecordsAdd").removeAttr("disabled");
                });

                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    format: 'yyyy-mm-dd',
                    autoclose: true
                });
                var sign = "";
                $(".healthRecordsAdd").click(function () {
                    var name = $("input[name=name]").val();
                    var age = $("input[name=age]").val();
                    var gender = $("select[name=gender]").val();
                    var clock = $("input[name=clock]").val();
                    var hepatitis = $("input[name=hepatitis]").val();
                    var dysentery = $("input[name=dysentery]").val();
                    var typhia = $("input[name=typhia]").val();
                    var tuberculosis = $("input[name=tuberculosis]").val();
                    var tetter = $("input[name=tetter]").val();
                    var heart = $("select[name=heart]").val();
                    var liver = $("select[name=liver]").val();
                    var spleen = $("select[name=spleen]").val();
                    var lung = $("select[name=lung]").val();
                    var rests = $("input[name=rests]").val();
                    var id = document.getElementsByName('sign');

                    for(var i = 0; i < id.length; i++){
                        if(id[i].checked)
                            sign+=id[i].value+",";
                    }
                    if(sign.length>0){
                        sign=sign.substring(0,sign.length-1);
                    }


                    if(name=="" || name==null){
                        $("#labelmsg").text('姓名不能为空！').addClass("label-danger");
                        return;
                    }else if(age=="" || age==null){
                        $("#labelmsg").text('年龄不能为空！').addClass("label-danger");
                        return;
                    }else if(gender=="" || gender==null){
                        $("#labelmsg").text('性别不能为空！').addClass("label-danger");
                        return;
                    }else if(heart=="" || heart==null){
                        $("#labelmsg").text('心功能不能为空！').addClass("label-danger");
                        return;
                    }else if(liver=="" || liver==null){
                        $("#labelmsg").text('肝功能不能为空！').addClass("label-danger");
                        return;
                    }else if(spleen=="" || spleen==null){
                        $("#labelmsg").text('脾功能不能为空！').addClass("label-danger");
                        return;
                    }else if(lung=="" || lung==null){
                        $("#labelmsg").text('心功能不能为空！').addClass("label-danger");
                        return;
                    }
                    healthRecordsAdd();
                });

                function healthRecordsAdd() {
                    $.post(window.apppath + "/admin/org/healthRecords/updateHealthRecords", {


                        name: $("input[name=name]").val(),
                        age: $("input[name=age]").val(),
                        gender: $("select[name=gender]").val(),
                        clock: $("input[name=clock]").val(),
                        hepatitis: $("input[name=hepatitis]").val(),
                        dysentery: $("input[name=dysentery]").val(),
                        typhia: $("input[name=typhia]").val(),
                        tuberculosis: $("input[name=tuberculosis]").val(),
                        tetter: $("input[name=tetter]").val(),
                        heart: $("select[name=heart]").val(),
                        liver: $("select[name=liver]").val(),
                        spleen: $("select[name=spleen]").val(),
                        lung: $("select[name=lung]").val(),
                        rests: $("input[name=rests]").val(),
                        id: $("input[name=id]").val(),
                        sign:sign,
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

