package com.wskj.app.controller.fore;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wskj.app.service.PublicityService;
import com.wskj.app.vo.PageInfo;

/**
 * 广告信息的controller层
 * 
 * @author Administrator
 *
 */
@Controller("forePublicityController")
@RequestMapping("/fore/publicity/")
public class PublicityController {
	
	@Autowired
	private PublicityService publicityService;
	
	/**
	 * 广告列表页面(首页)
	 * @return
	 */
	@RequestMapping(value="list.do",method=RequestMethod.GET)
	public String publicityList(Model model,@RequestParam (required=false,defaultValue="1")Integer currPage){
		PageInfo<Map<String,Object>> publicities =publicityService.listByPublicity(currPage);
		model.addAttribute("publicities", publicities);
		return "/fore/publicity/list";
	}
	
	/**
	 * 指定广告详细信息页面
	 * @return
	 */
	@RequestMapping("details.do")
	public String publicityDetails(Integer noid,Model model){
		//增加其点击量的方法
		publicityService.addPublicityClick(noid);
		//查询其详细信息的方法
		List<Map<String,Object>> list = publicityService.getPublicityeByNoid(noid);
		PageInfo<Map<String,Object>> publicities =publicityService.listByPublicity(null);
		model.addAttribute("publicities", publicities);
		model.addAttribute("publicitylist", list);
		return "/fore/publicity/details";
	}
	
}
