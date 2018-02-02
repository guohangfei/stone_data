<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<body>
		<div style="padding:10px 60px 20px 60px">
	    <form id="delPub" class="easyui-form" action="${basePath}/back/delPubExecute.do" method="post" data-options="novalidate:true">
	    	<input hidden="hidden" name="noid" value="${noid }">
	    		<p style="font-size:20px;text-indent:40px;">您确认删除此广告吗？</p>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"  onclick="submitForm()">确认</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"  onclick="clearForm()">取消</a>
	    </div>
	    </div>
<script type="text/javascript">

function submitForm(){
	$("#delPub").form('submit',{
		success:function(data){
			if(data=='ok'){
				alert("删除成功");
				$("#winPubDel").window("close");
				
			}else{
				alert("删除失败请重试");
			}
			$("#winPubDel").window("close");
			$("#dg_pub_list").datagrid("reload");
		}
	});
}

function clearForm(){
	$("#winPubDel").window("close");
}
</script>
</body>
</html>