<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<body>
	<table id="dg_user_use_detail_list" class="easyui-datagrid" 
   data-options="singleSelect:true,url:'${basePath}/back/get_use_detail_list.do?user_id=${user_id }&api_id=${api_id }&api_id=${random }',method:'post'
     ,pagination:true" >
  <thead>
    <tr>
	    <th data-options="field:'n',formatter:fmt_dg_use_detail_index,width:40">编号</th>
	    <th data-options="field:'user_code',width:90">调用人账号</th>
	    <th data-options="field:'api_name',width:80">调用人接口</th>
	    <th data-options="field:'use_times',formatter:fmt_dg_use_detail_time,width:150">调用时间</th>
	    <th data-options="field:'use_ip',width:100">调用人ip</th>
	    <th data-options="field:'use_url',width:300">调用人url</th>
	    <th data-options="field:'params',width:150">调用的参数</th>
    </tr>
  </thead>
</table>
<script type="text/javascript">

//时间的转换
function fmt_dg_use_detail_time(val,data,index){
	var use_time_1=data.use_time;
	var use_time=chGMT(use_time_1);
	return use_time;
}
                         
function fmt_dg_use_detail_index(val,data,index){
	return index+1;
}


/**
 * 格林威治时间转换为定义的时间
 */
Date.prototype.format = function(format)  
{  
    var o = {  
            "M+" : this.getMonth()+1, //month  
            "d+" : this.getDate(), //day  
            "h+" : this.getHours(), //hour  
            "m+" : this.getMinutes(), //minute  
            "s+" : this.getSeconds(), //second  
            "q+" : Math.floor((this.getMonth()+3)/3), //quarter  
            "S" : this.getMilliseconds() //millisecond  
        }  
    if(/(y+)/.test(format))  
    format=format.replace(RegExp.$1,(this.getFullYear()+"").substr(4 - RegExp.$1.length));  
    for(var k in o)  
    if(new RegExp("("+ k +")").test(format))  
    format = format.replace(RegExp.$1,RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));  
    return format;  
}  
function chGMT(gmtDate){  
    var mydate = new Date(gmtDate);  
    mydate.setHours(mydate.getHours() + 8);  
    return mydate.format("yyyy-MM-dd hh:mm:ss");  
}
</script>
</body>
</html>