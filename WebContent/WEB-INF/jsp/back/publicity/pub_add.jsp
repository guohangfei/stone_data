<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="width:280px;height:180px;padding:30px 60px 30px 60px">
	<form id="add" class="easyui-form" action="${basePath}/back/addPubExecute.do" method="post" enctype="multipart/form-data" data-options="novalidate:true">
		<p>广告标题: <input type="text" name="title"></p>
		<p>广告内容: <input type="text" name="content"></p>
		<p>所属分类: 
		<select name="type_id"> 
		
		<c:forEach items="${allTypes }" var="type">
		<option value="${type.noid }">
		${type.type_name }
		</option>
		</c:forEach>
		</select>
		</p>
		<p>上传图片: <input type="file" name="pic"></p>
		<p>广告链接: <input type="text" name="link_url"></p>
		<p>顺  序  号: <input type="text" name="order_numb"></p>
		<p style="display:none;">创建时间: <input type="text" name="create_time"></p>
		<p>状&nbsp;&nbsp;态: 
		<select name="state"> 
		<option value="1">可用</option>
		<option value="2">禁用</option>
		</select>
		</p>
		<p style="display:none;">点  击  量: <input type="text" name="click"></p>
		<div style="padding:5px;text-align:center;">
			<a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-ok" onclick="submitForm()">提交</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-cancel" onclick="clearForm()">取消</a>
		</div>
	</form>
</div>
<script type="text/javascript">

function submitForm(){
	$("#add").form('submit',{
		success:function(data){
			if(data=='ok'){
				alert("广告新增成功！");
			}else{
				alert("新增失败请重试。。。");
			}
			$("#winPubList").window("close");	
			$("#dg_pub_list").datagrid("reload");
		}
	});
}
function clearForm(){
	$("#winPubList").window("close");
}
</script>
</body>
</html>