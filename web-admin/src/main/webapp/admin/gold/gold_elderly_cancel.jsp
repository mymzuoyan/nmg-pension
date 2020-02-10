<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shoir" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>人员注销</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
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
                    <a href="#">高龄补贴发放管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">人员注销</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            人员注销
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <form class="form-body" id="addGovBuy">
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red"></font> 所属区域
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <div id="areaId"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red"></font> 姓名
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <div id="elderName" name="elderName"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 身份证号
                                        </td>
                                        <td class="app_list_search_td" colspan="2">
                                            <input type="hidden" value="" id="elderId">
                                            <input type="text" class="form-control" id="idcardno" name="idcardno" value=""
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_td">
                                            <shiro:hasPermission name="elder-glod-manager-system-logout-list">
                                            <button type="button" class="btn blue search">查询</button>
                                            </shiro:hasPermission>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            注销原因
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <select id="cancelReason" name="cancelReason" class="form-control">
                                                <option value="">--全部--</option>
                                                <option value="0">迁出</option>
                                                <option value="1">死亡</option>
                                                <option value="2">其他</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            注销时间
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input  id="cancelTime" name="cancelTime" value=""
                                                   class="form-control date-picker" data-date-format="yyyy-mm-dd" >
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <div class="modal-footer">
                                <shoir:hasPermission name="elder-glod-manager-system-logout-in">
                                <button type="button" class="btn blue addGovBuy">注销</button>
                                </shoir:hasPermission>
                                <%--<button onclick="javascript:history.back(-1)" type="button" class="btn btn-default">返回--%>
                                <%--</button>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" id="selectArea" tabindex="-1" role="basic" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                        <%--<div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h4 class="modal-title">选择组织</h4>
                        </div>--%>
                    <div class="modal-body">
                        <div id="areaTree" class="tree-demo"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn blue add">添加</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"></script>
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
                    // format:'YYYY-MM-DD hh:mm',
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
                    else{
                        alert("请输入身份证号码");
                    }
                });
                $(".addGovBuy").click(function () {
                    addGovbuy();
                });
            });

            function showModel(roleId) {
                AreaTree.setSelectServiceOrg(true);
                if (AreaTree.isInit()) {
                    AreaTree.refresh(roleId);
                }
                else {
                    AreaTree.init(roleId);
                }
                $("#selectArea").modal("show");
            }

            /*function  searchElder2(idcardno){
                $.post(window.apppath  + "/admin/api/gold/forGoldInfo/getElderByCardNoForGold", {
                    idcardno: idcardno
                },function(res){
                    console.log(res);
                    if (res!=null){
                        alert("身份证已登记");
                    }else{
                        searchElder(idcardno);
                    }
                }, 'json');
            }*/
            function searchElder(idcardno) {
                $.post(window.apppath + "/admin/api/gold/forGoldInfo/getElderByCardNoForGold", {
                    idcardno: idcardno
                }, function (res) {
                    console.log(res);
                    if (res != null) {
                        $("#elderName").html(res.elderName);
                        if (res.areaId != null & res.areaId != "") {
                            var data = res.areaId;
                            var  arr = {
                                "0":"海陵区","1": "兴化市", "2": "泰兴市", "3": "姜堰区", "4": "靖江市", "5": "高港区"
                            };
                            $("#areaId").html(arr[data]);
                        };
                    }
                }, 'json');
            }
            function addGovbuy() {
                var cancelReason = $("select[name=cancelReason]").val();
                if (cancelReason == null || cancelReason == "") {
                    // $("#labelmsg").text('请输入注销原因').addClass("label-danger");
                    alert("请输入注销原因");
                    return false;
                }
                var cancelTime =  $("input[name=cancelTime]").val();
                if (( cancelTime == null || cancelTime == "")) {
                    // $("#labelmsg").text('请输入注销时间').addClass("label-danger");
                    alert("请输入注销时间")
                    return false;
                }
                var elderName =  $("input[name=elderName]").val();
                var idcardno =  $("input[name=idcardno]").val();
                $.post(window.apppath + "/admin/api/gold/forGoldInfo/elderCancel", {
                    cancelReason: cancelReason,
                    cancelTime: cancelTime,
                    elderName: elderName,
                    idcardno: idcardno
                }, function (res) {
                    if (res.success) {
                        alert(res.message);
                        window.location.reload();
                    }
                    else {
                        alert(res.message);
                    }
                }, 'json');
                /*}*/
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

