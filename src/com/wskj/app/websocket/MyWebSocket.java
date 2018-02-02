package com.wskj.app.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import javax.ws.rs.core.Request;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.mysql.fabric.xmlrpc.base.Array;

@ServerEndpoint(value="/ws/{user}")
public class MyWebSocket {
	
	private static List<String> uuid = new ArrayList<>();
	private static Map<String,MyWebSocket> mp = new HashMap<>();
	private Session session;
	private String uid;
	private String nickName;
	private static String kufu1="0";
	private static String kufu2="0";
	
	@OnOpen
	public void onOpen(@PathParam("user")String user,Session session){
		this.session = session;
		
		//客服1进入
		if(user.equals("servicer1")){
			uuid.add("servicer1");
			mp.put("servicer1", this);
			kufu1="1";
			System.out.println("kefu1链接成功");
		}
		
		//客服2进入
		if(user.equals("servicer2")){
			uuid.add("servicer2");
			mp.put("servicer2", this);
			kufu2="1";
			System.out.println("kefu2链接成功");
		}
		
		//游客进入
		if(!user.equals("servicer1")&&!user.equals("servicer2")){
			uid=UUID.randomUUID().toString().replaceAll("-", "");
			uuid.add(uid);
			mp.put(uid, this);
			nickName="游客"+uid;
			System.out.println("游客链接成功");
		}
	}
	
	@OnMessage
	public void onMessage(String msg,Session session,@PathParam("user")String user) throws IOException{
		
		//客服1发消息给用户
		if(user.equals("servicer1")){
			String[] msgs = msg.split("%");
		    uid=msgs[1];
			mp.get(uid).session.getBasicRemote().sendText(msg);
			return;
		}
		
		//客服2发消息给用户
		if(user.equals("servicer2")){
			String[] msgs = msg.split("%");
		    uid=msgs[1];
			mp.get(uid).session.getBasicRemote().sendText(msg);
			return;
		}
		
		
		//用户发消息给管理员
		if(!kufu1.equals("0")||!kufu1.equals("0")&&!user.equals("servicer1")&&!user.equals("servicer2")){
			if(!msg.equals("get_nickname")){
				
				//都在线随机发送给一个客服
				if(kufu1.equals("1")&&kufu2.equals("1")){
					
					//
					if(msg.indexOf("%")>0){
						String[] msgs = msg.split("%");
						String serv=msgs[0];
						mp.get(serv).session.getBasicRemote().sendText(serv+"%"+uid+"%"+msgs[2]);
						return;
					}
					String[] str = { "servicer1", "servicer2" };
					int random = (int) ( Math.random () * 2 );
					String servicer=str[random];
					mp.get(servicer).session.getBasicRemote().sendText(servicer+"%"+uid+"%"+msg);
				}
				
				//客服1在线则发送给客服1
				if(kufu1.equals("1")&&kufu2.equals("0")){
					mp.get("servicer1").session.getBasicRemote().sendText("servicer1"+"%"+uid+"%"+msg);
				}
				
				//客服2在线则发送给客服2
				if(kufu1.equals("0")&&kufu2.equals("1")){
					mp.get("servicer2").session.getBasicRemote().sendText("servicer2"+"%"+uid+"%"+msg);
				}
				
			}
		}
		
		// 接到获取昵称的命令
		if(msg.equals("get_nickname")){
			Map ma=new HashMap<>();
			ma.put("nickName", nickName);
			ma.put("servicer1", kufu1);
			ma.put("servicer2", kufu2);
			Gson gs=new Gson();
			String m = gs.toJson(ma);
			this.session.getBasicRemote().sendText(m);
		}
	}
	
	@OnClose
	public void onClose(){
		kufu1="0";
		kufu2="0";
		System.out.println("链接已关闭");
	}
	
	@OnError
	public void onError( Throwable t){
		System.out.println("出现异常");
		t.printStackTrace();
	}
	
}
