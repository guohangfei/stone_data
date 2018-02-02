<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<h2>基本资料</h2>
			<div class="rcontent">
				<form id="myForm">
				<input type="hidden" name="noid" value="${noid }">
					<div class="formline">
						<label>账号</label>
						<div class="labelright">
							<input type="text" name="user_code" class="roundinput" id="code"
								value="${userInfo.userCode }" readonly="readonly" />
						</div>
					</div>
					<div class="formline">
						<label>昵称</label>
						<div class="labelright">
							<input type="text" name="nickname" class="roundinput"
								id="nickname" value="${userInfo.nickName }" placeholder="昵称" />
						</div>
					</div>
					<div class="formline">
						<label>性别</label>
						<div class="labelright" style="margin-top: 8px;">
							<c:if test="${userInfo.sex==1 }">
								<input type="radio" name="sex" value="1" checked="checked" />男&nbsp;&nbsp;&nbsp;
							<input type="radio" name="sex" value="2" />女
						</c:if>
							<c:if test="${userInfo.sex==2 }">
								<input type="radio" name="sex" value="1" />男&nbsp;&nbsp;&nbsp;
							<input type="radio" name="sex" value="2" checked="checked" />女
						</c:if>
							<c:if test="${userInfo.sex!=1&& userInfo.sex!=2}">
								<input type="radio" name="sex" value="1" checked="checked" />男&nbsp;&nbsp;&nbsp;
							<input type="radio" name="sex" value="2" />女
						</c:if>
						</div>
					</div>
					<div class="formline">
						<label>年龄</label>
						<div class="labelright">
							<input type="text" name="age" class="roundinput" id="age"
								value="${userInfo.age }" placeholder="年龄" />
						</div>
					</div>
					<div class="formline">
						<label>手机</label>
						<div class="labelright">
							<input type="text" name="mobile" class="roundinput" id="mobile"
								value="${userInfo.phoneNumb }" placeholder="手机号" />
						</div>
					</div>
					<div class="formline">
						<label>邮箱</label>
						<div class="labelright">
							<input type="text" name="email" class="roundinput" id="email"
								value="${userInfo.mail }" placeholder="邮箱" />
						</div>
					</div>
					<div class="formline">
						<label>地址</label>
						<div class="labelright">
							<select name="provinceid" id="province" onchange="selProvince()"
								class="addrinput">
								<option value="0">选择省</option>
								<c:forEach items="${provinces }" var="p">
									<c:if test="${userInfo.pId==p.noid }">
										<option selected="selected" value="${p.noid }">${p.pName }</option>
									</c:if>
									<c:if test="${userInfo.pId!=p.noid }">
										<option value="${p.noid }">${p.pName }</option>
									</c:if>
								</c:forEach>
							</select> <select name="cityid" id="city" onchange="selCity();"
								class="addrinput">
								<option value="0">选择市</option>
								<c:forEach items="${citys }" var="c">
									<c:if test="${userInfo.cId==c.noid }">
										<option selected="selected" value="${c.noid }">${c.cName }</option>
									</c:if>
									<c:if test="${userInfo.cId!=c.noid }">
										<option value="${c.noid }">${c.cName }</option>
									</c:if>
								</c:forEach>
							</select> <select name="townid" id="district" class="addrinput">
								<option value="0">选择县/区</option>
								<c:forEach items="${districts }" var="d">
									<c:if test="${userInfo.dId==d.noid }">
										<option selected="selected" value="${d.noid }">${d.dName }</option>
									</c:if>
									<c:if test="${userInfo.dId!=d.noid }">
										<option value="${d.noid }">${d.dName }</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="formline">
						<label>appkey</label>
						<div class="labelright" style="line-height: 35px;">
						${user.appKey }
						</div>
					</div>
					<div class="formline">
						<input type="button" onclick="submitForm();" class="btn"
							id="regbtn" value="修改并保存" />
					</div>
				</form>
			</div>

		</div>
	</div>
	<script>
		function selProvince() {
			$("#city option[value!=0]").remove();
			$("#district option[value!=0]").remove();
			var pId = $("#province").val();
			$.post("${basePath}/fore/user/get_citys.do", {
				'pId' : pId
			}, function(res) {
				var citys = eval("(" + res + ")");
				for (var i = 0; i < citys.length; i++) {
					$("#city").append(
							"<option value="+citys[i].noid+">" + citys[i].cName
									+ "</option>");
				}
			})
		}
		function selCity() {
			$("#district option[value!=0]").remove();
			var cId = $("#city").val();
			$.post("${basePath}/fore/user/get_districts.do", {
				'cId' : cId
			}, function(res) {
				var district = eval("(" + res + ")");
				for (var i = 0; i < district.length; i++) {
					$("#district").append(
							"<option value="+district[i].noid+">"
									+ district[i].dName + "</option>");
				}
			})
		}
		function submitForm() {
			var noid=$("input[name=noid]").val();
			var nickName = $("#nickname").val();
			var sex = $("input[name=sex] ").val();
			var age = $("#age").val();
			var mobile = $("#mobile").val();
			var email = $("#email").val();
			var province = $("#province").val();
			var city = $("#city").val();
			var district = $("#district").val();
			if(nickName.length>15){
				alert('昵称过长，请检查。');
				return;
			}
			if(!((/^[1][0|1|2][0-9]&/).test(age)||(/^[0-9][0-9]$/).test(age))){
				alert("年龄不合法，请检查。");
				return;
			}
			if(!(/^[1][3|5|8][0-9]{9}$/).test(mobile)){
				alert("请输入正确的手机号。");
				return;			
			}
			if(!(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/ ).test(email)){
				alert("邮箱格式不正确。");
				return;
			}
			$.post("${basePath}/fore/user/update_info.do", {
				"noid":noid,
				"email":email,
				"nickName" : nickName,
				"sex" : sex,
				"age" : age,
				"mobile" : mobile,
				"province" : province,
				"city" : city,
				"district" : district,
			}, function(res) {
				if(res=="success"){
					alert('修改成功,请重新登录！');
					$.post("${basePath}/logout.do",function(res){
						if (res=="success") {
							location.href="${basePath}/login.do"
						}
					});
				}else{
					alert('修改失败！');
				}
			})
		}
	</script>
</body>
</html>