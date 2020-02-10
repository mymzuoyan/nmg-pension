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
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>信件详情</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
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
                    <a href="#">派单系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">工单详情</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet light">
                    <div class="portlet-title">
                        <div class="caption">
                            信件详情
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal form-bordered  ">
                            <!-- PERSONAL INFO TAB -->
                            <div class="form-body">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">信件类型
                                    </label>
                                    <div class="col-md-10">
                                        <lb:select value="${letter.letterType}" cssClass="form-control" disabled="true">
                                            <lb:option value="">--请选择--</lb:option>
                                            <lb:option value="1">意见</lb:option>
                                            <lb:option value="2">咨询</lb:option>
                                            <lb:option value="3">投诉</lb:option>
                                            <lb:option value="4">其他</lb:option>
                                        </lb:select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">信件标题
                                    </label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control " readonly
                                               value="${letter.letterTitle}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">信件内容
                                    </label>
                                    <div class="col-md-10">
                                                <textarea name="content" class="form-control " rows="5"
                                                          readonly>${letter.letterContent}
                                                </textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">发布时间
                                    </label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control " readonly
                                               value="<fmt:formatDate value="${letter.createTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>">
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
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

