<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0024)https://www.jisuapi.com/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>石头数据API接口_数据接口平台</title>
	<meta name="description"
		content="极速数据平台提供各类生活数据API，方便开发者快速简单的开发APP、软件及其他服务平台。公交、火车、违章、快递等数据应有尽有。">
		<meta name="keywords" content="极速数据,API,数据接口">
			<link rel="canonical" href="http://www.jisuapi.com/">
				<link
					href="<%=request.getContextPath()%>/fore_source/css/mainv2.css"
					rel="stylesheet" type="text/css">
					<script src="<%=request.getContextPath()%>/fore_source/js/hm.js"></script>
					<script type="text/javascript"
						src="<%=request.getContextPath()%>/fore_source/js/jquery-2.0.3.min.js"></script>
					<script
						type="<%=request.getContextPath()%>/fore_source/js/jquery.js"></script>
					<link
						href="<%=request.getContextPath()%>/fore_source/css/jquery.css"
						rel="stylesheet" type="text/css">
						<script type="text/javascript"
							src="${basePath}/fore_source/js/jquery.bxslider.min.js"></script>
						<link
							href="<%=request.getContextPath()%>/fore_source/css/jquery.bxslider.css"
							rel="stylesheet" type="text/css" />
</head>

<body>

	<%@include file="../../include/top.jsp"%>

	<div style="height: 500px; background-color: gray;">
		<h1>本地天气</h1>
		<iframe  allowtransparency="true" frameborder="0" width="1000" height="300" scrolling="no" src="//tianqi.2345.com/plugin/widget/index.htm?s=2&z=3&t=1&v=0&d=5&bd=0&k=000000&f=000000&q=1&e=1&a=1&c=53698&w=1000&h=300&align=center"></iframe>
		<button></button>
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
		$(document).ready(function() {
			$('.item').mouseenter(function() {
				$(this).find('.sub').show();
				$(this).addClass('hover');
			});
			$('.item').mouseleave(function() {
				$(this).find('.sub').hide();
				$(this).removeClass('hover');
			});
		});

		$('.bxslider').bxSlider({
			mode : 'fade',
			auto : true
		});
	</script>
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
	<%@include file="../../include/foot.jsp"%>
</body>
</html>