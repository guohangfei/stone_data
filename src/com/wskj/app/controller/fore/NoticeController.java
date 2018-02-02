package com.wskj.app.controller.fore;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wskj.app.service.NoticeService;
import com.wskj.app.vo.PageInfo;

/**
 * 公告信息的controller层
 * 
 * @author Administrator
 * 
 * 
 * 
 * 
 *
 */
@Controller("foreNoticeController")
@RequestMapping("fore/notice/")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	/**
	 * 公告列表页面(首页)
	 * @return
	 */
	@RequestMapping(value="list.do",method=RequestMethod.GET)
	public String noticeList(Model model,@RequestParam (required=false,defaultValue="1")Integer currPage){
		PageInfo<Map<String,Object>> notices =noticeService.listByNotice(currPage);
		model.addAttribute("notices", notices);
		return "/fore/notice/list";
	}
	
	/**
	 * 指定详细公告信息页面，并增加点击量
	 * @return
	 */
	@RequestMapping("details.do")
	public String noticeDetails(Integer noid,Model model){
		//增加其点击量的方法
		noticeService.addNoticeClick(noid);
		//查询其详细信息的方法
		List<Map<String,Object>> list = noticeService.getNoticeByNoid(noid);
		PageInfo<Map<String,Object>> notices =noticeService.listByNotice(null);
		model.addAttribute("notices", notices);
		model.addAttribute("noticeslist", list);
		return "/fore/notice/details";
	}
	
}
