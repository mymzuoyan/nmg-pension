<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>自助报警</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/admin/institution/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/admin/institution/css/style.css">
</head>
<body>
	<div class="content">
		<div class="chart_cont2">
			<div class="chart_til">自助报警数量统计</div>
			<div class="chart_detail">
				<div id="bj_number_tj">
					<div class="bj_number1">
						<div class="bj_number1_1"><span class="bj_num">12</span><br><span class="bj_name">今日新增</span></div>
						<div class="bj_number1_2"><span class="bj_num">12</span><br><span class="bj_name">未解决</span></div>
						<div class="bj_number1_3"><span class="bj_num">12</span><br><span class="bj_name">已解决</span></div>
					</div>
					<div class="bj_number2"><span class="bj_ze">&nbsp;</span><br><span class="bj_num">12</span><br><span class="bj_name">历史遗留</span></div>
					<div class="bj_number3"><span class="bj_ze2">&nbsp;</span><br><span class="bj_num">12</span><br><span class="bj_name">本周</span></div>
					<div class="bj_number4"><span class="bj_ze2">&nbsp;</span><br><span class="bj_num">12</span><br><span class="bj_name">本月</span></div>
				</div>
			</div>
		</div>
		<div class="chart_cont2">
			<div class="chart_til">自助报警处理结果</div><!-- bzt_pro -->
			<div class="chart_detail">
				<div id="zzbjjg" style="height: 230px;"> <!-- 饼状图 --> </div>
			</div>
		</div>
		<div class="chart_cont2">
			<div class="chart_til">自助报警趋势分析</div><!-- bzt_pro -->
			<div class="chart_detail">
				<div id="zzbjqsfx" style="height: 230px;"> <!-- 曲线图 --> </div>
			</div>
		</div>
		<div class="chart_cont2">
			<div class="chart_til">自助报警科室分布</div>
			<div class="chart_detail" style="height: 275px;">
				<div id="zzbjksfb" style="height: 230px;"> <!-- 柱状图 --> </div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath }/assets/admin/institution/js/echarts.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/assets/admin/institution/js/data_echarts2.js" type="text/javascript"></script>
</body>
</html>