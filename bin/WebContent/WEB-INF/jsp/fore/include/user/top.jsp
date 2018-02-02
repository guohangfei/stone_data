<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript"
	src="${basePath }/fore_source/js/jquery-2.0.3.min.js"></script>
<div class="wid">
	<div id="top" class="mytop">
		<div id="logo">
			<a href="${basePath }/fore/index.do">顽石数据</a>
		</div>
		<div id="mylogoright">
			<span id="appkey">appkey: ${user.appKey }
			</span> <a href="${basePath }/fore/index.do" class="rightline">网站首页</a><i></i>
			<span> 你好， <label id="membername">
			<c:if test="${user.nickName==null }">
				顽石用户
			</c:if>
			<c:if test="${user.nickName!=null }">
				${user.nickName }
			</c:if>
			
			</label> !
			</span><i></i> <a href="javascript:void(0);" onclick="logout();">安全退出</a>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<script type="text/javascript">
	function logout(){
		if (!confirm('确定退出？')) {
			return;
		}
		$.post("${basePath}/logout.do",function(res){
			if (res=="success") {
				alert("已退出");
				location.href="${basePath}/fore/index.do";
			}
		});
	}
</script>