<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>全场数据五折起，数据有买就有送！ - 活动新闻 - 极速数据</title>
	<meta name="description"
		content="在这辞旧迎新之际，极速数据推出“全场数据五折起，数据有买就有送”的主题惠赠活动，全站数据五折起，更有超值礼

品等你来拿。">
		<meta name="keywords" content="全场数据五折起，数据有买就有送！,活动">
			<link rel="canonical" href="#">
				<link href="${basePath}/fore_source/css/mainv2.css" rel="stylesheet"
					type="text/css">
					<script src="${basePath}/fore_source/js/hm.js"></script>
					<script type="text/javascript"
						src="${basePath}/fore_source/js/jquery-2.js"></script>
</head>

<body>
	<%@include file="../include/top.jsp"%>

	<div class="wid">
		<c:forEach items="${noticeslist}" var="noti">
			<div id="topcrumb">
				<a href="${basePath}/fore/index.do">首页</a> <span></span> <a
					href="${basePath}/fore/notice/list.do">公告动态</a> <span></span> <a
					href="#">${noti.typeName}</a>
			</div>
			<div id="newsbox">

				<h1>${noti.title}</h1>
				<div class="nirline">
					<span class="nirtime">发布时间：<i>${noti.createTime}</i></span> <span
						class="nirclick">点击：<i>${noti.click}</i>次
					</span>
				</div>
				<div id="newscontent">${noti.content}</div>
			</div>
		</c:forEach>

	</div>
	<div id="newsright">
		<div id="indexnews">
			<h2>
				<strong>公告信息</strong><span>NOTICES</span> <a
					href="${basePath}/fore/notice/list.do">更多</a>
			</h2>
			<ul style="display: inline-block;">
				<c:forEach items="${notices.rows}" var="notice" varStatus="i">
					<li><a
						href="${basePath}/fore/notice/details.do?noid=${notice.noid}"
						<c:if test="${i.index==0}">class="on"</c:if>>${notice.title}</a></li>
				</c:forEach>
			</ul>
		</div>

	</div>
	<div class="clearfix"></div>

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
	<%@include file="../include/foot.jsp"%>
</body>
</html>