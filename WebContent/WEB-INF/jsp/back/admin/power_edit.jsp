<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>石头数据后台管理页面</title>
</head>
<body>
	<div style="padding:10px 60px 20px 60px">
	    <form id="edit" class="easyui-form" action="${basePath}/back/update_power_do.do" method="post" data-options="novalidate:true">
	    	<table cellpadding="5">
		    	<c:forEach items="${pow }" var="ma">
		    		<tr hidden="hidden">
		    			<td>id:</td>
		    			<td><input class="easyui-textbox" type="text" id="noid" name="noid" value="${ma.noid }" data-options="required:true"></input></td>
		    		</tr>
		    		<tr>
		    			<td>权限名称:</td>
		    			<td><input class="easyui-textbox" type="text" id="power_name" name="power_name" value="${ma.power_name }" data-options="required:true"></input></td>
		    		</tr>
		    		<tr>
		    			<td>权限别名:</td>
		    			<td><input class="easyui-textbox" type="text" id="power_symbol" name="power_symbol" value="${ma.power_symbol}" data-options="required:true"></input></td>
		    		</tr>
		    	</c:forEach>
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"  onclick="submitForm()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"  onclick="clearForm()">取消</a>
	    </div>
	    </div>
<script type="text/javascript">
function submitForm(){
	$("#edit").form('submit',{
		success:function(data){
			if(data=='ok'){
				alert("权限编辑成功!");
			}else{
				alert("权限编辑失败，请重试!");				
			}
			$("#winPowerEdit").window("close");
			$("#dg_power_list").datagrid("reload");
		}
	});
}

function clearForm(){
	$("#winPowerEdit").window("close");
}
</script>
</body>
</html>