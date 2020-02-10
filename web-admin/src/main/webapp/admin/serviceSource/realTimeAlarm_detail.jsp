<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>实时报警</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/admin/institution/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/admin/institution/css/style.css">
</head>
<body>
	<div class="content">
		<div class="chart_cont">
			<div class="chart_til">今日监控</div>
			<div class="chart_detail">
				<div id="today_number" style="height: 230px;"> <!-- 横向柱状图 --> </div>
			</div>
		</div>
		<div class="chart_cont">
			<div class="chart_til">报警总数统计</div>
			<div class="chart_detail" style="height: 275px;">
				<div id="in_total" style="height: 230px;"> <!-- 柱状图 --> </div>
			</div>
		</div>
		<div class="chart_cont">
			<div class="chart_til">报警处理分析</div><!-- bzt_pro -->
			<div class="chart_detail">
				<div id="bzt_pro" style="height: 230px;"> <!-- 饼状图 --> </div>
			</div>
		</div>
		<div class="chart_cont">
			<div class="chart_til">催办次数统计</div><!-- bzt_pro -->
			<div class="chart_detail">
				<div id="bzt_pro2" style="height: 230px;"> <!-- 饼状图2 --> </div>
			</div>
		</div>
		<div class="chart_cont">
			<div class="chart_til">报警趋势分析</div><!-- bzt_pro -->
			<div class="chart_detail">
				<div id="bj_qxfx" style="height: 230px;"> <!-- 曲线图 --> </div>
			</div>
		</div>
		<div class="chart_cont">
			<div class="chart_til">在用设备统计</div><!-- bzt_pro -->
			<div class="chart_detail">
				<div id="zysbtj">
					<ul>
						<li class="green"><span class="lf sbmc">床垫</span><span class="rt sbsl">13</span></li>
						<li class="yellow"><span class="lf sbmc">定位开</span><span class="rt sbsl">13</span></li>
						<li class="blue"><span class="lf sbmc">跌倒报警设备</span><span class="rt sbsl">13</span></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath }/assets/admin/institution/js/echarts.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/assets/admin/institution/js/data_echarts.js" type="text/javascript"></script>
</body>
</html>