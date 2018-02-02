<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<body>
<div style="padding:10px 60px 20px 60px">
	    <form id="noticeType_update" class="easyui-form" action="${basePath}/back/notice_type_update.do" method="post"  data-options="novalidate:false">
	    	<c:forEach items="${noticeTypes}" var="noticeType">
	    	<input type="hidden" name="noid" value="${noticeType.noid}">
	    	<table cellpadding="5">
	    			<tr>
	    			<td>分类名称:</td>
	    			<td><input id="typeName" name="typeName"  class="easyui-validatebox" type="text" value="${noticeType.typeName}"  data-options="required:true" missingMessage="请输入分类名称" /></td>
	    			<td id="pcode"></td>
	    		</tr>
	    		<tr>
	    			<td>分类代号:</td>
	    			<td><input type="text" class="easyui-numberbox" value="${noticeType.typeSymbol}" data-options="min:0,max:10000" name="typeSymbol"></td>
	    			<td id="ppwd"></td>
	    		</tr>
	    		<tr>
	    			<td>顺序号：</td>
	    			<td><input type="text" class="easyui-numberbox" value="${noticeType.typeOrderNumb}" data-options="min:0,max:10000" name="typeOrderNumb"></td>
	    		</tr>
	    	</table>
	    	</c:forEach>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"  onclick="submitUpdateNoticeType()">修改</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"  onclick="clearUpdateNoticeType()">取消</a>
	    </div>
	    </div>
   

<script type="text/javascript">

function submitUpdateNoticeType(){
	$("#noticeType_update").form('submit',{
		success:function(data){
			if(data){
				alert("公告分类信息修改成功！");
				$("#winUpdateNoticeType").window("close");	
			}else{
				alert("修改失败请重试");
			}
			$("#winUpdateNoticeType").window("close");	
			$("#noticeType_tbl").datagrid("reload");
		}
	});
}

function clearUpdateNoticeType(){
	$("#winUpdateNoticeType").window("close");
}


</script>
</body>
</html>