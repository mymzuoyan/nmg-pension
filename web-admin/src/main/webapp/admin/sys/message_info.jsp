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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>公告详情</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>

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
                    <a href="#">系统公告</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">公告详情</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            公告详情
                        </div>
                        <div class="tools">
                            <div style="float: left">
                                <button onclick="window.parent.updateTab('message_list');window.parent.closeTab('msgdetail'); " class="btn btn-circle green"><i class="fa">返回</i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div style="margin: 0px 40px">
                            <h3 style="text-align: center">${message.title}</h3>
                            <p style="text-align: center"><fmt:formatDate value="${message.createTime}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></p>
                            <h4 style="margin-top: 25px">
                                    ${message.content}
                            </h4>
                            <div style="width:100%;height:60px;" id="attachs">

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
                src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript" charset="utf-8"
                src="${pageContext.request.contextPath }/assets/global/plugins/kindeditor/kindeditor-all-min.js"></script>
        <script type="text/javascript" charset="utf-8"
                src="${pageContext.request.contextPath }/assets/global/plugins/kindeditor/lang/zh-CN.js"></script>
        <!--fileUpload-->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                if('${message.attach}'!=''){
                    var attachs =  '${message.attach}'.split(',');
                    for(var i=0;i<attachs.length;i++){
                        $('#attachs').append('<a style="float: right;" href="'+attachs[i]+'">附件'+(i+1)+'下载/查看</a><br/>');
                    }
                    $('#attachs').show();
                }
                window.parent.updateUnreadMessage();
            });
            function  showInfo(id) {
                window.parent.addTab("poor-applyInfo", "特困人员供养申请详情",  window.apppath + '/admin/elderMsg/poor/apply/info/' + id);

            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

