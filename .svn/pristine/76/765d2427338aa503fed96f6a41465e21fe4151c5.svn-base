package com.wskj.app.controller.back;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.wskj.app.service.NoticeService;
import com.wskj.app.service.NoticeTypeService;
import com.wskj.app.vo.PageInfo;

/**
 * 公告分类信息Controller
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/back")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private NoticeTypeService noticeTypeService;
	
	
	/**
	 * 全部公告信息页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/notice_list.do")
	public String listByNotice(Model model){
		List<Map<String,Object>> noticeTypes = noticeTypeService.listByNoticeType();
		model.addAttribute("noticeTypes", noticeTypes);
		return "back/notice/list";
	}
	
	
	/**
	 * 根据条件查询全部公告信息
	 * 
	 * @param page
	 * @param rows
	 * @param title
	 * @param beginDate
	 * @param endDate
	 * @param typeId
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value="/notice_list_json.do",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String listByNotice(Integer page,Integer rows,String title,String beginDate,String endDate,Integer typeId) throws ParseException{
		if(title!=null&&title.trim().length()==0){
			title=null;
		}
		if(beginDate!=null){
			if(beginDate.trim().length()>0){
				//格式化日期格式
				beginDate = beginDate.replaceAll("/", "-");
			}else{
				beginDate=null;
			}
		}
		if(endDate!=null){
			if(endDate.trim().length()>0){
				//格式化日期格式
				endDate = endDate.replaceAll("/", "-");
			}else{
				endDate=null;
			}
		}
		PageInfo<Map<String, Object>> notice = noticeService.listByNoticeWithConditions(page,rows,title,beginDate,endDate,typeId);
		SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//获得全部公告信息
		List<Map<String,Object>> list = notice.getRows();
		for (Map<String, Object> map : list) {
			if(map.get("createTime")==null){
				continue;
			}
			//格式化时间格式
			String createTime = sim.format((Date)map.get("createTime"));
			map.put("createTime", createTime);
		}
		Gson gson = new Gson();
		String noticeJson = gson.toJson(notice);
		return noticeJson;
	}
	
	
	/**
	 * 添加公告信息页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/notice_add.do",method=RequestMethod.GET)
	public String addNotice(Model model){
		List<Map<String,Object>> noticeTypes = noticeTypeService.listByNoticeType();
		model.addAttribute("noticeTypes", noticeTypes);
		return "back/notice/add";
	}
	
	
	/**
	 * 添加公告信息
	 * 
	 * @param title
	 * @param symbol
	 * @param typeId
	 * @param orderNumb
	 * @param state
	 * @param content
	 * @param picture
	 * @param request
	 * @return
	 * @throws Exception
	 * @throws IOException
	 */
	@RequestMapping(value="/notice_add.do",method=RequestMethod.POST)
	@ResponseBody
	public boolean addNotice(String title,Integer symbol,Integer typeId,Integer orderNumb,Integer state,String content, @RequestParam(name="picture", required=false) MultipartFile picture, HttpServletRequest request) throws Exception, IOException{
		String picUrl=null;
		//如果上传了图片执行添加图片的操作
		if(!picture.isEmpty()&&picture.getSize()>0){
			//获得图片的详细名称
			String fileName = picture.getOriginalFilename();
			//获得图片的格式
			String extension = fileName.substring(fileName.lastIndexOf("."));
			//通过UUID为图片更换名字,防止出现重复
			String newFileName=UUID.randomUUID().toString().replaceAll("-", "")+extension;
			//获得图片的保存路径
			String savePath = request.getServletContext().getRealPath("back_source/img");
			//获得图片的相对路径地址保存至数据库
			String filePath = savePath + "/" + newFileName;
			//执行上传图片的操作
			picture.transferTo(new File(filePath));
			picUrl="back_source/img/"+newFileName;
		}
		int noticeID = noticeService.addNotice(title,symbol,typeId,orderNumb,state,content,picUrl);
		//添加失败
		if(noticeID!=1){
			return false;
		}
		//添加成功
		return true;
	}
	
	
	/**
	 * 修改公告信息页面 
	 * 
	 * @param model
	 * @param noid
	 * @return
	 */
	@RequestMapping(value="/notice_update.do",method=RequestMethod.GET)
	public String updateNotice(Model model,Integer noid){
		List<Map<String,Object>> noticeTypes = noticeTypeService.listByNoticeType();
		List<Map<String,Object>> notice = noticeService.getNoticeByNoid(noid);
		//若此公告无图片,给其一个不存在的值
		for (Map<String, Object> map : notice) {
			if(!map.containsKey("picUrl")){
				map.put("picUrl", "-1");
			}
		}
		model.addAttribute("noticeTypes", noticeTypes);
		model.addAttribute("notices", notice);
		return "back/notice/update";
	}
	
	
	/**
	 * 修改公告信息
	 * 
	 * @param pictureDel
	 * @param noid
	 * @param click
	 * @param createTime
	 * @param title
	 * @param symbol
	 * @param typeId
	 * @param orderNumb
	 * @param state
	 * @param content
	 * @param picture
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value="/notice_update.do",method=RequestMethod.POST)
	@ResponseBody
	public String updateNotice(String pictureDel,Integer noid,Integer click,String createTime,String title,Integer symbol,Integer typeId,Integer orderNumb,Integer state,String content, @RequestParam(name="picture", required=false) MultipartFile picture, HttpServletRequest request) throws IllegalStateException, IOException{
		String picUrl=null;
		//判断是否上传了图片
		if(!picture.isEmpty()&&picture.getSize()>0){
			String fileName = picture.getOriginalFilename();
			String extension = fileName.substring(fileName.lastIndexOf("."));
			String newFileName=UUID.randomUUID().toString().replaceAll("-", "")+extension;
			String savePath = request.getServletContext().getRealPath("back_source/img");
			String filePath = savePath + "/" + newFileName;
			picture.transferTo(new File(filePath));
			picUrl="back_source/img/"+newFileName;
		}
		//判断是否点击了删除图片
		if(pictureDel=="1"){
			//若点击执行删除图片
			String pictureUrl = noticeService.getNoticePictureUrl(noid);
			noticeService.deleteNoticePicture(noid);
			String serUrl = request.getServletContext().getRealPath("/");
			File file = new File(serUrl+"/"+pictureUrl);
			if(file.exists()){
				file.delete();
			}
		}
		int noticeID = noticeService.updateNotice(title,symbol,typeId,orderNumb,state,content,picUrl,noid,click,createTime);
		if(noticeID!=1){
			return "false";
		}
		return "true";
	}
	
	
	/**
	 * 删除公告信息
	 * 
	 * @param notices
	 * @param request
	 * @return
	 */
	@RequestMapping("/notice_delete.do")
	@ResponseBody
	public boolean deleteNotice(String[] notices,HttpServletRequest request){
		for (String noids : notices) {
			String pictureUrl = noticeService.getNoticePictureUrl(Integer.parseInt(noids));
			String serUrl = request.getServletContext().getRealPath("/");
			File file = new File(serUrl+"/"+pictureUrl);
			//删除其对应的图片
			if(file.exists()){
				file.delete();
			}
			int noid = noticeService.deleteNoticeById(Integer.parseInt(noids));
			if(noid!=1){
				return false;
			}
		}
		return true;
	}
	
}
