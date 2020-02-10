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
        <a href="javascript:" data-addtab="side-institution-list"
           url="${pageContext.request.contextPath }/admin/serviceOrg/ConsoleManager/ShowConsoleManage"
           title="控制台管理"><i
                class="fa fa-desktop"></i> 控制台管理</a>
    </li>
    <li>
        <a href="javascript:" data-addtab="side-institution-list"
           url="${pageContext.request.contextPath }/admin/institution/list"
           title="基本信息管理"><i
                class="fa fa-building"></i> 基本信息管理</a>
    </li>
    <li>
        <a href="javascript:" title="从业人员管理">
            <i class="fa fa-openid "></i>
            <span class="title">从业人员管理</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu">
            <li>
                <a href="javascript:" data-addtab="side-userfuwu-list"
                   url="${pageContext.request.contextPath }/admin/user/fuwu/list?serviceOrgType=2"
                   title="从业人员管理"><i
                        class="fa fa-null"></i> 从业人员管理</a>
            </li>
            <li>
                <a href="javascript:" data-addtab="lrpggl-nlpgfzpz"
                   url="${pageContext.request.contextPath }/admin/user/fuwu/certificateList"
                   title="从业人员证书信息管理">
                    <i class="fa fa-null"></i> 从业人员证书信息管理
                </a>
            </li>
            <li>
                <a href="javascript:" data-addtab="lrpggl-nlpglb"
                   url="${pageContext.request.contextPath }/admin/user/fuwu/trainList"
                   title="从业人员培训信息管理">
                    <i class="fa fa-null"></i> 从业人员培训信息管理
                </a>
            </li>
            <li class="">
                <a href="javascript:" data-addtab="lrpggl-nlpglb"
                   url="${pageContext.request.contextPath }/admin/user/fuwu/prizeList"
                   title="从业人员获奖信息管理">
                    <i class="fa fa-null"></i> 从业人员获奖信息管理
                </a>
            </li>
            <li class="">
                <a href="javascript:" data-addtab="lrpggl-nlpglb"
                   url="${pageContext.request.contextPath }/admin/user/fuwu/quitList"
                   title="从业人员离职信息管理">
                    <i class="fa fa-null"></i> 从业人员离职信息管理
                </a>
            </li>
        </ul>
    </li>
    <li>
        <a href="javascript:" data-addtab="side-institution-elderly-list"
           url="${pageContext.request.contextPath }/admin/institution/elderly/list"
           title="在养人员管理"><i
                class="fa fa-laptop "></i> 在养人员管理</a>
    </li>
    <li>
        <a href="javascript:" data-addtab="lrpggl-nlpgfzpz"
           url="${pageContext.request.contextPath }/admin/serviceOrg/BedRoomManager/List"
           title="房间床位信息管理">
            <i class="fa fa-child"></i> 房间床位信息管理
        </a>
    </li>
    <li>
        <a href="javascript:" title="建设与运营补贴管理">
            <i class="fa fa-rss "></i>
            <span class="title">建设与运营补贴管理</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu">
            <li>
                <a href="javascript:" data-addtab="side-institution-subsidy-apply-1"
                   url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/apply?type=1&object=1"
                   title="机构建设补贴申请"><i
                        class="fa fa-null"></i> 建设补贴申请</a>
            <li>
         <%--   <li>
                <a href="javascript:" data-addtab="side-institution-subsidy-apply-2"
                   url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/apply?type=2&object=1"
                   title="机构运营补贴申请"><i
                        class="fa fa-null"></i> 机构运营补贴申请</a>
            </li>--%>
            <li>
                <a href="javascript:" data-addtab="side-serviceOrg-subsidy-jglist1"
                   url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/list?type=1&object=1"
                   title="机构建设补贴申请列表"><i
                        class="fa fa-null"></i> 建设补贴申请列表</a>
            </li>
            <li>
                <a href="javascript:" data-addtab="side-institution-subsidy-apply-institutional-1"
                   url="${pageContext.request.contextPath }/admin/api/serviceOrg/subsidy/mechanismAdd"
                   title="机构运营补贴申请"><i
                        class="fa fa-null"></i> 运营补贴申请</a>
            <li>
            <li>
                <a href="javascript:" data-addtab="side-institution-subsidy-apply-institutional-1"
                   url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/applyList?type=1&object=1"
                   title="机构运营补贴申请列表"><i
                        class="fa fa-null"></i> 运营补贴申请列表</a>
            <li>
        </ul>
    </li>
    <li>
        <a href="javascript:" data-addtab="side-institution-elderly-list"
           url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/starList?type=2&object=1"
           title="机构服务质量星级评定标准"><i
                class="fa fa-star"></i> 机构服务质量星级评定标准</a>
    </li>
</ul>
