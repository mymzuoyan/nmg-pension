<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>自助报警详情</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/admin/institution/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/admin/institution/css/style.css">
</head>
<body>
	<div class="content">
		<div class="chart_cont2">
			<div class="chart_til">实时定位</div>
			<div class="chart_detail" style="text-align: center;vertical-align: middle;">
				<a href=""><img style="margin-top: 10px" src="${pageContext.request.contextPath }/assets/admin/institution/images/ssdwi.jpg"></a>
			</div>
		</div>
		<div class="chart_cont2">
			<div class="chart_til">视频监控</div><!-- bzt_pro -->
			<div class="chart_detail"  style="text-align: center;vertical-align: middle;">
				<a href=""><img style="margin-top: 10px" src="${pageContext.request.contextPath }/assets/admin/institution/images/spjk1.jpg"></a>
			</div>
		</div>
		<div class="chart_cont2">
			<div class="chart_til2">
				<ul class="tab_tit">
					<li class="act2">老人信息</li>
					<li>设备信息</li>
				</ul>
			</div><!-- bzt_pro -->
			<div class="chart_detail info2">
				<div class="thisclass hidden">
					<div class="xx1">
						<div class="lf xximg"><img src="${pageContext.request.contextPath }/assets/admin/institution/images/laoren.jpg" style="width: 135px; height: 170px;"></div>
						<div class="rt xxzl">
							<table cellspacing="0" cellpadding="0" border="0" style="">
								<tr>
									<td width="70px" class="ryxx_name">入住信息</td>
									<td>老年养护二部（北）-7F-704-8</td>
								</tr>
								<tr>
									<td class="ryxx_name">护理级别</td>
									<td>自理</td>
								</tr>
								<tr>
									<td class="ryxx_name">护工</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td class="ryxx_name">养护主任</td>
									<td>&nbsp;</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="xx2">张爷爷&nbsp;&nbsp;&nbsp;&nbsp;男&nbsp;&nbsp;&nbsp;&nbsp;54岁</div>
				</div>
				<div class="hidden">设备信息内容</div>
			</div>
		</div>
		<div class="chart_cont2">
			<div class="chart_til2">
				<ul class="tab_tit3">
					<li class="act3">处理预案</li>
					<li>催办记录</li>
				</ul>
			</div>
			<div class="chart_detail info3">
				<div class="thisclass hidden">
					<div class="clya1">
						<div class="clya1_1">1、调看摄像头记录，确认老人的位置和现状；2.立即通知所属护工进行处理；3.护工在5分钟内未处理，继续电话通知督办。</div>
						<div class="clya1_2"><input type="button" value="催办" name=""></div>
					</div>
					<div class="clya2">*可对长时间无人处理的报警进行催办，再通知相关人员处理</div>
				</div>
				<div class="hidden">催办记录内容</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/admin/institution/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/admin/institution/js/functions.js"></script>
</body>
</html>