package com.wskj.app.controller.back;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.wskj.app.service.back.DataApiService;

@Controller
@RequestMapping(value="/back",produces="text/html;charset=utf-8")
public class DataApiController {
	
	@Autowired
	private DataApiService dataApiService;

	/**
	 * 数据接口管理页面
	 * @return
	 */
	@RequestMapping("/api_list.do")
	public String dataApi_list(){
		return "/back/api/api_list";
	}
	/**
	 * 接口资费套餐管理
	 * @return
	 */
	@RequestMapping("/meal_list.do")
	public String apiMeal_list(){
		return "/back/api/meal_list";
	}
	/**
	 * 打开编辑api接口的页面
	 * @param noid
	 * @param m
	 * @return
	 */
	@RequestMapping("/api_edit.do")
	public String dataApi_edit(Integer noid,Model m){
		Map<String,Object> api=dataApiService.getApiMap(noid);
		m.addAttribute("api", api);
		List<Map<String,Object>> meal=dataApiService.getMeals(noid);
		m.addAttribute("meal", meal);
		return "/back/api/api_edit";
	}
	/**
	 * 打开编辑套餐资费编辑的页面
	 * @param noid
	 * @param m
	 * @return
	 */
	@RequestMapping("/meal_edit.do")
	public String meal_edit(Integer noid,Model m){
		Map<String,Object> meal=dataApiService.getMealMap(noid);
		m.addAttribute("meal", meal);
		return "/back/api/meal_edit";
	}
	/**
	 * 执行接口信息修改的方法
	 * @param apiName
	 * @param apiDetail
	 * @param orderNumb
	 * @param meal
	 * @param noid
	 * @return
	 */
	@RequestMapping("/exec_edit_api.do")
	@ResponseBody
	public String editApi(String apiName,String apiDetail,Integer orderNumb,Integer meal,Integer noid){
		Integer cnt=dataApiService.updateApi(apiName,apiDetail,orderNumb,meal,noid);
		if (cnt>0) {
			return "success";
		}
		else{
			return "failed";
		}
	}
	/**
	 * 修改资费套餐
	 * @param noid
	 * @param numb
	 * @param price
	 * @return
	 */
	@RequestMapping("/exec_edit_meal.do")
	@ResponseBody
	public String editmeal(Integer noid,Integer numb,BigDecimal price){
		Integer cnt=dataApiService.updateMeal(noid,numb,price);
		if (cnt>0) {
			return "success";
		}
		else{
			return "failed";
		}
	}
	/**
	 * 获取接口列表
	 * @param m
	 * @return
	 */
	@RequestMapping("/getList.do")
	@ResponseBody
	public String getApiList(){
		List<Map<String,Object>> apis=dataApiService.getApiList();
		Gson gs=new Gson();
		return gs.toJson(apis);
	}
	/**
	 * 获取接口资费套餐列表
	 * @param m
	 * @return
	 */
	@RequestMapping("/getMealList.do")
	@ResponseBody
	public String getMealList(){
		List<Map<String,Object>> meals=dataApiService.getMealList();
		Gson gs=new Gson();
		return gs.toJson(meals);
	}
	
	@RequestMapping("/check_ordernumb.do")
	@ResponseBody
	public String checkOrderNumb(Integer orderNumb){
		Integer cnt = dataApiService.checkOrderNumb(orderNumb);
		if (cnt!=null) {
			return "repeat";
		}
		return "noRepeat";
	}
}
