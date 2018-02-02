package com.wskj.app.controller.back;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.wskj.app.service.back.PublicityBackService;

@Controller
@RequestMapping("/back")
public class PublicityBackController {
	
	@Autowired
	private PublicityBackService publicityBackService;
	/*
	 *01.广告信息
	 */
	//首页跳转 广告信息展示
	@RequestMapping("/pub_list.do")
	public String pubData_list(){
		return "/back/publicity/pub_list";
	}
	//获取所有广告信息
	@RequestMapping(value="/getAll_pub.do",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getData_pub(){
		
		List<Map> pubList = publicityBackService.getPubList();
		Gson gson = new Gson();
		String jsonStr = gson.toJson(pubList);
		try {
			String newStr = new String(jsonStr.getBytes(),"UTF-8");
			return newStr;
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		return null;
	}
	//进入删除广告弹窗页面
	@RequestMapping("/pubDelPrompt.do")
	public String delPubExecute(Integer noid, Model model){
		model.addAttribute("noid", noid);
		return "/back/publicity/pub_del";
	}
	//执行广告删除
	@RequestMapping("/delPubExecute.do")
	@ResponseBody
	public String delPubExecute(Integer noid){
		try {
			publicityBackService.delPubExecute(noid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "no";
		}
		return "ok";
	}
	//进入修改广告弹窗页面
	@RequestMapping("/pubUpdatePrompt.do")
	public String pubUpdatePrompt(Integer noid, Model model){
		List<Map> publi =publicityBackService.getPubOne(noid);
		List<Map> allTypes=publicityBackService.getAllTypes();
		model.addAttribute("publi", publi);
		model.addAttribute("allTypes",allTypes);
		return "/back/publicity/pub_update";
	}
	//执行广告修改
	@RequestMapping("/updatePubExecute.do")
	@ResponseBody
	public String updatePubExecute(String title,String content, Integer type_id, String pic_url, String link_url, Integer order_numb, Integer state, Integer noid, @RequestParam(name="pic", required=false) MultipartFile pic, HttpServletRequest request) throws ParseException{
		Date date=new Date();
		SimpleDateFormat simDaForm= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = simDaForm.format(date);
		date = simDaForm.parse(time);
		
		//如果上传了图片执行添加图片的操作
		if(!pic.isEmpty()&&pic.getSize()>0){
			//获得图片的详细名称
			String fileName = pic.getOriginalFilename();
			//获得图片的格式
			String extension = fileName.substring(fileName.lastIndexOf("."));
			//通过UUID为图片更换名字,防止出现重复
			String newFileName=UUID.randomUUID().toString().replaceAll("-", "")+extension;
			//获得图片的保存路径
			String savePath = request.getServletContext().getRealPath("fore_source/image/publicity");
			//System.out.println(savePath);
			//获得图片的相对路径地址保存至数据库
			String filePath = savePath + "/" + newFileName;
			//执行上传图片的操作
			try {
				pic.transferTo(new File(filePath));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pic_url="http://192.168.6.52:8080/stone_data/fore_source/image/publicity/"+newFileName;
		}
		//pic_url="http://192.168.6.52:8080/stone_data/fore_source/image/publicity/"+pic_url;
		
		Integer inte = publicityBackService.updatePubExecute(title,content,type_id,pic_url,link_url,order_numb,state,noid);
		System.out.println(inte);
		if (inte != 0) {
			return "ok";
		} else {
			return "no";
		}
	}	
	//进入新增广告弹窗
	@RequestMapping("/pubAddPrompt.do")
	public String addPubExecute(Model model){
		List<Map> allTypes=publicityBackService.getAllTypes();
		model.addAttribute("allTypes",allTypes);
		return "/back/publicity/pub_add";
	}
	//执行增加广告
	@RequestMapping("/addPubExecute.do")
	@ResponseBody
	public String addPubExecute(String title,String content, Integer type_id, String pic_url, String link_url, Integer order_numb, Integer state, Integer click,@RequestParam(name="pic", required=false) MultipartFile pic, HttpServletRequest request) throws ParseException{
		Date date=new Date();
		SimpleDateFormat simDaForm= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = simDaForm.format(date);
		date = simDaForm.parse(time);
		if(click==null){
			click=0;
		}
		//如果上传了图片执行添加图片的操作
		if(!pic.isEmpty()&&pic.getSize()>0){
			//获得图片的详细名称
			String fileName = pic.getOriginalFilename();
			//获得图片的格式
			String extension = fileName.substring(fileName.lastIndexOf("."));
			//通过UUID为图片更换名字,防止出现重复
			String newFileName=UUID.randomUUID().toString().replaceAll("-", "")+extension;
			//获得图片的保存路径
			String savePath = request.getServletContext().getRealPath("fore_source/image/publicity");
			//System.out.println(savePath);
			//获得图片的相对路径地址保存至数据库
			String filePath = savePath + "/" + newFileName;
			//执行上传图片的操作
			try {
				pic.transferTo(new File(filePath));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pic_url="http://192.168.6.52:8080/stone_data/fore_source/image/publicity/"+newFileName;
		}
		//pic_url="http://192.168.6.52:8080/stone_data/fore_source/image/publicity/"+pic_url;
		
		Integer inte = publicityBackService.addPubExecute(title,content,type_id,pic_url,link_url,order_numb,date,state,click);
		System.out.println(inte);
		if (inte != 0) {
			return "ok";
		} else {
			return "no";
		}
	}

	
	/*
	 *02.广告分类
	 */
	//首页跳转 广告分类展示
	@RequestMapping("/pub_type.do")
	public String getinPubData_type(){
		return "/back/publicity/pub_type";
		
	}
	//获取所有广告分类
	@RequestMapping(value="/getAll_pub_type.do",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String pubData_type(){
		/*List<PublicityType> pubTypeList=publicityBackService.getPubTypeList();
		model.addAttribute("pubTypeList",pubTypeList);
		return "/back/publicity/pub_type";*/
		
		List<Map> pubTypeList = publicityBackService.getPubTypeList();
		Gson gson = new Gson();
		String jsonStr = gson.toJson(pubTypeList);
		try {
			String newStr = new String(jsonStr.getBytes(),"UTF-8");
			return newStr;
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		return null;
	}
	//删除广告分类(1.进入删除广告分类的弹框)
	@RequestMapping("/delPubTyPrompt.do")
	public String delPubTyPro(Integer noid,Model model){
		model.addAttribute("noid", noid);
		return "/back/publicity/type_del";
	}
	//删除广告分类(2.执行删除广告分类)
	@RequestMapping("/delPubTyExecute.do")
	@ResponseBody
	public String delPubTyExecute(Integer noid){
		try {
			publicityBackService.delPubTyExecute(noid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "no";
		}
		return "ok";
	}
	
	//增加广告分类(1.进入新增广告分类的弹框)
		@RequestMapping("/addPubTyPrompt.do")
		public String addPubTyPro(){
			return "/back/publicity/type_add";
		}
	//增加广告分类(2.执行增加广告分类)
		@RequestMapping("/addPubTyExecute.do")
		@ResponseBody
		public String addPubTyExecute(String type_name, Integer type_symbol, Integer order_numb){
			
			Integer inte = publicityBackService.addPubTyExecute(type_name,type_symbol,order_numb);
			System.out.println(inte);
			if (inte != 0) {
				return "ok";
			} else {
				return "no";
			}
		}
		//查詢要回顯的广告分类(1.进入修改广告分类的弹框)
		@RequestMapping("/updatePubTyPrompt.do")
		public String updatePubTyPro(Integer noid,Model model){
			List<Map>pubType=publicityBackService.getPubTypeListByNoid(noid);
			model.addAttribute("pubType",pubType);
			//model.addAttribute("noid", noid);
			return "/back/publicity/type_update";
		}
		//修改广告分类(2.执行修改广告分类)
		@RequestMapping("/updatePubTyExecute.do")
		@ResponseBody
		public String updatePubTyExecute(String type_name, Integer type_symbol, Integer order_numb, Integer noid){
			try {
				Integer affectedInt=publicityBackService.updatePubTyExecute(type_name,type_symbol,order_numb,noid);
				if(affectedInt!=1){
					return "no";
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "ok";
		}	
	
}
