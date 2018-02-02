<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<body>
	<table id="dg_count_apply_list" class="easyui-datagrid" 
   data-options="singleSelect:true,url:'${basePath}/back/get_count_apply_list.do',method:'post'
     ,pagination:true" >
  <thead>
    <tr>
   	    <th hidden="hidden" data-options="field:'user_id',width:40">用户id</th>
	    <th data-options="field:'n',formatter:fmt_dg_count_apply_index,width:40">编号</th>
	    <th data-options="field:'user_code',width:90">申请人账号</th>
	    <th data-options="field:'nick_name',width:90">申请人昵称</th>
	    <th data-options="field:'app_key',width:260">申请人apikey</th>
	    <th data-options="field:'api_name',width:80">申请接口</th>
	    <th data-options="field:'all_apply_money',width:80">总申请费用</th>
	    <th data-options="field:'all_apply_cnt',width:70">申请总次数</th>
	    <th data-options="field:'used_cnt',width:70">已用总次数</th>
	    <th data-options="field:'unused_cnt',width:100">未使用总次数</th>
	    <th data-options="field:'sq',formatter:fmt_dg_count_apply_detail,width:90,align:'center'">申请明细</th>
	    <th data-options="field:'dy',formatter:fmt_dg_count_use_detail,width:90,align:'center'">调用明细</th>
    </tr>
  </thead>
</table>
<script type="text/javascript">
function fmt_dg_count_apply_detail(val,data,index){
	return "<button onclick='openApplyDetail(\""+data.user_code+"\",\""+data.user_id+"\",\""+data.api_id+"\")'>申请明细</button>";
}
function fmt_dg_count_use_detail(val,data,index){
	return "<button onclick='openUseDetail(\""+data.user_code+"\",\""+data.user_id+"\",\""+data.api_id+"\")'>调用明细</button>";
}
function fmt_dg_count_apply_index(val,data,index){
	return index+1;
}
//时间的转换
function fmt_dg_apply_time(val,data,index){
	var apply_time_1=data.apply_time;
	var apply_time=chGMT(apply_time_1);
	return apply_time;
}
  
/**
 * 打开申请详细列表 
 */
 function openApplyDetail(title,user_id,api_id) {
		// 首先判断是否存在要增加的tab项，如果存在就只显示，否则add
		var ti="的申请明细"
		var title=title+ti;
		if ($("#mytabs").tabs("exists", title)) {
			$("#mytabs").tabs("select", title)
		} else {
			$("#close").remove();
			$("#mytabs").tabs("add", {
				'title' : title,
				'href' : "${basePath }/back/apply_detail_list.do?user_id="+user_id+"&api_id="+api_id,
				'closable' : true               
			});
			//获取最后一个tabs 在新加的选项卡后面添加"关闭全部"
			var li = $(".tabs-wrap ul li:last-child");
			li.after("<li id='close'><a class='tabs-inner' href='javascript:void()' onClick='javascript:closeAll()'>关闭全部</a></li>");
		}
	}


/**
 * 打开调用（使用）详细列表 
 */
 function openUseDetail(title,user_id,api_id) {
		// 首先判断是否存在要增加的tab项，如果存在就只显示，否则add
		var ti="的调用详情"
		var title=title+ti;
		if ($("#mytabs").tabs("exists", title)) {
			$("#mytabs").tabs("select", title)
		} else {
			$("#mytabs").tabs("add", {
				'title' : title,
				'href' : "${basePath }/back/use_detail_list.do?user_id="+user_id+"&api_id="+api_id,
				'closable' : true               
			});
			
			//获取最后一个tabs 在新加的选项卡后面添加"关闭全部"
			$("#close").remove();
			var li = $(".tabs-wrap ul li:last-child");
			li.after("<li id='close'><a class='tabs-inner' href='javascript:void()' onClick='javascript:closeAll()'>关闭全部</a></li>");
			
		}
	}

</script>
</body>
</html>