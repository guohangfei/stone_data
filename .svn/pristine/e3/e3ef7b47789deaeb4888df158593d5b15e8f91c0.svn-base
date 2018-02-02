package com.wskj.app.interceptor;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.wskj.app.service.UserService;
import com.wskj.app.vo.User;

/**
 * 自动登录拦截器
 * @author Administrator
 *
 */
public class RememberInterceptor implements HandlerInterceptor{
	
	@Autowired
	UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//获得cookie
		Cookie[] cookies = request.getCookies();
		String username = "";
		if(cookies!=null){
			for (Cookie cookie : cookies) {
				//查询是否有匹配账号的cookie
				if("userCode".equals(cookie.getName())){
					username = cookie.getValue();
				}
			}
			if(username.equals("")){
				return true;
			}
			Map<String,Object> maps = userService.checkUser(username);
			//判断是否为自动登录状态
			if(2==(Integer)maps.get("remember")){
				return true;
			}
			//执行登录的方法
			User u = new User();
			u.setNoid((Integer) maps.get("noid"));
			u.setUserCode((String) maps.get("userCode"));
			u.setUserPwd((String) maps.get("userPwd"));
			u.setAppKey((String) maps.get("appKey"));
			if (maps.get("nickName") != null) {
				u.setNickName((String) maps.get("nickName"));
			}
			request.getSession().setAttribute("user", u);
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}
