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
			<h2>账户余额</h2>
			<div class="rcontent accrcontent" id="ircontent"
				style="overflow: hidden;">
				<div class="accountline">
					账户余额：<span style="font-size: 18px;"><i>￥</i>${balance }</span> <a
						href="recharge_log.do" class="mybtn gray">充值记录</a>
					<div style="font-size: 30px; color: red;">${xianshi }</div>
				</div>
				<div class="clearfix"></div>
			</div>

			<h2>在线充值</h2>
			<div class="rcontent accrcontent" id="ircontent">
				<form id="myForm">
					<div class="formline">
						<label>卡号</label>
						<div class="labelright">
							<input type="text" name="cardId" class="roundinput" id="cardId"
								placeholder="支付宝账号" />
						</div>
						<div class="flhint">
							<span class="red">*</span>
						</div>
					</div>
					<div class="formline">
						<label>密码</label>
						<div class="labelright">
							<input type="password" name="cardPwd" class="roundinput"
								id="cardPwd" placeholder="支付宝密码" />
						</div>
						<div class="flhint">
							<span class="red">*</span>
						</div>
					</div>
					<div class="formline">
						<label>开户姓名</label>
						<div class="labelright">
							<input type="text" name="userName" class="roundinput"
								id="userName" placeholder="开户姓名" />
						</div>
						<div class="flhint">
							<span class="red">*</span>
						</div>
					</div>
					<div class="formline">
						<label>充值金额</label>
						<div class="labelright">
							<input type="text" name="money" class="roundinput" id="money"
								value="100" />
						</div>
					</div>
					<div class="formline">
						<input type="button" onclick="submitForm();" class="btn"
							id="regbtn" value="充值" />
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		function submitForm() {
			var cardId = $("#cardId").val();
			var cardPwd = $("#cardPwd").val();
			var userName = $("#userName").val();
			var money = $("#money").val();
			if (!/\d{19}/.test(cardId)) {
				alert('卡号不正确');
				return false;
			}
			if (!/[\w^_]{6,10}/.test(cardPwd)) {
				alert('密码长度错误');
				return false;
			}
			if (!/[\u4E00-\u9FA5]{2,4}/.test(userName)) {
				alert('姓名格式错误');
				return false;
			}
			if (!/^[1-9]\d{0,9}$/.test(money)) {
				alert('金额格式不正确');
				return false;
			}
			$.post("${basePath}/fore/user/exec_recharge.do", {
				"cardId" : cardId,
				"cardPwd" : cardPwd,
				"userName" : userName,
				"money" : money
			}, function(res) {
				if (res == "nocard") {
					alert('银行卡信息错误');
					return;
				}
				if (res == "nomoney") {
					alert('账户余额不足');
					return;
				}
				if (res == "success") {
					alert("充值成功");
					location.reload();
				}
			})
		}
	</script>
</body>
</html>