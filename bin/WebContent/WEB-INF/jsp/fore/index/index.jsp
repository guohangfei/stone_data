<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0024)https://www.jisuapi.com/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>顽石数据_数据接口平台</title>
	<meta name="description" content="极速数据平台提供各类生活数据API，方便开发者快速简单的开发APP、软件及其他服务平台。公交、火车、违章、快递等数据应有尽有。">
	<meta name="keywords" content="极速数据,API,数据接口">
	<link href="${basePath}/fore_source/css/mainv2.css" rel="stylesheet" type="text/css">
	<script src="${basePath}/fore_source/js/hm.js"></script>
	<script type="text/javascript" src="${basePath}/fore_source/js/jquery-2.0.3.min.js"></script>
	<script type="${basePath}/fore_source/js/jquery.js"></script>
	<link href="${basePath}/fore_source/css/jquery.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${basePath}/fore_source/js/jquery.bxslider.min.js"></script>
	<link href="${basePath}/fore_source/css/jquery.bxslider.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<%@include file="../include/top.jsp"%>

	<div id="topbox" class="wid">
		<div id="allcat" class="allcat">
			<!-- <div id="tbctop"></div> -->
			<div id="tbctitle">常用数据</div>
			<div class="item first">

				<span><h3>
						<a href="${basePath}/fore/api/weather.do">天气预报 <span
							style="font-size: 10px; color: grey;">提供全国各个地市天气信息业务
								49￥/10000次 </span></a>
					</h3> <del></del> </span>

			</div>
			<div class="item">

				<span><h3>
						<a href="${basePath}/fore/api/lunar.do">黄道吉日 <span
							style="font-size: 10px; color: grey;">包罗万象的传统习俗及吉凶预测
								29￥/10000次 </span></a>
					</h3> <del></del> </span>

			</div>
			<div class="item">

				<span><h3>
						<a href="${basePath}/fore/api/constellation.do">星座运势 <span
							style="font-size: 10px; color: grey;">最全面的星座解析和塔罗牌预测
								29￥/10000次 </span></a>
					</h3> <del></del> </span>

			</div>
			<div class="item">

				<span><h3>
						<a href="${basePath}/fore/api/lottery.do">彩票数据 <span
							style="font-size: 10px; color: grey;">订购后，没人中奖你找我！
								59￥/10000次 </span></a>
					</h3> <del></del> </span>

			</div>

		</div>
		<div id="flashdiv">
			<div class="bx-wrapper" style="max-width: 100%;">
				<div class="bx-viewport"
					style="width: 100%; overflow: hidden; position: relative; height: 360px;">
					<ul class="bxslider" style="width: auto; position: relative;">
						<li
							style="float: none; list-style: none; position: absolute; width: 680px; z-index: 50; display: block;"><a
							href="#" target="_blank"><img
								src="${basePath }/fore_source/image/slide.png" alt="顽石科技"></a></li>
						<li
							style="float: none; list-style: none; position: absolute; width: 680px; z-index: 0; display: none;"><a
							href="#" target="_blank"><img
								src="${basePath }/fore_source/image/20160808034920_21622.jpg"
								alt="新用户注册即送100元代金券。"></a></li>
						<li
							style="float: none; list-style: none; position: absolute; width: 680px; z-index: 0; display: none;"><a
							href="#" target="_blank"><img
								src="${basePath }/fore_source/image/20161206014212_41042.jpg"
								alt="验证码短信上线"></a></li>
					</ul>
				</div>
				<div class="bx-controls bx-has-pager bx-has-controls-direction">
					<div class="bx-pager bx-default-pager">
						<div class="bx-pager-item">
							<!-- <a href="#" data-slide-index="0" class="bx-pager-link active">1</a> -->
						</div>
						<div class="bx-pager-item">
							<!-- <a href="#" data-slide-index="1" class="bx-pager-link">2</a> -->
						</div>
						<div class="bx-pager-item">
							<!-- <a href="#" data-slide-index="2" class="bx-pager-link">3</a> -->
						</div>
					</div>
					<div class="bx-controls-direction">
						<a class="bx-prev" href="#">Prev</a> <a class="bx-next" href="#">Next</a>
					</div>
				</div>
			</div>
		</div>

		<div id="indexnews">
			<h2>
				<strong>公告信息</strong><span>NOTICES</span> <a
					href="${basePath}/fore/notice/list.do">更多</a>
			</h2>
			<ul>
				<c:forEach items="${notices.rows}" var="notice" varStatus="i">
					<li><a
						href="${basePath}/fore/notice/details.do?noid=${notice.noid}"
						<c:if test="${i.index==0}">class="on"</c:if>>${notice.title}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>


	<div class="wid hotdata clearfix" id="hotdata">
		<h2>
			<strong>热门数据</strong><span>HOT DATA</span> <a name="anchorlink"></a>
		</h2>
		<ul>
			
			<a href="${basePath }/fore/api_detail/weather.do"> <c:if
					test="${weather_test==0}">
					<li
						style="background-image: url('${basePath }/fore_source/image/weather_back.jpg');">
						数据更新中请稍后<br> <img
							src="${basePath }/fore_source/image/wait.gif" />
					</li>
				</c:if> <c:forEach items="${nowWeather}" var="nw">
					<c:if test="${weather_test==1}">
						<li
							style="background-image: url('${basePath }/fore_source/image/weather_back.jpg');">

							<c:if test="${nw.weather_detail_img_sta!=40}">
								<img style="margin-top: -40px;"
									src="${basePath }/fore_source/image/weather/${nw.weather_detail_img_sta }.png" />
								<br>
							</c:if> <c:if
								test="${nw.weather_detail_img_sta!=nw.weather_detail_img_end }">
								<img src="${basePath }/fore_source/image/weather/${nw.weather_detail_img_end }.png" />
								<p>${nw.city_name }</p>
							</c:if>
							<p style="margin-top: -100px;float: left;">
							<img style="margin-top: -8px;" height="20px" width="20px" src="${basePath }/fore_source/image/dingwei.jpg" />${province_name }-${city_name }</p>
							<p>
								<strong>${nw.weather_date }</strong>
							</p>
							<p>${nw.weather_detail }</p> <font class="blue">${nw.min_temp }</font>～<font                     
							class="red">${nw.max_temp }℃</font><br>
								<p>${nw.wind_level }</p>
								<p>查看今日天气详情</p>
								<h4>空气${nw.air_quality}</h4>
								<h4>湿度${nw.humidity }</h4></a>
			</li>
			</c:if>

			</c:forEach>

			<li
				style="border-top-color: #a2e132;background-image: url(${basePath }/fore_source/image/lunarCalender/lunarbackground.jpg);">

				<div
					style="font-size: 25px; color: yellow; position: relative; margin-top: -65px; font-weight: 600;">
					黄道吉日
					<p style="font-size: 20px; float: right; color: purple;">${accordingDate }</p>
				</div> <a href="${basePath }/fore/api_detail/lunar.do">
					<div
						style="font-size: 14px; color: black; position: relative; margin-top: 8px;">${solarCalendarDay }</div>
					<div
						style="font-size: 15px; color: black; position: relative; margin-top: 5px;">${lunarCalendarDate }</div>
					<div
						style="font-size: 20px; color: black; position: relative; margin-top: 8px; font-weight: 600;">天干地支</div>
					<div
						style="font-size: 14px; color: black; position: relative; margin-top: 5px;">${lunarCalendarYear }
						${lunarCalendarMonth } ${lunarCalendarDay }</div>
					<div
						style="font-size: 20px; color: green; position: relative; margin-top: 5px; font-weight: 500;">今日所宜</div>
					<div
						style="font-size: 15px; color: black; position: relative; margin-top: 5px;">${suit }</div>
					<div
						style="font-size: 20px; color: red; position: relative; margin-top: 5px; font-weight: 500;">今日所忌</div>
					<div
						style="font-size: 15px; color: black; position: relative; margin-top: 5px;">${taboo }</div>
					<div
						style="font-size: 20px; color: black; position: relative; margin-top: 8px; font-weight: 600;">二十四节气</div>
					<div
						style="font-size: 15px; color: black; position: relative; margin-top: 5px;">上一节气：
						${lastsolarTerm }</div>
					<div
						style="font-size: 15px; color: black; position: relative; margin-top: 5px;">下一节气：
						${nextsolarTerm }</div>
			</a>
			</li>

			<!-- 星座运势的数据展示 -->
			<li
				style="border-top-color: #7babff;background-image: url(${basePath }/fore_source/image/constell/constell_background.jpg)">
				<a
				href="${basePath }/fore/api_detail/consToday.do?conNum=${conMain.orderNum}">
					<div style="position: relative; margin-top: -40px;">
						<img
							src="${basePath }/fore_source/image/constell/${conMain.orderNum }.png " />
					</div>
					<div>${conMain.conName }</div>
					<div>${conMain.dateRange}</div>
					<table>
						<tr>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td>整体运势：</td>
							<td><c:forEach var="i" begin="1" end="${conDay.zhengti }"
									step="1">
									<img src="${basePath }/fore_source/image/constell/star.gif" />
								</c:forEach></td>
						</tr>
						<tr>
							<td></td>
							<td>爱情运势：</td>
							<td><c:forEach var="i" begin="1" end="${conDay.aiqing }"
									step="1">
									<img src="${basePath }/fore_source/image/constell/star.gif" />
								</c:forEach></td>
						</tr>
						<tr>
							<td></td>
							<td>事业运势：</td>
							<td><c:forEach var="i" begin="1" end="${conDay.shiye }"
									step="1">
									<img src="${basePath }/fore_source/image/constell/star.gif" />
								</c:forEach></td>
						</tr>
						<tr>
							<td></td>
							<td>财富运势：</td>
							<td><c:forEach var="i" begin="1" end="${conDay.caifu }"
									step="1">
									<img src="${basePath }/fore_source/image/constell/star.gif" />
								</c:forEach></td>
						</tr>
						<tr>
							<td></td>
							<td align="left">短&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp评：</td>
							<td>${conDay.duanping }</td>
						</tr>
					</table>
			</a>
			</li>


			<!-- 彩票数据显示 -->
			<li
				style="border-top-color: #93c6ec;background-image:url(${basePath }/fore_source/image/timg.jpg)"><a
				href="${basePath}/fore/lottery.do">
					<h3 style="margin-top: -40px; left: 20px;">
						<strong>河北快3今日开奖(${now})</strong>
					</h3>
					<table>
						<tr>
							<td width="95px">开奖期号</td>
							<td width="85px">开奖时间</td>
							<td width="85px">开奖号码</td>
						</tr>
						<c:forEach items="${lst1 }" var="ls">
							<tr>
								<td>${ls.lottery_numb}</td>
								<td>${ls.run_time }</td>
								<td>${ls.run_numb}</td>
							</tr>
						</c:forEach>
					</table>
			</a></li>

		</ul>
	</div>

	<div class="wid hotdata clearfix" id="hotdata">
		<h2>
			<strong>广告信息</strong><span>HOT DATA</span> <a name="anchorlink"></a>
		</h2>
		<ul>
			<c:forEach items="${publicities.rows}" var="publicity" varStatus="j">
				<c:if test="${j.index<=3 }">
					<li
						style="border-top-color:<c:choose><c:when test="${j.index==0}">#ff7457</c:when><c:when test="${j.index==1}">#a2e132</c:when><c:when test="${j.index==2}">#7babff</c:when><c:otherwise>#93c6ec</c:otherwise></c:choose>">
						<div
							style="font-size: 20px; text-indent: 10px; height: 22px; position: absolute; margin-top: -60px;">${publicity.title}</div>
						<a
						href="${basePath}/fore/publicity/details.do?noid=${publicity.noid}">

							<div style="position: absolute; margin-top: -30px;">
								<img src="${publicity.picUrl}">
							</div>

					</a>
					</li>
				</c:if>
			</c:forEach>
		</ul>
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



	<div>
		<ul>
			<a href="${basePath}/fore/user/custom_service.do" target="_blank">
				<li class="sidb_1"
				style="font-size: 12px !important; text-align: center; color: #fff;">
					<span></span> 在线咨询
			</li>
			</a>

			<style>
.side-bar a:hover .sidb_3 dt {
	top: 65px !important;
}

.side-bar a:hover .sidb_4 dt {
	top: 65px !important;
}
</style>
			<link href="${basePath }/fore_source/css/footer.css" rel="stylesheet"
				type="text/css" />
			<style>
.side-bar .sidb_9 span {                         
	background-position: -58px -49px;
}
</style>

			<div class="side-bar">
				<ul>
					<a
						href="${basePath}/fore/user/custom_service.do"
						target="_blank">
						<li class="sidb_1"
						style="font-size: 12px !important; text-align: center; color: #fff;">
							<span></span> 在线咨询
					</li>
					</a>

					<a
						target="_blank">
						<li class="sidb_3"
						style="font-size: 12px !important; text-align: center;"><span></span>
							电话咨询
							<dt style="text-align: center; font-size: 14px;">
								全国免费电话<br /> 400-8080-105
							</dt></li>
				</ul>
			</div>

			<%@include file="../include/foot.jsp"%>
</body>
</html>