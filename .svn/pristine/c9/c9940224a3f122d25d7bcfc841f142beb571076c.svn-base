<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<body>
		<div style="padding:10px 60px 20px 60px">
	    <form id="admin_add" class="easyui-form" action="add_admin_do.do" method="post" data-options="novalidate:true">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>管理员账号:</td>
	    			<td><input id="code" name="admin_code" class="validate[required]" class="easyui-textbox" type="text" id="deptName" name="deptName" value="${dept.deptName }" data-options="required:true"></input></td>
	    			<td id="pcode"></td>
	    		</tr>
	    		<tr>
	    			<td>密码:</td>
	    			<td><input id="pwd" name="admin_pwd"   class="easyui-textbox" type="text" name="orderNumb" data-options="required:true"></input></td>
	    			<td id="ppwd"></td>
	    		</tr>
	    		<tr>
	    			<td>权限:</td>
	    			<td>
	    			<c:forEach items="${allpow }" var="ap">
	    				<input type="checkbox" value="${ap.noid }" name="chockbox">${ap.power_name }
	    			</c:forEach>
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
	$("#admin_add").form('submit',{
		success:function(data){
			if(data=='ok'){
				alert("管理员新增成功。");
				$("#winAdminAdd").window("close");	
			}else{
				alert("新增失败请重试");
			}
			$("#winAdminAdd").window("close");	
			$("#dg_admin_list").datagrid("reload");
		}
	});
}

function clearForm(){
	$("#winAdminAdd").window("close");
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
