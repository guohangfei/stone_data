<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>石头数据后台管理页面</title>
</head>
<body>
	<table id="dg_power_list" class="easyui-datagrid" 
   data-options="singleSelect:true,url:'${basePath}/back/get_all_power_list.do',method:'post'
     ,pagination:true" >
  <thead>
    <tr>
	    <th data-options="field:'noid',formatter:fmt_dg_power_index,width:80">编号</th>
	    <th data-options="field:'power_name',width:280">权限名称</th>
	    <th data-options="field:'power_symbol',width:280">权限别名</th>
	    <!-- <th data-options="field:'a',formatter:fmt_dg_power,width:180,align:'center'"><a onclick="winPowerList()" href="javascript:void(0)">新增权限</a></th> -->
    </tr>
  </thead>
</table>

<div id="winPowerList" class="easyui-window" title="新增权限" style="width:600px;height:400px"
    data-options="iconCls:'icon-save',modal:true,closed:true">
</div>
<div id="winPowerEdit" class="easyui-window" title="编辑权限" style="width:600px;height:400px"
    data-options="iconCls:'icon-save',modal:true,closed:true">
</div>
<div id="winPowerDel" class="easyui-window" title="删除窗口" style="width:400px;height:200px"
    data-options="iconCls:'icon-save',modal:true,closed:true">
</div>
<script type="text/javascript">
function fmt_dg_power(val,data,index){
	return "<button onclick='winPowerEdit("+data.noid+")'>编辑</button> &nbsp;&nbsp; <button onclick='winPowerDel("+data.noid+")'>删除</button>";
}
function fmt_dg_power_index(val,data,index){
	return index+1;
}

function winPowerList(){
	$("#winPowerList").window("refresh","${basePath}/back/power_add.do");
	$("#winPowerList").window("open");
}
function winPowerEdit(noid){
	$("#winPowerEdit").window("refresh","${basePath}/back/power_edit.do?noid="+noid);
	$("#winPowerEdit").window("open");
}
function winPowerDel(noid){
	$("#winPowerDel").window("refresh","${basePath}/back/power_del.do?noid="+noid);
	$("#winPowerDel").window("open");
}
</script>
</body>
</html>