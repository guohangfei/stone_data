<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<form id="ff" class="easyui-form"
	action="${basePath }/back/exec_edit_api.do" method="post">
	<input type="hidden" value="${api.noid }" name="noid">
	<table>
		<tr>
			<td>接口名称:</td>
			<td><input name="apiName" type="text" value="${api.apiName }"></input></td>
		</tr>
		<tr>
			<td>接口描述:</td>
			<td><textarea rows="5" cols="20" name="apiDetail">${api.apiDetail }</textarea>
			</td>
		</tr>
		<tr>
			<td>顺序号:</td>
			<td><input name="orderNumb" type="text"
				value="${api.orderNumb }"></input></td>
		</tr>
		<tr>
			<td>套餐:</td>
			<td><select id="cc" class="easyui-combobox" name="meal"
				style="width: 173px;">
					<c:forEach items="${meal }" var="m">
						<c:if test="${api.defaultNumb==m.mealId }">
							<option selected="selected" value="${m.mealId }">${m.meal }</option>
						</c:if>
						<c:if test="${api.defaultNumb!=m.mealId }">
							<option value="${m.mealId }">${m.meal }</option>
						</c:if>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="button" value="保存" onclick="submitForm();"></input>&nbsp;&nbsp;<input
				type="button" onclick="clearForm();" value="取消"></input></td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	function submitForm() {
		var orderNumb = $("input[name='orderNumb']").val();
		if (!/^[1-9]\d{0,19}$/.test(orderNumb)) {
			alert('顺序号格式错误');
			return;
		}
		$.post("${basePath }/back/check_ordernumb.do", {
			"orderNumb" : orderNumb
		}, function(res) {
			if (res == "repeat") {
				alert('顺序号重复，请检查');
				return;
			} else {
				$('#ff').form('submit', {
					success : function(data) {
						if (data == "success") {
							alert('修改成功');
						} else {
							alert('修改失败，请检查')
						}
						$("#api_win").window('close');
						$("#dg_api_list").datagrid("reload");
					}
				});
			}
		})

	}
	function clearForm() {
		$("#api_win").window('close');
	}
</script>