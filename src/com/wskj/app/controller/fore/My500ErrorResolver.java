package com.wskj.app.controller.fore;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
@Component
public class My500ErrorResolver implements HandlerExceptionResolver {
	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		// TODO Auto-generated method stub
		ex.printStackTrace();
		ModelAndView modelAndView = new ModelAndView();  
        modelAndView.setViewName("/alert/err500");  
        return modelAndView;  
	}
}
