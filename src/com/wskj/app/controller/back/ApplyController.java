package com.wskj.app.controller.back;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.wskj.app.service.back.ApplyService;
/**
 * 申请情况管理类
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/back")
public class ApplyController {
	
	@Autowired
	private ApplyService applyService;

	/**
	 * 进入统计（合计）的申请列表
	 * @return
	 */
	@RequestMapping("/count_apply_list.do")
	public String count_apply_list(){
		//获得所有的购买的列表
		return "/back/apply/count_apply_list"; 
	}

	/**
	 * AJAX获得统计（合计）的申请列表
	 * @return
	 */
	@RequestMapping(value="/get_count_apply_list.do",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String get_count_apply_list(Integer page,Integer rows){
		//获得所有的购买的列表
		List<Map> allapp = applyService.getCountAppleList();
		
		Gson gson=new Gson();
		String jsonStr = gson.toJson(allapp);
		return jsonStr; 
	}
	
	
	
	/**
	 * 进入申请详细
	 * @return
	 */
	@RequestMapping("/apply_detail_list.do")
	public String apply_list(Integer user_id,Integer api_id,Model mo){
		//获得所有的购买的列表
		mo.addAttribute("user_id", user_id);
		mo.addAttribute("api_id", api_id);
		return "/back/apply/apply_detail_list"; 
	}
	
	/**
	 * 进入调用详细页面
	 * @return
	 */
	@RequestMapping("/use_detail_list.do")
	public String use_detail_list(Integer user_id,Integer api_id,Model mo){
		//获得所有的购买的列表
		mo.addAttribute("user_id", user_id);
		mo.addAttribute("api_id", api_id);
		return "/back/apply/use_detail_list"; 
	}
	
	
	/**
	 * AJAX获得已购买信息列表 get_use_detail_list
	 * @return
	 */
	@RequestMapping(value="/get_apply_detail_list.do",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String get_apply_list(Integer user_id,Integer api_id){
		//获得所有的购买的列表
		List<Map> allapp = applyService.getAppleDetailList(user_id,api_id);
		
		Gson gson=new Gson();
		String jsonStr = gson.toJson(allapp);
		return jsonStr; 
	}
	
	/**
	 * AJAX获得已调用信息列表 
	 * @return
	 */
	@RequestMapping(value="/get_use_detail_list.do",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String get_use_detail_list(Integer page,Integer rows,Integer user_id,Integer api_id){
		//获得所有的购买的列表
		Integer pageStart=0;
		if(page==1){
			pageStart=0;
		   }else{
			pageStart=(page-1)*rows;
		   }
		
		List<Map> allapp = applyService.getUseDetailList(user_id,api_id,pageStart,rows);
		
		//获得总条数
		Map ma = applyService.getAppleDetailTotal(user_id,api_id);
		Map m=new HashMap<>();
		m.put("rows",allapp);
		m.put("total", ma.get("total"));
		Gson gson=new Gson();
		String jsonStr = gson.toJson(m);
		return jsonStr; 
	}
	
}
