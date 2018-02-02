<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>接口大全-顽石数据</title>
<link href="${basePath }/fore_source/css/mainv2.css" rel="stylesheet"
	type="text/css">
<script src="${basePath }/fore_source/js/hm.js"></script>
<script type="text/javascript"
	src="${basePath }/fore_source/js/jquery-2.js"></script>
</head>

<body>
	<!-- 页眉 -->
	<%@ include file="../include/top.jsp"%>

	<!-- 主体页面 -->
	<div class="wid" id="apilbox">
		<div id="apileft">
			<h2>接口列表</h2>
			<ul>
				<li style="margin-top: 30px;"><a>全国天气</a></li>
				<li style="margin-top: 30px"><a>黄道吉日</a></li>
				<li style="margin-top: 30px"><a>星座运势</a></li>
				<li style="margin-top: 30px"><a>河北快三</a></li>
			</ul>
		</div>
		<div id="apiright">
			<div id="apirtitle">
				<h1>全部接口</h1>
				<div class="clearfix"></div>
			</div>

			<div id="apilistbox" class="hotdata">
				<ul>
					<li style="border-top-color: #ff7457; width: 220px;">
					<a href="${basePath }/fore/api/weather.do"> 
						<img src="../fore_source/image/my/weather.png" alt="全国天气" height="70">
							<h3>全国天气</h3> <span><i><del>￥</del>350</i>/10000次</span>
					</a>
					</li>
					<li style="border-top-color: #4F98BD; width: 220px;"><a
						href="${basePath }/fore/api/lunar.do"> <img
							src="../fore_source/image/my/huangli.png" alt="黄道吉日" height="70">
							<h3>黄道吉日</h3> <span><i><del>￥</del>45</i>/1000次</span>
					</a></li>
					<li style="border-top-color: #a2e132; width: 220px;"><a
						href="${basePath }/fore/api/constellation.do"> <img
							src="../fore_source/image/my/astro.png" alt="星座运势" height="70">
							<h3>星座运势</h3> <span><i><del>￥</del>49</i>/10000次</span>
					</a></li>
					<li class="hdlilast"
						style="border-top-color: #7aabff; width: 220px;"><a
						href="${basePath }/fore/api/lottery.do"> <img
							src="../fore_source/image/my/caipiao.png" alt="河北快三" height="70">
							<h3>河北快三</h3> <span><i><del>￥</del>199</i>/10000次</span>
							</div>
					</a></li>

				</ul>

				<div class="clearfix"></div>
			</div>
		</div>

		<div class="clearfix"></div>
	</div>

	<script type="text/javascript">
		$("#logininbox>a").hover(function() {
			$('#loginindown').show();
		}, function() {
			$('#loginindown').hide();
		});

		$("#loginindown").hover(function() {
			$(this).show();
			$("#logininbox>a").addClass('on');
		}, function() {
			$(this).hide();
			$("#logininbox>a").removeClass('on');
		});
	</script>
  

	<!-- 页脚 -->
	<%@ include file="../include/foot.jsp"%>


</body>
</html>