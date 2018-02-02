<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description"
	content="星座运势API接口：提供十二星座查询，每个星座的今天、明天、本周、本月、本年星座运势查询。。">
<meta name="keywords" content="星座运势,数据接口">

<title>星座运势API接口_星座运势数据接口 - 极速数据</title>

<script src="${basePath }/fore_source/js/hm.js"></script>
<script type="text/javascript" src="${basePath }/fore_source/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="${basePath }/fore_source/js/jquery.zxxbox.3.0-min.js"></script>
<script type="text/javascript" src="${basePath }/fore_source/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="${basePath }/fore_source/js/shCore.js" charset="utf-8"></script>
<script type="text/javascript" src="${basePath }/fore_source/js/shAutoloader.js" charset="utf-8"></script>

<link rel="canonical" href="http://www.jisuapi.com/api/huangli/">
<link href="${basePath }/fore_source/css/mainv2.css" rel="stylesheet" type="text/css">
<link href="${basePath }/fore_source/css/api/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css">
<link href="${basePath }/fore_source/css/api/shCoreJisu.css" type="text/css" rel="stylesheet">

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
		<a href="${basePath}/fore/index.do">首页</a>&nbsp&nbsp>&nbsp&nbsp星座运势数据接口
	</div>
	<div class="wid" id="apiibox">
		<div id="apiileft">
			<div id="apiinfo" style="border-top-color: #f08f75">
				<div id="apiinfoleft">
					<img src="${basePath }/fore_source/image/api/astro.png" alt="星座运势">
				</div>
				<div id="apiinforight">
					<div id="apiitop">
						<h1>星座运势</h1>

						<div class="clearfix"></div>
					</div>
					<div id="apiiprice">

						<span class="price"><i><del>￥</del>5.00</i></span>/10000次
						<div class="atipsbox">
							<div class="atips">申请就送1000次</div>
						</div>
					</div>
					<div id="apiidesc">提供十二星座查询，每个星座的今天、明天、本周、本月、本年星座运势查询。</div>
					<div id="apinuminfo">
						<div class="clearfix"></div>
					</div>
					<div id="apiicollect">
						<a href="${basePath }/fore/user/buy.do?api_id=3" rel="nofollow"
							id="applybtn">申请数据</a>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			
<!-- 左中内容展示，切换页面 -->
	
	<div id="apicontent">
		<!-- api切换条 -->
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
								<li><a href="javascript:;" class="on">运势查询</a></li>
							</ul>
						</div>
						
						<div id="apibright">
	<!-- 星座查询 -->					
							<div class="subapiitem">
								<div class="subapiinfo">
									<div class="apiline">
										<label>接口地址：</label> <span class="enword lightblue">http://localhost:8080/stone_data/fore/apidata/getdata.do</span>
									</div>
									<div class="apiline">
										<label>支持格式：</label> <span class="enword">JSON</span>
									</div>
									<div class="apiline">
										<label>请求方法：</label> <span class="enword">GET</span>
									</div>
									<div class="apiline">
										<label>请求示例：</label> 
										<span class="enword lightblue">http://localhost:8080/stone_data/fore/apidata/getdata.do?appkey=“appkey”&conNum=“星座顺序号”&date=“yyyy-MM-dd”</span>
									</div>
									<div class="apilinebox">
										<div class="alh4line">
	<!-- 请求参数 -->								
											<h4>请求参数：</h4>
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
													<td class="param">appkey</td>
													<td class="param">string</td>
													<td>是</td>
													<td>appkey值</td>
												</tr>
												<tr>
													<td class="param">conNum</td>
													<td class="param">int</td>
													<td>是</td>
													<td>星座顺序号</td>
												</tr>
												<tr>
													<td class="param">date</td>
													<td class="param">string</td>
													<td>是</td>
													<td>日期</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="apilinebox">
										<div class="alh4line">
	<!-- 返回参数 -->
											<h4>返回参数：</h4>										
										</div>
										<table>
											<tbody>
												<tr>
													<th class="col1">参数名称</th>
													<th class="col2">类型</th>
													<th class="col5">说明</th>
												</tr>
												<tr>
													<td class="param">msg</td>
													<td class="param">string</td>
													<td>消息说明</td>
												</tr>
												<tr>
													<td class="param">result</td>
													<td class="param">json</td>
													<td>json查询结果</td>
												</tr>
												<tr>
													<td class="param">status</td>
													<td class="param">int</td>
													<td>状态参数</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="apilinebox">
									<div class="coderequest">
										<div class="codetab">
											<div class="clearfix"></div>
										</div>
										<div class="codebox">
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								<div class="coderesponse">
								</div>
							</div>
						</div>
					</div>
					
					<div id="apierror">
						<div class="apilinebox">
							<table>
								<tbody>
									<tr>
										<th class="col6">代号</th>
										<th class="col7">说明</th>
									</tr>
									<tr>
										<td>101</td>
										<td>appkey为空或不存在</td>
									</tr>
									<tr>
										<td>102</td>
										<td>appkey无请求此数据权限</td>
									</tr>
									<tr>
										<td>103</td>
										<td>请求次数超过限制</td>
									</tr>
									<tr>
										<td>104</td>
										<td>日期格式不正确或者日期最晚为当天日期</td>
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
										<td class="col8">免费套餐</td>
										<td>1000次</td>
										<td class="col10">免费</td>
										<td></td>
									</tr>
									<tr>
										<td class="col8">Level1</td>
										<td>10000次</td>
										<td class="col10">5.00元</td>
										<td></td>
									</tr>
									<tr>
										<td class="col8">Level2</td>
										<td>20000次</td>
										<td class="col10">9.00元</td>
										<td></td>
									</tr>
									<tr>
										<td class="col8">Level3</td>
										<td>50000次</td>
										<td class="col10">21.00元</td>
										<td></td>
									</tr>
									<tr>
										<td class="col8">Level4</td>
										<td>100000次</td>
										<td class="col10">40.00元</td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" >
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
		</script>
		
		
		<div id="apiiright" >
			<%@include file="../include/con_right.jsp" %>
		</div>
		<div class="clearfix"></div>
	</div>


	<%@include file="../include/foot.jsp"%>
</body>
</html>