<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>组织视频监控</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <style>
            #selectIcon img {
                width: 30px;
                height: 30px;
                margin: 2.5px;
                padding: 2.5px;
            }

            #selectIcon img:hover {
                background-color: #ccc;
                cursor: pointer;
            }
        </style>
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
                    <a href="#">服务资源管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">组织视频监控</a>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <div class="portlet " style="padding-top: 0px !important;padding-bottom: 0px !important;">
                    <div class="portlet-title">
                        <div class="caption tabbable-line" style="padding: 0px">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a onclick="if(!$(this).parent().hasClass('active')) window.location.href='${pageContext.request.contextPath}/admin/monitor/serviceOrgShow'"
                                       data-toggle="tab" aria-expanded="false"><span
                                            class="caption-subject font-red-sunglo bold uppercase"
                                            style="border-bottom: hidden">服务组织信息列表</span></a>
                                </li>
                            </ul>
                        </div>
                        <div class="tools">
                            <a href="" class="collapse"></a>
                        </div>
                    </div>
                    <div class="portlet-body" style="padding-top: 0px !important;display: block">
                        <form id="serviceOrg-form" name="serviceOrg-form">
                            <input type="hidden" name="socialForce" id="socialForce" value="${socialForce}">
                            <table class="table table-bordered table-hover table-condensed table-responsive">
                                <tr>
                                    <td colspan="6" class="tr-title">
                                        <span class="caption-helper">基本信息</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        所属区域
                                    </td>
                                    <td style="width:20%;text-align:center;vertical-align:middle;">
                                        <input class="form-control" type="text" id="areaName" name="areaName"
                                               data-toggle="modal"
                                               data-target="#areaModal" placeholder="请选择所属区域"
                                        <c:if test="${empty areaName}">
                                               value="${sessionScope.login_user.areaName}"
                                        </c:if>
                                               onclick="ServiceOrgDetail.selectMethod('add');" style="width: 100%">
                                        <input type="hidden" id="areaId" name="areaId">

                                    </td>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        单位名称
                                    </td>
                                    <td style="width:20%;text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="institutionName" placeholder="请输入单位名称"
                                               style="width: 100%">
                                    </td>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        组织类型
                                    </td>
                                    <td style="width:30%;text-align:center;vertical-align:middle;">
                                        <select id="institutionTypeDictId" name="institutionTypeDictId"
                                                class="form-control">
                                            <option value='1,2,3,4,5,7,6,8,9'>--全部--</option>
                                            <option value='1'>社区养老服务中心（A）</option>
                                            <option value='2'>社区养老服务中心（B）</option>
                                            <option value='3'>社区养老服务中心（C）</option>
                                            <option value='9'>社区养老服务中心（D）</option>
                                            <option value='4'>老年人助餐点</option>
                                            <option value='5'>老年人助浴点</option>
                                            <option value='6'>老年人日间照料中心</option>
                                            <option value='7'>居家乐托养点</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        联系人
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input class="form-control" name="applyName" placeholder="请输入联系人姓名"
                                               style="width: 100%">
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        等级
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select id="gradeDictId" name="gradeDictId" class="form-control">
                                            <option value=''>--全部--</option>
                                            <option value='234'
                                                    <c:if test="${grade == 234}">selected</c:if> >AAA以上
                                            </option>
                                            <option value='0'>A级</option>
                                            <option value='1'>AA级</option>
                                            <option value='2'>AAA级</option>
                                            <option value='3'>AAAA级</option>
                                            <option value='4'>AAAAA级</option>
                                        </select>
                                    </td>
                                    <td style="width:10%;text-align:center;vertical-align:middle;">
                                        是否接入
                                    </td>
                                    <td style="width:30%;text-align:center;vertical-align:middle;">
                                        <select name="videoStatus"
                                                class="form-control">
                                            <option value=''>--全部--</option>
                                            <option value='1'>已接入</option>
                                            <option value='0'>未接入</option>
                                        </select>
                                    </td>
                                </tr>


                            </table>
                        </form>
                        <shior:hasAnyRoles name="suadmin,muadmin">
                            <a id="excel" class="btn btn-circle  btn-black excel"
                               style="float: left;display: none;background-color: rgb(255, 70, 14)"><i class="fa">导出excel</i></a>
                        </shior:hasAnyRoles>
                        <div class="right" style="text-align: right">
                            <a id="refresh" class="btn btn-circle  green">
                                <i>刷新 </i>
                            </a>
                            <a id="search" class="btn btn-circle  green">
                                <i>查询 </i>
                            </a>
                            <a class="reload table-group-action-reload btn btn-circle btn-black"><i
                                    class="fa">重置</i></a>
                        </div>
                    </div>
                    <div class="portlet">
                        <div class="portlet-body">
                            <div class="table-container">
                                <div class="table-group-actions-wrapper">
                                </div>
                                <table class="table table-striped table-bordered table-hover"
                                       id="datatable_serviceOrg_List">
                                    <thead>
                                    <tr role="row" class="heading">
                                        <th width="1%">
                                            <input type="checkbox" class="group-checkable">
                                        </th>
                                        <th width="8%">
                                            所属区域
                                        </th>
                                        <th width="21%">
                                            组织名称
                                        </th>
                                        <th width="8%">
                                            单位性质
                                        </th>
                                        <th width="10%">
                                            联系人
                                        </th>
                                        <th width="12%">
                                            联系电话
                                        </th>
                                        <th width="5%">
                                            注册类型
                                        </th>
                                            <%--<th width="12%">
                                                实际运营的<br/>民营组织名称
                                            </th>--%>
                                        <th width="5%">
                                            等级
                                        </th>

                                        <th width="8%">
                                            状态
                                        </th>
                                        <th width="7%">
                                            是否接入
                                        </th>
                                        <th width="20%">
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
                                                onclick="ServiceOrg.goToPage()" title="GO">GO
                                        </button>
                                    </div>
                                </div>
                                    <%--<shior:hasPermission name="home-pro-manager-system-person-service-org-delete">
                                    <input type="hidden" id="serviceOrg-deleteInput" value="1">
                                    <div class=" right" style="text-align: right;margin-top: 10px;display: none"
                                         id="serviceOrg-delete">
                                        <span></span>
                                        <button id="btnDeleteServiceOrg" class="btn btn-circle red"><i
                                                class="fa fa-times"> 删除</i>
                                        </button>
                                    </div>
                                    </shior:hasPermission>--%>
                              <%--  <shior:hasPermission name="home-pro-manager-system-person-service-org-list">
                                    <input type="hidden" id="serviceOrgList" value="1">
                                </shior:hasPermission>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 导入模态框（Modal） -->
        <div class="modal fade" id="areaModal" tabindex="-1"
             role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal"
                                aria-hidden="true"></button>
                        <h4 class="modal-title"
                            id="myModalLabel">请选择所属区域</h4>
                    </div>
                    <div class="modal-body">
                        <div id="areaTree"
                             class="tree-demo"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn blue"
                                onclick="ServiceOrgDetail.getAreaName()">
                            确定
                        </button>
                        <button type="button"
                                class="btn default"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->

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
                        <form id="fileUpload" name="fileUpload" action="" method="POST" enctype="multipart/form-data"
                              target="impResult">
                            <table class="table-container">
                                <tr>
                                    <td width="20%">
                                        导入文件：
                                    </td>
                                    <td style="text-align:center;width: 20%">
                                        <input type="file" id="file" name="file" size="30"/>
                                    </td>
                                    <td width="10%">
                                        <input type="button" onclick="ServiceOrg.importFile('file')" value="导入">
                                    </td>
                                    <td width="25%">
                                        <span id="msg" class="label"></span>
                                    </td>
                                    <td width="25%">
                                        <a href="${pageContext.request.contextPath}/file/excel/download/serviceOrg/服务组织信息导入模板.xls"/>&nbsp;Excel模板下载</a>
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <!-- END PAGE CONTENT-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-close"
                                data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-danger btn-account"
                                style="float: left;display: none">导出账号
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/service_org_monitor.js?v=1.6"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/service_org_detail.js?v=1.2"
                type="text/javascript"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                AreaTree.init();
                ServiceOrg.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

