package com.wskj.app.controller.back;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wskj.app.service.back.CountService;

@Controller
@RequestMapping("/back")
public class BackController {
	
	@Autowired
	private CountService cntService;
	/**
	 * 进入首页
	 * @return
	 */
	@RequestMapping("/index.do")
	public String index(){
		
		return "/back/index/index";
	}
	
	/**
	 * 进入EasyUi首页
	 * @return
	 */
	@RequestMapping("/easyui_index.do")
	public String easyui_index(Model m){
		List<Map<String,Object>> cnt=cntService.getMoney();
		m.addAttribute("cnt", cnt);
		return "back/index/easyui_index";
	}
	
	@RequestMapping("do_index.do")
	public String do_index(){
		return "/back/index/do_index";
	}
}
