<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<body>
<div style="padding:10px 60px 20px 60px">
	<form id="add" class="easyui-form" action="${basePath}/back/addPubTyExecute.do" method="post" data-options="novalidate:true">
		<p>分类名称: <input type="text" name="type_name"></p>
		<p>分类代号: <input type="text" name="type_symbol"></p>
		<p>顺  序  号: <input type="text" name="order_numb"></p>
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
				alert("广告分类新增成功！");
			}else{
				alert("新增失败请重试。。。");
			}
			$("#winPubtyList").window("close");	
			$("#dg_pubty_list").datagrid("reload");
		}
	});
}
function clearForm(){
	$("#winPubtyList").window("close");
}
</script>
</body>
</html>