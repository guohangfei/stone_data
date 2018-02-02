<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<form id="meal_edit" class="easyui-form"
	action="${basePath }/back/exec_edit_meal.do" method="post">
	<input type="hidden" value="${meal.noid }" name="noid">
	<table>
		<tr>
			<td>接口名称:</td>
			<td><input type="text" value="${meal.apiName }"
				readonly="readonly"></input></td>
		</tr>
		<tr>
			<td>资费名称:</td>
			<td><input type="text" value="${meal.mealLevel}"
				readonly="readonly"></td>
		</tr>
		<tr>
			<td>单位条数:</td>
			<td><input name="numb" type="text" id="numb"
				value="${meal.numb }"></input>条</td>
		</tr>
		<tr>
			<td>单位价格:</td>
			<td><input name="price" type="text" id="price"
				value="${meal.price }"></input>元</td>
		</tr>
		<tr>
			<td></td>
			<td><input type="button" value="保存" onclick="submitForm();"></input>&nbsp;&nbsp;
				<input type="button" onclick="clearForm();" value="取消"></input></td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	function submitForm() {
		var numb = $("#numb").val();
		var price = $("#price").val();
		if (/^[1-9]\d{0,9}$/.test(numb)&&/^\d+[.]?\d+$/.test(price)) {
			$('#meal_edit').form('submit', {
				success : function(data) {
					if (data == "success") {
						alert('修改成功');
					} else {
						alert('修改失败，请检查')
					}
					$("#meal_win").window('close');
					$("#dg_meal_list").datagrid("reload");
				}
			});
		}
		alert('请检查数字格式');
	}
	function clearForm() {
		$("#meal_win").window('close');
	}
</script>