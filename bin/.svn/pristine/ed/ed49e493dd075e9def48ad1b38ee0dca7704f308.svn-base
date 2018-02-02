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
	<c:forEach items="${notices.rows}" var="notice">
		<div class="newsitem">
			<a href="${basePath }/fore/notice/details.do?noid=${notice.noid}">
				<div class="nileft">
					<img src="${basePath}/${notice.picUrl}" alt="" height="160"/>
				</div>
				<div class="niright">
					<h3>${notice.title}</h3>
					<div class="nirline">
						<span class="nirtime">发布时间：<i>${notice.createTime}</i></span>
							 <span class="nirclick">点击：<i>${notice.click}次</i></span>
					</div>
					
					<p></p>
					
				</div>
			</a>
			<div class="clearfix"></div>
		</div>
		</c:forEach>

		<div id="pageline">
			<span class="pprev">
				<c:if test="${notices.currPage<=1}">上一页</c:if>
				<c:if test="${notices.currPage>1}"><a href="?currPage=${notices.currPage-1}" style="display: inline-block;width: 45px;">上一页</a></c:if>
			</span> 
			<c:if test="${notices.total>0}">
			<c:forEach begin="1" end="${notices.totalPage}" var="i">
				<c:if test="${notices.currPage==i}"><span class="pprev">${i}</span></c:if>
				<c:if test="${notices.currPage!=i}"><a href="?currPage=${i}">${i}</a></c:if>
			</c:forEach>
			</c:if>
				<span class="pnext">
				<c:if test="${notices.currPage==notices.totalPage||notices.total==0}">下一页</c:if>
				<c:if test="${notices.currPage!=notices.totalPage&&notices.total>0}"><a href="?currPage=${notices.currPage+1}"  style="display: inline-block;width: 45px;">下一页</a></c:if>
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
</body>
</html>