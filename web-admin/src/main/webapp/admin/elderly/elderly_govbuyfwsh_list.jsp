<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>政府购买信息</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
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
                    <a href="#">政府购买信息</a>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <div class="portlet " style="padding-top: 0px !important;padding-bottom: 0px !important;">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">政府购买信息列表</span>
                        </div>
                        <div class="tools">
                            <a href="" class="collapse"></a>
                        </div>
                    </div>
                    <div class="portlet-body" style="padding-top: 0px !important;">
                        <form id="gove-form" name="gove-form">
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td colspan="8">
                                        <span class="caption-helper">基本信息</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10%" style="text-align:center;vertical-align:middle;">所属区域</td>
                                    <td width="15%" style="text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="areaName" id="areaName"
                                               onclick="ElderlyGovBuyFwList.selectArea();"
                                                <c:if test="${not empty sessionScope.login_user.areaName}">
                                                    value="${sessionScope.login_user.areaName}"
                                                </c:if>
                                               type="text"/>
                                        <input type="hidden" name="areaId" id="areaId"/>
                                    </td>
                                    <td width="10%" style="text-align:center;vertical-align:middle;">
                                        老人姓名
                                    </td>
                                    <td width="15%" style="text-align:center;vertical-align:middle;">
                                        <input name="elderName" class="form-control"/>
                                    </td>
                                    <td width="10%" style="text-align:center;vertical-align:middle;">
                                        老人身份证
                                    </td>
                                    <td width="15%" style="text-align:center;vertical-align:middle;">
                                        <input name="idcardno" class="form-control"/>
                                    </td>

                                </tr>
                                <tr>

                                    <td width="10%" style="text-align:center;vertical-align:middle;">
                                        人员类别
                                    </td>
                                    <td width="15%" style="text-align:center;vertical-align:middle;">
                                    <select id="elderType" class="form-control">
                                        <option value='0'>请选择</option>
                                        <option value='1'>分散供养特困人员</option>
                                        <option value='2'>低保老人</option>
                                        <option value='3'>建档立卡贫困老人</option>
                                        <option value='4'>重点优抚对象</option>
                                        <option value='5'>重度残疾人</option>
                                        <option value='6'>计划生育特殊困难</option>
                                    </select>
                                </td>
                                    <td width="10%" style="text-align:center;vertical-align:middle;">
                                        居住地址
                                    </td>
                                    <td width="15%"  style="text-align:center;vertical-align:middle;">
                                        <input name="realAddress" class="form-control"/>
                                    </td>
                                    <td width="10%" style="text-align:center;vertical-align:middle;">
                                        补贴标准
                                    </td>
                                    <td width="15%" style="text-align:center;vertical-align:middle;">
                                        <select id="srvsubsidy" class="form-control">
                                            <option value="">请选择</option>
                                            <option value='1'>每月50元</option>
                                            <option value='2'>每月100元</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <shior:hasPermission name="elderly-elderlyMsg-elderGoveInfo-list">
                            <input type="hidden" id="elderGoveInfoList" value="1"/>
                        <div class="right" style="text-align: right">
                            <a class="table-group-action-submit btn btn-circle btn-import"><i class="fa">查询</i></a>
                            <a class="reload table-group-action-reload btn btn-circle btn-black"><i
                                    class="fa">重置</i></a>
                        </div>
                        </shior:hasPermission>
                        <shiro:hasPermission name="elderly-elderlyMsg-elderGoveInfo-update">
                            <input type="hidden" id="elderGoveInfoUpdate" value="1"/>
                        </shiro:hasPermission>
                    </div>

                </div>
                <div class="portlet " style="padding-top: 0px !important;">
                    <div class="table-container">
                        <div class="table-group-actions-wrapper">
                        </div>
                        <table class="table table-striped table-bordered table-hover"
                               id="datatable_elderly_govbuyfw">
                            <thead>
                            <tr role="row" class="heading">
                                <th width="1%">
                                    <input type="checkbox" class="group-checkable">
                                </th>
                                <th width="10%">
                                    所在区域
                                </th>
                                <th width="10%">
                                    服务组织
                                </th>
                                <th width="4%">
                                    姓名
                                </th>
                                <th width="10%">
                                    联系电话
                                </th>
                                <th width="10%">
                                    移动电话
                                </th>
                                <th width="9%">
                                    住址
                                </th>
                                <th width="9%">
                                    人员类别
                                </th>
                                <th width="9%">
                                    补贴金额
                                </th>
                                <th width="9%">
                                    服务项目
                                </th>
                                <th width="9%">
                                    审批状态
                                </th>
                                <th width="7%">
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
                                        href="" id="goPage" class="btn btn-sm default "
                                        onclick="ElderlyGovBuyFwList.goToPage()" title="GO">GO
                                </button>
                            </div>
                        </div>
                       <%-- <shior:hasRole name="suadmin">
                            <a id="excel" class="btn btn-circle  btn-black excel" style="float: left;display: none"><i
                                    class="fa">导出excel</i></a>
                        </shior:hasRole>--%>
                        <shior:hasPermission name="elderly-elderlyMsg-elderGoveInfo-delete">
                            <div class=" right deleteDiv" style="text-align: right;">
                                <button id="btnDeleteGovBuy" class="btn btn-circle red"><i class="fa fa-times"> 删除</i>
                                </button>
                            </div>
                        </shior:hasPermission>
                    </div>
                </div>
            </div>
        </div>
        <!-- END PAGE CONTENT-->
        <!-- END CONTENT -->
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
                                onclick="ElderlyGovBuyFwList.getAreaValue(AreaTree.getAllAreaName(AreaTree.getSelectArea()),AreaTree.getSelectArea());">
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
                                        <input type="button" onclick="ElderlyGovBuyFwList.importFile('file')" value="导入">
                                    </td>
                                    <td width="25%">
                                        <span id="msg" class="label"></span>
                                    </td>
                                    <td width="25%">
                                        <a href="${pageContext.request.contextPath}/file/excel/download/elderGovBuy/govBuy.xls"/>&nbsp;Excel模板下载</a>
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <!-- END PAGE CONTENT-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/elderly/elderly_govBuyFwsh_list.js?v=2.34"></script>
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
                ElderlyGovBuyFwList.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
