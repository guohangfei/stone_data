<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="padding:10px 60px 20px 60px">
	<form id="update" class="easyui-form" action="${basePath}/back/updatePubTyExecute.do" method="post" data-options="novalidate:true">
	  <c:forEach items="${pubType }" var="pubTy">
		<p><input type="hidden" name="noid" value="${pubTy.noid }"></p>
		<p>分类名称: <input type="text" name="type_name" value="${pubTy.type_name }"></p>
		<p>分类代号: <input type="text" name="type_symbol" value="${pubTy.type_symbol }"></p>
		<p>顺  序  号: <input type="text" name="order_numb" value="${pubTy.order_numb }"></p>
		<div style="padding:5px;text-align:center;">
			<a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-ok" onclick="submitForm()">提交</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-cancel" onclick="clearForm()">取消</a>
		</div>
	  </c:forEach>
	</form>
<script type="text/javascript">
function submitForm(){
	$("#update").form('submit',{
		success:function(data){
			if(data=='ok'){
				alert("修改成功!");
			}else{
				alert("修改失败，请重试!");				
			}
			$("#winPubtyUpdate").window("close");
			$("#dg_pubty_list").datagrid("reload");
		}
	});
}

function clearForm(){
	$("#winPubtyUpdate").window("close");
}
</script>
</div>
</body>
</html>