<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb"%>
<html>
    <head>
        <title>老人评估列表</title>
        <link href="${pageContext.request.contextPath}/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
        <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="${pageContext.request.contextPath}/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
        <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/global/css/components.css" id="style_components" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <style>
            #datatable_event_list_info
            {
                width: 200px;
                vertical-align: super;
                text-align: center;
            }
        </style>
    </head>
    <body style="width: 98%">
        <input type="hidden" name="elderId" id="elderId" value="${elderId}" />
        <div class="portlet " style="padding-top: 0px !important;padding-left: 0px !important;">
            <div class="table-container">
                <table class="table table-striped table-bordered table-hover" id="datatable_event_list">
                    <thead>
                    <tr role="row" class="heading">
                        <th width="1%">
                            <input type="checkbox" class="group-checkable">
                        </th>
                        <th width="13%">
                            所在区域
                        </th>
                        <th width="13%">
                            编号
                        </th>
                        <th width="14%">
                            姓名
                        </th>
                        <th width="19%">
                            身份证号
                        </th>
                        <th width="13%">
                            评估时间
                        </th>
                        <th width="12%">
                            评估人1
                        </th>
                        <th width="13%">
                            评估人2
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
    <script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
    <!-- END CORE PLUGINS -->
    <script src="${pageContext.request.contextPath}/assets/global/scripts/metronic.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="${pageContext.request.contextPath}/assets/admin/pages/scripts/elderly/elderInfo_asseAllList.js?v=1.3"></script>
    <script src="${pageContext.request.contextPath}/assets/global/scripts/datatable.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            window.apppath = '${pageContext.request.contextPath }';
            Metronic.init();
            Layout.init();
            AssessAllInfo.init();
        });
    </script>
</html>
