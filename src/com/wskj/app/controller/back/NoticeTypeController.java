package com.wskj.app.controller.back;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.wskj.app.service.NoticeTypeService;

/**
 * 公告分类信息Controller
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/back")
public class NoticeTypeController {

	@Autowired
	private NoticeTypeService noticeTypeService;
	
	
	/**
	 * 公告分类信息页面
	 * 
	 * @return
	 */
	@RequestMapping("/notice_type_list.do")
	public String listByNoticeType(){
		return "back/notice_type/list";
	}
	
	
	/**
	 * 查询全部公告分类信息
	 * 
	 * @param page
	 * @param rows
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value="/notice_type_list_json.do",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String listByNoticeType(Integer page,Integer rows) throws ParseException{
		List<Map<String,Object>> noticeTypes = noticeTypeService.listByNoticeType();
		Gson gson = new Gson();
		String noticeTypeJson = gson.toJson(noticeTypes);
		return noticeTypeJson;
	}
	
	
	/**
	 * 添加公告分类信息页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/notice_type_add.do",method=RequestMethod.GET)
	public String addNoticeType(Model model){
		return "back/notice_type/add";
	}
	
	
	/**
	 * 添加公告分类信息
	 * 
	 * @param typeName
	 * @param typeSymbol
	 * @param typeOrderNumb
	 * @return
	 * @throws Exception
	 * @throws IOException
	 */
	@RequestMapping(value="/notice_type_add.do",method=RequestMethod.POST)
	@ResponseBody
	public String addNoticeType(String typeName,Integer typeSymbol,Integer typeOrderNumb) throws Exception, IOException{
		int noticeTypeId = noticeTypeService.addNoticeType(typeName,typeSymbol,typeOrderNumb);
		if(noticeTypeId!=1){
			return "false";
		}
		return "true";
	}
	
	
	/**
	 * 修改公告分类信息页面
	 * 
	 * @param model
	 * @param noid
	 * @return
	 */
	@RequestMapping(value="/notice_type_update.do",method=RequestMethod.GET)
	public String updateNoticeType(Model model,Integer noid){
		List<Map<String,Object>> noticeTypes = noticeTypeService.getNoticeTypeByNoid(noid);
		model.addAttribute("noticeTypes", noticeTypes);
		return "back/notice_type/update";
	}
	
	
	/**
	 * 修改公告分类信息
	 * 
	 * @param noid
	 * @param typeName
	 * @param typeSymbol
	 * @param typeOrderNumb
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value="/notice_type_update.do",method=RequestMethod.POST)
	@ResponseBody
	public boolean updateNoticeType(Integer noid,String typeName,Integer typeSymbol,Integer typeOrderNumb) throws IllegalStateException, IOException{
		int noticeTypeiD = noticeTypeService.updateNoticeType(typeName,typeSymbol,typeOrderNumb,noid);
		if(noticeTypeiD!=1){
			return false;
		}
		return true;
	}
	
	
	/**
	 * 删除公告分类信息
	 * 
	 * @param noticeTypes
	 * @return
	 */
	@RequestMapping("/notice_type_delete.do")
	@ResponseBody
	public boolean deleteNoticeType(String[] noticeTypes){
		for (String noids : noticeTypes) {
			int noid = noticeTypeService.deleteNoticeTypeById(Integer.parseInt(noids));
			if(noid!=1){
				return false;
			}
		}
		return true;
	}
	
}
