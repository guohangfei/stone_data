<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<body>
	<table class="easyui-datagrid" style="width: 800px; height: 250px" id="dg_api_list"
		data-options="rownumbers:true,fitColumns:true,url:'${basePath }/back/getList.do',singleSelect:true,method:'post'">
		<thead>
			<tr>
				<th data-options="field:'apiName',width:100,align:'center'">接口名称</th>
				<th data-options="field:'apiDetail',width:100,align:'center'">接口描述</th>
				<th data-options="field:'orderNumb',width:100,align:'center'">顺序号</th>
				<th data-options="field:'meal',width:100,align:'center'">默认套餐</th>
				<th
					data-options="field:'action',formatter:addBtn,width:100,align:'center'">操作</th>
			</tr>
		</thead>
	</table>
	<div id="api_win" class="easyui-window" title="修改接口信息"
		style="width: 600px; height: 400px"
		data-options="iconCls:'icon-save',modal:true,closed:true">
	</div>
	<script type="text/javascript">
		function addBtn(val, data, index) {
			return "<button onclick='newWindow("+data.noid+");'>修改</button>";
		}
		function newWindow(noid){
			$("#api_win").window('refresh',"${basePath}/back/api_edit.do?noid="+noid);
			$("#api_win").window('open');
		}
	</script>
</body>
</html>
