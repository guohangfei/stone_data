<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>石头数据后台管理页面</title>
</head>
<body>
		<table id="dg_admin_list" class="easyui-datagrid" 
   data-options="singleSelect:true,url:'${basePath}/back/get_all_admin_list.do',method:'post'
     ,pagination:true" >
  <thead>
    <tr>
	    <th data-options="field:'noid',formatter:fmt_dg_admin_index,width:80">编号</th>
	    <th data-options="field:'admin_code',width:180">管理员账号</th>
	    <th data-options="field:'admin_pwd',width:180">管理员密码</th>
	    <th data-options="field:'power_name',width:180">管理员权限</th>
	    <th data-options="field:'a',formatter:fmt_dg_admin,width:180,align:'center'"><a onclick="winAdminAdd()" href="javascript:void(0)">新增管理员</a></th>
    </tr>
  </thead>
</table>
<div id="winAdminAdd" class="easyui-window" title="新增管理员" style="width:600px;height:400px"
    data-options="iconCls:'icon-save',modal:true,closed:true">
</div>
<div id="winAdminEdit" class="easyui-window" title="编辑管理员" style="width:600px;height:400px"
    data-options="iconCls:'icon-save',modal:true,closed:true">
</div>
<div id="winAdminDel" class="easyui-window" title="删除管理员" style="width:400px;height:200px"
    data-options="iconCls:'icon-save',modal:true,closed:true">
</div>
<script type="text/javascript">
function fmt_dg_admin(val,data,index){
	return "<button onclick='winAdminEdit("+data.noid+")'>编辑</button> &nbsp;&nbsp; <button onclick='winAdminDel("+data.noid+")'>删除</button>";
}
function fmt_dg_admin_index(val,data,index){
	return index+1;
}

function winAdminAdd(){
	$("#winAdminAdd").window("refresh","${basePath}/back/admin_add.do");
	$("#winAdminAdd").window("open");
}
function winAdminEdit(noid){
	$("#winAdminEdit").window("refresh","${basePath}/back/admin_edit.do?noid="+noid);
	$("#winAdminEdit").window("open");
}
function winAdminDel(noid){
	$("#winAdminDel").window("refresh","${basePath}/back/admin_del.do?noid="+noid);
	$("#winAdminDel").window("open");
}
</script>
</body>
</html>