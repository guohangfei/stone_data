package com.wskj.app.listener;

import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.XmlWebApplicationContext;

import com.wskj.app.service.UserService;

/**
 * Application监听器，负责项目的坚挺，处理项目根路径
 * @author 
 *
 */
@Component
public class AppListener implements ApplicationListener<ContextRefreshedEvent> {

	@Override
	public void onApplicationEvent(ContextRefreshedEvent arg0) {
		if (arg0.getApplicationContext().getParent() != null) {
			String path = arg0.getApplicationContext().getApplicationName();
			XmlWebApplicationContext sc = (XmlWebApplicationContext) arg0.getApplicationContext().getParent();
			sc.getServletContext().setAttribute("basePath", path);
		}
	}
}
