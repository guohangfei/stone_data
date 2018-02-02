<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<body>
<div id="noticeTb">
	<div>
	      <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-add" onclick="addNotice()" plain="true">添加</a>
	      <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-remove" plain="true" onclick="deleteNotice()">删除</a>
    </div>
	<div style="padding:3px;width: 1200px;" >
		<span>公告标题:</span>
		<input id="title" style="line-height:26px;border:1px solid #ccc" name="title" value="${param.title}">
		<span>发布时间:</span><input id="begin" type="text" class="easyui-datebox" name="beginDate" value="${param.beginDate}" >&nbsp;－&nbsp;
		<input id="end" type="text" class="easyui-datebox" name="endDate" value="${param.endDate}">
		<span>公告分类：</span>
		<select id="typeId" class="easyui-combobox" name="typeId" style="width:200px;">
			<option  value="">请选择</option>
			<c:forEach items="${noticeTypes}" var="noticeType">
	        	<option value="${noticeType.noid}" <c:if test="${noticeType.noid==param.noid}">selected="selected"</c:if> >${noticeType.typeName}</option>
	   	 	</c:forEach>
	    </select>
		<a href="#" class="easyui-linkbutton" plain="true" onclick="searchNotice()">搜索</a>
	</div>
</div>
<table id="notice_tbl" class="easyui-datagrid" style="width:1210px;height:655px"  toolbar="#noticeTb"
	   data-options="url:'${basePath}/back/notice_list_json.do',title:'Load Data',iconCls:'icon-save',pagination:'true',rownumbers:true,checkOnSelect:false,pageList:[5,15,25],pageSize:5">
	<thead>
		<tr>
			<th field="noticeCk" checkbox="true"></th>
			<th data-options="field:'title',width:120,align:'center',halign:'center',formatter:format_title">公告标题</th>
			<th data-options="field:'typeName',width:80,align:'center',halign:'center',formatter:format_type">所属分类</th>
			<th data-options="field:'symbol',width:80,align:'center',halign:'center',formatter:format_symbol">公告代号</th>
			<th data-options="field:'picUrl',width:150,formatter:format_picture,align:'center',halign:'center'">公告图片</th>
			<th data-options="field:'orderNumb',width:80,align:'center',halign:'center',formatter:format_orderNumb">顺序号</th>
			<th data-options="field:'createTime',width:150,align:'center',halign:'center',formatter:format_createTime">发布时间</th>
			<th data-options="field:'click',width:60,align:'center',halign:'center',formatter:format_click">点击量</th>
			<th data-options="field:'state',width:110,formatter:format_state,align:'center',halign:'center'">状态（生效/禁用）</th>
			<th data-options="field:'operate',width:120,formatter:format_operate,align:'center'">操作列</th>
			<th data-options="field:'noid',width:10,hidden:'true'"></th>
		</tr>
	</thead>
</table>
<div id="winAddNotice" class="easyui-window" title="新增公告信息" style="width:700px;height:500px"
    data-options="iconCls:'icon-save',modal:true,closed:true">
</div>
<div id="winUpdateNotice" class="easyui-window" title="修改公告信息" style="width:700px;height:650px"
    data-options="iconCls:'icon-save',modal:true,closed:true">
</div>

<script type="text/javascript">

	function searchNotice(){
		$('#notice_tbl').datagrid('load',{
			title: $('#title').val(),
			beginDate: $('#begin').val(),
			endDate: $('#end').val(),
			typeId: $('#typeId').val()
		});
	}
	
	function format_title(value,row,index){
		if(row.title==null||row.title==""){
    		return "无";
    	}
    	return row.title;
	}
	
	function format_type(value,row,index){
		if(row.typeName==null||row.typeName==""){
    		return "无";
    	}
    	return row.typeName;	
	}
	
	function format_symbol(value,row,index){
		if(row.symbol==null||row.symbol==""){
    		return "无";
    	}
    	return row.symbol;
	}
	
	function format_orderNumb(value,row,index){
		if(row.orderNumb==null||row.orderNumb==""){
    		return "无";
    	}
    	return row.orderNumb;
	}
	
	function format_createTime(value,row,index){
		if(row.createTime==null||row.createTime==""){
    		return "无";
    	}
    	return row.createTime;
	}
	

	function format_operate(val,data,row){
		return "<button onclick='updateNotice("+data.noid+")'>修改</button><br/><br/><button onclick='deleteNotice("+data.noid+")'>删除</button>";
	}
	
    function format_state(value, row, index){  
        if(row.state==1){  
            return "生效";  
        }else if(row.state==2){  
            return "禁用";  
        }else{
        	return "无";
        }  
    }  
    
    function format_click(value,row,index){
    	if(row.click==null||row.click==""){
    		return "0";
    	}
    	return row.click;
    }
    
    function format_picture(value, row, index){
		if(row.picUrl==null||row.picUrl==""){
			return "<span style='display:inline-block;height:92px;line-height:92px;vertical-align:middle;'>无相关图片</span>";
		}    	
        return "<img src='"+${basePath}/+row.picUrl+"' width='150px' height='92px'/>"; 
    }  
    
    function addNotice(){
    	$("#winAddNotice").window("refresh","${basePath}/back/notice_add.do");
    	$("#winAddNotice").window("open");
    }
    
    function updateNotice(noid){
    	$("#winUpdateNotice").window("refresh","${basePath}/back/notice_update.do?noid="+noid);
    	$("#winUpdateNotice").window("open");
    }
    
    //删除公告信息执行的函数
    function deleteNotice(noid){
    	//存放公告信息noid的数组
    	var noticeIds=[];
    	//用户是否确认删除
    	var rs;
    	//判断是否删除指定的公告信息
    	if(typeof(noid)=="undefined"){
    		//获得所有的选中的公告信息的noid
    		var notices = $('#notice_tbl').datagrid("getSelections");
    		//是否有选中的公告信息
    		if(notices.length!=0){
    			for (var i = 0;i < notices.length; i++) {
    				var noticeId=notices[i].noid;
    				//存放至公告信息noid的数组
    				noticeIds.push(noticeId);
				}
    			rs = confirm("确认删除选中的公告信息？");
    			if(!rs){
    				//取消删除则结束此函数
    				return;
    			}
    		}else{
    			alert("未选中任何数据！");
        		return ;
    		}
    	}else{
	    	rs = confirm("确认删除此公告信息？");
	    	if(!rs){
				return;
			}
    		//指定公告信息noid放至公告信息noid的数组
	    	noticeIds.push(noid);
    	}
    	//执行删除操作
    	$.ajax({  
    	    url: "${basePath}/back/notice_delete.do",  
    	    data:{"notices":noticeIds},  
    	    dataType: "json",  
    	    type: "POST",  
    	    traditional: true,  
    	    success: function (data) {  
    	    	if(data){
       				alert("删除成功！");
       				$('#notice_tbl').datagrid('load',{
       	    			title: $('#title').val(),
       	    			beginDate: $('#begin').val(),
       	    			endDate: $('#end').val(),
       	    			typeId: $('#typeId').val()
       	    		});
       			}else{
       				alert("删除失败！")
       			} 
    	    }  
    	});  
    }
	
</script>

	
</body>
</html>