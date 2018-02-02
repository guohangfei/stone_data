<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
<link href="${basePath }/fore_source/css/user/main.css" rel="stylesheet"
	type="text/css" />
<link href="${basePath }/fore_source/css/user/my.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="${basePath }/fore_source/js/jquery-2.0.3.min.js"></script>
</head>
<body>
	<%@ include file="../include/user/top.jsp"%>
	<div class="wid">
		<%@ include file="../include/user/left.jsp"%>
		<div id="rcontentbox">
			<h2>修改密码</h2>
			<div class="rcontent">
				<form id="myForm">
					<input type="hidden" name="noid" value="${noid }" id="noid">
					<div class="formline">
						<label>输入密码</label>
						<div class="labelright">
							<input type="password" name="pwd" class="roundinput" id="pwd"
								placeholder="新密码" />
						</div>
						<div class="flhint">
							<span class="red">*</span>
						</div>
					</div>
					<div class="formline">
						<label>确认密码</label>
						<div class="labelright">
							<input type="password" name="pwd1" class="roundinput" id="pwd1"
								placeholder="确认密码" />
						</div>
						<div class="flhint">
							<span class="red">*</span>
						</div>
					</div>
					<div class="formline">
						<input type="button" onclick="clkBtn();" class="btn" id="regbtn"
							value="保存" />
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
	function clkBtn(){
		var noid=$("#noid").val();
		var pwd=$("#pwd").val();
		var pwd1=$("#pwd1").val();
		var reg=/\w{8,16}/;
		if(!reg.test(pwd)){
			alert('密码格式错误，请检查。');
			return;
		}
		if(pwd!=pwd1){
			alert('两次密码不一致，请检查。');
			return;
		}
		$.post("edit_pwd.do",{'noid':noid,'pwd':pwd,'pwd1':pwd1},function(res){
			if(res=="success"){
				alert('修改成功,请重新登录。');
				$.post("${basePath}/logout.do",function(res){
					if (res=="success") {
						location.href="${basePath}/login.do"
					}
				});
			}else{
				alert('修改失败，请检查后重试。');
			}
		})
	}
	</script>
</body>
</html>