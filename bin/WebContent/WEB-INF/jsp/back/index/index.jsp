<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE HTML>
<html>
<head>
<title>顽石数据后台管理页面</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="${basePath }/back_source/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${basePath }/back_source/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${basePath }/back_source/demo/demo.css">
<script type="text/javascript"
	src="${basePath }/back_source/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${basePath }/back_source/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${basePath }/back_source/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script src="${basePath }/back_source/Chart.js"></script>
</head>

<body class="easyui-layout">
	<div data-options="region:'north',border:false"
		style="height: 50px; background: #B3DFDA; padding: 10px">  
		<span style="color: green; font-size: 17px">顽石数据后台管理系统<a
			href="${basePath}/back/admin_logout.do"
			style="text-decoration: none; margin-left: 1100px;"
			onclick="return confirm('确认退出顽石数据管理系统？')"><img
				src="${basePath}/back_source/img/ExitF62232939.jpg" alt="退出"
				height="17.5px" width="70px"></a></span>
	</div>
	<div data-options="region:'west',split:true,title:'操作菜单'"
		style="width: 220px; padding: 10px;">
		<shiro:hasPermission name="mgr_admin">
		<ul class="easyui-tree">
			<li data-options="state:'closed'"><span>管理员</span>
				<ul>
					<li><label
						onclick="addTab('管理员列表','${basePath }/back/admin_list.do',true)">管理员列表</label></li>
					<li><label
						onclick="addTab('权限列表','${basePath }/back/power_list.do',true)">权限列表</label></li>
				</ul></li>
		</ul>
		</shiro:hasPermission>
		<shiro:hasPermission name="mgr_notice">
		<ul class="easyui-tree">
			<li data-options="state:'closed'"><span>公告管理</span>
				<ul>
					<li><label
						onclick="addTab('公告分类','${basePath }/back/notice_type_list.do',true)">公告分类</label></li>
					<li><label
						onclick="addTab('公告列表','${basePath }/back/notice_list.do',true)">公告列表</label></li>
				</ul></li>

		</ul>
		</shiro:hasPermission>
		<shiro:hasPermission name="mgr_publicity">
		<ul class="easyui-tree">
			<li data-options="state:'closed'"><span>广告管理</span>
				<ul>
					<li><label
						onclick="addTab('广告分类','${basePath }/back/pub_type.do',true)">广告分类</label></li>
					<li><label
						onclick="addTab('广告列表','${basePath }/back/pub_list.do',true)">广告列表</label></li>
				</ul></li>
		</ul>
		</shiro:hasPermission>
		<shiro:hasPermission name="mgr_api">
		<ul class="easyui-tree">
			<li data-options="state:'closed'"><span>数据接口管理</span>
				<ul>
					<li><label
						onclick="addTab('数据接口列表','${basePath }/back/api_list.do',true)">数据接口列表</label></li>
					<li><label
						onclick="addTab('接口资费套餐','${basePath }/back/meal_list.do',true)">接口资费套餐</label></li>
				</ul></li>
		</ul>
		</shiro:hasPermission>
		<shiro:hasPermission name="mgr_apply">
		<ul class="easyui-tree">
			<li data-options="state:'closed'"><span>申请情况管理</span>
				<ul>
					<li><label
						onclick="addTab('申请情况管理列表','${basePath }/back/count_apply_list.do',true)">申请情况管理列表</label></li>
				</ul></li>
		</ul>
		</shiro:hasPermission>
		<ul class="easyui-tree">
			<li data-options="state:'closed'"><span>统计功能管理</span>
				<ul>
					<li><label
						onclick="addTab('统计情况','${basePath }/back/count_list.do',true)">统计情况</label></li>
				</ul></li>
		</ul>
		<shiro:hasPermission name="mgr_custom_service ">
		<ul class="easyui-tree">
			<li data-options="state:'closed'"><span>客服</span>
				<ul>
					<li><a href="${basePath}/back/servicer1.do">客服1</a></li>
					<li><a href="${basePath}/back/servicer2.do">客服2</a></li>
				</ul>
		</ul>
		</shiro:hasPermission>
	</div>

	<div data-options="region:'south',border:false"
		style="height: 40px; background: #A9FACD; padding: 10px; text-align: center">
		河北顽石科技有限公司版权所有<br>@2017-04-11&nbsp;9527
	</div>
	<div id="mytabs" class="easyui-tabs" data-options="region:'center'">
	
	
	</div>
</body>
</html>

<script type="text/javascript">
	function addTab(title, url, closable) {
		// 首先判断是否存在要增加的tab项，如果存在就只显示，否则add 
		if ($("#mytabs").tabs("exists", title)) {
			$("#mytabs").tabs("select", title)
		} else {
			$("#mytabs").tabs("add", {
				'title' : title,
				'href' : url,
				'closable' : closable
			});
			//获取最后一个tabs 在新加的选项卡后面添加"关闭全部"
			var li = $(".tabs-wrap ul li:last-child");
			$("#close").remove();
			li.after("<li id='close'><a class='tabs-inner' href='javascript:void()' onClick='javascript:closeAll()'>关闭全部</a></li>");
		}
	}

	//关闭所用标签
	function closeAll() {
		$(".tabs li").each(function(index, obj) {
			//获取所有可关闭的选项卡
			var tab = $(".tabs-closable", this).text();
			$(".easyui-tabs").tabs('close', tab);
		});
		$("#close").remove();//同时把此按钮关闭
	}

	// 简写的$(document).ready(function(){}) 
	$(function() {
		addTab("首页", "/stone_data/back/easyui_index.do", false);
	})
</script>