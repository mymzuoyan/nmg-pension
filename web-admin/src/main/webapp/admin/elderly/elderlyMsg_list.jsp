<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>老人基础信息</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/extensions/TableTools/css/dataTables.tableTools.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">

        <!-- BEGIN PAGE HEADER-->
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">老人信息管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">老人基础信息</a>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <div class="portlet" style="padding-top: 0px !important;padding-bottom: 0px !important;">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">老人信息列表</span>
                        </div>
                        <div class="tools">
                            <div style="float: left">
                                <shiro:hasPermission name="elderly-elderlyMsg-elderlyInfo-create">
                                <a class="table-group-action-add btn btn-circle btn-add"><i class="fa">新增</i></a>
                                <a class="table-group-action-import btn btn-circle btn-import"><i
                                        class="fa">导入</i></a>
                                </shiro:hasPermission>
                            </div>
                            <a href="" class="collapse"></a>
                        </div>
                    </div>
                    <div class="portlet-body" style="padding-top: 0px !important;">
                        <form id="elder-form" name="elder-form">
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td colspan="8" onclick="ElderInfo.showTbody1();" class="tr-title">
                                        <span class="caption-helper">基本信息</span>
                                    </td>
                                </tr>
                                <tbody id="tbody1" style="border-bottom:0px solid #eee;">
                                <tr>
                                    <td width="10%" style="text-align:center;vertical-align:middle;">所属区域</td>
                                    <td width="15%" style="text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="areaName" id="areaName" autocomplete="off"
                                               onclick="ElderInfo.selectArea();"
                                                <c:if test="${sessionScope.login_user.areaId>1}">
                                                    <c:if test="${not empty sessionScope.login_user.areaName}">
                                                        value="${sessionScope.login_user.areaName}"
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${sessionScope.login_user.areaId==1}">
                                                    <c:if test="${not empty areaName}">
                                                        value="${areaName}"
                                                    </c:if>
                                                </c:if>
                                               type="text"/>
                                        <input type="hidden" name="areaId" id="areaId"/>
                                    </td>
                                    <td width="10%" style="text-align:center;vertical-align:middle;">
                                        联系电话
                                    </td>
                                    <td width="15%" style="text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="homeTel" autocomplete="off"/>
                                    </td>
                                    <td width="10%" style="text-align:center;vertical-align:middle;">
                                        姓&nbsp;&nbsp;名
                                    </td>
                                    <td width="15%" style="text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="elderName" autocomplete="off"/>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        评估状态
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="abilityAssess"
                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                            <option value=''>-全部-</option>
                                            <option value='1'
                                                    <c:if test="${not empty abilityAssess and abilityAssess==1}">
                                                selected
                                            </c:if>
                                            >已评估</option>
                                            <option value='2'
                                                    <c:if test="${not empty abilityAssess and abilityAssess==2}">
                                                        selected
                                                    </c:if>
                                            >未评估</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        身份证号
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="idcardno"/>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        年&nbsp;&nbsp;龄
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input class="form-control" style="width: 40%;display: inline-block" type="text"
                                               id="startAge" name="startAge" maxlength="3" size="5"/>
                                        至&nbsp;<input type="text" style="width: 40%;display: inline-block"
                                                      class="form-control" id="endAge" name="endAge" maxlength="3"
                                                      size="5"/>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                    性&nbsp;&nbsp;别
                                </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="sexDictId"
                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                            <option value=''>-全部-</option>
                                            <option value='1'>男</option>
                                            <option value='2'>女</option>
                                        </select>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        居住状况
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="residenceDictId"
                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                            <option value="">--请选择--</option>
                                            <option value="1">与配偶住</option>
                                            <option value="2">独居</option>
                                            <option value="3">与子女共住</option>
                                            <option value="4">与孙子女共住</option>
                                            <option value="5">与兄弟姐妹共住</option>
                                            <option value="6">与父母或岳父母共住</option>
                                            <option value="7">住养老院</option>
                                            <option value="0">其他</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        户籍地址
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;" colspan="3">
                                        <input class="form-control" name="regPlace" style="width: 100%"/>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        居住地址
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;" colspan="3">
                                        <input class="form-control" name="realAddress" style="width: 100%"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        人员类别
                                    </td>
                                    <td style="text-align: left" colspan="7">
                                        <input type="checkbox" name="elderTypeDictIds" value="1"/>城市三无
                                        <input type="checkbox" name="elderTypeDictIds" value="2"/>农村五保
                                        <input type="checkbox" name="elderTypeDictIds" value="3"/>城市低保
                                        <input type="checkbox" name="elderTypeDictIds" value="4"/>农村低保
                                        <input type="checkbox" name="elderTypeDictIds" value="5"/>经济困难的失能/半失能老人
                                        <input type="checkbox" name="elderTypeDictIds" value="6"/>70周岁及以上的计生特扶老人
                                        <input type="checkbox" name="elderTypeDictIds" value="7"/>百岁老人
                                        <input type="checkbox" name="elderTypeDictIds" value="8"/>空巢
                                        <input type="checkbox" name="elderTypeDictIds" value="9"/>独居
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form>
                        <div class="right" style="text-align: right">
                            <a class="table-group-action-submit btn btn-circle btn-import"><i class="fa">查询</i></a>
                            <a class="reload table-group-action-reload btn btn-circle btn-black"><i
                                    class="fa">重置</i></a>
                        </div>
                    </div>
                </div>
                <div class="portlet" style="padding-top: 0px !important;">
                    <div class="table-container">
                        <div class="table-group-actions-wrapper">
                        </div>
                        <table class="table table-striped table-bordered table-hover" id="datatable_event_list">
                            <thead>
                            <tr role="row" class="heading">
                                <th width="1%">
                                    <input type="checkbox" class="group-checkable">
                                </th>
                                <th width="9%">
                                    所在区
                                </th>
                                <th width="8%">
                                    姓名
                                </th>
                                <th width="15%">
                                    身份证号
                                </th>
                                <th width="5%">
                                    年龄
                                </th>
                                <th width="5%">
                                    性别
                                </th>
                                <th width="15%">
                                    人员类别
                                </th>
                                <th width="14%">
                                    居住地址
                                </th>
                                <th width="14%">
                                    户籍地址
                                </th>
                                <th width="11%">
                                    移动电话
                                </th>
                                <th width="11%">
                                    评估状态
                                </th>
                                <th width="12%">
                                    操作
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                        <div class="table-actions-check-wrapper">
                            <div class="pagination-panel"> 页数 <input type="text" id="page"
                                                                     class="pagination-panel-input form-control input-mini input-inline input-sm"
                                                                     maxlenght="5"
                                                                     style="text-align:center; margin: 0 5px;">
                                <button
                                        href="" id="goPage" class="btn btn-sm default " onclick="ElderInfo.goToPage()"
                                        title="GO">GO
                                </button>
                            </div>
                        </div>
                        <shiro:hasRole name="suadmin">
                            <a id="excel" class="btn btn-circle  btn-black excel" style="float: left;display: none"><i
                                    class="fa">导出excel</i></a>
                        </shiro:hasRole>
                        <shiro:hasPermission name="elderly-elderlyMsg-elderlyInfo-delete">
                            <input type="hidden" id="elderInfo-delete" value="1">
                            <div class="right" style="text-align: right;display: block;">
                                <span></span>
                                <button id="btnDeleteElderMsg" class="btn btn-circle red"><i class="fa fa-times"> 删除</i>
                                </button>
                            </div>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="elderly-elderlyMsg-elderlyInfo-list">
                            <input type="hidden" id="elderInfo-list" value="1">
                        </shiro:hasPermission>
                    </div>
                </div>
                <!-- 地区模态框（Modal） -->
                <div class="modal fade" id="myModal" tabindex="" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel">请选择...</h4>
                            </div>
                            <div class="modal-body">
                                <!-- BEGIN PAGE CONTENT-->
                                <div id="areaTree" class="tree-demo"></div>
                                <!-- END PAGE CONTENT-->
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default"
                                        data-dismiss="modal">关闭
                                </button>
                                <button type="button" class="btn btn-primary"
                                        onclick="ElderInfo.getAreaValue(AreaTree.getAllAreaName(AreaTree.getSelectArea()),AreaTree.getSelectArea());">
                                    确定
                                </button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>

                <!-- 导入模态框（Modal） -->
                <div class="modal fade" id="impModal" tabindex="" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;
                                </button>
                                <h4 class="modal-title" id="impModalLabel">请选择...</h4>
                            </div>
                            <div class="modal-body">
                                <!-- BEGIN PAGE CONTENT-->
                                <form id="fileUpload" name="fileUpload" action="" method="POST"
                                      enctype="multipart/form-data" target="impResult">
                                    <table class="table-container">
                                        <tr>
                                            <td width="20%">
                                                导入文件：
                                            </td>
                                            <td style="text-align:center;width: 20%">
                                                <input type="file" id="file" name="file" size="30"/>
                                            </td>
                                            <td width="10%">
                                                <input type="button" onclick="ElderInfo.importFile('file')" value="导入">
                                            </td>
                                            <td width="25%">
                                                <span id="msg" class="label"></span>
                                            </td>
                                            <td width="25%">
                                                <a href="${pageContext.request.contextPath}/file/excel/download/elderlyMsg/老人信息导入模板.xls"/>&nbsp;Excel模板下载</a>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                                <!-- END PAGE CONTENT-->
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-close"
                                        data-dismiss="modal">关闭
                                </button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
                <!-- 导入模态框（Modal） -->
                <div class="modal fade" id="ggimpModal" tabindex="" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;
                                </button>
                                <h4 class="modal-title" id="ggimpModalLabel">请选择...</h4>
                            </div>
                            <div class="modal-body">
                                <!-- BEGIN PAGE CONTENT-->
                                <form id="ggfileUpload" name="ggfileUpload" action="" method="POST"
                                      enctype="multipart/form-data" target="impResult">
                                    <table class="table-container">
                                        <tr>
                                            <td width="20%">
                                                导入文件：
                                            </td>
                                            <td style="text-align:center;width: 20%">
                                                <input type="file" id="ggfile" name="ggfile" size="30"/>
                                            </td>
                                            <td width="10%">
                                                <input type="button" onclick="ElderInfo.ggimportFile('ggfile')" value="导入">
                                            </td>
                                            <td width="25%">
                                                <span id="ggmsg" class="label"></span>
                                            </td>
                                            <%--<td width="25%">--%>
                                                <%--<a href="${pageContext.request.contextPath}/file/excel/download/elderlyMsg/老人信息导入模板.xls"/>&nbsp;Excel模板下载</a>--%>
                                            <%--</td>--%>
                                        </tr>
                                    </table>
                                </form>
                                <!-- END PAGE CONTENT-->
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-close"
                                        data-dismiss="modal">关闭
                                </button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>

            </div>
        </div>
        <!-- END PAGE CONTENT-->
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/elderly/elderlyMsg_list.js?v=1.1"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                AreaTree.init();
                ElderInfo.init();
                $(".table-group-action-reload").click(function () {
                    $("#elder-form").find("input:text").val("");//找到form表单下的所有input标签并清空
                    $("#elder-form").find("input:hidden").val("");//找到form表单下的所有input标签并清空
                    $("#elder-form").find("select").val("");//找到form表单下的所有select标签并清空
                    $("#elder-form").find("input:checkbox").parent().removeClass("checked");//找到form表单下的所有checkbox标签并清空
                    $("#elder-form").find("input:checkbox").attr("checked", false);
                });
                //关闭并刷新页面
                $(".btn-close").click(function () {
                    window.location.reload();
                });
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
