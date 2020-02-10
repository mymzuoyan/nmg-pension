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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>新闻列表</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/css/bootstrap.min.css"
              rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/reset.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/style.css?v=2.4"/>
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
                    <a href="#">新闻管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">新闻列表</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12" style="background-color:white">
                <!--新闻详情-->
                <div class="news_list_con news_detalis" style="padding: 0 22px">
                    <h2>${moduleMes.title}</h2>
                    <h4>发布时间：<fmt:formatDate value="${moduleMes.createTime}" pattern="yyyy-MM-dd"></fmt:formatDate>
                        作者：${moduleMes.creatorName}    </h4>
                </div>
                <div id="content"
                     style="padding: 0 22px;margin-bottom: 10px; background-color: #cccc">${moduleMes.content}</div>
                <nav id="navigationNav" aria-label="Page navigation"
                     style="display: none;text-align: right;padding-right: 20px">
                    <ul class="pagination pagination-sm" id="articlePages">
                    </ul>
                </nav>
                <div style="text-align: right;height: 20px">
                    <div id="ckepop" style="float: right;margin-right: 20px">
                        <span class="jiathis_txt">分享到：</span>
                        <a class="jiathis_button_weixin">微信</a>
                        <a class="jiathis_button_qq">QQ</a>
                        <a class="jiathis_button_tsina">微博</a>
                        <%--<a href="http://www.jiathis.com/share"
                           class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank">更多</a>
                        <a class="jiathis_counter_style"></a>--%>
                    </div>
                    <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=1"
                            charset="utf-8"></script>
                </div>
                <div style="padding: 0 22px;margin-bottom: 20px;">
                    <p>
                        上一篇：
                        <c:if test="${not empty topModuleMes}">
                            <a href="${pageContext.request.contextPath }/admin/moduleMes/info/${topModuleMes.id}"> ${topModuleMes.title}</a>
                        </c:if>
                        <c:if test="${ empty topModuleMes}">
                            无
                        </c:if>
                    </p>
                    <p>
                        下一篇：
                        <c:if test="${not empty lastModuleMes}">
                            <a href="${pageContext.request.contextPath }/admin/moduleMes/info/${lastModuleMes.id}"> ${lastModuleMes.title}</a>
                        </c:if>
                        <c:if test="${ empty lastModuleMes}">
                            无
                        </c:if>
                    </p>
                </div>
            </div>
        </div>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/website/moduleMes_list.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

