<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册- 会员管理中心</title>
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

<script type="text/javascript">

	function reloadcode(){
	var verify=document.getElementById('safecode');
	verify.setAttribute('src','${basePath}/yanzhengma.jpg?'+Math.random());
	//这里必须加入随机数不然地址相同我发重新加载
	}

$(function(){
  	jQuery("#formID").validationEngine();
	var rs=true;
  	$("#username").change(function(){
  		var username =	$("#username").val();
  		$("#usernamehint").text("");
  		$.get("${basePath}/check.do",{username:username}, function(data){
  		 		if(data != null&&data!=""){
  		 			$("#usernamehint").text("该账号已存在");
  		 			rs=false;
  				}else{
  					$("#usernamehint").text("");
  		 			rs=true;
  				}
  		 });  
  	});
  	
  	$("#verification").focus(function() {
		$("#checkSpan").text("");
		
	})
	 
  	$("#regbtn").click(function(){
  		if(rs==false){
  			return;
  		}
  		$("#formID").submit();
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
				<a href="${basePath}/login.do">登录</a> <span>|</span> 
				<a href="${basePath}/register.do">注册</a>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>



<div class="wid wid2">  
    <div id="regright" class="loginright"> 
        <h1>欢迎注册顽石数据</h1>
        <form id="formID" action="${basePath}/register.do" method="post">
          <div class="formline">            
            <div class="labelright"><input style="height:35px; font-size: 15px" size="33" name="username" id="username" value="${param.username}" placeholder="请输入您的账号" type="text" class="validate[required]"></div>
            <div class="flhint" id="usernamehint"></div>
          </div>
         
          <div class="formline">            
            <div class="labelright"><input style="height:35px; font-size: 15px" size="33" name="password" id="password" placeholder="请输入您的密码" type="password" class="validate[required,minSize[8],maxSize[12]]"></div>
            <div class="flhint" id="passwordhint"><span class="red"></span> 8位-12位之间</div>
          </div>



          <div class="formline">            
            <div class="labelright"><input style="height:35px; font-size: 15px" size="13" name="checkCode"  id="verification" placeholder="请输入验证码" type="text" class="validate[required]"></div>
           	<div class="flhint" id="checkhint"  style="width: 167px;height: 52px; position: absolute;left: 150px;bottom:0.1px;">
			<img alt="" src="${basePath}/yanzhengma.jpg" id="safecode"><div style="display: inline-block;position: absolute;top: 20px;width: 100px;"><a href="#" onclick="reloadcode()">看不清？换一张</a></div>
			</div>
			<span id="checkSpan" style="color: red;display: block;width: 150px;height: 150px;margin-left: 100px;">${errorItem}</span>
		</div>

				<div class="formline">
					<input name="fromurl" id="fromurl" value="index.php" type="hidden">
					<input class="btn" id="regbtn" value="马上注册" type="button">
				</div>
				<div class="formline mcenter" id="regrbotline">
					已有顽石帐号？<a href="${basePath}/login.do" class="bluea">立即登录</a>
				</div>
			</form>
		</div>
		<div class="clearfix"></div>

	</div>

	<div class="wid" id="foot2">
		<div class="wid2">
			<p class="clear mtop15 mcenter" style="text-align: center;"> &#169; 2011-2015 石家庄科技有限公司 版权所有
				石ICP备13024337号 石公网安备33010602003109号</p>
		</div>
	</div>



</body>
</html>