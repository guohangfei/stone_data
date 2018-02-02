<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 顶部标题 -->
<div id="top">
	<div class="wid">
		<div id="logo">
			<img alt="" src="${basePath }/fore_source/image/footlogo.png"
				width="200px" height="60px">
		</div>
		<div id="logocenter">
			<div id="nav">
				<ul>
					<li><a href="${basePath}/fore/index.do">首页</a></li>
					<li><a href="${basePath}/fore/api_list.do">数据接口</a></li>
					<li><a href="${basePath}/fore/index.do#anchorlink">数据查询</a></li>
					<li><a href="${basePath}/fore/help_list.do">在线帮助</a></li>
				</ul>
			</div>
		</div>
		<div id="logoright">
			<div id="searchbox">
				<input id="keyword" type="text" name="keyword" readonly="readonly"
					value="顽石数据，竭诚为您服务！">
			</div>
			<div id="logindiv">
				<div id="nologinbox">
					<c:if test="${user==null }">
						<a href="${basePath}/login.do" class="on" rel="nofollow">登录</a>
						<span>|</span>
						<a href="${basePath}/register.do" rel="nofollow">注册</a>
					</c:if>
					<c:if test="${user!=null }">
						<a href="${basePath}/fore/user/my.do" class="on" rel="nofollow">个人中心</a>
						<span>|</span>
						<a rel="nofollow" href="#" onclick="logout()">注销</a>
					</c:if>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div>
<script type="text/javascript">
	var text = document.getElementById("keyword").value;
	var strs = new Array();
	strs = text.split("");
	setInterval("tt()", 1000);
	function tt() {
		var str = strs.shift();
		strs.push(str);
		document.getElementById("keyword").value = strs.join("");
	}
	function logout() {
		if (!confirm("确定退出？")) {
			return;
		}
		$.post("${basePath}/logout.do", function(res) {
			if (res == "success") {
				alert('退出成功');
				location.href = "${basePath}/fore/index.do";
			}
		});
	}
</script>