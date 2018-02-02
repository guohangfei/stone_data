<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
			<h2>充值记录</h2>
			<div class="rcontent">
				<table class="table">
					<tr>
						<th>序号</th>
						<th>订单号</th>
						<th>充值时间</th>
						<th>金额</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${logs}" var="log" varStatus="vst">
					<tr>
						<td>${vst.count }</td>
						
						<td>${log.orderNumb }</td>
					
						<td><fmt:formatDate value="${log.rechargeTime }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
						<td>${log.rechargeMoney }元</td>
						<td><span onclick="delRecord(${log.noid});" class="lightblue3">删除</span></td>
						<td>
							<!--<a href="order_detail.php?id=642">详情</a>-->
						</td>
					</tr>
					</c:forEach>
				</table>
				<c:if test="${logs.size()>0 }">
				<div class="mtop10" id="pageline">
					<span class="pprev">上一页</span> <span class="current">1</span> <span
						class="pnext">下一页</span>
				</div>
				</c:if>
				<c:if test="${logs.size()==0 }">无充值记录</c:if>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function delRecord(noid){
		var state=confirm('确定删除？');
		if (!state) {
			return false;
		}
		$.post("${basePath }/fore/user/del_record.do?noid="+noid,function(res){
			if (res=="success") {
				alert('删除成功');
				location.reload();			
			}
		})
	}
	</script>
</body>
</html>