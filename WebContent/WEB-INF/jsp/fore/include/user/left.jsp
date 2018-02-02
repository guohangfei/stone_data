<%@ page language="java" contentType="text/html; charset=utf-8"%>
<script type="text/javascript"
	src="${basePath }/fore_source/js/jquery-2.0.3.min.js"></script>
<div id="menu">
	<div class="menubox">
		<h4 id="menuaccount">个人中心</h4>
		<ul>
			<li><a href="avatar.do" id="avatar">头像管理</a></li>
			<li><a href="profile.do" id="profile">基本资料</a></li>
			<li><a href="password.do" id="password">修改密码</a></li>
		</ul>
	</div>
	<div class="menubox">
		<h4 id="menuapi">数据管理</h4>
		<ul>
			<li><a href="my.do" id="my">用户中心</a></li>
			<li><a href="api.do" id="api">我的数据</a></li>
			<li><a href="balance.do" id="balance">账户余额</a></li>
		</ul>
	</div>
</div>
<script type="text/javascript">
	var url = window.location.href;
	var paths = new Array();
	paths = url.split("/");
	var text = paths.pop();
	if(text=='avatar.do'){
		$("#avatar").addClass("on");
	}
	if(text=='profile.do'){
		$("#profile").addClass("on");
	}
	if(text=='password.do'){
		$("#password").addClass("on");
	}
	if(text=='my.do'){
		$("#my").addClass("on");
	}
	if(text=='api.do'){
		$("#api").addClass("on");
	}
	if(text=='apply.do'){
		$("#apply").addClass("on");
	}
	if(text=='balance.do'){
		$("#balance").addClass("on");
	}
</script>