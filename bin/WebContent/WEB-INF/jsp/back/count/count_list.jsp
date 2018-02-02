<%@ page language="java" contentType="text/html; charset=UTF-8"%>
	<table class="easyui-datagrid" title="收入统计"
		style="width: 1120px; height: 484px"
		data-options="singleSelect:true,collapsible:true,url:'${basePath }/back/count.do',method:'post'">
		<thead>
			<tr>
				<th data-options="field:'apiName',width:80">接口名称</th>
				<th data-options="field:'cntMoney',width:100">总收入(元)</th>
				<th data-options="field:'cntItem',width:100">购买总条数(条)</th>
				<th data-options="field:'usedCnt',width:100">调用总条数(条)</th>
				<th data-options="field:'unusedCnt',width:100">剩余总条数(条)</th>
			</tr>
		</thead>
	</table>
