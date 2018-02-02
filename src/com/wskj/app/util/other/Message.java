package com.wskj.app.util.other;

import javax.jws.WebService;

/**
 * 模拟短信发送
 * @author Administrator
 *
 */
@WebService(targetNamespace="com.wskj.message.webservice.Message")
public interface Message {
	
	String getMessageByPhone(String phone);
}
