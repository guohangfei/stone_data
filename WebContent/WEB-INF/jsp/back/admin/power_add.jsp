<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<body>
		<div style="padding:10px 60px 20px 60px">
	    <form id="add" class="easyui-form" action="add_power_do.do" method="post" data-options="novalidate:true">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>权限名称:</td>
	    			<td><input class="easyui-textbox" type="text" id="power_name" name="power_name" " data-options="required:true"></input></td>
	    			<td id="pcode"></td>
	    		</tr>
	    		<tr>
	    			<td>权限别名:</td>
	    			<td><input class="easyui-textbox" type="text" id="power_symbol" name="power_symbol" data-options="required:true"></input></td>
	    			<td id="ppwd"></td>
	    		</tr>
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"  onclick="submitForm()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"  onclick="clearForm()">取消</a>
	    </div>
	    </div>
   

<script type="text/javascript">

function submitForm(){
	$("#add").form('submit',{
		success:function(data){
			if(data=='ok'){
				alert("权限新增成功。");
				
			}else{
				alert("权限新增失败请重试");
			}
			$("#winPowerList").window("close");	
			$("#dg_power_list").datagrid("reload");
		}
	});
}
function clearForm(){
	$("#winPowerList").window("close");
}
</script>
</body>
</html>
