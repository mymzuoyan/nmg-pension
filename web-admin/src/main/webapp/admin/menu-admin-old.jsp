<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: gengqiang
  Date: 2018/1/23
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ul class="page-sidebar-menu " data-auto-scroll="true" data-slide-speed="200">
    <shiro:hasPermission name="elderly">
        <li class="">
            <a href="javascript:">
                <i class="fa fa-location-arrow"></i>
                <span class="title">为老服务大数据中心
                </span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu" style="display: none;">
                <shiro:hasPermission name="elderly-elderlyMsg">
                    <li>
                        <a href="javascript:">
                            <i class="fa fa-openid"></i>
                            老人档案管理
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <shiro:hasPermission name="elderly-elderlyMsg-elderlyInfo">
                                <li>
                                    <a href="javascript:" data-addtab="elder_Info"
                                       url="${pageContext.request.contextPath }/admin/elderly/list"
                                       title="老人基础信息">
                                        <i class="fa fa-null"></i> 老人基础信息</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="elderly-elderlyMsg-elderGoveInfo">
                                <li>
                                    <a href="javascript:" data-addtab="tab_elderly_govbuy_list"
                                        <%-- url="${pageContext.request.contextPath }/admin/elderly/govbuy/list"--%>
                                       url="${pageContext.request.contextPath }/admin/elderly/govbuyfw/list"
                                       title="政府购买信息">
                                        <i
                                                class="fa fa-null"></i> 政府购买信息</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="elderly-elderlyMsg-elderDeadInfo">
                                <li>
                                    <a href="javascript:" data-addtab="elder_deadInfo"
                                       url="${pageContext.request.contextPath }/admin/elderly/deadInfo"
                                       title="殡葬信息"><i
                                            class="fa fa-null"></i> 殡葬信息</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="elderly-elderlyMsg-data-statistic-elder">
                                <li>
                                    <a href="javascript:" data-addtab="elderly_statistics"
                                       url="${pageContext.request.contextPath }/admin/elderly/elderly_statistics"
                                       title="老人数据统计分析"><i
                                            class="fa fa-null"></i> 老人数据统计分析</a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="BigDataGeographicInformation">
                    <li>
                        <a href="javascript:"><i
                                class="fa   fa-life-saver (alias)"></i>
                            <span class="title">大数据地理信息</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <shiro:hasPermission name="data-map-service-org">
                                <li>
                                    <a href="javascript:" data-addtab="side-serviceOrg-map"
                                       url="${pageContext.request.contextPath }/admin/serviceOrgShow/map"
                                       title="服务组织地图"><i
                                            class="fa fa-null"></i> 服务组织地图</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="home-pro-manager-system-person-service-org">
                                <li>
                                    <a href="javascript:" data-addtab="side-serviceOrg-list"
                                       url="${pageContext.request.contextPath }/admin/serviceOrgShow"
                                       title="养老服务组织"><i
                                            class="fa fa-null"></i> 养老服务组织</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="data-map-institution">
                                <li>
                                    <a href="javascript:" data-addtab="side-institution-map"
                                       url="${pageContext.request.contextPath }/admin/institution/map"
                                       title="养老机构地图"><i
                                            class="fa fa-null"></i> 养老机构地图</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="data-map-dispatch">
                                <li class="">
                                    <a href="javascript:" class="other" data-addtab="dispatch_map"
                                       url="${pageContext.request.contextPath }/admin/dispatch/map"
                                       title="资源调度视图">
                                        <i class="fa  fa-null"></i>
                                        <span class="title">资源调度视图</span>
                                    </a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="data-map-nurse">
                                <li>
                                    <a href="javascript:" data-addtab="side-nurse-map"
                                       url="${pageContext.request.contextPath }/admin/nurse/map"
                                       title="智能看护视图"><i
                                            class="fa fa-null"></i> 智能看护视图</a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>
            </ul>
        </li>
    </shiro:hasPermission>


    <shiro:hasPermission name="lrpggl">
        <li class="">
            <a href="javascript:">
                <i class="fa fa-crop"></i>
                <span class="title">老人评估系统
            </span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu" style="display: none;">
                <shiro:hasPermission name="lrpggl-nlpgxxwcdpz">
                    <li>
                        <a href="javascript:" data-addtab="lrpggl-nlpgxxxz"
                           url="${pageContext.request.contextPath }/admin/api/power/wcdfzsz/detail"
                           title="能力评估信息完成度配置">
                            <i class="fa fa-null"></i> 能力评估信息完成度配置</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="lrpggl-nlpgfzpz">
                    <li>
                        <a href="javascript:" data-addtab="lrpggl-nlpgfzpz"
                           url="${pageContext.request.contextPath }/admin/power/ability/insertOrUpdate"
                           title="能力评估分值配置">
                            <i class="fa fa-null"></i> 能力评估分值配置</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="lrpggl-nlpglb">
                    <li>
                        <a href="javascript:" data-addtab="lrpggl-nlpglb"
                           url="${pageContext.request.contextPath }/admin/api/power/wcdfzsz/catacityList"
                           title="能力评估列表">
                            <i
                                    class="fa fa-null"></i> 能力评估列表</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="lrpggl-assessor-list">
                    <li>
                        <a href="javascript:" data-addtab="lrpggl-assessor"
                           url="${pageContext.request.contextPath }/admin/api/power/assessor/assessorList"
                           title="评估员列表"><i
                                class="fa fa-null"></i> 评估员列表</a>
                    </li>
                </shiro:hasPermission>
            </ul>
        </li>
    </shiro:hasPermission>


    <shiro:hasPermission name="person-institution-manager">
        <li class="">
            <a href="javascript:" class="other">
                <i class="fa   fa-building"></i>
                <span class="title">机构养老信息管理</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <shiro:hasPermission name="person-institution-manager-list">
                    <li>
                        <a href="javascript:" data-addtab="side-institution-list"
                           url="${pageContext.request.contextPath }/admin/institution/list"
                           title="养老机构列表"><i
                                class="fa fa-null"></i> 养老机构列表</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="person-institution-manager-staffManager">
                    <li>
                        <a href="javascript:" data-addtab="side-userfuwu-list"
                           url="${pageContext.request.contextPath }/admin/user/fuwu/list?serviceOrgType=2"
                           title="工作人员管理"><i
                                class="fa fa-null"></i> 工作人员管理</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="person-institution-manager-elderManager">
                    <li>
                        <a href="javascript:" data-addtab="side-institution-elderly-list"
                           url="${pageContext.request.contextPath }/admin/institution/elderly/list"
                           title="在养人员管理"><i
                                class="fa fa-null"></i> 在养人员管理</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="person-institution-manager-subsidyList">
                    <li>
                        <a href="javascript:" data-addtab="side-institution-subsidy-list"
                           url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/list?object=1"
                           title="机构补贴申请列表"><i
                                class="fa fa-null"></i> 机构补贴申请列表</a>
                    </li>
                    <li>
                        <a href="javascript:" data-addtab="side-institution-subsidy-statistic"
                           url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/statistic?type=2&object=1"
                           title="机构补贴统计分析"><i
                                class="fa fa-null"></i> 机构补贴统计分析</a>
                    </li>
                </shiro:hasPermission>
            </ul>
        </li>
    </shiro:hasPermission>
    <shiro:hasPermission name="home-pro-manager-system">
        <li>
            <a href="javascript:">
                <i class="fa fa-institution"></i>
                <span class="title">居家(社区)养老服务中心</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <shiro:hasPermission name="home-pro-manager-system-person-service-org">
                    <li id="serviceOrgLi">
                        <a href="javascript:" data-addtab="side-serviceOrg-list"
                           url="${pageContext.request.contextPath }/admin/serviceOrgShow"
                           title="养老服务组织"><i
                                class="fa fa-null"></i> 养老服务组织</a>
                    </li>
                </shiro:hasPermission>
                <li>
                    <a href="javascript:" data-addtab="side-serviceOrg-statistics"
                       url="${pageContext.request.contextPath }/admin/serviceOrgShow/statistics"
                       title="服务组织统计分析"><i
                            class="fa fa-null"></i> 服务组织统计分析</a>
                </li>
                <shiro:hasPermission name="home-pro-manager-system-subsidyList">
                    <li>
                        <a href="javascript:" data-addtab="side-serviceOrg-subsidy-list"
                           url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/list?object=2"
                           title="组织补贴申请列表"><i
                                class="fa fa-null"></i> 组织补贴申请列表</a>
                    </li>
                </shiro:hasPermission>
                <li>
                    <a href="javascript:" data-addtab="side-serviceOrg-subsidy-statistic"
                       url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/statistic?type=2&object=2"
                       title="组织补贴统计分析"><i
                            class="fa fa-null"></i> 组织补贴统计分析</a>
                </li>
                <li>
                    <a href="javascript:" data-addtab="side-serviceOrg-comment"
                       url="${pageContext.request.contextPath }/admin/serviceOrg/comment/list?type=1"
                       title="评价管理"><i
                            class="fa fa-null"></i> 评价管理</a>
                </li>
                <li>
                    <a href="javascript:" data-addtab="side-serviceOrg-warehouse"
                       url="${pageContext.request.contextPath }/admin/serviceOrg/wareHouse/list"
                       title="仓库管理"><i
                            class="fa fa-null"></i> 仓库管理</a>
                </li>
                <shiro:hasPermission name="home-pro-manager-system-service-org-count">
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
                </shiro:hasPermission>
                <shiro:hasPermission name="home-pro-manager-system-service-org-happy">
                    <li>
                        <a href="javascript:" data-addtab="side-serviceOrg-happy"
                           url="${pageContext.request.contextPath }/admin/api/power/bill/happyList"
                           title="文娱活动信息管理"><i
                                class="fa fa-null"></i> 文娱活动信息管理</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="home-pro-manager-system-service-org-emergency">
                    <li>
                        <a href="javascript:" data-addtab="side-serviceOrg-emergency"
                           url="${pageContext.request.contextPath }/admin/api/org/emergencyManagement/emergencyList"
                           title="突发事件信息管理"><i
                                class="fa fa-null"></i> 突发事件信息管理</a>
                    </li>
                </shiro:hasPermission>
            </ul>
        </li>
    </shiro:hasPermission>
    <li>
        <a href="javascript:" title="补助管理">
            <i class="fa fa-rss "></i>
            <span class="title">补助管理</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu">
            <li>
                <a href="javascript:">
                    <i class="fa fa-institution"></i>
                    建设补助管理
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="javascript:" data-addtab="side-institution-subsidy-apply-1"
                           url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/apply?type=1&object=1"
                           title="机构建设补助申请"><i
                                class="fa fa-null"></i> 机构建设补助申请</a>
                    <li>
                    <li>
                        <a href="javascript:" data-addtab="side-serviceOrg-subsidy-apply-1"
                           url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/apply?type=1&object=2"
                           title="组织建设补助申请"><i
                                class="fa fa-null"></i> 组织建设补助申请</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:">
                    <i class="fa fa-openid"></i>
                    运营补贴管理
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="javascript:" data-addtab="side-institution-subsidy-apply-2"
                           url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/apply?type=2&object=1"
                           title="机构运营补贴申请"><i
                                class="fa fa-null"></i> 机构运营补贴申请</a>
                    </li>
                    <li>
                        <a href="javascript:" data-addtab="side-serviceOrg-subsidy-apply-2"
                           url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/apply?type=2&object=2"
                           title="组织运营补贴申请"><i
                                class="fa fa-null"></i> 组织运营补贴申请</a>
                    </li>
                </ul>
            </li>
        </ul>
    </li>
    <li>
        <a href="javascript:" title="服务质量监督管理">
            <i class="fa fa-cloud "></i>
            <span class="title">服务质量监督管理</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu">
            <li>
                <a href="javascript:" data-addtab="side-serviceOrg-comment"
                   url="${pageContext.request.contextPath }/admin/serviceOrg/comment/list?type=1"
                   title="评价管理"><i
                        class="fa fa-cutlery"></i> 评价管理</a>
            </li>
            <li>
                <a href="javascript:">
                    <i class="fa fa-turkish-lira"></i>
                    <span class="title"> 等级评估</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <shiro:hasPermission name="serviceOrgSup-orgAssess-orgAssessShow">
                        <li>
                            <a href="javascript:" data-addtab="side-orgAssessShow"
                               url="${pageContext.request.contextPath }/admin/orgAssessShow"
                               title="养老组织评估列表">
                                <i class="fa  fa-null" style=""></i>
                                养老组织评估列表
                            </a>
                        </li>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="serviceOrgSup-orgAssess-orgAssessStatistic">
                        <li>
                            <a href="javascript:" data-addtab="side-orgAssess-statistic"
                               url="${pageContext.request.contextPath }/admin/orgAssess/statistic"
                               title="养老组织评估统计">
                                <i class="fa  fa-null" style=""></i>
                                养老组织评估统计
                            </a>
                        </li>
                    </shiro:hasPermission>
                </ul>
            </li>

            <li class="">
                <a href="javascript:">
                    <i class="fa fa-location-arrow "></i>
                    <span class="title">诚信管理系统</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu" style="display: none;">
                    <shiro:hasPermission name="expourse">
                        <li class="">
                            <a href="javascript:">
                                <i class="fa fa-location-arrow "></i>
                                <span class="title">曝光台</span>
                                <span class="arrow"></span>
                            </a>
                            <ul class="sub-menu" style="display: none;">
                                <li>
                                    <shiro:hasPermission name="expourse-list">
                                        <a href="javascript:;" data-addtab="integrity_exposure"
                                           url="${pageContext.request.contextPath }/admin/api/showInfoExpourse">
                                            <i class="fa fa-null"></i>
                                            曝光台列表
                                        </a>
                                    </shiro:hasPermission>
                                    <shiro:hasPermission name="expourse-showList">
                                        <a href="javascript:;" data-addtab="integrity_exposure_things"
                                           url="${pageContext.request.contextPath }/admin/api/showInfoExpourseThings">
                                            <i class="fa  fa-null"></i>
                                            曝光台事迹列表
                                        </a>
                                    </shiro:hasPermission>
                                    <shiro:hasPermission name="integrity-system-publish">
                                        <a href="javascript:;" data-addtab="integrity_exposure_add"
                                           url="${pageContext.request.contextPath }/admin/api/publishIntegrity">
                                            <i class="fa  fa-null"></i>
                                            发布曝光
                                        </a>
                                    </shiro:hasPermission>
                                </li>
                            </ul>
                        </li>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="glory">
                        <li>
                            <a href="javascript:">
                                <i class="fa fa-institution"></i>
                                光荣榜
                                <span class="arrow"></span>
                            </a>
                            <ul class="sub-menu">
                                <shiro:hasPermission name="glory-list">
                                    <li>
                                        <a href="javascript:;" data-addtab="integrity_glory"
                                           url="${pageContext.request.contextPath }/admin/api/showInfoGlory"
                                           title="光荣榜"><i
                                                class="fa fa-null"></i> 光荣榜列表</a>
                                    </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="glory-showList">
                                    <li>
                                        <a href="javascript:;" data-addtab="integrity_exposure_add"
                                           url="${pageContext.request.contextPath }/admin/api/showInfoGloryThings"
                                           title="光荣榜事迹列表"><i
                                                class="fa fa-null"></i> 光荣榜事迹列表</a>
                                    </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="integrity-system-publish">
                                    <li>
                                        <a href="javascript:;" data-addtab="integrity_exposure_add"
                                           url="${pageContext.request.contextPath }/admin/api/publishIntegrity"
                                           title="光荣榜"><i
                                                class="fa fa-null"></i> 发布光荣榜</a>
                                    </li>
                                </shiro:hasPermission>
                            </ul>
                        </li>
                    </shiro:hasPermission>
                </ul>
            </li>
        </ul>
    </li>


    <shiro:hasPermission name="help-elderly-card-system">
        <li>
            <a href="javascript:" title="助老卡刷卡系统">
                <i class="fa fa-credit-card "></i>
                <span class="title">助老卡刷卡系统</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <li>
                    <a href="http://117.71.61.79:30007/ecard" data-addtab="healthManage" target="_blank"
                       title="银通消费一卡通管理平台"><i
                            class="fa fa-null"></i> 一卡通管理平台</a>
                </li>
                <shiro:hasPermission name="lrpggl-oldmancard-list">
                    <li>
                        <a href="javascript:" data-addtab="tab_pggl-oldmancard"
                           url="${pageContext.request.contextPath }/admin/api/power/oldmancard/list"
                           title="老人绑卡管理"><i
                                class="fa fa-null"></i> 老人绑卡管理</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="billInfo">
                    <li>
                        <a href="javascript:" data-addtab="bill_list"
                           url="${pageContext.request.contextPath }/admin/api/power/bill/billList"
                           title="订单管理"><i
                                class="fa fa-null"></i> 订单管理</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="moneyflow_list">
                    <li>
                        <a href="javascript:" data-addtab="tab_moneyflow_list"
                           url="${pageContext.request.contextPath }/admin/api/power/wcdfzsz/tomoneyflowList"
                           title="助老卡资金流水列表">
                            <i
                                    class="fa fa-null"></i> 助老卡资金流水列表</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="serviceOrg_cashPool_list">
                    <li>
                        <a href="javascript:" data-addtab="tab_serviceOrg_cashPool_list"
                           url="${pageContext.request.contextPath }/admin/api/power/cashPool/serviceOrg_cashPool_list"
                           title="资金池列表">
                            <i class="fa fa-null"></i> 资金池列表</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="cashPool_list">
                    <li>
                        <a href="javascript:" data-addtab="tab_cashPool_list"
                           url="${pageContext.request.contextPath }/admin/api/power/cashPool/list"
                           title="资金池流水列表">
                            <i class="fa fa-null"></i> 资金池流水列表</a>
                    </li>
                </shiro:hasPermission>


                    <%--<li>--%>
                    <%--<a href="javascript:" data-addtab="tab_for_org_card_list"--%>
                    <%--url="${pageContext.request.contextPath }/admin/org/card/list"--%>
                    <%--title="刷卡数据"><i--%>
                    <%--class="fa fa-null"></i> 刷卡数据</a>--%>
                    <%--</li>--%>


            </ul>
        </li>
    </shiro:hasPermission>

    <shiro:hasPermission name="government">
        <li class="">
            <a href="javascript:">
                <i class="fa fa-location-arrow"></i>
                <span class="title">政务工作平台
                </span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu" style="display: none;">
                <shiro:hasPermission name="gov-approve">
                    <li>
                        <a href="javascript:">
                            <i class="fa fa-openid"></i>
                            审批
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                                <%--<shiro:hasPermission name="gov-approve-cityAndTown">--%>
                                <%--<li>--%>
                                <%--<a href="javascript:" data-addtab="city_And_Town"--%>
                                <%--&lt;%&ndash;url="${pageContext.request.contextPath }/admin/elderly/list"&ndash;%&gt;--%>
                                <%--title="特困人员审批">--%>
                                <%--<i class="fa fa-null"></i> 特困人员审批</a>--%>
                                <%--</li>--%>
                                <%--</shiro:hasPermission>--%>
                            <shiro:hasPermission name="pggl-tklrgl-gysqlb">
                                <li>
                                    <a href="javascript:" data-addtab="elderly_gysq_list"
                                       url="${pageContext.request.contextPath }/admin/elderly/poor/list"
                                       title="特困人员申请列表">
                                        <i class="fa fa-null"></i> 特困人员申请列表</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="pggl-tklrgl-gysqdblb">
                                <li>
                                    <a href="javascript:" data-addtab="elderly_gydb_list"
                                       url="${pageContext.request.contextPath }/admin/elderly/poor/handle/list"
                                        <%--title="特困人员审批">--%>
                                        <%--<i--%>
                                        <%--class="fa fa-null"></i> 特困人员审批</a>--%>
                                        <%--url="${pageContext.request.contextPath }/admin/elderly/list"--%>
                                       title="城乡特困人员审批">
                                        <i class="fa fa-null"></i> 城乡特困人员审批</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="gov-approve-buyServer">
                                <li>
                                    <a href="javascript:" data-addtab="tab_gov_buyServer"
                                       url="${pageContext.request.contextPath }/admin/elderly/govbuyfw/listsp"
                                       title="政府购买服务审批">
                                        <i
                                                class="fa fa-null"></i> 政府购买服务审批</a>
                                </li>
                            </shiro:hasPermission>

                            <shiro:hasPermission name="person-institution-manager-subsidyList">
                                <li>
                                    <a href="javascript:" data-addtab="side-institution-subsidy-list"
                                       url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/list?object=1"
                                       title="机构补贴申请列表"><i
                                            class="fa fa-null"></i> 机构补贴申请列表</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="home-pro-manager-system-subsidyList">
                                <li>
                                    <a href="javascript:" data-addtab="side-serviceOrg-subsidy-list"
                                       url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/list?object=2"
                                       title="补贴申请列表"><i
                                            class="fa fa-null"></i> 组织补贴申请列表</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="home-pro-employment-subsidyList">
                                <li>
                                    <a href="javascript:">
                                        <i class="fa fa-full"></i>
                                        入职补贴审批
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <shiro:hasPermission name="home-pro-employment-apply">
                                            <li>
                                                <a href="javascript:" data-addtab="home-pro-employment-apply"
                                                   url="${pageContext.request.contextPath }/admin/entrySubsidy/apply"
                                                   title="入职补贴申请"><i
                                                        class="fa fa-null"></i>入职补贴申请</a>
                                            </li>
                                        </shiro:hasPermission>
                                        <shiro:hasPermission name="home-pro-employment-applyList">
                                            <li>
                                                <a href="javascript:" data-addtab="home-pro-employment-applyList"
                                                   url="${pageContext.request.contextPath }/admin/entrySubsidy/list"
                                                   title="入职补贴申请查询"><i
                                                        class="fa fa-null"></i>入职补贴申请查询</a>
                                            </li>
                                        </shiro:hasPermission>
                                    </ul>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="home-pro-qualifications-subsidyList">
                                <li>
                                    <a href="javascript:">
                                        <i class="fa fa-full"></i>
                                        资格补贴审批
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <shiro:hasPermission name="home-pro-qualifications-apply">
                                            <li>
                                                <a href="javascript:" data-addtab="home-pro-qualifications-apply"
                                                   url="${pageContext.request.contextPath }/admin/qualSubsidy/apply"
                                                   title="资格补贴申请"><i
                                                        class="fa fa-null"></i>资格补贴申请</a>
                                            </li>
                                        </shiro:hasPermission>
                                        <shiro:hasPermission name="home-pro-qualifications-applyList">
                                            <li>
                                                <a href="javascript:" data-addtab="home-pro-qualifications-applyList"
                                                   url="${pageContext.request.contextPath }/admin/qualSubsidy/list"
                                                   title="资格补贴申请查询"><i
                                                        class="fa fa-null"></i>资格补贴申请查询</a>
                                            </li>
                                        </shiro:hasPermission>
                                        <shiro:hasPermission name="home-pro-qualifications-statistics">
                                            <li>
                                                <a href="javascript:" data-addtab="home-pro-qualifications-statistics"
                                                   url="${pageContext.request.contextPath }/admin/qualSubsidy/statistics"
                                                   title="资格补贴申请统计"><i
                                                        class="fa fa-null"></i>资格补贴申请统计</a>
                                            </li>
                                        </shiro:hasPermission>
                                    </ul>
                                </li>
                            </shiro:hasPermission>
                                <%-- <shiro:hasPermission name="gov-approve-subsidies">
                                     <li>
                                         <a href="javascript:" data-addtab="gov_approve_subsidies"
                                            url="${pageContext.request.contextPath }/admin/elderly/deadInfo"
                                            title="入职补贴审批"><i
                                                 class="fa fa-null"></i> 入职补贴审批</a>
                                     </li>
                                 </shiro:hasPermission>
                                 <shiro:hasPermission name="zigebutie">
                                     <li>
                                         <a href="javascript:" data-addtab="gov_approve_zizhi"
                                            url="${pageContext.request.contextPath }/admin/elderly/elderly_statistics"
                                            title="资格补贴审批"><i
                                                 class="fa fa-null"></i>资格补贴审批</a>
                                     </li>
                                 </shiro:hasPermission>--%>
                        </ul>
                    </li>
                </shiro:hasPermission>
                    <%--<shiro:hasPermission name="kaohedata">--%>
                    <%--<li>--%>
                    <%--<a href="javascript:"><i--%>
                    <%--class="fa   fa-life-saver (alias)"></i>--%>
                    <%--<span class="title">各类考核数据</span>--%>
                    <%--<span class="arrow"></span>--%>
                    <%--</a>--%>
                    <%--<ul class="sub-menu">--%>
                    <%--<shiro:hasPermission name="data-map-service-org">--%>
                    <%--<shiro:hasPermission name="gov-approve-subsidies">--%>
                    <%--<li>--%>
                    <%--<a href="javascript:" data-addtab="gov_approve_subsidies"--%>
                    <%--&lt;%&ndash;url="${pageContext.request.contextPath }/admin/elderly/deadInfo"&ndash;%&gt;--%>
                    <%--title="入职补贴审批"><i--%>
                    <%--class="fa fa-null"></i> 入职补贴审批</a>--%>
                    <%--</li>--%>
                    <%--</shiro:hasPermission>--%>
                    <%--<shiro:hasPermission name="zigebutie">--%>
                    <%--<li>--%>
                    <%--<a href="javascript:" data-addtab="gov_approve_zizhi"--%>
                    <%--&lt;%&ndash;url="${pageContext.request.contextPath }/admin/elderly/elderly_statistics"&ndash;%&gt;--%>
                    <%--title="资格补贴审批"><i--%>
                    <%--class="fa fa-null"></i>资格补贴审批</a>--%>
                    <%--</li>--%>
                    <%--</shiro:hasPermission>--%>
                    <%--</ul>--%>
                    <%--</li>--%>
                    <%--</shiro:hasPermission>--%>
                    <%--<shiro:hasPermission name="kaohedata">--%>
                    <%--<li>--%>
                    <%--<a href="javascript:"><i--%>
                    <%--class="fa   fa-life-saver (alias)"></i>--%>
                    <%--<span class="title">各类考核数据</span>--%>
                    <%--<span class="arrow"></span>--%>
                    <%--</a>--%>
                    <%--<ul class="sub-menu">--%>
                    <%--&lt;%&ndash;<shiro:hasPermission name="data-map-service-org">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<li>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<a href="javascript:" data-addtab="side-serviceOrg-map"&ndash;%&gt;--%>
                    <%--&lt;%&ndash;title="服务组织地图"><i&ndash;%&gt;--%>
                    <%--&lt;%&ndash;class="fa fa-null"></i> 服务组织地图</a>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</shiro:hasPermission>&ndash;%&gt;--%>
                    <%--</ul>--%>
                    <%--</li>--%>
                    <%--</shiro:hasPermission>--%>
                    <%--<shiro:hasPermission name="fuwuziyuan">--%>
                    <%--<li>--%>
                    <%--<a href="javascript:"><i--%>
                    <%--class="fa   fa-life-saver (alias)"></i>--%>
                    <%--<span class="title">服务资源</span>--%>
                    <%--<span class="arrow"></span>--%>
                    <%--</a>--%>
                    <%--<ul class="sub-menu">--%>
                    <%--<shiro:hasPermission name="yanglaozuzhi_pinggu">--%>
                    <%--<li>--%>
                    <%--<a href="javascript:" data-addtab="yanglaozuzhi_pinggu"--%>
                    <%--&lt;%&ndash;url="${pageContext.request.contextPath }/admin/serviceOrgShow/map"&ndash;%&gt;--%>
                    <%--title="养老组织评估列表"><i--%>
                    <%--class="fa fa-null"></i> 养老组织评估列表</a>--%>
                    <%--</li>--%>
                    <%--</shiro:hasPermission>--%>
                    <%--<shiro:hasPermission name="jujiahuli">--%>
                    <%--<li>--%>
                    <%--<a href="javascript:" data-addtab="jujiahuli"--%>
                    <%--&lt;%&ndash;url="${pageContext.request.contextPath }/admin/serviceOrgShow"&ndash;%&gt;--%>
                    <%--title="居家护理综合中心评估列表"><i--%>
                    <%--class="fa fa-null"></i> 居家护理综合中心评估列表</a>--%>
                    <%--</li>--%>
                    <%--</shiro:hasPermission>--%>
                    <%--<shiro:hasPermission name="yanglaopgtj">--%>
                    <%--<li>--%>
                    <%--<a href="javascript:" data-addtab="yanglaopgtj"--%>
                    <%--&lt;%&ndash;url="${pageContext.request.contextPath }/admin/institution/map"&ndash;%&gt;--%>
                    <%--title="养老组织评估统计"><i--%>
                    <%--class="fa fa-null"></i> 养老组织评估统计</a>--%>
                    <%--</li>--%>
                    <%--</shiro:hasPermission>--%>
                    <%--</ul>--%>
                    <%--</li>--%>
                    <%--</shiro:hasPermission>--%>
                    <%--<shiro:hasPermission name="serverData">--%>
                    <%--<li>--%>
                    <%--<a href="javascript:"><i--%>
                    <%--class="fa   fa-life-saver (alias)"></i>--%>
                    <%--<span class="title">服务记录</span>--%>
                    <%--<span class="arrow"></span>--%>
                    <%--</a>--%>
                    <%--<ul class="sub-menu">--%>
                    <%--<shiro:hasPermission name="fuwu_list">--%>
                    <%--<li>--%>
                    <%--<a href="javascript:" data-addtab="fuwu_list"--%>
                    <%--title="服务记录列表"><i--%>
                    <%--class="fa fa-null"></i> 服务记录列表</a>--%>
                    <%--</li>--%>
                    <%--</shiro:hasPermission>--%>
                    <%--</ul>--%>
                    <%--</li>--%>
                    <%--</shiro:hasPermission>--%>
                    <%--<shiro:hasPermission name="zcfgData">--%>
                    <%--<li>--%>
                    <%--<a href="javascript:"><i--%>
                    <%--class="fa   fa-life-saver (alias)"></i>--%>
                    <%--<span class="title">政策法规</span>--%>
                    <%--<span class="arrow"></span>--%>
                    <%--</a>--%>
                    <%--<ul class="sub-menu">--%>
                    <%--<shiro:hasPermission name="zcfg_list">--%>
                    <%--<li>--%>
                    <%--<a href="javascript:" data-addtab="zcfg_list"--%>
                    <%--title="政策法规列表"><i--%>
                    <%--class="fa fa-null"></i> 政策法规列表</a>--%>
                    <%--</li>--%>
                    <%--</shiro:hasPermission>--%>
                    <%--</ul>--%>
                    <%--</li>--%>
                    <%--</shiro:hasPermission>--%>
                    <%--<shiro:hasPermission name="zdgzData">--%>
                    <%--<li>--%>
                    <%--<a href="javascript:"><i--%>
                    <%--class="fa   fa-life-saver (alias)"></i>--%>
                    <%--<span class="title">重点工作</span>--%>
                    <%--<span class="arrow"></span>--%>
                    <%--</a>--%>
                    <%--<ul class="sub-menu">--%>
                    <%--<shiro:hasPermission name="zdgz_list">--%>
                    <%--<li>--%>
                    <%--<a href="javascript:" data-addtab="zdgz_list"--%>
                    <%--title="重点工作列表"><i--%>
                    <%--class="fa fa-null"></i>重点工作列表</a>--%>
                    <%--</li>--%>
                    <%--</shiro:hasPermission>--%>
                    <%--</ul>--%>
                    <%--</li>--%>
                    <%--</shiro:hasPermission>--%>
            </ul>
        </li>
    </shiro:hasPermission>
    <shiro:hasPermission name="jiankang_manage">
        <li class="">
            <a href="javascript:">
                <i class="fa fa-flag-o"></i>
                <span class="title">健康管理
                </span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu" style="display: none;">

                <shiro:hasPermission name="jiankangfuwu">
                    <li>
                        <a href="javascript:"><i
                                class="fa   fa-life-saver (alias)"></i>
                            <span class="title">健康动态监测</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <shiro:hasPermission name="jiankangdangan_list">
                                <li>
                                    <a href="javascript:" data-addtab="jiankangdangan_list"
                                       url="${pageContext.request.contextPath }/admin/health/healthList"
                                       title="健康档案列表"><i
                                            class="fa fa-null"></i> 健康档案列表</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="jiankangshuju_select">
                                <li>
                                    <a href="javascript:" data-addtab="jiankangshuju_select"
                                       url="${pageContext.request.contextPath }/admin/health/healthSelect"
                                       title="健康数据查询"><i
                                            class="fa fa-null"></i> 健康数据查询</a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>


            </ul>
        </li>
    </shiro:hasPermission>
    <shiro:hasPermission name="elder-glod-manager-system">

        <li>
            <a href="javascript:">
                <i class="fa fa-openid"></i>
                <span class="title">高龄补贴管理</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <shiro:hasPermission name="elder-glod-manager-system-elderInfo">
                    <li>
                        <a href="javascript:" data-addtab="tab_for_gold_list"
                           url="${pageContext.request.contextPath }/admin/gold/forGold/list"
                           title="人员信息登记"><i
                                class="fa fa-null"></i> 人员信息登记列表</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="elder-glod-manager-system-moneySearch">
                    <li>
                        <a href="javascript:" data-addtab="tab_gold_send_list"
                           url="${pageContext.request.contextPath }/admin/gold/goldSend/list"
                           title="高龄补贴发放查询"><i
                                class="fa fa-null"></i> 高龄补贴发放查询</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="elder-glod-manager-system-reisueeMoney">
                    <li>
                        <a href="javascript:" data-addtab="gold_reissue"
                           url="${pageContext.request.contextPath }/admin/gold/goldSend/goldReissue"
                           title="高龄补贴补发"><i
                                class="fa fa-null"></i> 高龄补贴补发</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="elder-glod-manager-system-reissueMoneySeach">
                    <li>
                        <a href="javascript:" data-addtab="gold_reissue_list"
                           url="${pageContext.request.contextPath }/admin/gold/goldSend/goldReissueList"
                           title="高龄补贴补发查询"><i
                                class="fa fa-null"></i> 高龄补贴补发查询</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="elder-glod-manager-system-moneyTotal">
                    <li>
                        <a href="javascript:" data-addtab="gold_fafang_summary"
                           url="${pageContext.request.contextPath }/admin/gold/goldSend/goldFafangStatistic"
                           title="高龄补贴发放汇总"><i
                                class="fa fa-null"></i> 高龄补贴发放汇总</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="elder-glod-manager-system-reissueMoneyTotal">
                    <li>
                        <a href="javascript:" data-addtab="gold_bufa_summary"
                           url="${pageContext.request.contextPath }/admin/gold/goldSend/goldBufaStatistic"
                           title="高龄补贴补发汇总"><i
                                class="fa fa-null"></i> 高龄补贴补发汇总</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="elder-glod-manager-system-notice">
                    <li>
                        <a href="javascript:" data-addtab="gold_notice"
                           url="${pageContext.request.contextPath }/admin/gold/goldSend/goldNotice"
                           title="高龄补贴发放提醒"><i
                                class="fa fa-null"></i> 高龄补贴发放提醒</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="elder-glod-manager-system-bankMoneyList">
                    <li>
                        <a href="javascript:" data-addtab="gold_bank_summary"
                           url="${pageContext.request.contextPath }/admin/gold/goldSend/goldSendBankList"
                           title="高龄补贴银行发放详表"><i
                                class="fa fa-null"></i> 高龄补贴银行发放详表</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="elder-glod-manager-system-bankReissueMoneyList">
                    <li>
                        <a href="javascript:" data-addtab="gold_bank_reissue_summary"
                           url="${pageContext.request.contextPath }/admin/gold/goldSend/goldSendBankReissueList"
                           title="高龄补贴银行补发详表"><i
                                class="fa fa-null"></i> 高龄补贴银行补发详表</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="elder-glod-manager-system-logout">
                    <li>
                        <a href="javascript:" data-addtab="gold_elderly_cancel"
                           url="${pageContext.request.contextPath }/admin/gold/forGold/goldElderCancel"
                           title="人员注销"><i
                                class="fa fa-null"></i> 人员注销</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="system-data-elderMon">
                    <li>
                        <a href="javascript:" data-addtab="gold_send_standard_list"
                           url="${pageContext.request.contextPath }/admin/gold/sendStandard/list"
                           title="高龄补贴发放标准管理"><i
                                class="fa fa-null"></i> 高龄补贴发放标准管理</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="gold_send_message_list">
                    <li>
                        <a href="javascript:" data-addtab="gold_send_message_list"
                           url="${pageContext.request.contextPath }/admin/gold/sendMessage/list"
                           title="短信发送列表"><i
                                class="fa fa-null"></i> 短信发送列表</a>
                    </li>
                </shiro:hasPermission>
            </ul>
        </li>
    </shiro:hasPermission>
    <shiro:hasPermission name="community-service-manager">
        <li class="">
            <a href="javascript:" class="other">
                <i class="fa   fa-building"></i>
                <span class="title">社会组织（企业）服务</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <shiro:hasPermission name="community-service-list">
                    <li>
                        <a href="javascript:" data-addtab="side-institution-list"
                           url="${pageContext.request.contextPath }/admin/providersShow"
                           title="社会企业服务列表"><i
                                class="fa fa-null"></i> 社会企业服务列表</a>
                    </li>
                </shiro:hasPermission>
            </ul>
        </li>
    </shiro:hasPermission>
    <shiro:hasPermission name="user-worker-manager">
        <li>
            <a href="javascript:">
                <i class="fa fa-pagelines"></i>
                <span class="title">从业人员管理系统</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <shiro:hasPermission name="person-institution-manager-staffManager">
                    <li>
                        <a href="javascript:" data-addtab="side-userfuwu-list"
                           url="${pageContext.request.contextPath }/admin/user/fuwu/list?serviceOrgType=2"
                           title="机构工作人员管理"><i
                                class="fa fa-null"></i> 机构工作人员管理</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="home-pro-manager-system-service-staff-manager">
                    <li>
                        <a href="javascript:" data-addtab="side-home-userfuwu-list"
                           url="${pageContext.request.contextPath }/admin/user/fuwu/list?serviceOrgType=1"
                           title="组织服务人员管理"><i
                                class="fa fa-null"></i> 组织服务人员管理</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="person-institution-manager-butie">
                    <li>
                        <a href="javascript:" data-addtab="side-butie-list"
                           url="${pageContext.request.contextPath }/admin/elderly/jiuyelist"
                           title="从业人员补贴记录"><i
                                class="fa fa-null"></i> 从业人员补贴记录</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="person-institution-manager-huizong">
                    <li>
                        <a href="javascript:" data-addtab="tab_elderly_govbuy_huizong"
                           url="${pageContext.request.contextPath }/admin/orgAssess/jiuYeHuiZong"
                           title="从业人员补贴汇总">
                            <i
                                    class="fa fa-null"></i> 从业人员补贴汇总</a>
                    </li>
                </shiro:hasPermission>
            </ul>
        </li>
    </shiro:hasPermission>
    <shiro:hasPermission name="elderly-wallet-manager">
        <li class="">
            <a href="javascript:" class="other"
               data-addtab="side_elderly_wallet"
               url="${pageContext.request.contextPath }/admin/elderly/wallet/list"
               title="养老服务虚拟货币管理系统">
                <i class="fa  fa-refresh"></i>
                <span class="title">虚拟货币管理系统</span>
                <span class="arrow"></span>

            </a>
        </li>
    </shiro:hasPermission>
    <shiro:hasPermission name="task-call-manager">
        <li class="">
            <a href="javascript:" href="javascript:">
                <i class="fa icon-layers "></i>
                <span class="title">呼叫中心管理系统</span>
                <span class="arrow"></span>

            </a>
            <ul class="sub-menu" style="">
                <shiro:hasPermission name="task-call-manager-map">
                    <li class="">
                        <a href="javascript:" class="other" data-addtab="dispatch_map"
                           url="${pageContext.request.contextPath }/admin/dispatch/map"
                           title="资源调度视图">
                            <i class="fa  fa-null"></i>
                            <span class="title">资源调度视图</span>
                        </a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="hjzxglxt-zskgl">
                    <li>
                        <a href="javascript:">
                            <i class="fa fa-full"></i>
                            知识库管理
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <shiro:hasPermission name="hjzxglxt-zskgl-zsklx">
                                <li>
                                    <a href="javascript:" data-addtab="task_sendddd"
                                       url="${pageContext.request.contextPath }/admin/call/knowledge/type/list"
                                       title="知识库类型"><i
                                            class="fa fa-null"></i> 知识库类型</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="hjzxglxt-zskgl-zsklb">
                                <li>
                                    <a href="javascript:" data-addtab="task_receiveeee"
                                       url="${pageContext.request.contextPath }/admin/call/knowledge/list"
                                       title="知识库列表"><i
                                            class="fa fa-null"></i> 知识库列表</a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="task-call-manager-taskSupervise">
                    <li class="">
                        <a href="javascript:" class="other" data-addtab="side_task_supervise"
                           url="${pageContext.request.contextPath }/admin/task/task_supervise"
                           title="工单监管">
                            <i class="fa  fa-null"></i>
                            <span class="title">工单监管</span>
                        </a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="task-call-manager-appList">
                    <li class="">
                        <a href="javascript:" class="other" data-addtab="task_app_list"
                           url="${pageContext.request.contextPath }/admin/task/app_list"
                           title="历史服务记录">
                            <i class="fa  fa-null"></i>
                            <span class="title">历史服务记录</span>
                        </a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="task-call-manager-call">
                    <li>
                        <a href="javascript:"><i
                                class="fa  fa-null"></i>
                            <span class="title">呼叫中心</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <shiro:hasPermission name="task-call-manager-call-service">
                                <li class="">
                                    <a href="javascript:" data-addtab="call_list"
                                       url="${pageContext.request.contextPath }/admin/call/list?method=new"
                                       title="历史服务记录"> <i
                                            class="fa fa-null"></i> 历史服务记录</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="task-call-manager-call-abnormal">
                                <li>
                                    <a href="javascript:" data-addtab="call_abnormal_list"
                                       url="${pageContext.request.contextPath }/admin/call/abnormal/list"
                                       title="异常工单"> <i
                                            class="fa fa-null"></i> 异常工单</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="task-call-manager-call-dispatch">
                                <li>
                                    <a href="javascript:">
                                        <i class="fa fa-null"></i>
                                        工单派遣系统
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <shiro:hasPermission name="task-call-manager-call-dispatch-send">
                                            <li>
                                                <a href="javascript:" data-addtab="task_send"
                                                   url="${pageContext.request.contextPath }/admin/task/send"
                                                   title="发送工单"><i
                                                        class="fa fa-null"></i> 发送工单</a>
                                            </li>
                                        </shiro:hasPermission>
                                        <shiro:hasPermission name="task-call-manager-call-dispatch-get">
                                            <li>
                                                <a href="javascript:" data-addtab="task_receive"
                                                   url="${pageContext.request.contextPath }/admin/task/receive_list"
                                                   title="接收工单"><i
                                                        class="fa fa-null"></i> 接收工单</a>
                                            </li>
                                        </shiro:hasPermission>
                                        <shiro:hasPermission name="task-call-manager-call-dispatch-sendList">
                                            <li>
                                                <a href="javascript:" data-addtab="task_send_list"
                                                   url="${pageContext.request.contextPath }/admin/task/send_list"
                                                   title="已发送"><i
                                                        class="fa fa-null"></i> 已发送</a>
                                            </li>
                                        </shiro:hasPermission>
                                    </ul>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="task-call-manager-finance">
                    <li class="">
                        <a href="javascript:" href="javascript:">
                            <i class="fa fa-null "></i>
                            <span class="title">财务管理</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu" style="">
                            <shiro:hasPermission name="task-call-manager-finance-wallet">
                                <li class="">
                                    <a href="javascript:" class="other"
                                       data-addtab="side_elderly_wallet"
                                       url="${pageContext.request.contextPath }/admin/elderly/wallet/list"
                                       title="用户钱包管理">
                                        <i class="fa  fa-null"></i> 用户钱包管理
                                    </a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="task-call-manager-finance-serviceOrg">
                                <li class="">
                                    <a href="javascript:" class="other"
                                       data-addtab="task_serviceOrg_money"
                                       url="${pageContext.request.contextPath }/admin/task/task_serviceOrg_money"
                                       title="组织钱包管理">
                                        <i class="fa  fa-null"></i> 组织钱包管理
                                    </a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="task-call-manager-finance-serviceOrgInfo">
                                <li class="">
                                    <a href="javascript:" class="other"
                                       data-addtab="task_serviceOrg_money_info"
                                       url="${pageContext.request.contextPath }/admin/task/task_serviceOrg_money_info"
                                       title="组织资金动向">
                                        <i class="fa  fa-null"></i> 组织资金动向
                                    </a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="task-call-manager-callCenter">
                    <li>
                        <a target="_blank" href="${pageContext.request.contextPath }/home.html"><i
                                class="fa fa-null"></i> 德视呼叫系统</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="hjzxglxt">
                    <li class="">
                        <a href="javascript:" href="javascript:">
                            <i class="fa  fa-fax "></i>
                            <span class="title">呼叫中心管理系统</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu" style="">
                            <shiro:hasPermission name="hjzxglxt-zxgl">
                                <li>
                                    <a href="javascript:">
                                        <i class="fa fa-user"></i>
                                        坐席管理
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <shiro:hasPermission name="hjzxglxt-zxgl-zxlb">
                                            <li>
                                                <a href="javascript:" data-addtab="task_senda"
                                                   url="${pageContext.request.contextPath }/admin/call/monitor/list"
                                                   title="坐席列表"><i
                                                        class="fa fa-null"></i> 坐席列表</a>
                                            </li>
                                        </shiro:hasPermission>

                                        <shiro:hasPermission name="hjzxglxt-zxgl-zxzt">
                                            <li>
                                                <a href="javascript:" data-addtab="task_send_listc"
                                                   url="${pageContext.request.contextPath }/admin/call/monitor/status"
                                                   title="坐席状态"><i
                                                        class="fa fa-null"></i> 坐席状态</a>
                                            </li>
                                        </shiro:hasPermission>
                                    </ul>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="hjzxglxt-hjldgl">
                                <li>
                                    <a href="javascript:">
                                        <i class="fa fa-tty"></i>
                                        呼叫来电管理
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <shiro:hasPermission name="hjzxglxt-hjldgl-dxydhj">
                                            <li>
                                                <a href="javascript:" data-addtab="task_send_listf"
                                                   url="${pageContext.request.contextPath }/admin/call/index"
                                                   title="待响应呼叫"><i
                                                        class="fa fa-null"></i> 待响应呼叫</a>
                                            </li>
                                        </shiro:hasPermission>
                                    </ul>
                                </li>
                            </shiro:hasPermission>

                            <shiro:hasPermission name="hjzxglxt-hjzxsjtjbb">
                                <li class="">
                                    <a href="javascript:" data-addtab="call_listtt1"
                                       url="${pageContext.request.contextPath }/admin/call/home"
                                       title="数据统计报表"> <i
                                            class="fa fa-bar-chart"></i> 数据统计报表</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="call-center">
                                <li class="">
                                    <a href="javascript:" onclick="window.top.open('http://121.46.130.73/yscrm')"
                                       title="呼叫中心平台"> <i
                                            class="fa fa-bar-chart"></i> 呼叫中心平台</a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>
            </ul>
        </li>
    </shiro:hasPermission>
    <%--<shiro:hasPermission name="nurse-manager-system">--%>
    <%--<li class="">--%>
    <%--<a href="javascript:" class="other">--%>
    <%--<i class="fa   fa-laptop"></i>--%>
    <%--<span class="title">智能照护监控中心系统</span>--%>
    <%--<span class="arrow"></span>--%>
    <%--</a>--%>
    <%--<ul class="sub-menu">--%>
    <%--<shiro:hasPermission name="nurse-manager-system-jpInfo">--%>
    <%--<li>--%>
    <%--<a href="javascript:">--%>
    <%--<i class="fa fa-users"></i>--%>
    <%--接入组织信息--%>
    <%--<span class="arrow"></span>--%>
    <%--</a>--%>
    <%--<ul class="sub-menu">--%>
    <%--<shiro:hasPermission name="nurse-manager-system-jpInfo-serviceOrg">--%>
    <%--<li>--%>
    <%--<a href="javascript:" data-addtab="side-institution-nurse"--%>
    <%--url="${pageContext.request.contextPath }/admin/nurse/serviceOrg/list/2"--%>
    <%--title="养老机构信息"><i--%>
    <%--class="fa fa-null"></i> 养老机构信息</a>--%>
    <%--</li>--%>
    <%--</shiro:hasPermission>--%>
    <%--<shiro:hasPermission name="nurse-manager-system-jpInfo-Org">--%>
    <%--<li>--%>
    <%--<a href="javascript:" data-addtab="side-serviceOrg-nurse"--%>
    <%--url="${pageContext.request.contextPath }/admin/nurse/serviceOrg/list/1"--%>
    <%--title="养老组织信息"><i--%>
    <%--class="fa fa-null"></i> 养老组织信息</a>--%>
    <%--</li>--%>
    <%--</shiro:hasPermission>--%>
    <%--</ul>--%>
    <%--</li>--%>
    <%--</shiro:hasPermission>--%>
    <%--<shiro:hasPermission name="nurse-manager-system-nurse">--%>
    <%--<li>--%>
    <%--<a href="javascript:" data-addtab="side-elderly-nurse"--%>
    <%--url="${pageContext.request.contextPath }/admin/nurse/elderly/list"--%>
    <%--title="看护对象信息"><i--%>
    <%--class="fa fa-null"></i> 看护对象信息</a>--%>
    <%--</li>--%>
    <%--</shiro:hasPermission>--%>
    <%--<shiro:hasPermission name="nurse-manager-system-sign">--%>
    <%--<li>--%>
    <%--<a href="javascript:" data-addtab="side-elder-nurse-sign-list"--%>
    <%--url="${pageContext.request.contextPath }/admin/nurse/elderly/sign/list"--%>
    <%--title="体征信息管理"><i--%>
    <%--class="fa fa-null"></i> 体征信息管理</a>--%>
    <%--</li>--%>
    <%--</shiro:hasPermission>--%>
    <%--<shiro:hasPermission name="nurse-manager-system-view">--%>
    <%--<li>--%>
    <%--<a href="javascript:" data-addtab="side-nurse-map"--%>
    <%--url="${pageContext.request.contextPath }/admin/nurse/map"--%>
    <%--title="智能看护视图"><i--%>
    <%--class="fa fa-null"></i> 智能看护视图</a>--%>
    <%--</li>--%>
    <%--</shiro:hasPermission>               --%>
    <%--<shiro:hasPermission name="nurse-manager-system-alarm">--%>
    <%--<li>--%>
    <%--<a href="javascript:" data-addtab="side-nurse-alarm-list"--%>
    <%--url="${pageContext.request.contextPath }/admin/nurse/alarm/list"--%>
    <%--title="看护告警信息"><i--%>
    <%--class="fa fa-null"></i> 看护告警信息</a>--%>
    <%--</li>--%>
    <%--</shiro:hasPermission>--%>
    <%--</ul>--%>
    <%--</li>--%>
    <%--</shiro:hasPermission>--%>
    <shiro:hasPermission name="serviceOrgSup">
        <li class="">
            <a href="javascript:" href="javascript:">
                <i class="fa fa-certificate "></i>
                <span class="title">服务质量监督管理</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu" style="">
                <shiro:hasPermission name="serviceOrgSup-performanceAppraisal">
                    <li>
                        <a href="javascript:" data-addtab="side-serviceOrg-performance-appraisal"
                           url="${pageContext.request.contextPath }/admin/serviceOrg/performanceAppraisal"
                           title="养老组织绩效考核">
                            <i class="fa  fa-null"></i>
                            养老组织绩效考核 </a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="serviceOrgSup-orgAssess">
                    <li>
                        <a href="javascript:">
                            <i class="fa fa-null"></i>
                            <span class="title"> 等级评估</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <shiro:hasPermission name="serviceOrgSup-orgAssess-orgAssessShow">
                                <li>
                                    <a href="javascript:" data-addtab="side-orgAssessShow"
                                       url="${pageContext.request.contextPath }/admin/orgAssessShow"
                                       title="养老组织评估列表">
                                        <i class="fa  fa-null" style=""></i>
                                        养老组织评估列表
                                    </a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="serviceOrgSup-orgAssess-orgAssessStatistic">
                                <li>
                                    <a href="javascript:" data-addtab="side-orgAssess-statistic"
                                       url="${pageContext.request.contextPath }/admin/orgAssess/statistic"
                                       title="养老组织评估统计">
                                        <i class="fa  fa-null" style=""></i>
                                        养老组织评估统计
                                    </a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>
            </ul>
        </li>
    </shiro:hasPermission>
    <shiro:hasPermission name="love-bracelet-manager">
        <li class="">
            <a href="javascript:" class="other">
                <i class="fa   fa-laptop"></i>
                <span class="title">爱心手环管理</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <shiro:hasPermission name="love-bracelet-manager-objectInfo">
                    <li>
                        <a href="javascript:" data-addtab="bracelet-object-info"
                           url="${pageContext.request.contextPath }/admin/loveBracelet/braceletObjectInfo"
                           title="手环对象信息"><i class="fa fa-null"></i> 手环对象信息</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="love-bracelet-manager-view">
                    <li>
                        <a href="javascript:" data-addtab="love-bracelet-view"
                           url="${pageContext.request.contextPath }/admin/loveBracelet/braceletView"
                           title="智能手环视图"><i
                                class="fa fa-null"></i> 智能手环视图</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="love-bracelet-view-list">
                    <li>
                        <a href="javascript:" data-addtab="love-bracelet-view-list"
                           url="${pageContext.request.contextPath }/admin/loveBracelet/braceletViewList"
                           title="手环视图列表"><i
                                class="fa fa-null"></i> 手环视图列表</a>
                    </li>
                </shiro:hasPermission>
            </ul>
        </li>
    </shiro:hasPermission>
    <shiro:hasPermission name="monitor-manager">
        <li class="">
            <a href="javascript:" class="other">
                <i class="fa fa-video-camera"></i>
                <span class="title">智能照护监控中心系统</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <shiro:hasPermission name="monitor-jg-manager">
                    <li>
                        <a href="javascript:" data-addtab="monitor-jg-manager-info"
                           url="${pageContext.request.contextPath }/admin/monitor/institution/serviceInstitutionList"
                           title="机构视频监控"><i class="fa fa-null"></i> 机构视频监控</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="monitor-zz-manager">
                    <li>
                        <a href="javascript:" data-addtab="monitor-zz-manager-info"
                           url="${pageContext.request.contextPath }/admin/monitor/serviceOrgShow"
                           title="组织视频监控"><i class="fa fa-null"></i> 组织视频监控</a>
                    </li>
                </shiro:hasPermission>
            </ul>
        </li>
    </shiro:hasPermission>
    <shiro:hasPermission name="sojourn-pasture">
     <%--   <li>
            <a href="javascript:;" data-addtab="side-sojourn-pasture"
               url="${pageContext.request.contextPath }/admin/serviceSource/migratory_bird_care.jsp"
               title="旅居养老"><i
                    class="fa fa-reply-all"></i> 旅居养老</a>
        </li>--%>


        <li class="">
            <a href="javascript:" class="other">
                <i class="fa fa-video-camera"></i>
                <span class="title">旅居养老</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">

                <shiro:hasPermission name="sojourn-zr-pasture">
                    <li>
                        <a href="javascript:" data-addtab="monitor-jg-manager-info"
                         <%--  url="${pageContext.request.contextPath }/admin/monitor/institution/serviceInstitutionList"--%>
                           title="旅居养老机构准入"><i class="fa fa-null"></i> 旅居养老机构准入</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="sojourn-gl-pasture">
                    <li>
                        <a href="javascript:" data-addtab="monitor-zz-manager-info"
                           url="${pageContext.request.contextPath }/admin/api/org/sojournManage/sojournManageList"
                           title="旅居养老机构管理"><i class="fa fa-null"></i> 旅居养老机构管理</a>
                    </li>
                </shiro:hasPermission>
            </ul>
        </li>

    </shiro:hasPermission>
    <shiro:hasPermission name="elderServiceWebsite">
        <li class="">
            <a href="javascript:" href="javascript:">
                <i class="fa  fa-desktop "></i>
                <span class="title">
                养老服务发布网
            </span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu" style="">
                <shiro:hasPermission name="elderServiceWebsite-homePage">
                    <li>
                        <a target="_blank" href="${pageContext.request.contextPath }/home.html"><i
                                class="fa fa-null"></i> 网站首页</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="elderServiceWebsite-newsManager">
                    <li>
                        <a href="javascript:">
                            <i class="fa icon-docs"></i>
                            <span class="title">新闻管理</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <shiro:hasPermission name="elderServiceWebsite-newsManager-list">
                                <li>
                                    <a href="javascript:" data-addtab="side-moduleMes-list"
                                       url="${pageContext.request.contextPath }/admin/portal/moduleMes_view_list.jsp"
                                       title="新闻列表"><i
                                            class="fa fa-null"></i> 新闻列表</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="elderServiceWebsite-newsManager-type">
                                <li>
                                    <a href="javascript:" data-addtab="side-module"
                                       url="${pageContext.request.contextPath }/admin/moduleMes/type"
                                       title="新闻类型"><i
                                            class="fa fa-null"></i> 新闻类型</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="elderServiceWebsite-newsManager-issue">
                                <li>
                                    <a href="javascript:" data-addtab="side-moduleMes-publish"
                                       url="${pageContext.request.contextPath }/admin/moduleMes/publish"
                                       title="发布新闻"><i
                                            class="fa fa-null"></i> 发布新闻</a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="elderServiceWebsite-storeManager">
                    <li>
                        <a href="javascript:">
                            <i class="fa fa-shopping-cart"></i>
                            <span class="title">商城管理</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <shiro:hasPermission name="elderServiceWebsite-storeManager-list">
                                <li>
                                    <a href="javascript:" data-addtab="side-goods-list"
                                       url="${pageContext.request.contextPath }/admin/goods/list"
                                       title="商品列表"><i
                                            class="fa fa-null"></i> 商品列表</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="elderServiceWebsite-storeManager-type">
                                <li>
                                    <a href="javascript:" data-addtab="side-goods-calss"
                                       url="${pageContext.request.contextPath }/admin/goods/class/list"
                                       title="商品类型"><i
                                            class="fa fa-null"></i> 商品类型</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="elderServiceWebsite-storeManager-issue">
                                <li>
                                    <a href="javascript:" data-addtab="side-goods-publish"
                                       url="${pageContext.request.contextPath }/admin/goods/add"
                                       title="发布商品"><i
                                            class="fa fa-null"></i> 发布商品</a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="elderServiceWebsite-advertisement">
                    <li>
                        <a href="javascript:">
                            <i class="fa icon-docs"></i>
                            <span class="title">广告管理</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <shiro:hasPermission name="elderServiceWebsite-advertisement-list">
                                <li>
                                    <a href="javascript:" data-addtab="side-advertisement-list"
                                       url="${pageContext.request.contextPath }/admin/advertisement/list"
                                       title="广告列表"><i
                                            class="fa fa-null"></i> 广告列表</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="elderServiceWebsite-advertisement-issue">
                                <li>
                                    <a href="javascript:" data-addtab="side-advertisement-add"
                                       url="${pageContext.request.contextPath }/admin/advertisement/add"
                                       title="发布广告"><i
                                            class="fa fa-null"></i> 发布广告</a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="elderServiceWebsite-letter">
                    <li>
                        <a href="javascript:">
                            <i class="fa icon-envelope-letter"></i>
                            <span class="title">信件管理</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <shiro:hasPermission name="elderServiceWebsite-letter-list">
                                <li>
                                    <a href="javascript:" data-addtab="side-letter-list"
                                       url="${pageContext.request.contextPath }/admin/letter/show"
                                       title="信件列表"><i
                                            class="fa fa-null"></i> 信件列表</a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>
            </ul>
        </li>
    </shiro:hasPermission>
    <shiro:hasPermission name="timeBank">
    <li>
    <a href="javascript:">
    <i class="fa  fa-bitbucket"></i>
    <span class="title">时间银行</span>
    <span class="arrow"></span>
    </a>
    <ul class="sub-menu">
    <shiro:hasPermission name="timeBank-addVolunteer">
    <li>
    <a href="javascript:" data-addtab="side-volunteer-add"
    url="${pageContext.request.contextPath }/admin/volunteer/add"
    title="新增志愿者"><i
    class="fa fa-null"></i> 新增志愿者</a>
    </li>
    </shiro:hasPermission>
    <shiro:hasPermission name="timeBank-volunteerList">
    <li>
    <a href="javascript:" data-addtab="side-volunteer-list"
    url="${pageContext.request.contextPath }/admin/volunteer/list"
    title="志愿者列表"><i
    class="fa fa-null"></i> 志愿者列表</a>
    </li>
    </shiro:hasPermission>
    </ul>
    </li>
    </shiro:hasPermission>
    <shiro:hasPermission name="system">
        <li>
            <a href="javascript:">
                <i class="icon-settings"></i>
                <span class="title">系统管理</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <shiro:hasPermission name="system-user">
                    <li class="">
                        <a href="javascript:">
                            <i class="icon-users"></i>
                            <span class="title">用户管理</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <shiro:hasPermission name="system-user-list">
                                <li>
                                    <a href="javascript:" data-addtab="user_list"
                                       url="${pageContext.request.contextPath }/admin/user/list"
                                       title="用户列表"><i
                                            class="fa fa-null"></i> 用户列表</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="system-user-create">
                                <li>
                                    <a href="javascript:" data-addtab="user_add"
                                       url="${pageContext.request.contextPath }/admin/user/add"
                                       title="添加用户"><i
                                            class="fa fa-null"></i> 添加用户</a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="system-data">
                    <li class="">
                        <a href="javascript:">
                            <i class=" fa  fa-chain (alias)"></i>
                            <span class="title">数据字典</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <shiro:hasPermission name="system-data-serviceType">
                                <li>
                                    <a href="javascript:" data-addtab="service_type_list"
                                       url="${pageContext.request.contextPath }/admin/dictionary/serviceType/list"
                                       title="服务类型管理"><i
                                            class="fa fa-null"></i> 服务类型管理</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="system-data-servicePro">
                                <li>
                                    <a href="javascript:" data-addtab="service_project_list"
                                       url="${pageContext.request.contextPath }/admin/dictionary/serviceProject/list"
                                       title="服务项目管理"><i
                                            class="fa fa-null"></i> 服务项目管理</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="system-data-elderMon">
                                <li>
                                    <a href="javascript:" data-addtab="gold_send_standard_list"
                                       url="${pageContext.request.contextPath }/admin/gold/sendStandard/list"
                                       title="高龄补贴发放标准管理"><i
                                            class="fa fa-null"></i> 高龄补贴发放标准管理</a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="system-notice">
                    <li class="">
                        <a href="javascript:">
                            <i class=" fa fa-volume-down"></i>
                            <span class="title">系统公告</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <shiro:hasPermission name="system-notice-list">
                                <li>
                                    <a href="javascript:" data-addtab="message_list"
                                       url="${pageContext.request.contextPath }/admin/message/list"
                                       title="公告列表"><i
                                            class="fa fa-null"></i> 公告列表</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="system-notice-issue">
                                <li>
                                    <a href="javascript:" data-addtab="message_send"
                                       url="${pageContext.request.contextPath }/admin/message/send"
                                       title="发布公告"><i
                                            class="fa fa-null"></i> 发布公告</a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="system-permission">
                    <li>
                        <a href="javascript:" data-addtab="side-sysPerm"
                           url="${pageContext.request.contextPath }/admin/sys/perm"
                           title="权限管理"><i
                                class="fa  fa-slack"></i> 权限管理</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="system-role">
                    <li>
                        <a href="javascript:" data-addtab="side-sysRole"
                           url="${pageContext.request.contextPath }/admin/sys/role"
                           title="角色管理"><i
                                class="fa fa-pied-piper-alt"></i> 角色管理</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="system-log">
                    <li>
                        <a href="javascript:" data-addtab="side-sysLog"
                           url="${pageContext.request.contextPath }/admin/sys/log"
                           title="系统日志"><i
                                class="fa  fa-file-o"></i> 系统日志</a>
                    </li>
                </shiro:hasPermission>
            </ul>
        </li>
    </shiro:hasPermission>
</ul>
<!-- END SIDEBAR MENU -->
