package com.wskj.app.controller.back;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.wskj.app.service.back.CountService;
/**
 * 统计情况类
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value="/back",produces="text/html;charset=utf-8")
public class CountController {
	
	@Autowired
	private CountService countService;
	
	/**
	 * 进入统计页面
	 * @return
	 */
	@RequestMapping("/count_list.do")
	public String count_list(){
		return "/back/count/count_list";
	}
	
	
	@RequestMapping("/count.do")
	@ResponseBody
	public String getCnt(){
		List<Map<String,Object>> cnt=countService.getCnt();
		Gson gs=new Gson();
		return gs.toJson(cnt);
	}
}
