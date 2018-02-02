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
			<h2>头像管理</h2>
			<div class="rcontent">
				<div class="formline"
					style="background-color: #ccc; width: 200px; height: 200px">
					<c:if test="${url==null }">
						<img id="myImg" src="${basePath }/fore_source/image/slide.png" alt="图片无法显示"
							style="width: 200px; height: 200px;">
					</c:if>
					<c:if test="${url!=null }">
						<img src="../../../${url }" alt="图片无法显示"
							style="width: 200px; height: 200px;">
					</c:if>
				</div>
				<form enctype="multipart/form-data" action="${basePath}/fore/user/update_avatar.do" method="post">
				<input type="hidden" name="noid" value="${noid }">
					<div class="formline">
						<label>更换头像</label>
						<div class="labelright">
							<input type="file" name="fl" class="roundinput" id="fl" />
						</div>
					</div>
					<div class="formline">
						<input type="submit" class="btn" onclick="return submitForm();" id="regbtn" value="保存" />
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function submitForm(){
			if($("#fl").val()==""){
				alert('请选择图片');
				return false;
			}
		}
	</script>
</body>
</html>