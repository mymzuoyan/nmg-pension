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
<%@ taglib prefix="shoir" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>运营补贴申请新增</title>
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
                    <a href="#">运营补贴申请新增</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            <span class="caption-subject font-red-sunglo bold uppercase">
                            申请运营补贴
                            </span>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <form class="form-body" id="addGovBuy">
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="app_list_search_caption">
                                            组织名称<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td" colspan="7">
                                            <input type="text" class="form-control" id="serviceOrgName" name="serviceOrgName" value="${sessionScope.login_user.serviceOrgName}"
                                                   maxlength="18" disabled/>
                                            <input type="hidden" class="form-control" id="serviceOrgId" name="serviceOrgId" value="${sessionScope.login_user.serviceOrgId}"
                                                   maxlength="18" disabled/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            开业时间<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" id="openingHours" name="openingHours" value=""
                                                   class="form-control date-picker" />
                                        </td>
                                        <td class="app_list_search_caption">
                                            申请时间<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" id="applyTime" name="applyTime" value=""
                                                   class="form-control date-picker" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            法定代表<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="legalRepresentative" name="legalRepresentative" value=""
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            详细地址<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="address" name="address" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            联系电话<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="mobile" name="mobile" value=""
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            管理人员数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="management" name="management" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            服务人员数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="servicePersonal" name="servicePersonal" value=""
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            其他人员数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="otherPersonal" name="otherPersonal" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 特困老年人数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="extremelyPoorElderly" name="extremelyPoorElderly" value=""
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 其他（自费）
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="other" name="other" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            申请年度<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <select id="applyYear" name="applyYear" class="form-control">
                                                <option value="">
                                                    -- 请选择 --
                                                </option>
                                                <option value="2017.01~2017.12">
                                                    2017.01~2017.12
                                                </option>
                                                <option value="2018.01~2018.12">
                                                    2018.01~2018.12
                                                </option>
                                                <option value="2019.01~2019.12">
                                                    2019.01~2019.12
                                                </option>
                                        </select>
                                        </td>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 一月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum1" name="bedNum1" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 二月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum2" name="bedNum2" value=""
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 三月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum3" name="bedNum3" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 四月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum4" name="bedNum4" value=""
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 五月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum5" name="bedNum5" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 六月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum6" name="bedNum6" value=""
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 七月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum7" name="bedNum7" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 八月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum8" name="bedNum8" value=""
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 九月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum9" name="bedNum9" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 十月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum10" name="bedNum10" value=""
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 十一月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum11" name="bedNum11" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 十二月补贴床位数
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="bedNum12" name="bedNum12" value=""
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            申请人<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="applyer" name="applyer" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <div class="modal-footer">
                                <button type="button" class="btn blue addHappy">保存</button>
                                <span id="labelmsg" class="label"></span>
                                <button onclick="window.parent.closeTab('tab_mechanism_add')" class="btn btn-default">返回
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
                Metronic.init();
                Layout.init();

                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    format: 'yyyy-mm-dd',
                    autoclose: true
                });

                $(".addHappy").click(function () {
                    var serviceOrgName = $("input[name=serviceOrgName]").val();
                    var openingHours = $("input[name=openingHours]").val();
                    var applyTime = $("input[name=applyTime]").val();
                    var legalRepresentative = $("input[name=legalRepresentative]").val();
                    var address = $("input[name=address]").val();
                    var mobile = $("input[name=mobile]").val();
                    var applyYear = $("select[name=applyYear]").val();
                    var applyer = $("input[name=applyer]").val();

                    if(serviceOrgName=="" || serviceOrgName==null){
                        $("#labelmsg").text('组织名称不能为空！').addClass("label-danger");
                        return;
                    }else if(openingHours=="" || openingHours==null){
                        $("#labelmsg").text('开业时间不能为空！').addClass("label-danger");
                        return;
                    }else if(applyTime=="" || applyTime==null){
                        $("#labelmsg").text('申请时间不能为空！').addClass("label-danger");
                        return;
                    }else if(legalRepresentative=="" || legalRepresentative==null){
                        $("#labelmsg").text('法定代表不能为空！').addClass("label-danger");
                        return;
                    }else if(address=="" || address==null){
                        $("#labelmsg").text('详细地址不能为空！').addClass("label-danger");
                        return;
                    }else if(mobile=="" || mobile==null){
                        $("#labelmsg").text('联系电话不能为空！').addClass("label-danger");
                        return;
                    }else if(applyer=="" || applyer==null){
                        $("#labelmsg").text('申请人不能为空！').addClass("label-danger");
                        return;
                    }else if(applyYear=="" || applyYear==null){
                        $("#labelmsg").text('申请年度不能为空！').addClass("label-danger");
                        return;
                    }
                    addHappy();
                });

                function addHappy() {
                    $.post(window.apppath + "/admin/api/serviceOrg/subsidy/addMechanisam", {
                        type:1,
                        object:1,
                        submitStatus:1,
                        serviceOrgId: $("input[name=serviceOrgId]").val(),
                        serviceOrgName: $("input[name=serviceOrgName]").val(),
                        openingHours: $("input[name=openingHours]").val(),
                        applyTime: $("input[name=applyTime]").val(),
                        legalRepresentative: $("input[name=legalRepresentative]").val(),
                        address: $("input[name=address]").val(),
                        mobile: $("input[name=mobile]").val(),
                        management: $("input[name=management]").val(),
                        servicePersonal: $("input[name=servicePersonal]").val(),
                        otherPersonal: $("input[name=otherPersonal]").val(),
                        extremelyPoorElderly: $("input[name=extremelyPoorElderly]").val(),
                        other: $("input[name=other]").val(),
                        applyYear: $("select[name=applyYear]").val(),
                        bedNum1: $("input[name=bedNum1]").val(),
                        bedNum2: $("input[name=bedNum2]").val(),
                        bedNum3: $("input[name=bedNum3]").val(),
                        bedNum4: $("input[name=bedNum4]").val(),
                        bedNum5: $("input[name=bedNum5]").val(),
                        bedNum6: $("input[name=bedNum6]").val(),
                        bedNum7: $("input[name=bedNum7]").val(),
                        bedNum8: $("input[name=bedNum8]").val(),
                        bedNum9: $("input[name=bedNum9]").val(),
                        bedNum10: $("input[name=bedNum10]").val(),
                        bedNum11: $("input[name=bedNum11]").val(),
                        bedNum12: $("input[name=bedNum12]").val(),
                        applyer: $("input[name=applyer]").val()
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

