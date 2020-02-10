<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/24
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>控制台</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/assets/global/plugins/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/assets/view/css/manage.css"/>
</head>
<body>
<div class="layui-tab layui-tab-card" lay-unauto="">
    <div id="leftClick" class="layui-icon layui-icon-prev"></div>
    <div id="rightClick" class="layui-icon layui-icon-next"></div>
    <ul class="layui-tab-title"></ul>
    <div class="layui-tab-content" style="height: 100%;">
        <div class="layui-tab-item layui-show">
            <div class="xinXi"></div>
            <div class="xiangQing">
            </div>
        </div>
    </div>
</div>
<div id="right">
    <p id="right_p">
        <span></span>
        <button class="layui-icon layui-icon-search">查询</button>
        <input placeholder="请输入房间编号">
    </p>
    <div id="right_bottom">
        <ul id="right_ul">
            <%--<li>房间类型：<span></span></li>
            <li>朝向：<span></span></li>
            <li>房间面积：<span></span></li>
            <li>辅助用房设施：<span></span></li>
            <li>其他辅助用房设施：<span></span></li>
            <li>房间设备：<span></span></li>--%>
        </ul>
        <div id="right_type">
            <%--<ul>
                <li class="right_type_key">床位编号：</li>
                <li>123456</li>
                <li class="right_type_key">姓名：</li>
                <li>张三</li>
                <li class="right_type_key">性别：</li>
                <li>男</li>
                <br/>
                <li class="right_type_key">年龄：</li>
                <li>80</li>
                <li class="right_type_key">人员类别：</li>
                <li>社会老年人</li>
                <li class="right_type_key">自理能力：</li>
                <li>完全不能自理老年人</li>
                <br/>
                <li class="right_type_key">入院时间：</li>
                <li>2008-11-08</li>
                <li class="right_type_key">联系人：</li>
                <li>李四</li>
                <li class="right_type_key">联系电话：</li>
                <li>123456789</li>
                <br/>
                <li class="right_type_key">现病史：</li>
                <li>糖尿病</li>
                <p class="touX layui-icon layui-icon-friends"></p>
                <p class="clickT">
                    <span>基本信息</span>
                    &lt;%&ndash;<span>联系人</span>
                    <span>入住期评估</span>
                    <span>健康档案</span>
                    <span>生命体征检测</span>
                    <span>欠费</span>
                    <span>退费</span>&ndash;%&gt;
                </p>
            </ul>--%>

        </div>
    </div>
</div>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/global/scripts/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/global/plugins/layui/layui.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/global/scripts/manage.js"></script>
</body>
</html>
