<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<body>
<div style="padding:10px 60px 20px 60px">
	    <form id="notice_update" class="easyui-form" action="${basePath}/back/notice_update.do" method="post" enctype="multipart/form-data" data-options="novalidate:false">
	    	<c:forEach items="${notices}" var="notice">
	    	<input type="hidden" name="noid" value="${notice.noid}">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>标题:</td>
	    			<td><input id="title" name="title"  class="easyui-validatebox" type="text" id="title"  data-options="required:true" missingMessage="请输入公告标题" value="${notice.title}"/></td>
	    			<td id="pcode"></td>
	    		</tr>
	    		<tr>
	    			<td>代号:</td>
	    			<td><input type="text" class="easyui-numberbox" value="${notice.symbol}" data-options="min:0,max:10000" name="symbol"></td>
	    			<td id="ppwd"></td>
	    		</tr>
	    		<tr>
	    			<td>分类:</td>
	    			<td>
	    			<select name="typeId">
	    				<option value="">请选择</option>
		    			<c:forEach items="${noticeTypes}" var="noticeType">
		    				<option value="${noticeType.noid}" <c:if test="${notice.typeId==noticeType.noid}">selected="selected"</c:if> >${noticeType.typeName}</option>
		    			</c:forEach>
	    			</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>图片:</td>
	    			
	    			<td><c:if test="${notice.picUrl!='-1'}"><img src="${basePath}/${notice.picUrl}" width="200px" height="100px"></c:if>
	    				<br/><br/>
	    				<input type="file" name="picture" />
	    				<c:if test="${notice.picUrl!='-1'}"><button onclick="delectNoticePicture()" name="pictureDel"  value="0">删除图片</button></c:if>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>顺序号：</td>
	    			<td><input type="text" class="easyui-numberbox" value="${notice.orderNumb}" data-options="min:0,max:10000" name="orderNumb"></td>
	    		</tr>
	    		<tr>
	    			<td>发布时间：</td>
	    			<td><input id="begin" type="text" class="easyui-datebox" editable="true" name="createTime" value="${notice.createTime}" ></td>
	    		</tr>
	    		<tr>
	    			<td>状态:</td>
	    			<td>
	    				<select name="state">
	    				<option value="" <c:if test="${notice.state==null}">selected="selected"</c:if>>请选择</option>
		    			<option value="2" <c:if test="${notice.state==2}">selected="selected"</c:if>>禁用</option>
		    			<option value="1" <c:if test="${notice.state==1}">selected="selected"</c:if>>可用</option>
	    			</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>内容:</td>
	    			<td><textarea cols="50" rows="10 name="content">${notice.content}</textarea></td>
	    		</tr>
	    	</table>
	    	</c:forEach>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"  onclick="submitUpdateNotice()">修改</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"  onclick="clearUpdateNotice()">取消</a>
	    </div>
	    </div>
   

<script type="text/javascript">

function submitUpdateNotice(){
	$("#notice_update").form('submit',{
		success:function(data){
			if(data=='true'){
				alert("公告信息修改成功！");
				$("#winUpdateNotice").window("close");	
			}else{
				alert("修改失败请重试");
			}
			$("#winUpdateNotice").window("close");	
			$("#notice_tbl").datagrid("reload");
		}
	});
}

function clearUpdateNotice(){
	$("#winUpdateNotice").window("close");
}

function delectNoticePicture(noid) {
	var rs = confirm("确认删除相片?");
	if(!rs){
		return;
	}
	$("button").val("1");
	$("img").hide();
}

</script>
</body>
</html>