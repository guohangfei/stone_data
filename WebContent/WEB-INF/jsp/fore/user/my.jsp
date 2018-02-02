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
			<h2>
				我的数据 
			</h2>
			<div id="iapilist" class="clearfix">
				<ul>
				
					<c:forEach items="${countDate }" var="cd">
					<li>
						<div class="iapileft">
							<a href="/api/weather/" target="_blank"><img
								src="${basePath }${cd.img_url }" height="32" />${cd.api_name }</a>
						</div>
						<div class="iapicenter">
							<div class="progressline">
								<div class="progress">
									<div class="progress-bar" style="width: ${cd.used_cnt/cd.all_apply_cnt*100 }%;">
										<div class="indication">
											<span class="bot"></span><span class="top"></span>${cd.used_cnt }次
										</div>
									</div>
								</div>
								<div class="prototal">${cd.all_apply_cnt }次&nbsp;&nbsp;&nbsp;<a href="${basePath }/fore/user/buy.do?api_id=${cd.api_id }" class="mybtn btnorange">续费</a></div>
							</div>
						</div>
					</li>
					</c:forEach>
					
				</ul>
			</div>
			<h2>账号信息</h2>
			<div class="rcontent accrcontent">
				<div class="myline">
					<span class="label">用户账号：</span> ${userCode } 
				</div>
				<div class="myline">
					<span class="label">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</span>
					<c:if test="${nickName!=null }">
						${nickName }
					</c:if>
					<c:if test="${nickName==null }">
						未设置昵称
					</c:if>
					
				</div>
				<div class="myline">
					<span class="label">邮箱地址：</span> 
					<c:if test="${mail!=null }">
						${mail }
					</c:if>
					<c:if test="${nickName==null }">
						未设置邮箱
					</c:if>
				</div>
				<div class="myline">
					<span class="label">appkey &nbsp;：</span> ${appKey }
				</div>
			</div>
			<h2>账户状态</h2>
			<div class="rcontent accrcontent"
				style="padding-left: 0px; overflow: hidden;">
				<div class="accountline">
					账户余额：<span><i>￥</i>${balance }</span> <a href="recharge_log.do"
						class="aldetail">查看明细</a> <a href="balance.do" class="btna">充值</a>
				</div>
			</div>
		</div>
	</div>
	<script>
	</script>
</body>
</html>