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
<div style="padding:10px 60px 20px 60px">
	    <form id="noticeType_add" class="easyui-form" action="${basePath}/back/notice_type_add.do" method="post" data-options="novalidate:false">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>分类名称:</td>
	    			<td><input id="typeName" name="typeName"  class="easyui-validatebox" type="text" id="title"  data-options="required:true" missingMessage="请输入分类名称" /></td>
	    			<td id="pcode"></td>
	    		</tr>
	    		<tr>
	    			<td>分类代号:</td>
	    			<td><input type="text" class="easyui-numberbox" value="0" data-options="min:0,max:10000" name="typeSymbol"></td>
	    			<td id="ppwd"></td>
	    		</tr>
	    		<tr>
	    			<td>顺序号：</td>
	    			<td><input type="text" class="easyui-numberbox" value="0" data-options="min:0,max:10000" name="typeOrderNumb"></td>
	    		</tr>
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"  onclick="submitAddNoticeType()">添加</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"  onclick="clearAddNoticeType()">取消</a>
	    </div>
	    </div>
   

<script type="text/javascript">

function submitAddNoticeType(){
	$("#noticeType_add").form('submit',{
		success:function(data){
			if(data=='true'){
				alert("公告分类信息添加成功！");
				$("#winAddNoticeType").window("close");	
			}else{
				alert("添加失败请重试");
			}
			$("#winAddNoticeType").window("close");	
			$("#noticeType_tbl").datagrid("reload");
		}
	});
}

function clearAddNoticeType(){
	$("#winAddNoticeType").window("close");
}
		
</script>
</body>
</html>