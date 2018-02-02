<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录- 会员管理中心</title>
<link href="${basePath}/fore_source/css/mainv2.css" rel="stylesheet"
	type="text/css">
<link href="${basePath}/fore_source/css/user/my.css" rel="stylesheet"
	type="text/css">
<link href="${basePath}/fore_source/css/user/template.css"
	rel="stylesheet" type="text/css">
<link
	href="${basePath}/fore_source/css/user/validationEngine.jquery.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${basePath}/fore_source/js/jquery-1.6.min.js"></script>
<script type="text/javascript"
	src="${basePath}/fore_source/js/jquery.validationEngine-zh_CN.js"></script>
<script src="${basePath}/fore_source/js/jquery.validationEngine.js"></script>
<style type="text/css">
#zxxBlank {
	position: absolute;
	z-index: 2000;
	left: 0;
	top: 0;
	width: 100%;
	height: 0;
	background: black;
}

.wrap_out {
	padding: 5px;
	background: #eee;
	box-shadow: 0 0 6px rgba(0, 0, 0, .5);
	position: absolute;
	z-index: 2000;
	left: -9999px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

.wrap_in {
	background: #fafafa;
	border: 1px solid #ccc;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

.wrap_bar {
	border-bottom: 1px solid #ddd;
	background: #f0f0f0;
	background: -moz-linear-gradient(top, #fafafa, #eee);
	background: -o-linear-gradient(top, #fafafa, #eee);
	background: -webkit-linear-gradient(top, #fafafa, #eee);
	background: linear-gradient(top, #fafafa, #eee);
}

.wrap_title {
	line-height: 30px;
	padding-left: 10px;
	margin: 0;
	font-weight: bold;
	font-size: 14px;
}

.wrap_close {
	position: relative;
}

.wrap_close a {
	width: 20px;
	height: 20px;
	text-align: center;
	margin-top: -25px;
	color: #34538b;
	font: bold 1em/20px Tahoma;
	text-decoration: none;
	cursor: pointer;
	position: absolute;
	right: 6px;
}

.wrap_close a:hover {
	text-decoration: none;
	color: #f30;
}

.wrap_body {
	background: white;
}

.wrap_remind {
	padding: 20px 20px;
	color: #333;
	min-width: 200px;
}

.wrap_remind p {
	margin: 10px 0 0;
}

.submit_btn, .cancel_btn {
	width: 100px;
}

.submit_btn {
	
}

.submit_btn:hover {
	
}

.cancel_btn {
	color: #666;
	background-color: #eee;
}
</style>
<style type="text/css">
.logintab {
	display: inline-block;
	border-bottom: 0px;
	padding: 5px;
	padding-top: 10px;
	margin-bottom: 10px;
}

.logindiv {
	padding-top: 10px;
}

#adminlogintab {
	border: 0px solid #ccc;
	border-bottom: 0px;
	height: 30px;
	margin-bottom: 0px;
}

#userlogintab {
	border: 0px solid #ccc;
	border-bottom: 0px;
	height: 30px;
	margin-bottom: 0px;
}

#alltab {
	width: 349px;
	border-bottom: 1px #ccc dashed;
	margin-bottom: 10px;
}

.tabback {
	background-color: #26BCF1;
}
</style>

<script type="text/javascript">
	$(function() {
		var setPwdAlert="${setPwdSuccess}";
		if(setPwdAlert!=""){
			alert(setPwdAlert);
		}
		
		jQuery("#userformID").validationEngine();
		$("#regbtn").click(function() {
			$("#userformID").submit();
		});
		jQuery("#adminformID").validationEngine();
		$("#regbtn1").click(function() {
			$("#adminformID").submit();
		});

		$("#adminlogin").hide();
		$("#userlogintab").addClass("tabback");

		$("#userlogintab").hover(function() {
			$("#errorSpan").text("");
			jQuery('#adminformID').validationEngine('hide')
			$("#adminlogintab").removeClass("tabback");
			$("#userlogintab").addClass("tabback");
			$("#userlogin").fadeIn(500);
			$("#adminlogin").hide();
		}, function() {

		});

		$("#adminlogintab").hover(function() {
			$("#errorSpan").text("");
			jQuery('#userformID').validationEngine('hide')
			$("#userlogintab").removeClass("tabback");
			$("#adminlogintab").addClass("tabback");
			$("#adminlogin").fadeIn(500);
			$("#userlogin").hide();
		}, function() {

		});

		$("#username").focus(function() {
			$("#errorSpan").text("");
		});
		$("#password").focus(function() {
			$("#errorSpan").text("");
		});

	});
</script>

</head>
<body class="whitebody">

	<div id="top" class="regtop">
		<div class="wid wid2">
			<div id="logo">
				<a style="display: inline;" href="${basePath}/fore/index.do"><img
					src="${basePath }/fore_source/image/footlogo.png" width="200px"
					height="63px"></a>
			</div>
			<div id="rlogoright">
				<a href="${basePath}/login.do">登录</a> <span>|</span> <a
					href="${basePath}/register.do">注册</a>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>


	<div class="wid wid2">
		<div id="regbox">
			<div id="regleft">
				<a href="${basePath}/fore/index.do" target="_blank"><img
					src="${basePath }/fore_source/image/adlogin.jpg"></a>
			</div>
			<div id="regright">
				<h1 style="margin-bottom: 10px;">欢迎登录顽石数据</h1>
				<span id="errorSpan"
					style="display: inline-block; margin-left: 80px; margin-bottom: 12px; color: red">${errorItem}</span>

				<div id="alltab">
					<div id="userlogintab" class="logintab">用户登录</div>
					<div id="adminlogintab" class="logintab">管理员登录</div>
				</div>

				<!-- 用户登录表单 -->

				<div id="userlogin" class="logindiv">
					<form id="userformID" action="${basePath}/login.do"
						method="post">
						<div class="formline">
							<div class="labelright">
								<input style="height: 35px; font-size: 15px" size="33"
									name="username" id="username" placeholder="请输入账号" type="text"
									value="${param.username}" class="validate[required]">
							</div>
						</div>

						<div class="formline">
							<div class="labelright">
								<input style="height: 35px; font-size: 15px" size="33"
									id="password" name="password" placeholder="请输入密码"
									type="password" class="validate[required,minSize[8]]">
							</div>
						</div>

						<div class="formline" id="autologinline">
							<label class="checkbox-group" id="checkboxgroup1"> <input
								name="autologin" value="1" checked="checked" type="checkbox"
								style="opacity: 1;"> <span>两周内自动登录</span>
							</label> <a href="${basePath}/forget_password.do" class="bluea"
								id="forgeta">忘记密码</a>
						</div>

						<div class="formline">
							<input name="fromurl" id="fromurl" value="" type="hidden">
							<input class="btn" id="regbtn" value="用户登录" type="button">
						</div>

						<div class="formline mcenter" id="regrbotline">
							还没有顽石帐号？<a href="${basePath}/register.do" class="bluea">立即注册</a>
						</div>
					</form>
				</div>

				<!-- 管理员登录表单 -->

				<div id="adminlogin" class="logindiv">
					<form id="adminformID" action="${basePath}/do_back_login.do"
						method="post">
						<div class="formline">
							<div class="labelright">
								<input style="height: 35px; font-size: 15px" size="33"
									name="adminname" id="username" placeholder="请输入账号" type="text"
									value="${param.adminname}" class="validate[required]">
							</div>
						</div>

						<div class="formline">
							<div class="labelright">
								<input style="height: 35px; font-size: 15px" size="33"
									id="adminPassword" name="password" placeholder="请输入密码"
									type="password" class="validate[required,minSize[6]]">
							</div>
						</div>

						<div class="formline" id="autologinline">
							<a href="${basePath}/forget_password.do" class="bluea"
								id="forgeta" style="float: left;">忘记密码</a>
						</div>

						<div class="formline">
							<input name="fromurl" id="fromurl" value="" type="hidden">
							<input class="btn" id="regbtn1" value="管理员登录" type="button"
								style="width: 300px;">
						</div>
					</form>
				</div>

			</div>
			<div class="clearfix"></div>
		</div>
	</div>

	<div class="wid" id="foot2">
		<div class="wid2">
			<p class="clear mtop15 mcenter">&#169; 2011-2015 石家庄科技有限公司 版权所有
				石ICP备13024337号 石公网安备33010602003109号</p>
		</div>
	</div>

</body>
</html>