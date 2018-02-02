<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<body>
	<table class="easyui-datagrid" style="width: 800px; height: 600px" id="dg_meal_list"
		data-options="rownumbers:true,fitColumns:true,url:'${basePath }/back/getMealList.do',singleSelect:true,method:'post'">
		<thead>
			<tr>
				<th data-options="field:'apiName',width:100,align:'center'">接口名称</th>
				<th data-options="field:'meal',width:100,align:'center'">套餐等级</th>
				<th data-options="field:'number',width:100,align:'center'">单位条数(条)</th>
				<th data-options="field:'price',width:100,align:'center'">单位价格(元)</th>
				<th
					data-options="field:'meal_aciton',formatter:fmt_meal_btn,width:100,align:'center'">操作</th>
			</tr>
		</thead>
	</table>
	<div id="meal_win" class="easyui-window" title="修改接口信息"
		style="width: 600px; height: 400px"
		data-options="iconCls:'icon-save',modal:true,closed:true">
	</div>
	<script type="text/javascript">
		function fmt_meal_btn(val, data, index) {
			return "<button onclick='mealEditWindow("+data.noid+");'>修改</button>";
		}
		function mealEditWindow(noid){
			$("#meal_win").window('refresh',"${basePath}/back/meal_edit.do?noid="+noid);
			$("#meal_win").window('open');
		}
	</script>
</body>
</html>
