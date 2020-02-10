<%--
  Created by IntelliJ IDEA.
  User: gengqiang
  Date: 2018/1/19
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ul class="page-sidebar-menu " data-auto-scroll="true" data-slide-speed="200">


        <%--<li>--%>
            <%--<a href="javascript:">--%>
                <%--<i class="fa fa-openid"></i>--%>
                <%--从业人员管理--%>
                <%--<span class="arrow"></span>--%>
            <%--</a>--%>
            <%--<ul class="sub-menu">--%>
                    <%--<li>--%>
                        <%--<a href="javascript:" data-addtab="lrpggl-nlpgxxxz"--%>
                           <%--url="${pageContext.request.contextPath }/admin/user/fuwu/list?serviceOrgType=1"--%>
                           <%--title="从业人员信息管理">--%>
                            <%--<i class="fa fa-null"></i> 从业人员信息管理</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="javascript:" data-addtab="lrpggl-nlpgfzpz"--%>
                           <%--url="${pageContext.request.contextPath }/admin/power/ability/insertOrUpdate"--%>
                           <%--title="从业人员健康记录">--%>
                            <%--<i class="fa fa-null"></i> 从业人员健康记录</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="javascript:" data-addtab="lrpggl-nlpglb"--%>
                           <%--url="${pageContext.request.contextPath }/admin/user/fuwu/feedbackList?serviceOrgType=1"--%>
                           <%--title="服务反馈信息管理">--%>
                            <%--<i--%>
                                    <%--class="fa fa-null"></i> 服务反馈信息管理</a>--%>
                    <%--</li>--%>
                    <%--<li class="">--%>
                        <%--<a href="javascript:;">--%>
                            <%--<i class="fa fa-null "></i>--%>
                            <%--<span class="title">从业人员服务记录</span>--%>
                            <%--<span class="arrow"></span>--%>
                        <%--</a>--%>
                        <%--<ul class="sub-menu" style="">--%>
                            <%--<li class="">--%>
                                <%--<a href="javascript:;" class="other" data-addtab="task_sc_record_list"--%>
                                   <%--url="${pageContext.request.contextPath }/admin/task/sc_record_list"--%>
                                   <%--title="市场工单服务记录">--%>
                                    <%--<i class="fa  fa-null"></i>--%>
                                    <%--<span class="title">市场工单服务记录</span>--%>
                                <%--</a>--%>
                            <%--</li>--%>
                            <%--<li class="">--%>
                                <%--<a href="javascript:;" class="other" data-addtab="task_jh_record_list"--%>
                                   <%--url="${pageContext.request.contextPath }/admin/task/jh_record_list"--%>
                                   <%--title="计划工单服务记录">--%>
                                    <%--<i class="fa  fa-null"></i>--%>
                                    <%--<span class="title">计划工单服务记录</span>--%>
                                <%--</a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
            <%--</ul>--%>
        <%--</li>--%>
    <li class="">
        <a href="javascript:">
            <i class="fa fa-location-arrow"></i>
            <span class="title">为老服务大数据中心
                </span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu" style="display: none;">
                <li>
                    <a href="javascript:">
                        <i class="fa fa-openid"></i>
                        老年人基础信息
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                            <li>
                                <a href="javascript:" data-addtab="elder_Info"
                                   url="${pageContext.request.contextPath }/admin/elderly/list"
                                   title="老人基础信息">
                                    <i class="fa fa-null"></i> 老人基础信息</a>
                            </li>
                            <li>
                                <a href="javascript:" data-addtab="tab_elderly_govbuy_list"
                                   url="${pageContext.request.contextPath }/admin/elderly/govbuy/list"
                                   title="政府购买信息">
                                    <i
                                            class="fa fa-null"></i> 政府购买信息</a>
                            </li>
                        <li>
                                <a href="javascript:" data-addtab="elder_deadInfo"
                                   url="${pageContext.request.contextPath }/admin/elderly/deadInfo"
                                   title="殡葬信息"><i
                                        class="fa fa-null"></i> 殡葬信息</a>
                            </li>
                     <li>
                                <a href="javascript:" data-addtab="elderly_statistics"
                                   url="${pageContext.request.contextPath }/admin/elderly/elderly_statistics"
                                   title="老人数据统计分析"><i
                                        class="fa fa-null"></i> 老人数据统计分析</a>
                            </li>
                    </ul>
                </li>
            <li>
                    <a href="javascript:"><i
                            class="fa   fa-life-saver (alias)"></i>
                        <span class="title">大数据地理信息</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                       <li>
                                <a href="javascript:" data-addtab="side-serviceOrg-map"
                                   url="${pageContext.request.contextPath }/admin/serviceOrgShow/map"
                                   title="服务组织地图"><i
                                        class="fa fa-null"></i> 服务组织地图</a>
                            </li>
                       <li>
                                <a href="javascript:" data-addtab="side-serviceOrg-list"
                                   url="${pageContext.request.contextPath }/admin/serviceOrgShow"
                                   title="养老服务组织"><i
                                        class="fa fa-null"></i> 养老服务组织</a>
                            </li>
                       <li>
                                <a href="javascript:" data-addtab="side-institution-map"
                                   url="${pageContext.request.contextPath }/admin/institution/map"
                                   title="养老机构地图"><i
                                        class="fa fa-null"></i> 养老机构地图</a>
                            </li>
                       <li class="">
                                <a href="javascript:" class="other" data-addtab="dispatch_map"
                                   url="${pageContext.request.contextPath }/admin/dispatch/map"
                                   title="资源调度视图">
                                    <i class="fa  fa-null"></i>
                                    <span class="title">资源调度视图</span>
                                </a>
                            </li>
                      <li>
                                <a href="javascript:" data-addtab="side-nurse-map"
                                   url="${pageContext.request.contextPath }/admin/nurse/map"
                                   title="智能看护视图"><i
                                        class="fa fa-null"></i> 智能看护视图</a>
                            </li>

                    </ul>
                </li>
        </ul>
    </li>

    <li>
        <a href="javascript:">
            <i class="fa fa-institution"></i>
            <span class="title">居家养老信息管理系统</span>
            <span class="arrow"></span>
        </a>

        <ul class="sub-menu">

            <li id="serviceOrgLi">
                <a href="javascript:" data-addtab="side-serviceOrg-list"
                   url="${pageContext.request.contextPath }/admin/serviceOrgShow"
                   title="养老服务组织"><i
                        class="fa fa-null"></i> 养老服务组织</a>
            </li>
            <li>
                <a href="javascript:" data-addtab="side-userfuwu-list"
                   url="${pageContext.request.contextPath }/admin/user/fuwu/list?serviceOrgType=1"
                   title="服务人员管理"><i
                        class="fa fa-null"></i> 服务人员管理</a>
            </li>
            <li>
                <a href="javascript:" data-addtab="side-serviceOrg-subsidy-apply-1"
                   url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/apply?type=1&object=2"
                   title="建设补贴申请"><i
                        class="fa fa-null"></i> 建设补贴申请</a>
            </li>
            <li>
                <a href="javascript:" data-addtab="side-serviceOrg-subsidy-apply-2"
                   url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/apply?type=2&object=2"
                   title="运营补贴申请"><i
                        class="fa fa-null"></i> 运营补贴申请</a>
            </li>
            <li>
                <a href="javascript:" data-addtab="side-serviceOrg-subsidy-list"
                   url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/list"
                   title="补贴申请列表"><i
                        class="fa fa-null"></i> 组织补贴申请列表</a>
            </li>
            <li>
                <a href="javascript:">
                    <i class="fa fa-full"></i>
                    <span class="title">入职补贴审批</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="javascript:" data-addtab="home-pro-employment-apply"
                           url="${pageContext.request.contextPath }/admin/entrySubsidy/apply"
                           title="入职补贴申请"><i
                                class="fa fa-null"></i>入职补贴申请</a>
                    </li>
                    <li>
                        <a href="javascript:" data-addtab="home-pro-employment-applyList"
                           url="${pageContext.request.contextPath }/admin/entrySubsidy/list"
                           title="入职补贴申请查询"><i
                                class="fa fa-null"></i>入职补贴申请查询</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:">
                    <i class="fa fa-full"></i>
                    <span class="title">资格补贴审批</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="javascript:" data-addtab="home-pro-qualifications-apply"
                           url="${pageContext.request.contextPath }/admin/qualSubsidy/apply"
                           title="资格补贴申请"><i
                                class="fa fa-null"></i>资格补贴申请</a>
                    </li>
                    <li>
                        <a href="javascript:" data-addtab="home-pro-qualifications-applyList"
                           url="${pageContext.request.contextPath }/admin/qualSubsidy/list"
                           title="资格补贴申请查询"><i
                                class="fa fa-null"></i>资格补贴申请查询</a>
                    </li>
                    <li>
                        <a href="javascript:" data-addtab="home-pro-qualifications-statistics"
                           url="${pageContext.request.contextPath }/admin/qualSubsidy/statistics"
                           title="资格补贴申请统计"><i
                                class="fa fa-null"></i>资格补贴申请统计</a>
                    </li>

                </ul>
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
            <li>
                <a href="javascript:" data-addtab="side-serviceOrg-socialdonation"
                   url="${pageContext.request.contextPath }/admin/api/power/socialDonation/communityDonationList"
                   title="社会捐赠信息管理"><i
                        class="fa fa-null"></i> 社会捐赠信息管理</a>
            </li>
            <li>
                <a href="javascript:" data-addtab="side-serviceOrg-socialwork"
                   url="${pageContext.request.contextPath }/admin/api/power/socialWork/communityServiceList"
                   title="社会服务信息管理"><i
                        class="fa fa-null"></i> 社会服务信息管理</a>
            </li>
            <li>
                <a href="javascript:" data-addtab="side-serviceOrg-emergency"
                   url="${pageContext.request.contextPath }/admin/api/org/emergencyManagement/emergencyList"
                   title="突发事件信息管理"><i
                        class="fa fa-null"></i> 突发事件信息管理</a>
            </li>
            <li>
                <a href="javascript:" data-addtab="side-serviceOrg-happy"
                   url="${pageContext.request.contextPath }/admin/api/power/bill/happyList"
                   title="文娱活动信息管理"><i
                        class="fa fa-null"></i> 文娱活动信息管理</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="javascript:" data-addtab="side-serviceOrg-warehouse"
           url="${pageContext.request.contextPath }/admin/serviceOrg/wareHouse/list"
           title="仓库物品入出库信息管理"><i
                class="fa fa-th-list"></i> 仓库物品入出库信息管理</a>
    </li>
    <%--<li>--%>
        <%--<a href="javascript:" data-addtab="side-serviceOrg-socialdonation"--%>
           <%--url="${pageContext.request.contextPath }/admin/api/power/socialDonation/communityDonationList"--%>
           <%--title="社会捐赠信息管理"><i--%>
                <%--class="fa fa-signal"></i> 社会捐赠信息管理</a>--%>
    <%--</li>--%>
    <%--<li>--%>
        <%--<a href="javascript:" data-addtab="side-serviceOrg-socialwork"--%>
           <%--url="${pageContext.request.contextPath }/admin/api/power/socialWork/communityServiceList"--%>
           <%--title="社会服务信息管理"><i--%>
                <%--class="fa fa-power-off"></i> 社会服务信息管理</a>--%>
    <%--</li>--%>
    <%--<li>--%>
        <%--<a href="javascript:" data-addtab="side-serviceOrg-happy"--%>
           <%--url="${pageContext.request.contextPath }/admin/api/power/bill/happyList"--%>
           <%--title="文娱活动信息管理"><i--%>
                <%--class="fa fa-bookmark"></i> 文娱活动信息管理</a>--%>
    <%--</li>--%>


    <li>
        <a href="javascript:;" data-addtab="side-orgAssessShow"
           url="${pageContext.request.contextPath }/admin/orgAssessShow"
           title="养老组织评估">
            <i class="fa  fa-check"></i>
            <span class="title">养老组织评估</span>
        </a>
    </li>
    <li>
        <a href="javascript:">
            <i class="fa fa-tasks"></i>
            <span class="title">工单派遣系统</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu">
            <li>
                <a href="javascript:;" data-addtab="task_send"
                   url="${pageContext.request.contextPath }/admin/task/send"
                   title="发送工单"><i
                        class="fa fa-null"></i> 发送工单</a>
            </li>
            <li>
                <a href="javascript:;" data-addtab="task_receive"
                   url="${pageContext.request.contextPath }/admin/task/receive_list"
                   title="接收工单"><i
                        class="fa fa-null"></i> 接收工单</a>
            </li>
            <li>
                <a href="javascript:;" data-addtab="task_send_list"
                   url="${pageContext.request.contextPath }/admin/task/send_list"
                   title="已发送"><i
                        class="fa fa-null"></i> 已发送</a>
            </li>
            <li>
                <a href="javascript:;" data-addtab="task_list"
                   url="${pageContext.request.contextPath }/admin/task/task_list"
                   title="工单统计"> <i
                        class="fa fa-null"></i> 工单统计</a>
            </li>
        </ul>
    </li>
    <li class="">
        <a href="javascript:;" href="javascript:">
            <i class="fa icon-layers "></i>
            <span class="title"> 服务资源调度系统</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu" style="">
            <li class="">
                <a href="javascript:;" class="other" data-addtab="dispatch_map"
                   url="${pageContext.request.contextPath }/admin/dispatch/map"
                   title="资源调度视图">
                    <i class="fa  fa-null"></i>
                    <span class="title">资源调度视图</span>
                </a>
            </li>
            <li class="">
                <a href="javascript:;" class="other" data-addtab="side_task_supervise"
                   url="${pageContext.request.contextPath }/admin/task/task_supervise"
                   title="工单监管">
                    <i class="fa  fa-null"></i>
                    <span class="title">工单监管</span>
                </a>
            </li>
            <li class="">
                <a href="javascript:;" class="other" data-addtab="task_app_statistics"
                   url="${pageContext.request.contextPath }/admin/task/task_statistics"
                   title="数据统计">
                    <i class="fa  fa-null"></i>
                    <span class="title">数据统计</span>
                </a>
            </li>
            <li class="">
                <a href="javascript:;" class="other"
                   data-addtab="task_serviceOrg_money_info"
                   url="${pageContext.request.contextPath }/admin/task/task_serviceOrg_money_info"
                   title="组织资金动向">
                    <i class="fa  fa-null"></i> 组织资金动向
                </a>
            </li>
        </ul>
    </li>
            <li class="">
                <a href="javascript:;" href="javascript:">
                    <i class="fa fa-video-camera "></i>
                    <span class="title"> 旅居养老</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu" style="">
                    <li>
                        <a href="javascript:" data-addtab="monitor-zz-manager-info"
                           url="${pageContext.request.contextPath }/admin/api/org/sojournManage/elderlyNeedsDistribution"
                           title="旅居老人需求发放"><i class="fa fa-bars"></i> 旅居老人需求发放</a>
                    </li>
                    <li>
                        <a href="javascript:" data-addtab="monitor-zz-manager-info"
                           url="${pageContext.request.contextPath }/admin/api/org/sojournManage/elderlyNeedsList"
                           title="旅居老人需求管理"><i class="fa fa-cubes"></i> 旅居老人需求管理</a>
                    </li>
                </ul>
            </li>
    <li>
        <a href="javascript:">
            <i class="icon-settings"></i>
            <span class="title">系统管理</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu">
            <li class="">
                <a href="javascript:">
                    <i class="icon-users"></i>
                    <span class="title">用户管理</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="javascript:;" data-addtab="user_list"
                           url="${pageContext.request.contextPath }/admin/user/list"
                           title="用户列表"><i
                                class="fa fa-null"></i> 用户列表</a>
                    </li>
                    <li>
                        <a href="javascript:;" data-addtab="user_add"
                           url="${pageContext.request.contextPath }/admin/user/add"
                           title="添加用户"><i
                                class="fa fa-null"></i> 添加用户</a>
                    </li>
                </ul>
            </li>
        </ul>
    </li>
</ul>
