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

    <!-- 养老服务大数据库-->
    <shiro:hasPermission name="elderly">
        <li class="">
            <a href="javascript:">
                <i class="fa fa-location-arrow"></i>
                <span class="title">养老服务大数据库
                </span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu" style="display: none;">
                    <%--老人数据--%>
                <shiro:hasPermission name="elderly-elderlyMsg">
                    <li>
                        <a href="javascript:">
                            <i class="fa fa-openid"></i>
                            老年人数据
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
                                         <%--url="${pageContext.request.contextPath }/admin/elderly/govbuy/list"--%>
                                       url="${pageContext.request.contextPath }/admin/elderly/govbuyfw/list"
                                       title="政府购买信息">
                                        <i
                                                class="fa fa-null"></i> 政府购买信息</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasRole name="suadmin">
                                <li>
                                    <a href="javascript:" data-addtab="elder_deadInfo"
                                       url="${pageContext.request.contextPath }/admin/elderly/deadInfo"
                                       title="殡葬信息"><i
                                            class="fa fa-null"></i> 殡葬信息</a>
                                </li>
                            </shiro:hasRole>
                        </ul>
                    </li>
                </shiro:hasPermission>
                    <%--养老服务数据--%>
                <shiro:hasPermission name="elderly-serviceMsg">
                    <li>
                        <a href="javascript:">
                            <i class="fa fa-openid"></i>
                            养老服务数据
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <shiro:hasPermission name="person-institution-manager-list">
                                <li>
                                    <a href="javascript:" data-addtab="side-institution-list"
                                       url="${pageContext.request.contextPath }/admin/institution/list"
                                       title="养老机构信息管理"><i
                                            class="fa fa-null"></i> 养老机构信息管理</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="home-pro-manager-system-person-service-org">
                                <li id="serviceOrgLi">
                                    <a href="javascript:" data-addtab="side-serviceOrg-list"
                                       url="${pageContext.request.contextPath }/admin/serviceOrgShow"
                                       title="居家养老信息管理"><i
                                            class="fa fa-null"></i> 居家养老信息管理</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="community-service-list">
                                <li>
                                    <a href="javascript:" data-addtab="side-provider-list"
                                       url="${pageContext.request.contextPath }/admin/providersShow"
                                       title="市场化服务商管理"><i
                                            class="fa fa-null"></i> 市场化服务商管理</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="timeBank">
                                <li>
                                    <a href="javascript:">
                                        <i class="fa fa-null"></i>
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
                            <shiro:hasPermission name="person-institution-manager-staffManager">
                                <li>
                                    <a href="javascript:" data-addtab="side-userfuwu-list-1"
                                       url="${pageContext.request.contextPath }/admin/user/fuwu/list"
                                       title="从业人员信息"><i class="fa fa-null"></i> 从业人员信息</a>
                                </li>
                            </shiro:hasPermission>
                             <shiro:hasPermission name="task-list">
                            <li>
                                <a href="javascript:">
                                        <i class="fa fa-null"></i>
                                        <span class="title">服务记录</span>
                                        <span class="arrow"></span>
                                    </a>
                                        <ul class="sub-menu" style="">
                                        <li class="">
                                            <a href="javascript:;" class="other" data-addtab="task_app_list"
                                               url="${pageContext.request.contextPath }/admin/task/app_list"
                                               title="市场工单记录">
                                                <i class="fa  fa-null"></i>
                                                <span class="title">市场工单记录</span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="javascript:;" class="other" data-addtab="task_plan_app_list"
                                               url="${pageContext.request.contextPath }/admin/task/plan/list"
                                               title="计划工单记录">
                                                <i class="fa  fa-null"></i>
                                                <span class="title">计划工单记录</span>
                                            </a>
                                        </li>
                                    </ul>
                            </li>
                              </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>
                    <%--养老政务数据--%>
                <shiro:hasPermission name="elderly-government-affairs">
                    <li>
                        <a href="javascript:">
                            <i class="fa fa-openid"></i>
                            养老政务数据
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <shiro:hasPermission name="elder-glod-manager-system">

                                <li>
                                    <a href="javascript:">
                                       <%-- <i class="fa fa-openid"></i>--%>
                                        <span class="title">补贴金管理</span>
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
                            <shiro:hasPermission name="data-assessmentMsg">
                                <li>
                                    <a href="javascript:">
                                       <%-- <i class="fa fa-street-view"></i>--%>
                                        评估数据
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <shiro:hasPermission name="data-assessmentMsg-list">
                                            <li>
                                                <a href="javascript:" data-addtab="elderly_pggl"
                                                   url="${pageContext.request.contextPath }/admin/api/power/wcdfzsz/catacityList"
                                                   title="评估列表"><%--<i
                                                        class="fa fa-file-text"></i>--%> 评估列表</a>
                                            </li>
                                        </shiro:hasPermission>
                                    </ul>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>
                    <%--养老地理信息数据--%>
                <shiro:hasPermission name="BigDataGeographicInformation">
                    <li>
                        <a href="javascript:"><i
                                class="fa   fa-life-saver (alias)"></i>
                            <span class="title">养老地理信息数据</span>
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

    <!-- 居家(社区)养老服务中心-->
    <shiro:hasPermission name="home-pro-manager-system">
        <li>
            <a href="javascript:">
                <i class="fa fa-institution"></i>
                <span class="title">居家(社区)养老服务中心</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <shiro:hasPermission name="basic-information-management">
                    <li>
                        <a href="javascript:"><i
                                class="fa   fa-life-saver (alias)"></i>
                            <span class="title">基础信息管理</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <shiro:hasPermission name="home-pro-manager-system-person-service-org">
                                <li id="serviceOrgLi">
                                    <a href="javascript:" data-addtab="side-serviceOrg-list"
                                       url="${pageContext.request.contextPath }/admin/serviceOrgShow"
                                       title="居家养老服务机构基础信息管理"><i
                                            class="fa fa-null"></i> 居家养老服务机构基础信息管理</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="home-pro-manager-system-service-staff-manager">
                                <li>
                                    <a href="javascript:" data-addtab="side-userfuwu-list-2"
                                       url="${pageContext.request.contextPath }/admin/user/fuwu/list?serviceOrgType=1"
                                       title="从业人员信息"><i class="fa fa-null"></i> 从业人员信息</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="home-pro-manager-system-service-org-wareHouse">
                                <li>
                                    <a href="javascript:" data-addtab="side-serviceOrg-warehouse"
                                       url="${pageContext.request.contextPath }/admin/serviceOrg/wareHouse/list"
                                       title="仓库物品入出库信息管理"><i
                                            class="fa fa-null"></i> 仓库物品入出库信息管理</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="home-pro-manager-system-service-org-donation">
                                <li>
                                    <a href="javascript:" data-addtab="side-serviceOrg-socialdonation"
                                       url="${pageContext.request.contextPath }/admin/api/power/socialDonation/communityDonationList"
                                       title="社会捐赠信息管理"><i
                                            class="fa fa-null"></i> 社会捐赠信息管理</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="home-pro-manager-system-service-org-service">
                                <li>
                                    <a href="javascript:" data-addtab="side-serviceOrg-socialwork"
                                       url="${pageContext.request.contextPath }/admin/api/power/socialWork/communityServiceList"
                                       title="社会服务信息管理"><i
                                            class="fa fa-null"></i> 社会服务信息管理</a>
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
                            <shiro:hasPermission name="home-pro-manager-system-service-org-happy">
                                <li>
                                    <a href="javascript:" data-addtab="side-serviceOrg-happy"
                                       url="${pageContext.request.contextPath }/admin/api/power/bill/happyList"
                                       title="文娱活动信息管理"><i
                                            class="fa fa-null"></i> 文娱活动信息管理</a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>

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
                                       url="${pageContext.request.contextPath }/userLinkElder/view"
                                       title="老人基础信息">
                                        <i class="fa fa-null"></i> 老人基础信息</a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="elderly-eabl-elderlyMsg">
                    <li>
                        <a href="javascript:">
                            <i class="fa fa-openid"></i>
                            老年人能力评估
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a href="javascript:" data-addtab="elder_Info_undo_assess"
                                   url="${pageContext.request.contextPath }/admin/elderly/list?abilityAssess=2"
                                   title="待评估老人管理">
                                    <i
                                            class="fa fa-null"></i> 待评估老人管理</a>
                            </li>
                            <li class="">
                                <a href="javascript:;">
                                    <i class="fa fa-null "></i>
                                    <span class="title"> 老人能力评估管理</span>
                                    <span class="arrow"></span>
                                </a>
                                <ul class="sub-menu" style="">
                                    <shiro:hasPermission name="lrpggl-nlpglb">
                                        <li>
                                            <a href="javascript:" data-addtab="lrpggl-nlpglb"
                                               url="${pageContext.request.contextPath }/admin/api/power/wcdfzsz/catacityList"
                                               title="能力评估列表">
                                                <i
                                                        class="fa fa-null"></i> 老人评估列表</a>
                                        </li>
                                    </shiro:hasPermission>
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
                                </ul>
                            </li>
                        </ul>
                    </li>
                </shiro:hasPermission>

                <shiro:hasPermission name="elderly-eabl-employee">
                    <li>
                        <a href="javascript:">
                            <i class="fa fa-openid"></i>
                            从业人员管理
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <shiro:hasPermission name="home-pro-manager-system-service-staff-manager">
                                <li>
                                    <a href="javascript:" data-addtab="side-userfuwu-list-3"
                                       url="${pageContext.request.contextPath }/admin/user/fuwu/list?serviceOrgType=1"
                                       title="从业人员信息">
                                        <i class="fa fa-null"></i> 从业人员信息
                                    </a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="home-pro-manager-system-service-health-manager">
                                <li>
                                    <a href="javascript:" data-addtab="lrpggl-nlpgfzpz"
                                       url="${pageContext.request.contextPath }/admin/org/healthRecords/List"
                                       title="从业人员健康记录">
                                        <i class="fa fa-null"></i> 从业人员健康记录
                                    </a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="home-pro-manager-system-service-feedback-manager">
                                <li>
                                    <a href="javascript:" data-addtab="lrpggl-nlpglb"
                                       url="${pageContext.request.contextPath }/admin/user/fuwu/feedbackList?serviceOrgType=1"
                                       title="服务反馈信息">
                                        <i class="fa fa-null"></i> 服务反馈信息
                                    </a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="home-pro-manager-system-service-record-manager">
                                <li class="">
                                    <a href="javascript:" data-addtab="lrpggl-nlpglb"
                                       url="${pageContext.request.contextPath }/admin/user/fuwu/recordList"
                                       title="从业人员服务记录">
                                        <i class="fa fa-null"></i> 从业人员服务记录
                                    </a>
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
                            <shiro:hasPermission name="timeBank-volunteerList">
                                <li>
                                    <a href="javascript:" data-addtab="side-volunteer-list"
                                       url="${pageContext.request.contextPath }/admin/volunteer/list"
                                       title="志愿者管理"><i
                                            class="fa fa-null"></i> 志愿者管理</a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="task-call-manager-call-dispatch">
                    <li>
                        <a href="javascript:">
                            <i class="fa fa-adn"></i>
                            工单派遣系统
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
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
                                    <a href="javascript:;">
                                        <i class="fa fa-null "></i>
                                        <span class="title">历史服务记录</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu" style="">
                                        <li class="">
                                            <a href="javascript:;" class="other" data-addtab="task_app_list"
                                               url="${pageContext.request.contextPath }/admin/task/app_list"
                                               title="市场工单记录">
                                                <i class="fa  fa-null"></i>
                                                <span class="title">市场工单记录</span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="javascript:;" class="other" data-addtab="task_plan_app_list"
                                               url="${pageContext.request.contextPath }/admin/task/plan/list"
                                               title="计划工单记录">
                                                <i class="fa  fa-null"></i>
                                                <span class="title">计划工单记录</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </shiro:hasPermission>
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

                <shiro:hasPermission name="construction-operation-subsidy-management">
                    <li>
                        <a href="javascript:" title="建设与运营补贴管理">
                            <i class="fa fa-rss "></i>
                            <span class="title">建设与运营补贴管理</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <shiro:hasPermission name="application-organizational-construction-subsidy">
                                <li>
                                    <a href="javascript:" data-addtab="side-serviceOrg-subsidy-apply-1"
                                       url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/apply?type=1&object=2"
                                       title="组织建设补助申请"><i
                                            class="fa fa-null"></i> 组织建设补助申请</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="application-organizational-operational-subsidies">
                                <li>
                                    <a href="javascript:" data-addtab="side-serviceOrg-subsidy-apply-2"
                                       url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/apply?type=2&object=2"
                                       title="组织运营补贴申请"><i
                                            class="fa fa-null"></i> 组织运营补贴申请</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="application-organizational-operational-zzlist1">
                                <li>
                                    <a href="javascript:" data-addtab="side-serviceOrg-subsidy-zzlist1"
                                       url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/list?type=1&object=2"
                                       title="组织申请列表"><i
                                            class="fa fa-null"></i> 组织申请列表</a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>

                <shiro:hasPermission name="service_org_routine_check">
                    <li>
                        <a href="javascript:" data-addtab="side-routine-check-list"
                           url="${pageContext.request.contextPath }/admin/serviceOrgRoutineCheck/view"
                           title="日常检查"><i class="fa fa-database "></i> 日常检查</a>
                    </li>
                </shiro:hasPermission>

                <shiro:hasPermission name="household-fixed-assets">
                    <li>
                        <a href="javascript:" data-addtab="household-fixed-assets-list"
                           url="${pageContext.request.contextPath }/admin/api/power/socialDonation/fixedAssetsList"
                           title="居家固定资产"><i
                                class="fa fa-star"></i> 居家固定资产</a>
                    </li>
                </shiro:hasPermission>

                <shiro:hasPermission name="person-institution-org-communityPensionStars">
                    <li>
                        <a href="javascript:" data-addtab="side-institution-elderly-list"
                           url="${pageContext.request.contextPath }/admin/institution/org/communityPensionStarsList"
                           title="社区养老服务站星级评定"><i
                                class="fa fa-star"></i> 社区养老服务站星级评定</a>
                    </li>
                </shiro:hasPermission>

                <shiro:hasPermission name="person-institution-org-arerHomePensionStars">
                    <li>
                        <a href="javascript:" data-addtab="side-institution-elderly-list"
                           url="${pageContext.request.contextPath }/admin/institution/org/areaHomePensionStarsList"
                           title="区域性居家养老服务中心星级评定"><i
                                class="fa fa-star"></i> 区域性居家养老服务中心星级评定</a>
                    </li>
                </shiro:hasPermission>

            </ul>
        </li>
    </shiro:hasPermission>

    <!-- 服务质量监督管理-->
    <shiro:hasPermission name="supervision-management-of-service-quality">
        <li>
            <a href="javascript:">
                <i class="fa fa-institution"></i>
                <span class="title">服务质量监督管理</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
        <shiro:hasPermission name="serviceOrg-comment-list">

        <li>
                        <a href="javascript:" data-addtab="side-serviceOrg-comment"
                           url="${pageContext.request.contextPath }/admin/serviceOrg/comment/list?type=1"
                           title="评价评测"><i
                                class="fa  fa-child"></i> 评价评测</a>
                    </li>
        </shiro:hasPermission>
                <shiro:hasPermission name="integrity-supervision">
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
                                        <%--<i class="fa fa-location-arrow "></i>--%>
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
                                        <%--<i class="fa fa-institution"></i>--%>
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
                </shiro:hasPermission>
            </ul>
        </li>
    </shiro:hasPermission>


    <!-- 机构养老信息管理-->
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
                           title="基本信息管理"><i
                                class="fa fa-database "></i> 基本信息管理</a>
                    </li>
                </shiro:hasPermission>

                <shiro:hasPermission name="elderly-eabl-employee">
                    <li>
                        <a href="javascript:">
                            <i class="fa fa-openid"></i>
                            从业人员管理
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <shiro:hasPermission name="person-institution-manager-staffManager">
                                <li>
                                    <a href="javascript:" data-addtab="side-userfuwu-list-4"
                                       url="${pageContext.request.contextPath }/admin/user/fuwu/list?serviceOrgType=2"
                                       title="从业人员信息管理"><i
                                            class="fa fa-null "></i> 从业人员信息管理</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="elderly-employee-certificate-information-management">
                                <li>
                                    <a href="javascript:" data-addtab="lrpggl-nlpgfzpz"
                                       url="${pageContext.request.contextPath }/admin/user/fuwu/certificateList"
                                       title="从业人员证书信息管理">
                                        <i class="fa fa-null"></i> 从业人员证书信息管理
                                    </a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="elderly-employee-train-information-management">
                                <li>
                                    <a href="javascript:" data-addtab="lrpggl-nlpglb"
                                       url="${pageContext.request.contextPath }/admin/user/fuwu/trainList"
                                       title="从业人员培训信息管理">
                                        <i class="fa fa-null"></i> 从业人员培训信息管理
                                    </a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="elderly-employee-prize-information-management">
                                <li class="">
                                    <a href="javascript:" data-addtab="lrpggl-nlpglb"
                                       url="${pageContext.request.contextPath }/admin/user/fuwu/prizeList"
                                       title="从业人员获奖信息管理">
                                        <i class="fa fa-null"></i> 从业人员获奖信息管理
                                    </a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="elderly-employee-quit-information-management">
                                <li class="">
                                    <a href="javascript:" data-addtab="lrpggl-nlpglb"
                                       url="${pageContext.request.contextPath }/admin/user/fuwu/quitList"
                                       title="从业人员离职信息管理">
                                        <i class="fa fa-null"></i> 从业人员离职信息管理
                                    </a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="person-institution-manager-elderManager">
                    <li>
                        <a href="javascript:" data-addtab="side-institution-elderly-list"
                           url="${pageContext.request.contextPath }/admin/institution/elderly/list"
                           title="在养人员管理"><i class="fa fa-database "></i> 在养人员管理</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="person-institution-manager-elderBedRoomManager">
                    <li>
                        <a href="javascript:" data-addtab="lrpggl-nlpgfzpz"
                           url="${pageContext.request.contextPath }/admin/serviceOrg/BedRoomManager/List"
                           title="房间床位信息管理">
                            <i class="fa fa-child"></i> 房间床位信息管理
                        </a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="construction-operation-subsidy-management">
                    <li>
                        <a href="javascript:" title="建设与运营补贴管理">
                            <i class="fa fa-rss "></i>
                            <span class="title">建设与运营补贴管理</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <shiro:hasPermission name="application-institutional-construction-subsidy-1">
                                <li>
                                    <a href="javascript:" data-addtab="side-institution-subsidy-apply-1"
                                       url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/apply?type=1&object=1"
                                       title="机构建设补贴申请"><i
                                            class="fa fa-null"></i> 建设补贴申请</a>
                                <li>
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
                                    </shiro:hasPermission>
                            <%--<shiro:hasPermission name="application-institutional-operational-subsidies">--%>
                                <%--<li>--%>
                                    <%--<a href="javascript:" data-addtab="side-institution-subsidy-apply-2"--%>
                                       <%--url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/apply?type=2&object=1"--%>
                                       <%--title="机构运营补贴申请"><i--%>
                                            <%--class="fa fa-null"></i> 机构运营补贴申请</a>--%>
                                <%--</li>--%>
                            <%--</shiro:hasPermission>--%>
                                <%--<shiro:hasPermission name="application-organizational-operational-jglist1">--%>
                                    <%--<li>--%>
                                        <%--<a href="javascript:" data-addtab="side-serviceOrg-subsidy-jglist1"--%>
                                           <%--url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/list?type=1&object=1"--%>
                                           <%--title="机构申请列表"><i--%>
                                                <%--class="fa fa-null"></i> 机构申请列表</a>--%>
                                    <%--</li>--%>
                                <%--</shiro:hasPermission>--%>
                        </ul>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="person-institution-star-rate">
                    <li>
                        <a href="javascript:" data-addtab="side-institution-elderly-list"
                           url="${pageContext.request.contextPath }/admin/serviceOrg/subsidy/starList?type=2&object=1"
                           title="机构服务质量星级评定标准"><i
                                class="fa fa-star"></i> 机构服务质量星级评定标准</a>
                    </li>
                </shiro:hasPermission>
            </ul>
        </li>
    </shiro:hasPermission>

    <!-- 智能照护监控中心系统-->
    <shiro:hasPermission name="nurse-manager-system">
        <li class="">
            <a href="javascript:" class="other">
                <i class="fa   fa-laptop"></i>
                <span class="title">智能照护监控中心系统</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <li>
                    <a href="javascript:">
                        <i class="fa fa-null"></i>
                        <span class="title">服务记录</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu" style="">
                        <li class="">
                            <a href="javascript:;" class="other" data-addtab="task_app_list"
                               url="${pageContext.request.contextPath }/admin/task/app_list"
                               title="市场工单记录">
                                <i class="fa  fa-null"></i>
                                <span class="title">市场工单记录</span>
                            </a>
                        </li>
                        <li class="">
                            <a href="javascript:;" class="other" data-addtab="task_plan_app_list"
                               url="${pageContext.request.contextPath }/admin/task/plan/list"
                               title="计划工单记录">
                                <i class="fa  fa-null"></i>
                                <span class="title">计划工单记录</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <shiro:hasPermission name="video-surveillance">
                    <li class="">
                        <a href="javascript:" class="other">
                            <i class="fa   fa-laptop"></i>
                            <span class="title">视频监控</span>
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
            </ul>
        </li>
    </shiro:hasPermission>

    <!-- 旅居养老 暂时隐藏-->
    <%--<shiro:hasPermission name="lrpggl">--%>
        <%--<li class="">--%>
            <%--<a href="javascript:" class="other">--%>
                <%--<i class="fa fa-video-camera"></i>--%>
                <%--<span class="title">旅居养老</span>--%>
                <%--<span class="arrow"></span>--%>
            <%--</a>--%>
            <%--<ul class="sub-menu">--%>
                <%--<shiro:hasPermission name="sojourn-gl-pasture">--%>
                    <%--<li>--%>
                        <%--<a href="javascript:" data-addtab="monitor-zz-manager-info"--%>
                           <%--url="${pageContext.request.contextPath }/admin/api/org/sojournManage/sojournManageList"--%>
                           <%--title="旅居养老机构管理"><i class="fa fa-university"></i> 旅居养老机构管理</a>--%>
                    <%--</li>--%>
                <%--</shiro:hasPermission>--%>
                <%--<shiro:hasPermission name="sojourn-gl-distribution">--%>
                    <%--<li>--%>
                        <%--<a href="javascript:" data-addtab="monitor-zz-manager-info"--%>
                           <%--url="${pageContext.request.contextPath }/admin/api/org/sojournManage/elderlyNeedsDistribution"--%>
                           <%--title="旅居老人需求发放"><i class="fa fa-bars"></i> 旅居老人需求发放</a>--%>
                    <%--</li>--%>
                <%--</shiro:hasPermission>--%>
                <%--<shiro:hasPermission name="sojourn-gl-elderlyNeeds">--%>
                    <%--<li>--%>
                        <%--<a href="javascript:" data-addtab="monitor-zz-manager-info"--%>
                           <%--url="${pageContext.request.contextPath }/admin/api/org/sojournManage/elderlyNeedsList"--%>
                           <%--title="旅居老人需求管理"><i class="fa fa-cubes"></i> 旅居老人需求管理</a>--%>
                    <%--</li>--%>
                <%--</shiro:hasPermission>--%>
            <%--</ul>--%>
        <%--</li>--%>
    <%--</shiro:hasPermission>--%>


    <!-- 养老服务发布网-->
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
                                class="fa fa-university"></i> 网站首页</a>
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
                            <shiro:hasPermission name="elderServiceWebsite-newsManager-type">
                                <li>
                                    <a href="javascript:" data-addtab="side-module"
                                       url="${pageContext.request.contextPath }/admin/moduleMes/type"
                                       title="新闻类型管理"><i
                                            class="fa fa-null"></i> 新闻类型管理</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="elderServiceWebsite-newsManager-list">
                                <li>
                                    <a href="javascript:" data-addtab="side-moduleMes-list"
                                       url="${pageContext.request.contextPath }/admin/portal/moduleMes_view_list.jsp"
                                       title="新闻列表管理"><i
                                            class="fa fa-null"></i> 新闻列表管理</a>
                                </li>
                            </shiro:hasPermission>

                            <shiro:hasPermission name="elderServiceWebsite-newsManager-issue">
                                <li>
                                    <a href="javascript:" data-addtab="side-moduleMes-publish"
                                       url="${pageContext.request.contextPath }/admin/moduleMes/publish"
                                       title="新闻发布管理"><i
                                            class="fa fa-null"></i> 新闻发布管理</a>
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
                                       title="广告列表管理"><i
                                            class="fa fa-null"></i> 广告列表管理</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="elderServiceWebsite-advertisement-issue">
                                <li>
                                    <a href="javascript:" data-addtab="side-advertisement-add"
                                       url="${pageContext.request.contextPath }/admin/advertisement/add"
                                       title="广告发布管理"><i
                                            class="fa fa-null"></i> 广告发布管理</a>
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
                <shiro:hasPermission name="elderServiceWebsite-goods">
                    <li>
                        <a href="javascript:">
                            <i class="fa fa-shopping-cart"></i>
                            <span class="title">商城管理</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a href="javascript:" data-addtab="side-goods-list"
                                   url="${pageContext.request.contextPath }/admin/goods/list"
                                   title="商品列表"><i class="fa fa-null"></i> 商品列表</a>
                            </li>
                            <li>
                                <a href="javascript:" data-addtab="side-goods-type"
                                   url="${pageContext.request.contextPath }/admin/goods/type/list"
                                   title="商品类型"><i class="fa fa-null"></i> 商品类型</a>
                            </li>
                            <li>
                                <a href="javascript:" data-addtab="side-goods-publish"
                                   url="${pageContext.request.contextPath }/admin/goods/add"
                                   title="发布商品"><i class="fa fa-null"></i> 发布商品</a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasPermission>
            </ul>
        </li>
    </shiro:hasPermission>

    <!-- 系统管理-->
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
                            <shiro:hasPermission name="system-data-serviceApproval">
                                <li>
                                    <a href="javascript:" data-addtab="service_project_approval"
                                       url="${pageContext.request.contextPath }/admin/dictionary/serviceProject/approval"
                                       title="服务项目审批"><i
                                            class="fa fa-null"></i> 服务项目审批</a>
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
