<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<body>
<div id="noticeTypeTb">
	<div>
	      <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-add" onclick="addNoticeType()" plain="true">添加</a>
	      <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-remove" plain="true" onclick="deleteNoticeType()">删除</a>
    </div>
</div>
<table id="noticeType_tbl" class="easyui-datagrid" style="width:1210px;height:500px"  toolbar="#noticeTypeTb"
	   data-options="url:'${basePath}/back/notice_type_list_json.do',title:'Load Data',iconCls:'icon-save',rownumbers:true,pagination:'true',checkOnSelect:false,pageList:[10,20,30],pageSize:10">
	<thead>
		<tr>
			<th field="noticeTypeCk" checkbox="true"></th>
			<th data-options="field:'typeName',width:200,align:'center',halign:'center'">分类名称</th>
			<th data-options="field:'type_symbol',width:200,align:'center',halign:'center',formatter:format_type_symbol">分类代号</th>
			<th data-options="field:'order_numb',width:200,align:'center',halign:'center',formatter:format_type_orderNumb">顺序号</th>
			<th data-options="field:'operate',width:200,formatter:format_operate,align:'center'">操作列</th>
			<th data-options="field:'noid',width:10,hidden:'true'"></th>
		</tr>
	</thead>
</table>
<div id="winAddNoticeType" class="easyui-window" title="新增公告信息" style="width:500px;height:300px"
    data-options="iconCls:'icon-save',modal:true,closed:true">
</div>
<div id="winUpdateNoticeType" class="easyui-window" title="修改公告信息" style="width:500px;height:300px"
    data-options="iconCls:'icon-save',modal:true,closed:true">
</div>

<script type="text/javascript">

	function format_type_symbol(value,row,index){
		if(row.type_symbol==null||row.type_symbol==""){
    		return "无";
    	}
    	return row.type_symbol;
	}
	
	function format_type_orderNumb(value,row,index){
		if(row.order_numb==null||row.order_numb==""){
    		return "无";
    	}
    	return row.order_numb;
	}
	
	function format_operate(val,data,row){
		return "<button onclick='updateNoticeType("+data.noid+")'>修改</button>&nbsp;&nbsp;<button onclick='deleteNoticeType("+data.noid+")'>删除</button>";
	}
	
    function addNoticeType(){
    	$("#winAddNoticeType").window("refresh","${basePath}/back/notice_type_add.do");
    	$("#winAddNoticeType").window("open");
    }
    
    function updateNoticeType(noid){
    	$("#winUpdateNoticeType").window("refresh","${basePath}/back/notice_type_update.do?noid="+noid);
    	$("#winUpdateNoticeType").window("open");
    }
    
    function deleteNoticeType(noid){
    	var noticeTypeIds=[];
    	var rs;
    	if(typeof(noid)=="undefined"){
    		var noticeTypes = $('#noticeType_tbl').datagrid("getSelections");
    		if(noticeTypes.length!=0){
    			for (var i = 0;i < noticeTypes.length; i++) {
    				var noticeTypeId=noticeTypes[i].noid;
    				noticeTypeIds.push(noticeTypeId);
				}
    			rs = confirm("确认删除选中的公告分类信息？");
    			if(!rs){
    				return;
    			}
    		}else{
    			alert("未选中任何数据！");
        		return ;
    		}
    	}else{
	    	rs = confirm("确认删除此公告分类信息？");
	    	if(!rs){
				return;
			}
	    	noticeTypeIds.push(noid);
    	}
    	$.ajax({  
    	    url: "${basePath}/back/notice_type_delete.do",  
    	    data:{"noticeTypes":noticeTypeIds},  
    	    dataType: "json",  
    	    type: "POST",  
    	    traditional: true,  
    	    success: function (data) {  
    	    	if(data){
       				alert("删除成功！");
       				$('#noticeType_tbl').datagrid('load');
       			}else{
       				alert("删除失败！")
       			} 
    	    }  
    	});  
    }
	
</script>

</body>
</html>