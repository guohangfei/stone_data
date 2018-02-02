<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>本月星座数据</title>

<script type="text/javascript" src="${basePath }/fore_source/js/constell/jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="${basePath }/fore_source/js/constell/commfun.js" charset="utf-8"></script>
<script type="text/javascript" src="${basePath }/fore_source/js/constell/getLogin.js" charset="utf-8"></script>
<script type="text/javascript" src="${basePath }/fore_source/js/constell/fortune.js" charset="utf-8"></script>

<link href="${basePath }/fore_source/css/mainv2.css" rel="stylesheet" type="text/css">
<link href="${basePath }/fore_source/css/api/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css">
<link href="${basePath }/fore_source/css/api/shCoreJisu.css" type="text/css" rel="stylesheet">
<link href="${basePath }/fore_source/css/constell/fortune.css" type="text/css" rel="stylesheet">

</head>
<body>

	<%@include file="../../include/top.jsp"%>

	<div id="topcrumb" class="wid">
		星座详情展示<span></span>
	</div>
	<div class="wid" id="apiibox">
	
		<div id="apiileft">
		
		<!-- 星座展示 -->		
<div id="wraper">
<div id="view">
<div class="c_main">

<div class="top"><strong>${conMain.conName }</strong>
<a href="${basePath }/fore/api_detail/consToday.do?conNum=${conMain.orderNum }">今日运势</a>
<a href="${basePath }/fore/api_detail/consTomorrow.do?conNum=${conMain.orderNum }" >明日运势</a>
<a href="${basePath }/fore/api_detail/consWeek.do?conNum=${conMain.orderNum }">本周运势</a>
<a href="${basePath }/fore/api_detail/consMonth.do?conNum=${conMain.orderNum }" class="on">本月运势</a>
<a href="${basePath }/fore/api_detail/consYear.do?conNum=${conMain.orderNum }">今年运势</a>
<a href="${basePath }/fore/api_detail/consLove.do?conNum=${conMain.orderNum }">爱情运势</a>
</div>

<div class="card_xingzuo">

<a href="${basePath }/fore/api_detail/consToday.do?conNum=1" class="l0"><img src="${basePath }/fore_source/image/constell/s_1.png"><em>白羊座<small>3.21-4.19</small></em></a>
<a href="${basePath }/fore/api_detail/consToday.do?conNum=2" class="l1"><img src="${basePath }/fore_source/image/constell/s_2.png"><em>金牛座<small>4.20-5.20</small></em></a>
<a href="${basePath }/fore/api_detail/consToday.do?conNum=3" class="l2"><img src="${basePath }/fore_source/image/constell/s_3.png"><em>双子座<small>5.21-6.21</small></em></a>
<a href="${basePath }/fore/api_detail/consToday.do?conNum=4" class="l3"><img src="${basePath }/fore_source/image/constell/s_4.png"><em>巨蟹座<small>6.22-7.22</small></em></a>
<a href="${basePath }/fore/api_detail/consToday.do?conNum=5" class="l0"><img src="${basePath }/fore_source/image/constell/s_5.png"><em>狮子座<small>7.23-8.22</small></em></a>
<a href="${basePath }/fore/api_detail/consToday.do?conNum=6" class="l1"><img src="${basePath }/fore_source/image/constell/s_6.png"><em>处女座<small>8.23-9.22</small></em></a>
<a href="${basePath }/fore/api_detail/consToday.do?conNum=7" class="l2"><img src="${basePath }/fore_source/image/constell/s_7.png"><em>天秤座<small>9.23-10.23</small></em></a>
<a href="${basePath }/fore/api_detail/consToday.do?conNum=8" class="l3"><img src="${basePath }/fore_source/image/constell/s_8.png"><em>天蝎座<small>10.24-11.22</small></em></a>
<a href="${basePath }/fore/api_detail/consToday.do?conNum=9" class="l0"><img src="${basePath }/fore_source/image/constell/s_9.png"><em>射手座<small>11.23-12.21</small></em></a>
<a href="${basePath }/fore/api_detail/consToday.do?conNum=10" class="l1"><img src="${basePath }/fore_source/image/constell/s_10.png"><em>摩羯座<small>12.22-1.19</small></em></a>
<a href="${basePath }/fore/api_detail/consToday.do?conNum=11" class="l2"><img src="${basePath }/fore_source/image/constell/s_11.png"><em>水瓶座<small>1.20-2.18</small></em></a>
<a href="${basePath }/fore/api_detail/consToday.do?conNum=12" class="l3 on"><img src="${basePath }/fore_source/image/constell/s_12.png"><em>双鱼座<small>2.19-3.20</small></em></a>

</div>

<script>(function(){var A=$('.card_xingzuo'),B=$('.top strong');B.click(function(){if($(this).attr('class')!='on'){A.fadeIn();$(this).addClass('on')}else{A.fadeOut();$(this).removeClass('on')}})})();</script>

<dl>

<dt><span><img src="${basePath }/fore_source/image/constell/${conMain.orderNum }.png"  alt="${conMain.conName }"></span></dt>

	<dd><h4>${conMain.conName  }本月运势</h4>

	<ul>
	<li><label>整体运势：</label>
	<c:forEach var="i" begin="1" end="${conMonth.zhengti }" step="1">   
			<img src="${basePath }/fore_source/image/constell/star.gif" />     
		</c:forEach>
	</li>
	<li><label>爱情运势：</label>
	<c:forEach var="i" begin="1" end="${conMonth.aiqing }" step="1">   
			<img src="${basePath }/fore_source/image/constell/star.gif" />     
		</c:forEach>
	</li>
	<li><label>事业学业：</label>
	<c:forEach var="i" begin="1" end="${conMonth.shiye }" step="1">   
			<img src="${basePath }/fore_source/image/constell/star.gif" />     
		</c:forEach>
	</li>
	<li><label>财富运势：</label>
	<c:forEach var="i" begin="1" end="${conMonth.caifu }" step="1">   
			<img src="${basePath }/fore_source/image/constell/star.gif" />     
		</c:forEach>
	</li>
	<li class="desc"><label>短评：</label>${conMonth.duanping }</li>
	
	</ul>
	</dd>

</dl>

<div class="c_box">
<div class="v_ad_2"><script>setp_ad(1,2)</script></div>
<div class="c_cont">

<p><strong class="p1">整体运势</strong><span>${conMonth.zhengtib }</span></p>
<p><strong class="p2">爱情运势</strong><span>${conMonth.aiqingb }</span></p>
<p><strong class="p3">事业学业</strong><span>${conMonth.shiyeb }</span></p>
<p><strong class="p4">财富运势</strong><span>${conMonth.caifub }</span></p>
<p><strong class="p5">健康运势</strong><span>${conMonth.jiankangb }</span></p>
<p><strong class="p6">解压方式</strong><span>${conMonth.jieyab }</span></p>
<p><strong class="p7">开运小秘诀</strong><span>${conMonth.kaiyunb }</span></p><div class="z"></div></div>

</div>
</div>
</div>
<div class="clearfix"></div>
</div>
			
			
		<!-- 中右展示页面 -->
		</div>
		<div id="apiiright">
			<%@include file="../../include/con_right.jsp" %>
		</div>
		<div class="clearfix"></div>
	</div>



	<%@include file="../../include/foot.jsp"%>


</body>
</html>