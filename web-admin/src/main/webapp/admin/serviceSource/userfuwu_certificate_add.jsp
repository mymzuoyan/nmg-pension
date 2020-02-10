
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shoir" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>从业人员证书信息新增</title>
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
                    <a href="#">从业人员证书信息新增</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            <span class="caption-subject font-red-sunglo bold uppercase">从业人员证书信息新增</span>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <form class="form-body" id="addGovBuy">
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="app_list_search_caption" style="text-align:center;vertical-align:middle;">
                                            身份证号<font color="red">（必填）</font>
                                        </td>
                                        <td class="app_list_search_td" colspan="2">
                                            <input type="text" class="form-control" id="idcardno" name="idcardno"
                                                   maxlength="18"/>
                                            <input type="hidden" value="${serviceOrgId}" id="serviceOrgId">
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <button type="button" class="btn blue search">查询</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="1" style="text-align:center;vertical-align:middle;" class="app_list_search_caption">
                                            姓名<font color="red">（必填）</font>
                                        </td>
                                        <td colspan="2" class="app_list_search_td" >
                                            <input disabled type="text" class="form-control" id="name" name="name" value=""  placeholder="姓名"
                                                   maxlength="18"/>
                                        </td>
                                        <td colspan="1" style="text-align:center;vertical-align:middle;" class="app_list_search_caption">
                                            证书名称<font color="red">（必填）</font>
                                        </td>
                                        <td colspan="2" class="app_list_search_td" >
                                            <input type="text" class="form-control" id="certificateName" name="certificateName" value="" placeholder="证书名称"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="1" style="text-align:center;vertical-align:middle;">证书类别<font color="red">（必填）</font></td>
                                        <td colspan="2" style="text-align:center;vertical-align:middle;">
                                            <select style="width:100%;height: 38px" name="certificateType" id="certificateType" class="form-control">
                                                <option value=''>-请选择-</option>
                                                <option value='1'>从业资格证</option>
                                                <option value='2'>培训班</option>
                                            </select>
                                        </td>
                                        <td colspan="1" style="text-align:center;vertical-align:middle;" class="app_list_search_caption">
                                            发证时间<font color="red">（必填）</font>
                                        </td>
                                        <td colspan="2" class="app_list_search_td">
                                            <input type="text" id="issuingTime" name="issuingTime" value=""
                                                   class="form-control date-picker" />
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <div class="modal-footer">
                                <button type="button" class="btn blue certificateAdd">保存</button>
                                <span id="labelmsg" class="label"></span>
                                <button onclick="window.parent.closeTab('tab_certificate_add')" class="btn btn-default">返回
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
                $("#addGovBuy .search").click(function () {
                    var cardNo = $("#idcardno").val();
                    if (cardNo != null & cardNo != "") {
                        searchElder(cardNo);
                    }
                    else
                        alert("请输入身份证号码");
                });


                function searchElder(cardNo) {
                    var serviceOrgId = $('#serviceOrgId').val();
                    $.post(window.apppath + "/admin/api/user/fuwu/getEmployeeByCardNo?serviceOrgId=" + serviceOrgId, {
                        cardNo: cardNo
                    }, function (res) {
                        console.log(res);
                        if(res==null){
                            $("#name").val(null);
                            alert("无法查询到该从业人员信息");
                        }
                        if (res != null) {
                            $("#name").val(res.name);
                        }
                    }, 'json');
                }

                $(".certificateAdd").click(function () {
                    var name = $("input[name=name]").val();
                    var idcardno = $("input[name=idcardno]").val();
                    var certificateType = $("select[name=certificateType]").val();
                    var certificateName = $("input[name=certificateName]").val();
                    var issuingTime = $("input[name=issuingTime]").val();

                    if(name=="" || name==null){
                        $("#labelmsg").text('姓名不能为空！').addClass("label-danger");
                        return;
                    }else if(idcardno=="" || idcardno==null){
                        $("#labelmsg").text('身份证号不能为空！').addClass("label-danger");
                        return;
                    }else if(certificateType=="" || certificateType==null){
                        $("#labelmsg").text('证书类型不能为空！').addClass("label-danger");
                        return;
                    }else if(certificateName=="" || certificateName==null){
                        $("#labelmsg").text('证书名称不能为空！').addClass("label-danger");
                        return;
                    }else if(issuingTime=="" || issuingTime==null){
                        $("#labelmsg").text('发证时间不能为空！').addClass("label-danger");
                        return;
                    }
                    certificateAdd();
                });

                function certificateAdd() {
                    $.post(window.apppath + "/admin/api/user/fuwu/certificateAdd", {
                        name: $("input[name=name]").val(),
                        certificateType: $("select[name=certificateType]").val(),
                        idcardno: $("input[name=idcardno]").val(),
                        certificateName: $("input[name=certificateName]").val(),
                        issuingTime: $("input[name=issuingTime]").val(),
                        serviceOrgId: $("#serviceOrgId").val()
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

