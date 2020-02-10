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
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>创建坐席</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>

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
                    <a href="#">坐席管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">创建坐席</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            坐席账号
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <div class="form-body">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">坐席组
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <select class="form-control input-xlarge" id="groupId">
                                            <option Value="-1">--请选择--</option>
                                            <c:if test="${!empty monitorGroups}">
                                                <c:forEach var="moitorGroup" items="${monitorGroups}">
                                                    <option Value="${moitorGroup.id}">${moitorGroup.name}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">登陆账号
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <input name="login_name" type="text" class="form-control input-xlarge"
                                               value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">姓名
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <input name="nick_name" type="text" class="form-control input-xlarge"
                                               value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">登陆密码
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <input name="pass_word" type="password" class="form-control input-xlarge"
                                               value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">确认密码
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <input name="pass_word2" type="password"
                                               class="form-control input-xlarge"
                                               value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">所在市
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <input type="hidden" id="province" value="0">
                                        <select name="city" class="form-control input-xlarge" id="city"
                                                onChange="EographicArea.changeCity();"
                                                >
                                            <option value="">直辖市，地级市</option>
                                            <option value="1">西宁市</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">行政区
                                    </label>
                                    <div class="col-md-10">
                                        <select name="area" class="form-control input-xlarge" id="county"
                                                onChange="EographicArea.changeCounty();"
                                                readonly="readonly">
                                            <option value="">行政区，市，县</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group" style="display: none">
                                    <label class="col-md-2 control-label">监控范围
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <div class="checkbox-list">
                                            <label for="queueName_1"
                                                   class="checkbox-inline">
                                                <input id="queueName_1"
                                                       name="queueName"
                                                       type="checkbox"
                                                       value="200" checked/>
                                                12349热线</label>
                                            <label for="queueName_2"
                                                   class="checkbox-inline">
                                                <input id="queueName_2"
                                                       name="queueName"
                                                       type="checkbox"
                                                       value="201"/>
                                                综合服务</label>
                                            <label for="queueName_3"
                                                   class="checkbox-inline">
                                                <input id="queueName_3"
                                                       name="queueName"
                                                       type="checkbox"
                                                       value="202"/>
                                                紧急呼叫</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">分机号
                                        <span class="required">	* </span>
                                    </label>
                                    <div class="col-md-10">
                                        <input name="extension" type="text"
                                               class="form-control input-xlarge"
                                               value=""/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-4 col-md-8">
                                <button id="btnPublish" type="submit" class="btn green"
                                        data-loading-text="保存中...">保存
                                </button>
                                <span id="labelmsg" class="label "></span>
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
        <script type="text/javascript"
                src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/call/monitor_add.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js?v=1"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                AddMonitor.init();
                EographicArea.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

