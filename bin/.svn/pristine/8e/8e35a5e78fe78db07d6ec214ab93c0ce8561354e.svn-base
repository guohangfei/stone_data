<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>广告分类表</title>
	<!-- <meta charset="UTF-8">
	<title>广告分类表</title>
	<link rel="stylesheet" type="text/css" href="../../themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../../themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../demo.css">
	<script type="text/javascript" src="../../jquery.min.js"></script>
	<script type="text/javascript" src="../../jquery.easyui.min.js"></script> -->
</head>
<body>
<h2 style="text-indent:20px;font-size:26px;">广告分类信息</h2>
	<p></p>
	<div style="margin:20px 0;"></div>
	<table id="dg_pubty_list" class="easyui-datagrid" title="数据表"
		style="width: 1000px; height: 350px"
		data-options="singleSelect:true,collapsible:true,url:'${basePath }/back/getAll_pub_type.do',method:'post'">
		<thead>
			<tr>
			    <th data-options="field:'noid',formatter:fmt_pubty_index,width:80,align:'center'">编号</th>
				<th data-options="field:'type_name',width:80,align:'center'">广告分类名称</th>
				<th data-options="field:'type_symbol',width:80,align:'center'">分类代号</th>
				<th data-options="field:'order_numb',width:90,align:'center'">顺序号</th>
				<th data-options="field:'handle',formatter:fmt_pubty,width:110,align:'center'"><a onclick="winPubtyList()" href="javascript:void(0)">新增广告分类</a></th>
			</tr>
		</thead>
	</table>	
	<div style="margin:20px 0;"></div>
	<div class="easyui-panel">
		<div class="easyui-pagination" data-options="total:114"></div>
	</div>
	<div id="winPubtyList" class="easyui-window" title="新增广告分类" style="width:400px;height:200px"
    data-options="iconCls:'icon-save',modal:true,closed:true">
	</div>
	<div id="winPubtyUpdate" class="easyui-window" title="修改广告分类" style="width:400px;height:200px"
	    data-options="iconCls:'icon-save',modal:true,closed:true">
	</div>
	<div id="winPubtyDel" class="easyui-window" title="删除广告分类" style="width:400px;height:200px"
	    data-options="iconCls:'icon-save',modal:true,closed:true">
	</div>
<script type="text/javascript">
function fmt_pubty(val,data,index){
	return "<button onclick='winPubtyUpdate("+data.noid+")'>修改</button>&nbsp;<button onclick='winPubtyDel("+data.noid+")'>删除</button>";
}
function fmt_pubty_index(val,data,index){
	return index+1;
}
function winPubtyList(){
	$("#winPubtyList").window("refresh","${basePath}/back/addPubTyPrompt.do");
	$("#winPubtyList").window("open");
}
function winPubtyUpdate(noid){
	$("#winPubtyUpdate").window("refresh","${basePath}/back/updatePubTyPrompt.do?noid="+noid);
	$("#winPubtyUpdate").window("open");
}
function winPubtyDel(noid){
	$("#winPubtyDel").window("refresh","${basePath}/back/delPubTyPrompt.do?noid="+noid);
	$("#winPubtyDel").window("open");
}
</script>
</body>
</html>