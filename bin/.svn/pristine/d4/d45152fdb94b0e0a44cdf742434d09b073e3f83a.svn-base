<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description"
	content="黄历查询API接口：按年月日查询公历星期、农历、星座、天干地支、被查询日的所属生肖、今日所宜、今日所忌、二十四节气，数据范围仅限当年日期。。">
<meta name="keywords" content="黄历查询,数据接口">
<title>黄历查询API接口_黄历查询数据接口 - 顽石数据</title>

<script src="${basePath }/fore_source/js/hm.js"></script>
<script type="text/javascript"
	src="${basePath }/fore_source/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript"
	src="${basePath }/fore_source/js/jquery.zxxbox.3.0-min.js"></script>
<script type="text/javascript"
	src="${basePath }/fore_source/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript"
	src="${basePath }/fore_source/js/shCore.js" charset="utf-8"></script>
<script type="text/javascript"
	src="${basePath }/fore_source/js/shAutoloader.js" charset="utf-8"></script>

<link rel="canonical" href="http://www.jisuapi.com/api/huangli/">

<link href="${basePath }/fore_source/css/mainv2.css"
	rel="stylesheet" type="text/css">
<link
	href="${basePath }/fore_source/css/api/jquery.mCustomScrollbar.css"
	rel="stylesheet" type="text/css">
<link href="${basePath }/fore_source/css/api/shCoreJisu.css"
	type="text/css" rel="stylesheet">

<script type="text/javascript">
	function path() {
		var args = arguments, result = [];
		for (var i = 0; i < args.length; i++)
			result.push(args[i].replace('$',
					'/static/js/syntaxhighlighter/scripts/'));
		return result;
	}
	$(function() {
		SyntaxHighlighter.autoloader.apply(null, path(
				'php                    $shBrushPhp.js',
				'java                   $shBrushJava.js',
				'objc obj-c             $shBrushObjC.js',
				'actionscript3 as3      $shBrushAS3.js',
				'bash shell             $shBrushBash.js',
				'coldfusion cf          $shBrushColdFusion.js',
				'c# c-sharp csharp      $shBrushCSharp.js',
				'delphi pascal          $shBrushDelphi.js',
				'jfx javafx             $shBrushJavaFX.js',
				'js jscript javascript  $shBrushJScript.js',
				'perl pl                $shBrushPerl.js',
				'py python              $shBrushPython.js',
				'ruby rails ror rb      $shBrushRuby.js',
				'vb vbnet               $shBrushVb.js',
				'xml xhtml xslt html    $shBrushXml.js'));
		//SyntaxHighlighter.defaults['gutter'] = false;
		SyntaxHighlighter.defaults['toolbar'] = false;
		SyntaxHighlighter.defaults['auto-links'] = false;
		SyntaxHighlighter.all();
	})
</script>
</head>
<body>

	<%@include file="../include/top.jsp"%>

	<div id="topcrumb" class="wid">
		<a href="${basePath }/fore/index.do">首页</a> > 黄历查询数据接口
	    <a name="backToTop"></a>
	</div>
	<div class="wid" id="apiibox">
		<div id="apiileft">
			<div id="apiinfo" style="border-top-color: #d7c490">
				<div id="apiinfoleft">
					<img src="${basePath }/fore_source/image/api/huangli.png"
						alt="黄历查询">
				</div>
				<div id="apiinforight">
					<div id="apiitop">
						<h1>黄历查询</h1>

						<div class="clearfix"></div>
					</div>
					<div id="apiiprice">

						<span class="price"><i><del>￥</del>6.00</i></span>/10000次
						<div class="atipsbox">
							<div class="atips">申请就送1000次</div>
						</div>
					</div>
					<div id="apiidesc">按年月日查询公历星期、农历、星座、天干地支、被查询日的所属生肖、今日所宜、今日所忌、二十四节气，数据范围仅限当年日期。。</div>
					<div id="apinuminfo">
						<div class="clearfix"></div>
					</div>
					<div id="apiicollect">
						<a href="${basePath }/fore/user/buy.do?api_id=2" rel="nofollow"
							id="applybtn">申请数据</a>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div id="apicontent">
				<div id="apitab">
					<ul>
						<li><a href="javascript:;" class="on">API</a></li>
						<li><a href="javascript:;">错误码参照</a></li>
						<li><a href="javascript:;">价格</a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div id="apibox">
					<div id="apimain">
						<div id="apibleft">
							<ul>
								<li><a href="javascript:;" class="on">黄历查询</a></li>

							</ul>
						</div>
						<div id="apibright">
							<div class="subapiitem">
								<div class="subapiinfo">
									<div class="apiline">
										<label>接口地址：</label> <span class="enword lightblue">http://192.168.6.52:8080/stone_data/fore/api/getLunarData.do</span>
									</div>
									<div class="apiline">
										<label>支持格式：</label> <span class="enword">JSON</span>
									</div>
									<div class="apiline">
										<label>请求方法：</label> <span class="enword">POST</span>
									</div>
									<div class="apiline">
										<label>请求示例：</label> <span class="enword lightblue">http://192.168.6.52:8080/stone_data/fore/api/getLunarData.do?appkey=yourappkey&amp;year=2017&amp;month=1&amp;day=1</span>
									</div>
									<div class="apiline">
										<label style="color:red;">注意：</label> <span class="enword lightblue">当月份和天数不超过10，在请求时请勿在对应参数前面加零。<br/>
										错误格式：2017-09-09   正确格式：2017-9-9</span>
									</div>
									<div class="apilinebox">
										<div class="alh4line">
											<h4>请求参数：</h4>
											<a href="#"
												style="display: none;">API接口测试工具</a>
										</div>
										<table>
											<tbody>
												<tr>
													<th class="col1">参数名称</th>
													<th class="col2">类型</th>
													<th class="col3">必填</th>
													<th class="col4">说明</th>
												</tr>
												<tr>
													<td class="param">year</td>
													<td class="param">string</td>
													<td>是</td>
													<td>年</td>
												</tr>
												<tr>
													<td class="param">month</td>
													<td class="param">string</td>
													<td>是</td>
													<td>月</td>
												</tr>
												<tr>
													<td class="param">day</td>
													<td class="param">string</td>
													<td>是</td>
													<td>日</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="apilinebox">
										<div class="alh4line">
											<h4>返回参数：</h4>
											<a href="#"
												style="display: none;">查看完整示例</a>
										</div>
										<table>
											<tbody>
												<tr>
													<th class="col1">参数名称</th>
													<th class="col2">类型</th>
													<th class="col5">说明</th>
												</tr>
												<tr>
													<td class="param">requiredate</td>
													<td class="param">string</td>
													<td>请求的日期</td>
												</tr>
												<tr>
													<td class="param">solarcalendardate</td>
													<td class="param">string</td>
													<td>公历</td>
												</tr>
												<tr>
													<td class="param">lunarcalendardate</td>
													<td class="param">string</td>
													<td>农历</td>
												</tr>
												<tr>
													<td class="param">lunarcalendaryear</td>
													<td class="param">string</td>
													<td>天干年</td>
												</tr>
												<tr>
													<td class="param">lunarcalendarmonth</td>
													<td class="param">string</td>
													<td>天干月</td>
												</tr>
												<tr>
													<td class="param">lunarcalendarday</td>
													<td class="param">string</td>
													<td>天干日</td>
												</tr>
												
												<tr>
													<td class="param">suit</td>
													<td class="param">string</td>
													<td>今日所宜</td>
												</tr>
												<tr>
													<td class="param">taboo</td>
													<td class="param">string</td>
													<td>今日所忌</td>
												</tr>
												<tr>
													<td class="param">solarterm</td>
													<td class="param">string</td>
													<td>二十四节气</td>
												</tr>
												
											</tbody>
										</table>
									</div>
								</div>
								<div class="coderesponse">
									<h4>JSON返回示例 :</h4>
									<div class="codeboxresponse">
										<div>
											<div id="highlighter_494803" class="syntaxhighlighter  js">
												<table border="0" cellpadding="0" cellspacing="0">
													<tbody>
														<tr>
															<td class="gutter"><div
																	class="line number1 index0 alt2">1</div>
																<div class="line number2 index1 alt1">2</div>
																<div class="line number3 index2 alt2">3</div>
																<div class="line number4 index3 alt1">4</div>
																<div class="line number5 index4 alt2">5</div>
																<div class="line number6 index5 alt1">6</div>
																<div class="line number7 index6 alt2">7</div>
																<div class="line number8 index7 alt1">8</div>
																<div class="line number9 index8 alt2">9</div>
																<div class="line number10 index9 alt1">10</div>
																<div class="line number11 index10 alt2">11</div>
																<div class="line number12 index11 alt1">12</div>
																<div class="line number13 index12 alt2">13</div>
																<div class="line number14 index13 alt1">14</div>
																<div class="line number15 index14 alt2">15</div>
																<div class="line number16 index15 alt1">16</div>
																<div class="line number17 index16 alt2">17</div>
																<div class="line number18 index17 alt1">18</div>
																<div class="line number17 index18 alt2">19</div>
																<div class="line number18 index19 alt1">20</div>
																<div class="line number17 index20 alt2">21</div>
																<div class="line number18 index21 alt1">22</div>
																<div class="line number17 index22 alt2">23</div>
																<div class="line number18 index24 alt1">24</div>
																</td>
															<td class="code"><div class="container" style="color:#0000FD;">
																	 "result": {<br><br>
																	 "requiredate":"2017年1月1日",<br> <br>
																	 "solarcalendardate":"公历 2017年1月1日 星期曰 摩羯座 (阳历)",<br><br> 
																	 "lunarcalendardate":"农历二0一六年十二月初四日 大(阴历)",<br><br>
																	 "lunarcalendaryear":" 丙申年 属猴年",<br><br> 
																	 "lunarcalendarmonth":" 庚子月 属鼠月",<br> <br>
																	 "lunarcalendarday":" 戊子日 属鼠日",<br><br> 
																	 "suit":"赴任　斋醮　开市　入宅　求医　祭祀　行丧 入学　求人 ",<br> <br>
																	 "taboo":"嫁娶　归宁　出行　冠笄　盖屋　修造　动土 置产　破土　筑堤<br><br>　放水　针灸　纳采　祈福 求嗣　出货　上梁　竖柱　安葬　启�　解除 行舟",<br><br> 
																	 "solarterm":" 小寒 2017-01-05 11:55:42 大寒 2017-01-20 05:23:33"}
																</div></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="apierror">
						<div class="apilinebox">
							<h4>API错误码：</h4>
							<table>
								<tbody>
									<tr>
										<th class="col6">代号</th>
										<th class="col7">说明</th>
									</tr>
									<tr>
										<td class="td-1">203</td>
										<td class="td-2">没有信息</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="apilinebox">
							<h4>系统错误码：</h4>
							<table>
								<tbody>
									<tr>
										<th class="col6">代号</th>
										<th class="col7">说明</th>
									</tr>
									<tr>
										<td>101</td>
										<td>APPKEY为空或不存在</td>
									</tr>
									<tr>
										<td>102</td>
										<td>APPKEY已过期</td>
									</tr>
									<tr>
										<td>103</td>
										<td>APPKEY无请求此数据权限</td>
									</tr>
									<tr>
										<td>104</td>
										<td>请求超过次数限制</td>
									</tr>
									<tr>
										<td>105</td>
										<td>IP被禁止</td>
									</tr>
									<tr>
										<td>106</td>
										<td>IP请求超过限制</td>
									</tr>
									<tr>
										<td>107</td>
										<td>接口维护中</td>
									</tr>
									<tr>
										<td>108</td>
										<td>接口已停用</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div id="apiprice">
						<div class="apilinebox">

							<table>
								<tbody>
									<tr>
										<th class="col8">名称</th>
										<th class="col9">权限</th>
										<th class="col10">价格</th>
										<th class="col10"></th>
									</tr>
									<tr>
										<td class="col8">免费套餐 青铜免费</td>
										<td>1000次</td>
										<td class="col10">免费</td>
										<td></td>
									</tr>
									<tr>
										<td class="col8">Level1 白银价</td>
										<td>10000次</td>
										<td class="col10">6.00元</td>
										<td></td>
									</tr>
									<tr>
										<td class="col8">Level2 黄金价</td>
										<td>20000次</td>
										<td class="col10">11.00元</td>
										<td></td>
									</tr>
									<tr>
										<td class="col8">Level3 钻石价</td>
										<td>50000次</td>
										<td class="col10">26.00元</td>
										<td></td>
									</tr>
									<tr>
										<td class="col8">Level4 王者价</td>
										<td>100000次</td>
										<td class="col10">49.00元</td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div id="apiiright">
			<%@include file="../include/con_right.jsp" %>
		</div>
		<div class="clearfix"></div>
	</div>


	<script type="text/javascript">

		$("#apitab a").on('click', function() {
			$(this).parent().parent().find('a').removeClass('on');
			$(this).addClass('on');
			var index = $(this).parent().index();
			$("#apibox").children('div').hide();
			$("#apibox").children('div').eq(index).show();
		})

		$("#apibleft a").on('click', function() {
			$(this).parent().parent().find('a').removeClass('on');
			$(this).addClass('on');
			var index = $(this).parent().index();
			$("#apibright").children('.subapiitem').hide();
			$("#apibright").children('.subapiitem').eq(index).show();
		})
		$(".codetab a").on('click', function() {
			$(this).parent().parent().find('a').removeClass('on');
			$(this).addClass('on');
			var index = $(this).parent().index();
			var coderequest = $(this).parent().parent().parent().parent();
			coderequest.find('.codeitem').hide();
			coderequest.find('.codeitem').eq(index).show();
		})
       /*  $("#applybtn").on('click', function(){
        	$.getJSON("${basePath}/fore/api/lunarValidateUser.do", function(data) {});
        	
        }); */
		
		$("#collectbtn").on('click', function() {
			if ($("#logindiv a:eq(0)").html() == '登录') {
				document.location = '/my/login.php?fromurl=/api/huangli/';
				return false;
			}
			$.getJSON("/my/collect.php?act=add&apiid=48", function(data) {
				$.zxxbox.remind('收藏成功！', null, {
					title : '提示',
					drag : true,
					bg : false,
					delay : 30000
				});
			});
		})

		$(window).on("load", function() {
			$(".codeitem").mCustomScrollbar({
				theme : "inset-2-dark",
				axis : "y"
			});
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

	<div style="position: fixed;bottom:100px;right: 64px;width: 46px;z-index: 999;">
		<a href="javascript:;" style="text-indent:20px; font-size:20px;">TOP</a>
	    <a href="#backToTop"><img alt="arrowup" src="${basePath }/fore_source/image/api/arrow-up.jpg"></a>
	</div>

	<%@include file="../include/foot.jsp"%>

</body>
</html>
