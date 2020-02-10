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
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>高龄补贴补发汇总</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/extensions/TableTools/css/dataTables.tableTools.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <style>
            #goldSend_statistic tr td {
                text-align: center;
            }
        </style>
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
                    <a href="#">高龄补贴补发汇总统计</a>
                </li>
            </ul>
        </div>
        <div class="row">
        <div class="col-md-12">
            <div class="portlet">
                <div id="searchDiv" class="portlet-body form" style="">
                    <table class="table table-bordered table-hover table-condensed table-responsive">
                        <tr>
                            <td width="10%" style="text-align:center;vertical-align:middle;">所属区域</td>
                            <td width="20%" style="text-align:center;vertical-align:middle;">
                                <input class="form-control" name="areaName" id="areaName"
                                       onclick="GoldSendBuFaStatistics.selectArea();"
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
                                <input type="hidden" name="areaId" id="areaId1"/>
                            </td>
                            <td style="text-align:center;vertical-align:middle;">
                                开始年月
                            </td>
                            <td>
                                <input name="startTimeString" id="startTimeString"
                                       class="form-control date-picker" data-date-format="yyyy-mm">  </input>
                            </td>
                            <td style="text-align:center;vertical-align:middle;">
                                结束年月
                            </td>
                            <td>
                                <input name="endTimeString" id="endTimeString"
                                       class="form-control date-picker" data-date-format="yyyy-mm">  </input>
                            </td>
                        </tr>
                    </table>
                    <shiro:hasAnyRoles name="suadmin,readmin,muadmin">
                        <a id="excel" class="btn btn-circle  btn-black excel"
                           style="float: left;display: none;background-color: rgb(255, 70, 14)"><i class="fa">导出excel</i></a>
                    </shiro:hasAnyRoles>
                    <div style="text-align: right">
                        <a id="search" class="btn btn-circle  green">
                            <i> 查询 </i>
                        </a>
                        <a id="reload" class="reload table-group-action-reload btn btn-circle btn-black"><i
                                class="fa">重置</i></a>
                    </div>
                </div>
                <div>&nbsp;</div>
                <div class="portlet-body">
                    <input type="hidden" value="${areaId}" id="areaId">
                    <a onclick="window.location.reload()" class="btn btn-circle green" >
                        刷新
                    </a>
                    <a  class="btn btn-circle green"  id="loadingPDF">
                        生成PDF
                    </a>
                    <a  class="btn btn-circle green"  id="loadingWord">
                        生成Word
                    </a>
                    <div>&nbsp;</div>
                    <div id="goldSendWord">
                        <table class="table  table-bordered" style="background:white "
                               id="goldSend_statistic">
                            <tr>
                                <input type="hidden" id="level" name="level" value="${level}">
                                <td colspan="15">

                                    <h1 style="text-align: center" id="tableTitle">
                                        高龄补贴补发汇总统计
                                    </h1>
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="2">
                                    区域
                                </td>
                                <td colspan="2">
                                    80-89岁
                                </td>
                                <td colspan="2">
                                    90-94岁
                                </td>
                                <td colspan="2">
                                    95-99岁
                                </td>
                                <td colspan="2">
                                    100岁及以上
                                </td>
                                <td colspan="4">
                                    其中
                                </td>
                                <td colspan="2">
                                    合计
                                </td>
                            </tr>
                            <tr>
                                <td>人次数</td>
                                <td>金额</td>
                                <td>人次数</td>
                                <td>金额</td>
                                <td>人次数</td>
                                <td>金额</td>
                                <td>人次数</td>
                                <td>金额</td>
                                <td>省财政</td>
                                <td>市财政</td>
                                <td>区县财政</td>
                                <td>镇财政</td>
                                <td>人次数</td>
                                <td>金额</td>
                            </tr>
                            <tbody id="tbody">
                            </tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- End: life time stats -->
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
                                onclick="GoldSendBuFaStatistics.getAreaValue(AreaTree.getAllAreaName(AreaTree.getSelectArea()),AreaTree.getSelectArea());">
                            确定
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/pdf/html2canvas.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/pdf/jspdf.debug.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/assets/global/plugins/word/FileSaver.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/assets/global/plugins/word/jquery.wordexport.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/gold/gold_send_bufaStatistic.js?v=1.3"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/gold/gold_send_bufaStatistic.js?v=1.48"></script>

        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                AreaTree.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
                var userAreaId = "${sessionScope.login_user.areaId}";
                if (userAreaId != areaId) {
                    $("#back_a").show();
                }

                GoldSendBuFaStatistics.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

