<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>公告-广告 信息 顽石数据</title>
	<meta name="description" content="">
		<meta name="keywords" content="API,大数据新闻,新闻">
			<link href="${basePath}/fore_source/css/mainv2.css" rel="stylesheet"
				type="text/css">
				<script src="${basePath}/fore_source/js/hm.js"></script>
				<script type="text/javascript"
					src="${basePath}/fore_source/js/jquery-2.js"></script>
</head>
<body>
	<%@include file="../include/top.jsp"%>

	<div class="wid clearfix" id="news">
	
			<c:forEach items="${publicities.rows}" var="publictity">
		<div class="newsitem">
			<a href="${basePath }/fore/publicity/details.do?noid=${publictity.noid}">
				<div class="nileft">
					<img src="${basePath}/${publictity.picUrl}" alt="" height="160"/>
				</div>
				<div class="niright">
					<h3>${publictity.title}</h3>
					<div class="nirline">
						<span class="nirtime">发布时间：<i>${publictity.createTime}</i></span>
							 <span class="nirclick">点击：<i>${publictity.click}次</i></span>
					</div>
					
					<p></p>
					
				</div>
			</a>
			<div class="clearfix"></div>
		</div>
		</c:forEach>


		<div id="pageline">
			<span class="pprev">
				<c:if test="${publicities.currPage<=1}">上一页</c:if>
				<c:if test="${publicities.currPage>1}"><a href="?currPage=${publicities.currPage-1}" style="display: inline-block;width: 45px;">上一页</a></c:if>
			</span> 
			<c:if test="${publicities.total>0 }">
			<c:forEach begin="1" end="${publicities.totalPage}" var="i">
				<c:if test="${publicities.currPage==i}"><span class="pprev">${i}</span></c:if>
				<c:if test="${publicities.currPage!=i}"><a href="?currPage=${i}">${i}</a></c:if>
			</c:forEach>
			</c:if>
				<span class="pnext">
				<c:if test="${publicities.currPage==publicities.totalPage||publicities.total==0}">下一页</c:if>
				<c:if test="${publicities.currPage!=publicities.totalPage&&publicities.total>0}"><a href="?currPage=${publicities.currPage+1}" style="display: inline-block;width: 45px;">下一页</a></c:if>
				</span>
		</div>
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
	<script type="text/javascript"
		src="${basePath}/fore_source/js/widget.js"></script>
	<div id="contactwidget">
		<ul>
			<li id="wgqq"><a href="javascript:;">QQ</a>
				<div class="wgbox" style="display: none;">
					<ul>
						<li><a target="_blank"
							href="http://wpa.qq.com/msgrd?v=3&amp;uin=2732567275&amp;site=qq&amp;menu=yes"
							rel="nofollow" class="qqa">QQ在线客服</a></li>
						<li><a target="_blank"
							href="http://shang.qq.com/wpa/qunwpa?idkey=ace5f97dea665034b4c9cf121aa00599578b28dfc9c017199a58661bc8933e34"
							rel="nofollow" class="qquna">QQ群</a></li>
					</ul>
				</div>
				<div id="wgqqbotline"></div></li>
			<li id="wgwx"><a href="javascript:;">微信</a>
				<div class="wgbox" style="display: none;">
					<img
						src="API%E6%96%B0%E9%97%BB_%E5%A4%A7%E6%95%B0%E6%8D%AE%E6%96%B0%E9%97%BB%20-%20%E6%9E%81%E9%80%9F%E6%95%B0%E6%8D%AE_files/qrcode200.jpg"
						alt="极速微信" height="105">
				</div></li>
			<li id="wgtop"><a href="javascript:;">TOP</a></li>
		</ul>
	</div>

	<%@include file="../include/foot.jsp"%>
</body>
</html>