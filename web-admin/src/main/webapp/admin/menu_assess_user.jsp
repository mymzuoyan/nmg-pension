<%--
  Created by IntelliJ IDEA.
  User: gengqiang
  Date: 2018/1/19
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ul class="page-sidebar-menu " data-auto-scroll="true" data-slide-speed="200">
    <li>
        <a href="javascript:" data-addtab="side-institution-elderly-list"
           url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/starList?type=2&object=1"
           title="机构服务质量星级评定标准"><i
                class="fa fa-star"></i> 机构服务质量星级评定标准</a>
    </li>
    <li>
        <a href="javascript:" data-addtab="side-institution-elderly-list"
           url="${pageContext.request.contextPath }/admin/institution/org/communityPensionStarsList"
           title="社区养老服务站星级评定"><i
                class="fa fa-star"></i> 社区养老服务站星级评定</a>
    </li>
    <li>
        <a href="javascript:" data-addtab="side-institution-elderly-list"
           url="${pageContext.request.contextPath }/admin/institution/org/areaHomePensionStarsList"
           title="区域性居家养老服务中心星级评定"><i
                class="fa fa-star"></i> 区域性居家养老服务中心星级评定</a>
    </li>
</ul>
