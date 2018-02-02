<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
	<title>广告数据表</title>
	<link rel="stylesheet" type="text/css" href="${basePath }/back_source/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${basePath }/back_source/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${basePath }/back_source/easyui/demo/demo.css">
	<script type="text/javascript" src="${basePath }/back_source/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${basePath }/back_source/easyui/jquery.easyui.min.js"></script>
</head>
<body>
	<h2 style="text-indent:20px;font-size:26px;">广告信息</h2>
	<p></p>
	<div style="margin:20px 0;"></div>
	
	<table id="dg_pub_list" class="easyui-datagrid" title="数据表" style="width:1200px;height:500px;"
			data-options="singleSelect:true,collapsible:true,url:'${basePath }/back/getAll_pub.do',method:'post'">
		<thead>
			<tr>
				<th data-options="field:'noid',formatter:fmt_pub_index,width:50,align:'center'">编号</th>
				<th data-options="field:'title',width:100,align:'center'">广告标题</th>
				<th data-options="field:'content',width:500,align:'center'">内容</th>
				<th data-options="field:'type_id',width:100,align:'center',formatter:fmt_type">所属分类</th>
				<th data-options="field:'pic_url',width:300,align:'center',formatter:fmt_picurl">图片链接</th>
				<th data-options="field:'link_url',width:300,align:'center',formatter:fmt_puburl">广告链接</th>
				<th data-options="field:'order_numb',width:50,align:'center'">顺序号</th>
				<th data-options="field:'create_time',width:240,align:'center'">发布时间</th>
				<th data-options="field:'state',width:80,align:'center',formatter:fmt_pubstatus">状态</th>
				<th data-options="field:'click',width:80,align:'center'">点击量</th>
				<th data-options="field:'a',formatter:fmt_pub,width:180,align:'center'"><a onclick="winPubList()" href="javascript:void(0)">新增广告</a></th>
			</tr>
		</thead>
		<%-- <tbody>
			<c:forEach items="${pubList }" var="pub">
			<tr>
			   <td>${pub.noid}</td>
			   <td>${pub.title}</td>
			   <td>${pub.content}</td>
			   <td>
			   <c:if test="${pub.type_id=='1'}">家电</c:if>
			   <c:if test="${pub.type_id=='2'}">服饰</c:if>
			   <c:if test="${pub.type_id=='3'}">汽车</c:if>
			   <c:if test="${pub.type_id=='4'}">家居</c:if>
			   </td>
			   <td><img src="${pub.pic_url}" style="width=64px;height:80px;"/></td>
			   <td>${pub.link_url}</td>
			   <td>${pub.order_numb}</td>
			   <td>${pub.create_time}</td>
			   <td>
			   	  <c:if test="${pub.state=='1'}">生效</c:if>
			   	  <c:if test="${pub.state=='2'}">禁用</c:if>
			   </td>
			   <td>${pub.click}</td>
			   <td></td>
			</tr>
			</c:forEach>
		</tbody> --%>
	</table>
	
	<div style="margin:20px 0;"></div>
	<div class="easyui-panel">
		<div class="easyui-pagination" data-options="total:114"></div>
	</div>
	<div id="winPubList" class="easyui-window" title="新增广告" style="width:410px;height:380px"
    data-options="iconCls:'icon-save',modal:true,closed:true">
	</div>
	<div id="winPubUpdate" class="easyui-window" title="修改广告" style="width:600px;height:400px"
	    data-options="iconCls:'icon-save',modal:true,closed:true">
	</div>
	<div id="winPubDel" class="easyui-window" title="删除广告" style="width:400px;height:200px"
	    data-options="iconCls:'icon-save',modal:true,closed:true">
	</div>
<script type="text/javascript">
function fmt_pub(val,data,index){
	return "<button onclick='winPubUpdate("+data.noid+")'>修改</button> &nbsp;&nbsp; <button onclick='winPubDel("+data.noid+")'>删除</button>";
}
function fmt_pub_index(val,data,index){
	return index+1;
}
function fmt_type(val,data,index){
	if(data.type_id=="1"){
		return "家电";
	}
	if(data.type_id=="2"){
		return "服饰";
	}
	if(data.type_id=="3"){
		return "汽车";
	}
	if(data.type_id=="4"){
		return "家居";
	}
}
function fmt_picurl(val,data,index){
	if(data.pic_url==null||data.pic_url==""){
		return "暂无实物图";
	}
	return "<img src='"+data.pic_url+"' style='width=64px;height:80px;'/>";
}
function fmt_puburl(val,data,index){
	if(data.link_url==null||data.link_url==""){
		return "暂无链接";
	}
	return data.link_url;
}
function fmt_pubstatus(val,data,index){
	if(data.state=="1"){
		return "可用";
	}
	if(data.state=="2"){
		return "禁用";
	}
}

function winPubList(){
	$("#winPubList").window("refresh","${basePath}/back/pubAddPrompt.do");
	$("#winPubList").window("open");
}
function winPubUpdate(noid){
	$("#winPubUpdate").window("refresh","${basePath}/back/pubUpdatePrompt.do?noid="+noid);
	$("#winPubUpdate").window("open");
}
function winPubDel(noid){
	$("#winPubDel").window("refresh","${basePath}/back/pubDelPrompt.do?noid="+noid);
	$("#winPubDel").window("open");
}
</script>
</body>
</html>




