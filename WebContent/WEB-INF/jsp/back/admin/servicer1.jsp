<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>客服1</title>
		<script type="text/javascript" src="${basePath }/fore_source/js/jquery-1.6.min.js"></script>
	</head>
	<link
		href="${basePath }/fore_source/css/style.css"
		rel="stylesheet" type="text/css">
  <body>
  客服1
  	
  	<div class="chatbox">
  <div class="chat_top fn-clear">
    <div class="logo"><img src="${basePath }/fore_source/image/footlogo.png" width="190" height="60"  alt=""/></div>
    <div class="uinfo fn-clear">
      <div class="uface"><img src="${basePath }/fore_source/image/footlogo.png" width="40" height="40"  alt=""/></div>
      <div class="uname">
     
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
        <li class="fn-clear selected"><em>所有用户</em></li>
        <li class="fn-clear" data-id="1"><span><img src="${basePath }/fore_source/image/footlogo.png" width="30" height="30"  alt=""/></span><em>用户1</em><small class="online" title="在线"></small></li>
      </ul>
    </div>
  </div>
</div>
<script type="text/javascript">
var socket=null;
		//新建websocket链接
		var socket =new WebSocket("ws://"+ window.location.host+"/${pageContext.request.contextPath}/ws/servicer1");
		var id = null;
		var servicer=null;
		
		socket.onopen=function(){
			 $("#message_box").append("顽石数据：链接成功！<br/>");
		}
		
		//发送信息
		 $("#sendButton").click(function() {
        	 socket.send(servicer+"%"+id+"%"+$("#msg").val());
			 $("#message_box").append("客服1"+"："+$("#msg").val()+"<br/>");
			 $("#msg").val(''); 
   		 })
   	
   		//接收到服务器消息后调用
		socket.onmessage = function(msg) {
			 var neirong = msg.data.split('%');
			 servicer=neirong[0];
   			 id = neirong[1];
   			 $("#message_box").append("游客"+id+"："+neirong[2]+"<br/>");
		};

		//关闭连接的时候调用
		socket.onclose = function() {
			alert("close");
		}
	
		//出错时调用
		socket.onerror = function() {
			alert("error");
		};

</script>
  </body>
</html>
