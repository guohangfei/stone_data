<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>游客</title>
		<script type="text/javascript" src="${basePath }/fore_source/js/jquery-1.6.min.js"></script>
	</head>
	<link
		href="${basePath }/fore_source/css/style.css"
		rel="stylesheet" type="text/css">
  <body>
  	
  	<div class="chatbox">
  <div class="chat_top fn-clear">
    <div class="logo"><img src="${basePath }/fore_source/image/footlogo.png" width="190" height="60"  alt=""/></div>
    <div class="uinfo fn-clear">
      <div class="uface"><img src="${basePath }/fore_source/image/footlogo.png" width="40" height="40"  alt=""/></div>
      <div class="uname">
         <input type="text" id="nickname"><i class="fontico down"></i>
      </div>
    </div>
  </div>
  <div class="chat_message fn-clear">
    <div class="chat_left">
      <div class="message_box" id="message_box">
        <div class="msg_item fn-clear">
          <div class="uface"><img src="images/53f44283a4347.jpg" width="40" height="40"  alt=""/></div>
        </div>
        
      </div>
      <div class="write_box">
        <textarea name="message" class="write_area" id="msg" onkeydown="kdmsg()" placeholder="说点啥吧..."></textarea>
        <input type="hidden" name="fromname" id="fromname" value="河图" />
        <input type="hidden" name="to_uid" id="to_uid" value="0">
        <div class="facebox fn-clear">
          <div class="expression"></div>
         <button id="sendButton">发送消息</button>
         
        </div>
      </div>
    </div>
    <div class="chat_right">
      <ul class="user_list" title="双击用户私聊">
        <li class="fn-clear selected"><em>客服</em></li>
        <li class="fn-clear" data-id="1"><span><img src="${basePath }/fore_source/image/footlogo.png" width="30" height="30"  alt=""/></span><em>客服1</em><small id="servicer1" class=""></small></li>
        <li class="fn-clear" data-id="1"><span><img src="${basePath }/fore_source/image/footlogo.png" width="30" height="30"  alt=""/></span><em>客服2</em><small id="servicer2" class=""></small></li>
      </ul>
    </div>
  </div>
</div>
<script type="text/javascript">

		//新建websocket链接
		var socket =new WebSocket("ws://"+ window.location.host+"/${pageContext.request.contextPath}/ws/user");
		var id = null;
		var nickName=null;
		var servicer1=null;
		var servicer2=null;
		
		
		//启动执行发送获得昵称信息
		$(function(){
			 socket.send("get_nickname");
		})
		
		var start = new Date();
	    while(new Date() - start < 600) { // delay 1 sec
	        ;
	    }
		
		socket.onopen=function(){
			 $("#message_box").append("连接服务器成功<br/>");
		};
		
		 //接收服务器消息后调用
		socket.onmessage = function(msg) {
			 var neirong = msg.data;
			 
			 	//包含%为非首次发送数据
				if(neirong.indexOf('%') > 0 ){
					var neirong = msg.data.split('%');
		   			 id = neirong[1];
					$("#message_box").append("客服"+"："+neirong[2]+"<br/>");
				}else{
					var json = eval('(' + neirong + ')');
					nickName=json.nickName
					servicer1=json.servicer1;
					servicer2=json.servicer2;
					
					if(servicer1==0&&servicer2==0){
						$("#message_box").append("人工客服不在线，请稍后！<br/>");
					 }else{
						$("#message_box").append("顽石数据客服：有什么可以帮助您吗？<br/>");
					 }
					
					//显示在线客服
					if(servicer1==1){
						$("#servicer1").attr("class","online");
					}
					if(servicer2==1){
						$("#servicer2").attr("class","online");
					}
					
					
				}
		};
		
		//发送信息
		 $("#sendButton").click(function() {
        	 socket.send(nickName+"%"+id+"%"+$("#msg").val());
			 $("#message_box").append(nickName+":"+$("#msg").val()+"<br/>");
			 $("#msg").val(''); 
   		 });

		//关闭连接的时候调用
		socket.onclose = function() {
			alert("close");
		};
		//出错时调用
		socket.onerror = function() {
			alert("error");
		};


</script>
  </body>
</html>
