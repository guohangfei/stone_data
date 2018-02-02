<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<body>
		<div style="padding:10px 60px 20px 60px">
	    <form id="del" class="easyui-form" action="${basePath}/back/del_power_do.do" method="post" data-options="novalidate:true">
	    	<input hidden="hidden" name="noid" value="${noid }">
	    	您确认删除本信息吗？
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"  onclick="submitForm()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"  onclick="clearForm()">取消</a>
	    </div>
	    </div>
<script type="text/javascript">

function submitForm(){
	$("#del").form('submit',{
		success:function(data){
			if(data=='ok'){
				alert("删除成功");
				$("#winPowerDel").window("close");	
			}else{
				alert("删除失败请重试");
			}
			$("#winPowerDel").window("close");
			$("#dg_power_list").datagrid("reload");
		}
	});
}

function clearForm(){
	$("#winPowerDel").window("close");
}
</script>
</body>
</html>
