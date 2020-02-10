<%--
  Created by IntelliJ IDEA.
  User: MaiBenBen
  Date: 2017/2/13
  Time: 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>需求调度</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="${pageContext.request.contextPath }/assets/global/plugins/font-awesome/css/font-awesome.min.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/assets/global/plugins/simple-line-icons/simple-line-icons.min.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/css/bootstrap.min.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/assets/global/plugins/uniform/css/uniform.default.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css"
          rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/css/jquery.dataTables_themeroller.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css"/>
    <link href="${pageContext.request.contextPath }/assets/global/css/components.css" id="style_components" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath }/assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath }/assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
    <link id="style_color" href="${pageContext.request.contextPath }/assets/admin/layout/css/themes/default.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath }/assets/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/alertStyle.css"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/favicon.ico"/>
    <style>
        body {
            font-family: "微软雅黑", sans-serif;
            font-size: 13px;
        }
    </style>
</head>
<body>
<div id="dispatchMap" style="height: 100% !important;"></div>
<div id="serviceOrgs_modal" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document" style="width: 800px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">范围内组织列表</h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered" id="dataTable_serviceOrgs">
                    <thead>
                    <tr>
                        <th>
                            选择
                        </th>
                        <th>组织名称</th>
                        <th>组织类型</th>
                        <th>所属区域</th>
                        <th>详细地址</th>
                    </tr>
                    </thead>
                    <tbody >

                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" id="dispatchBtn" class="btn btn-primary ">派单</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div id="alertModal"  class='alert_wrap' style="display: none;">
    <div class="alert_main">
        <div class="alert_wrap_con">
            <div class="alert_head_wrap">
                <h3 style="margin: 0px;padding: 10px">提示信息</h3>
                <a class="cancel" href="javascript:void(0)">×</a>
            </div>
            <div class="alert_info_con">
                <p  style="text-align: center;margin: 25px;font-size: 22px" class="alertModalMes">
                </p>
            </div>
            <div class="alert_btm_con">
                <a href="javascript:void(0)" class="confirm lg_btn">确定</a>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath }/assets/global/plugins/jquery.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/jquery-migrate.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/js/bootstrap.min.js"
        type="text/javascript"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<script type="text/javascript"
        src="http://api.map.baidu.com/api?v=2.0&ak=UtTMI5ofPulxrOYjzLcEWHGXRlyAEfUB"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>
<!--加载鼠标绘制工具-->
<script type="text/javascript"
        src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/admin/pages/scripts/task/dispatch_a_demand.js?v=1.6"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/view/js/InfoBox.js"></script>
<script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/Global.js?v=1.1"
        type="text/javascript"></script>
<script>
    window.apppath = "${pageContext.request.contextPath }";
    $(function () {
        DispatchADemand.init("${taskId}");
    });
</script>
</html>
