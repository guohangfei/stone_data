<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>页面找不到了...</title>
<meta charset="utf-8">

<link rel="stylesheet" type="text/css"
	href="${basePath }/back_source/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${basePath }/back_source/easyui/themes/icon.css">
<script type="text/javascript" src="${basePath }/back_source/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${basePath }/back_source/easyui/jquery.easyui.min.js"></script>
</head>
<body>
	<div style="text-align: center">
		<img alt="" src="/stone_data/fore_source/image/404.jpg">
	</div>
	<div style="text-align: center">
		<p>
			将在 <span id="mes">3</span> 秒钟后返回<a href="javascript:history.back();">上一页</a>
		</p>
	</div>
</body>
<script type="text/javascript">
	var i = 3;
	var intervalid;
	intervalid = setInterval("fun()", 1000);
	function fun() {
		if (i == 0) {
			window.location.href = "javascript:history.back();";
			clearInterval(intervalid);
		}
		document.getElementById("mes").innerHTML = i;
		i--;
	}
</script>
</html>