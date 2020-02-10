<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>订单管理列表</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
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
                    <a href="#">助老卡刷卡管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">订单管理</a>
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
                            <span class="caption-subject font-red-sunglo bold uppercase">项目列表</span>
                        </div>
                        <div class="tools">
                                <input data-loading-text="提交中..."
                                        type="button" class="btn btn-circle green" style="margin-top: 4px" value=" 确定"
                                        onclick="sub()" />
                        </div>
                    </div>
                    <div class="portlet-body" style="padding-top: 0px !important;display: block">
                        <form>
                            <input id="orderIds" name="orderIds" value = ${m} type="hidden"/>
                        </form>
                    </div>
                    <div class="portlet">
                        <div class="portlet-body">
                            <div class="table-container">
                                <table class="table table-striped table-bordered table-hover"
                                       id="datatable_order_List">
                                    <thead>
                                    <tr role="row" class="heading">
                                        <th width="1%">
                                            <input type="checkbox" class="group-checkable">
                                        </th>

                                        <th width="16%">
                                           项目名称
                                        </th>
                                        <th width="8%">
                                            单价
                                        </th>
                                        <th width="10%">
                                            结算类型
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
                                                onclick="OrderList.goToPage()" title="GO">GO
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/lrnlpg/order_list.js?v=2.6"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js?v=1.2"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
                AreaTree.init();
                OrderList.init();
            });

            function sub(){
                var chk_value="";
                var serviceName="";
                var price="";
                var serviceUnit="";
                var array = new Array();
                var docments = document.getElementsByTagName("span");
                var className = "checked";
                for(var i in docments){
                    if(docments[i].className==className){
                        $(docments[i]).each(function () {
                           /* var parentParent = $(this).parent();
                            if (parentParent.hasClass("checked"))*/
                                chk_value += ($(this).next().val());
                            serviceName+=$(this).parent().parent().next().val();
                            price+=$(this).parent().parent().next().next().val();
                            serviceUnit+=$(this).parent().parent().next().next().next().val();
                            var object = new Object();
                            object.id = chk_value;
                            object.serviceName =serviceName;
                            object.price = price;
                            object.serviceUnit = serviceUnit;
                            array.push(object);
                        });
                    }
                }
              /*  $("input[type=checkbox]:checked").each(function () {
                    var parentParent = $(this).parent();
                    if (parentParent.hasClass("checked"))
                        chk_value += ($(this).val());
                        serviceName+=$(this).parent().parent().parent().next().val();
                        price+=$(this).parent().parent().parent().next().next().val();
                        serviceUnit+=$(this).parent().parent().parent().next().next().next().val();
                         var object = new Object();
                        object.id = chk_value;
                        object.serviceName =serviceName;
                        object.price = price;
                        object.serviceUnit = serviceUnit;
                         array.push(object);
                });*/
                window.returnValue = array;
                window.close();
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

