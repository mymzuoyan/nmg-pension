<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: gengqiang
  Date: 2018/1/19
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ul class="page-sidebar-menu " data-auto-scroll="true" data-slide-speed="200">
    <li class="">
        <a href="javascript:">
            <i class="fa fa-phone"></i>
            <span class="title"> 呼叫管理</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu">
            <li>
                <a href="javascript:;" id="nowCallInfo1" data-addtab="nowCallInfo"
                   url="http://223.83.194.9:32766/agent/dscom_login.php?type=extension&username=${sessionScope.login_user.disphone}&password=${sessionScope.login_user.pwd}&queuenum=${sessionScope.login_user.queue}&agent=${sessionScope.login_user.agent}"
                   title="呼叫中心">
                    <i class="fa fa-null"></i> 呼叫中心
                </a>
            </li>
            <li>
                <a href="javascript:;" id="nowCallInfo" data-addtab="nowCallInfo"
                   url="${pageContext.request.contextPath }/admin/call/nowCallInfo"
                   title="正在响应的呼叫">
                    <i class="fa fa-null"></i> 正在响应的呼叫
                </a>
            </li>
            <li>
                <a href="javascript:;" data-addtab="abandonCall"
                   url="${pageContext.request.contextPath }/admin/call/index"
                   title="待响应的呼叫">
                                            <span id="abandonedCount"
                                                  class="badge badge-danger"></span>
                    <i class="fa fa-null"></i> 待响应的呼叫
                </a>
            </li>
            <li>
                <a href="javascript:;" data-addtab="call_list"
                   url="${pageContext.request.contextPath }/admin/call/list?method=new"
                   title="历史服务记录"> <i
                        class="fa fa-null"></i> 历史服务记录</a>
            </li>
            <li>
                <a href="javascript:;" data-addtab="call_abnormal_list"
                   url="${pageContext.request.contextPath }/admin/call/abnormal/list"
                   title="异常工单"> <i
                        class="fa fa-null"></i> 异常工单</a>
            </li>
            <li class="">
                <a href="javascript:;">
                    <i class="fa fa-null"></i> 呼叫客户管理<span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="javascript:;" data-addtab="customer_add"
                           url="${pageContext.request.contextPath }/admin/call/customer/add"
                           title="创建呼叫客户"> <i
                                class="fa fa-null"></i> 创建呼叫客户</a>
                    </li>
                    <li>
                        <a href="javascript:;" data-addtab="customer_list"
                           url="${pageContext.request.contextPath }/admin/call/customer/list"
                           title="客户列表">
                            <i class="fa fa-null"></i> 客户列表</a>
                    </li>
                    <li>
                        <a href="javascript:;" data-addtab="customer_group_add"
                           url="${pageContext.request.contextPath }/admin/call/customer/group/add"
                           title="创建呼叫客户">
                            <i class="fa fa-null"></i> 创建客户群组</a>
                    </li>
                    <li>
                        <a href="javascript:;" data-addtab="customer_group_list"
                           url="${pageContext.request.contextPath }/admin/call/customer/group/list"
                           title="群组列表"><i
                                class="fa fa-null"></i> 群组列表</a>
                    </li>
                </ul>
            </li>
        </ul>
    </li>
    <li>
        <a href="javascript:;" data-addtab="visit_list"
           url="${pageContext.request.contextPath }/admin/call/visit/list"
           title="日常回访"> <i
                class="fa fa-chain (alias)"></i> 日常回访</a>
    </li>
    <li>
        <a href="javascript:">
            <i class="fa fa-tasks"></i>
            工单派遣
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
        </ul>
    </li>
    <li class="">
        <a href="javascript:;" href="javascript:">
            <i class="fa fa-location-arrow "></i>
            <span class="title"> 信息查询</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu" style="">
            <li>
                <a href="javascript:;" data-addtab="elder_Info"
                   url="${pageContext.request.contextPath }/admin/elderMsg/elder_Info"
                   title="老人基础信息">
                    <i class="fa fa-null"></i> 老人基础信息</a>
            </li>
            <li>
                <a href="javascript:;" data-addtab="elder_goveInfo"
                   url="${pageContext.request.contextPath }/admin/elderMsg/elder_goveInfo"
                   title="政府购买信息">
                    <i
                            class="fa fa-null"></i> 政府购买信息</a>
            </li>
            <li>
                <a href="javascript:;" data-addtab="side-serviceOrg-list"
                   url="${pageContext.request.contextPath }/admin/serviceOrgShow"
                   title="养老服务组织"><i
                        class="fa fa-null"></i> 养老服务组织</a>
            </li>
            <li>
                <a href="javascript:;" data-addtab="side-serviceOrg-map"
                   url="${pageContext.request.contextPath }/admin/serviceOrgShow/map"
                   title="服务组织地图"><i
                        class="fa fa-null"></i> 服务组织地图</a>
            </li>
        </ul>
    </li>
    <li class="">
        <a href="javascript:;" href="javascript:">
            <i class="fa icon-layers "></i>
            <span class="title"> 数据管理</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu" style="">
            <li>
                <a href="javascript:;" data-addtab="task_list"
                   url="${pageContext.request.contextPath }/admin/task/task_list"
                   title="工单统计"> <i
                        class="fa fa-null"></i> 工单统计</a>
            </li>
            <li>
                <a href="javascript:;" data-addtab="call_statistics"
                   url="${pageContext.request.contextPath }/admin/call/call_statistics"
                   title="呼叫数据分析"> <i
                        class="fa fa-null"></i> 呼叫数据分析</a>
            </li>
            <li>
                <a href="javascript:;" data-addtab="monitor_statistics"
                   url="${pageContext.request.contextPath }/admin/call/monitor_statistics"
                   title="坐席统计">
                    <i class="fa fa-null"></i> 坐席统计</a>
            </li>
        </ul>
    </li>
    <li class="">
        <a href="javascript:;">
            <i class="fa fa-edit"></i> 坐席管理<span class="arrow"></span>
        </a>
        <ul class="sub-menu">
            <li>
                <a href="javascript:;" data-addtab="monitor_add"
                   url="${pageContext.request.contextPath }/admin/call/monitor/add"
                   title="创建坐席"> <i
                        class="fa fa-null"></i> 创建坐席</a>
            </li>
            <li>
                <a href="javascript:;" data-addtab="monitor_list"
                   url="${pageContext.request.contextPath }/admin/call/monitor/list"
                   title="创建坐席"> <i
                        class="fa fa-null"></i> 坐席列表</a>
            </li>
            <li>
                <a href="javascript:;" data-addtab="monitor_group"
                   url="${pageContext.request.contextPath }/admin/call/monitor/group"
                   title="坐席组"> <i
                        class="fa fa-null"></i> 坐席组</a>
            </li>
        </ul>
    </li>
    <li class="">
        <a href="javascript:;">
            <i class="fa fa-edit"></i> 知识库管理<span class="arrow"></span>
        </a>
        <ul class="sub-menu">
            <li>
                <a href="javascript:;" data-addtab="knowledge_type_add"
                   url="${pageContext.request.contextPath }/admin/call/knowledge/type/list"
                   title="类型列表"> <i
                        class="fa fa-null"></i> 类型列表</a>
            </li>
            <li>
                <a href="javascript:;" data-addtab="knowledge_list"
                   url="${pageContext.request.contextPath }/admin/call/knowledge/list"
                   title="知识库列表"> <i
                        class="fa fa-null"></i> 知识库列表</a>
            </li>
            <li>
                <a href="javascript:;" data-addtab="knowledge_add"
                   url="${pageContext.request.contextPath }/admin/call/knowledge/add"
                   title="添加知识库"> <i
                        class="fa fa-null"></i> 添加知识库</a>
            </li>
        </ul>
    </li>
</ul>
