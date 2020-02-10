
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shoir" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>楼院信息记录新增</title>
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
                    <a href="#">楼院信息记录新增</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            <span class="caption-subject font-red-sunglo bold uppercase">楼院信息记录新增</span>
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
                                            <font color="red">*</font> 楼院编号<font color="red">(必填)</font>
                                        </td>
                                        <td colspan="2" class="app_list_search_td" >
                                            <input  type="text" class="form-control" id="towerCourtyardNum" name="towerCourtyardNum" value=""  placeholder="请输入楼院编号"
                                                   maxlength="18"/>
                                        </td>
                                        <td colspan="1" style="text-align:center;vertical-align:middle;" class="app_list_search_caption">
                                             备注
                                        </td>
                                        <td colspan="2" class="app_list_search_td" >
                                            <input  type="text" class="form-control" id="remark" name="remark" value="" placeholder="请输入备注"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <div class="modal-footer">
                                <button type="button" class="btn blue TowerCourtyardAdd">保存</button>
                                <span id="labelmsg" class="label"></span>
                                <button onclick="window.parent.closeTab('tab_towercourtyards_add')" class="btn btn-default">返回
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
                $(".TowerCourtyardAdd").click(function () {
                    var towerCourtyardNum = $("input[name=towerCourtyardNum]").val();
                    var age = $("input[name=age]").val();

                    if(towerCourtyardNum=="" || towerCourtyardNum==null){
                        $("#labelmsg").text('楼院编号不能为空！').addClass("label-danger");
                        return;
                    }
                    TowerCourtyardAdd();
                });

                function TowerCourtyardAdd() {
                    $.post(window.apppath + "/admin/serviceOrg/BedRoomManager/TowerCourtyardsAdd", {
                        towerCourtyardNum: $("input[name=towerCourtyardNum]").val(),
                        remark: $("input[name=remark]").val(),
                        kickafk: 0,
                        rooms: 0,
                        bedNum: 0
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

