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
	    <form id="notice_add" class="easyui-form" action="${basePath}/back/notice_add.do" method="post" enctype="multipart/form-data" data-options="novalidate:false">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>标题:</td>
	    			<td><input id="title" name="title"  class="easyui-validatebox" type="text" id="title"  data-options="required:true" missingMessage="请输入公告标题" /></td>
	    			<td id="pcode"></td>
	    		</tr>
	    		<tr>
	    			<td>代号:</td>
	    			<td><input type="text" class="easyui-numberbox" value="0" data-options="min:0,max:10000" name="symbol"></td>
	    			<td id="ppwd"></td>
	    		</tr>
	    		<tr>
	    			<td>分类:</td>
	    			<td>
	    			<select name="typeId">
	    				<option value="">请选择</option>
		    			<c:forEach items="${noticeTypes}" var="noticeType">
		    				<option value="${noticeType.noid}">${noticeType.typeName}</option>
		    			</c:forEach>
	    			</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>图片:</td>
	    			<td><input type="file" name="picture"/></td>
	    		</tr>
	    		<tr>
	    			<td>顺序号：</td>
	    			<td><input type="text" class="easyui-numberbox" value="0" data-options="min:0,max:10000" name="orderNumb"></td>
	    		</tr>
	    		<tr>
	    			<td>状态:</td>
	    			<td>
	    				<select name="state">
	    				<option value="">请选择</option>
		    			<option value="2">禁用</option>
		    			<option value="1">可用</option>
	    			</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>内容:</td>
	    			<td><textarea cols="50" rows="10" name="content"></textarea></td>
	    		</tr>
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"  onclick="submitAddNotice()">添加</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"  onclick="clearAddNotice()">取消</a>
	    </div>
	    </div>
   

<script type="text/javascript">

function submitAddNotice(){
	$("#notice_add").form('submit',{
		success:function(data){
			if(data=='true'){
				alert("公告信息新增成功！");
				$("#winAddNotice").window("close");	
			}else{
				alert("新增失败请重试");
			}
			$("#winAddNotice").window("close");	
			$("#notice_tbl").datagrid("reload");
		}
	});
}

function clearAddNotice(){
	$("#winAddNotice").window("close");
}

//账号验证，必须是4-12字符间字母、数字或下划线
$("#code").blur(function() {
	//账号格式比对
	var acc = $("#code").val().trim();
	var sgl = /^\w{4,12}$/;
	if (sgl.test(acc)) {
		$("#pcode").text("账号可用").css("color", "green");
		$("#state").val("1")
	} else {
		$("#pcode").text("必须是4-12字符间字母、数字或下划线").css("color", "red");
		$("#state").val("0")
	}
})

	//第一次密码验证，必须是8-16位的字母、数字
		$("#pwd").blur(function() {
			//密码格式比对
			var acc = $("#pwd").val().trim();
			var sgl = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/;
			if (sgl.test(acc)) {
				$("#ppwd").text("密码可用").css("color", "green");
				$("#state").val("1")
			} else {
				$("#ppwd").text("密码须是8-16字符间字母+数字").css("color", "red");
				$("#state").val("0")
			}
		})
		
		
</script>
</body>
</html>