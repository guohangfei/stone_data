<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>石头数据后台管理页面</title>
</head>
<body>
	<div style="width:280px;height:180px;padding:30px 60px 30px 60px">
	<form id="update" class="easyui-form" action="${basePath}/back/updatePubExecute.do" method="post" enctype="multipart/form-data" data-options="novalidate:true">
		<c:forEach items="${publi}" var="pub">
		<p><input type="hidden" name="noid" value="${pub.noid }"></p>
		<p>广告标题: <input type="text" name="title" value="${pub.title }"></p>
		<p>广告内容: <input type="text" name="content" value="${pub.content }"></p>
		<p>所属分类: 
		<select name="type_id"> 
		<c:forEach items="${allTypes }" var="type">
		<option value="${type.noid }" <c:if test="${type.noid==pub.type_id}">selected="selected"</c:if>>
		${type.type_name }
		</option>
		</c:forEach>
		</select>
		</p>
		<p><c:if test="${pub.pic_url!=''||pub.pic_url!=null}"><img src="${pub.pic_url}" width="150px;" height="150px;"></c:if></p>
		<p>选择要重新上传的图片: <input type="file" name="pic"></p>
		<p>广告链接: <input type="text" name="link_url" value="${pub.link_url }"></p>
		<p>顺  序  号: <input type="text" name="order_numb" value="${pub.order_numb }"></p>
		<p style="display:none;">创建时间: <input type="text" name="create_time"></p>
		<p>状&nbsp;&nbsp;态: 
		<select name="state">
		<option value="1" <c:if test="${pub.state==1}">selected="selected"</c:if>>可用</option>
		<option value="2" <c:if test="${pub.state==2}">selected="selected"</c:if>>禁用</option>
		</select>
		</p>
		<p style="display:none;">点  击  量: <input type="text" name="click"></p>
		<div style="padding:5px;text-align:center;">
			<a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-ok" onclick="submitForm()">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-cancel" onclick="clearForm()">取消</a>
		</div>
		</c:forEach>
	</form>
</div>
<script type="text/javascript">
function submitForm(){
	$("#update").form('submit',{
		success:function(data){
			if(data=='ok'){
				alert("广告修改成功!");
			}else{
				alert("广告修改失败，请重试!");				
			}
			$("#winPubUpdate").window("close");
			$("#dg_pub_list").datagrid("reload");
		}
	});
}

function clearForm(){
	$("#winPubUpdate").window("close");
}
</script>
</html>