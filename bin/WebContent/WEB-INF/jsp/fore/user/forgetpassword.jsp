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
	var chkRs=false;
	$(function(){
		var errorItem = "${setErrorItem}";
		if(errorItem!=""){
			alert(errorItem);
		}
		
	  	jQuery("#formID").validationEngine();
		var rs=true;  
		 
	  	$("#regbtn").click(function(){
	  		if(rs==false){
	  			return;
	  		}
	  		$("#formID").submit();
	  	});
	  	
	  	function inputCha(){
	  		
	  	}
	  	
	  	$("#userCode").change(function(){
			var userCode = $("#userCode").val();
			if(userCode==""){
				return;
			}
			$.getJSON("${basePath}/checkUserCode.do",{userCode:userCode},function(data){
				if(data){
					chkRs=true;
					$("#userCodehint").text("通过");
					$("#mobile").removeAttr("readonly").attr("placeholder","手机号");
					$("#verifycode").removeAttr("readonly").attr("placeholder","6位验证码");
					$("#password").removeAttr("readonly").attr("placeholder","8-12位密码");
					return;
				}
				$("#mobile").attr({readonly:"readonly",placeholder:"请先输入用户账号"});
				$("#verifycode").attr({readonly:"readonly",placeholder:"请先输入用户账号"});
				$("#password").attr({readonly:"readonly",placeholder:"请先输入用户账号"});
				$("#userCodehint").text("账号不存在！");
	  		});
		});	
	});

	function sendMessage(){
		if(!chkRs){
	  		return;
	  	}
		var phone = $("#mobile").val();
	    $.post('${basePath}/getPhoneMessage.do', {mobile:phone}, function(msg) {
			if(msg=='提交成功'){
				RemainTime();
			}else{
	    		alert(msg);
			}
	    });
	};
	var iTime = 59;
	var Account;
	function RemainTime(){
		document.getElementById('btncode').disabled = true;
		var iSecond,sSecond="",sTime="";
		if (iTime >= 0){
			iSecond = parseInt(iTime%60);
			iMinute = parseInt(iTime/60)
			if (iSecond >= 0){
				if(iMinute>0){
					sSecond = iMinute + "分" + iSecond + "秒";
				}else{
					sSecond = iSecond + "秒";
				}
			}
			sTime=sSecond;
			if(iTime==0){
				clearTimeout(Account);
				sTime='获取手机验证码';
				iTime = 59;
				document.getElementById('btncode').disabled = false;
			}else{
				Account = setTimeout("RemainTime()",1000);
				iTime=iTime-1;
			}
		}else{
			sTime='没有倒计时';
		}
		document.getElementById('btncode').value = sTime;
	}

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
    <div id="regright" class="loginright"> 
        <h1>找回密码</h1>
        <form id="formID" action="${basePath}/forget_password.do" method="post">
        <div class="formline">            
            <div class="labelright"><input name="userCode" class="validate[required] roundinput" id="userCode" placeholder="请输入用户帐号" type="text"></div>
            <div class="flhint" id="userCodehint"></div>
          </div>
         <div class="formline">            
            <div class="labelright"><input name="mobile" class="validate[required] roundinput" id="mobile" placeholder="请先输入用户账号" type="text" readonly="readonly"></div>
            <div class="flhint" id="mobilehint">${phoneErrorItem}</div>
          </div>
          <div class="formline" id="verifycodeline">            
            <div class="labelright"><input name="verifycode" class="validate[required] roundinput" id="verifycode" placeholder="请先输入用户账号" type="text" readonly="readonly"> 
            <input id="btncode" value="发送验证码" class="btn" onclick="sendMessage();" type="button"></div>
            <div class="flhint" id="verifycodehint">${validateErrorItem}</div>
          </div>
          <div class="formline">            
            <div class="labelright"><input name="password" class="validate[required,minSize[8],maxSize[12]] roundinput" id="password" placeholder="请先输入用户账号" type="password" readonly="readonly"></div>
            <div class="flhint" id="passwordhint"><span class="red"></span> 8-12位</div>
          </div>          
          <div class="formline">
    		<input class="btn" id="regbtn" value="重置密码" type="button">
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