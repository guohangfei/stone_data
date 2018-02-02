<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>黄历详情</title>
<meta name="description"
	content="极速数据平台提供各类生活数据API，方便开发者快速简单的开发APP、软件及其他服务平台。公交、火车、违章、快递等数据应有尽有。">
<meta name="keywords" content="极速数据,API,数据接口">
<link rel="canonical" href="http://www.jisuapi.com/">
<link href="<%=request.getContextPath()%>/fore_source/css/mainv2.css"
	rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/fore_source/js/hm.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/fore_source/js/jquery-2.0.3.min.js"></script>
<script type="<%=request.getContextPath()%>/fore_source/js/jquery.js"></script>
<link href="<%=request.getContextPath()%>/fore_source/css/jquery.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/fore_source/js/jquery.bxslider.min.js"></script>
<link
	href="<%=request.getContextPath()%>/fore_source/css/jquery.bxslider.css"
	rel="stylesheet" type="text/css" />
<link type="text/css"
	href="<%=request.getContextPath()%>/fore_source/css/lunarcss/pikaday.css"
	rel="stylesheet">
<link type="text/css"
	href="<%=request.getContextPath()%>/fore_source/css/lunarcss/site.css"
	rel="stylesheet">
<script
	src="<%=request.getContextPath()%>/fore_source/js/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/fore_source/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/fore_source/js/datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/fore_source/js/hm.min.js"></script>
<style>
.first {
	background-color: #007FC3;
}

.wrap {
	padding: 20px 0;
}

body, input, select, textarea {
	font-family: Helvetica, Arial, "Hiragino Sans GB", "Microsoft Yahei",
		"微软雅黑", STHeiti, "华文细黑", sans-serif;
}

section {
	padding: 20px 0;
}

.plugin-title {
	font-size: 80px;
	text-align: center;
	color: #fff;
	font-family: arial, sans-serif;
}

.plugin-desc {
	text-align: center;
	font-size: 20px;
	color: #fff;
	font-family: '黑体';
}

.list-group-item-heading {
	margin: 5px 0 15px;
	color: #007FC3;
}

.key {
	color: #888;
	font-weight: bold;
}

.osc_git_issues {
	display: none;
}

.osc_git_title {
	
}

.osc_git_box {
	border: 0 !important;
}

.osc_git_box .split {
	margin: 0 -15px !important;
}
</style>


</head>


<body>
	<%@include file="../../include/top.jsp"%>
	<div
		style="font-size: 20px; font-weight: 600; height: 30px; color: #E8A326; text-indent: 170px; position: relative; margin-top: -20px;">
		黄历详情</div>
	<section class="first" style="background-color: #9392F2;">
		<div class="container">

			<h4 class="plugin-desc"
				style="position: relative; margin-left: -190px;">请选择查看日期:</h4>

			<div class="wrap">
				<div class="row"
					style="position: relative; margin-top: -20px; margin-left: 20px;">
					<div class="input-group col-md-4 col-md-offset-4">
						<form action="${basePath }/fore/api_detail/lunar.do" method="post"
							onsubmit="return getAccordingDate()">
							<input id="demo" type="text" class="form-control"
								placeholder="请选择当年日期，以便于查看黄历" readonly
								aria-describedby="icon-datepicker" name="accordingDate"
								style="width: 300px;" /> &nbsp;
							<button type="submit"
								style="height: 35px; width: 60px; background-color: #4B4B4B; color: #39A9F1; font-size: 16px;">查询</button>
						</form>
						<!--<span class="input-group-addon" id="datepicker-trigger"><span class="glyphicon glyphicon-calendar"></span></span>-->
					</div>
				</div>
			</div>
		</div>
	</section>
	<div
		style="height:500px;background-image: url(${basePath }/fore_source/image/lunarCalender/lunarbackground.jpg);">

		<div
			style="padding-top: 20px; padding-left: 636px; font-size: 35px; color: yellow; position: relative; font-weight: 600;">黄道吉日
		</div>
		<div
			style="padding-left: 606px; font-size: 30px; color: purple; position: relative; margin-top: 8px;">${accordingDate }</div>
		<div
			style="padding-left: 550px; font-size: 18px; color: black; position: relative; margin-top: 8px;">${solarCalendarDay }</div>
		<div
			style="padding-left: 550px; font-size: 18px; color: black; position: relative; margin-top: 5px;">${lunarCalendarDate }</div>
		<div
			style="padding-left: 666px; font-size: 20px; color: black; position: relative; margin-top: 8px; font-weight: 600;">天干地支</div>
		<div
			style="padding-left: 545px; font-size: 18px; color: black; position: relative; margin-top: 5px;">${lunarCalendarYear }
			${lunarCalendarMonth } ${lunarCalendarDay }</div>
		<div
			style="padding-left: 666px; font-size: 20px; color: green; position: relative; margin-top: 5px; font-weight: 500;">今日所宜</div>
		<div
			style="padding-left: 476px; font-size: 18px; color: black; position: relative; margin-top: 5px;">${suit }</div>
		<div
			style="padding-left: 666px; font-size: 20px; color: red; position: relative; margin-top: 5px; font-weight: 500;">今日所忌</div>
		<div
			style="padding-left: 476px; font-size: 18px; color: black; position: relative; margin-top: 5px;">${taboo }</div>
		<div
			style="padding-left: 656px; font-size: 20px; color: black; position: relative; margin-top: 10px; font-weight: 600;">二十四节气</div>
		<div
			style="padding-left: 550px; font-size: 18px; color: black; position: relative; margin-top: 8px;">上一节气：
			${lastsolarTerm }</div>
		<div
			style="padding-left: 550px; font-size: 18px; color: black; position: relative; margin-top: 5px;">下一节气：
			${nextsolarTerm }</div>
		<a href="${basePath }/fore/index.do"
			style="position: relative; margin-left: 1200px; font-size: 18px;">返回首页</a>
	</div>
	<div class="wid" id="ouradvantage">
		<h2>
			<strong>我们的优势</strong><span>OUR ADVANTAGE</span>
		</h2>
		<ul>
			<li id="odli1"><strong>专业</strong>
				<div class="odicon">
					<img src="${basePath }/fore_source/image/profession.png" alt=""
						style="position: relative; left: -22px; top: -10px;" />
				</div>
				<p>专业的开发团队，针对开发者定制各种数据</p></li>
			<li id="odli2"><strong>标准</strong>
				<div class="odicon">
					<img src="${basePath }/fore_source/image/standard.png" alt=""
						style="position: relative; left: -20px; top: -9px;" />
				</div>
				<p>接口标准，对接方式简捷，减少企业的开发成本，提高开发效率</p></li>
			<li id="odli3"><strong>极速</strong>
				<div class="odicon">
					<img src="${basePath }/fore_source/image/fast.png" alt=""
						style="position: relative; left: -21px; top: -14px;" />
				</div>
				<p>接口数据极速响应，利于企业及时获取数据，提升服务体验</p></li>
			<li id="odli4"><strong>稳定</strong>
				<div class="odicon">
					<img src="${basePath }/fore_source/image/stablization.png" alt=""
						style="position: relative; left: -28px; top: -13px;" />
				</div>
				<p>多台服务器并行响应，稳定性99.99%</p></li>
		</ul>
		<div class="clearfix"></div>
	</div>

	<script type="text/javascript">
		function getAccordingDate() {
			var inputVal = $('#demo').val(); //获取

			if (inputVal == '') {
				alert('请选择日期！');
				return false;
			}

			if (inputVal.trim().substr(0, 4) != new Date().getFullYear()) {
				alert('只能查看本年数据。')
				return false;
			}
		}
	</script>
	<script type="text/javascript">
		$('#demo').datepicker();
	</script>

	<%@include file="../../include/foot.jsp"%>
</body>
</html>