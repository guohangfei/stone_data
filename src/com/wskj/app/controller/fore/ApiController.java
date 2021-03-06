package com.wskj.app.controller.fore;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.wskj.app.service.CalenderService;
import com.wskj.app.service.LotteryService;
import com.wskj.app.service.WeatherService;
import com.wskj.app.util.other.GetIP;
import com.wskj.app.vo.Lunar;
import com.wskj.app.vo.User;

@Controller
@RequestMapping("/fore/api")
public class ApiController {

	@Autowired
	private CalenderService calenderService;
	@Autowired
	private WeatherService weatherService;
	@Autowired
	private LotteryService lotteryService;

	/*
	 * 说明：以下为主页面左侧链接的跳转操作
	 */

	// 01.天气预报跳转
	@RequestMapping("/weather.do")
	public String weather(Model mo) {
		// 数据库获得本地7天的天气详情
		List<Map> weatherApi = weatherService.getWeatherApi();
		mo.addAttribute("weatherApi", weatherApi);
		return "/fore/api/api_weather";
	}

	/**
	 * 接口获得天气数据
	 * 
	 * @return
	 */
	@RequestMapping("/weather/query.do")
	@ResponseBody
	public String query(String province_name, String city_name, String district_name, String weather_date,
			String appkey,HttpServletRequest request) {

		// 判断key是否存在
		List<Map> ma = weatherService.getWeatherDataByKey(appkey);
		if (ma.size() == 0) {
			return "101";// APPKEY为空或不存在
		}

		// 判断用户可使用次数是否等于0 user_id api_id
		Integer user_id = (Integer) ma.get(0).get("noid");
		Integer api_id = 1;
		List<Map> wea = weatherService.getCountApply(user_id, api_id);

		// APPKEY无请求此数据权限
		if (wea.size() == 0) {
			return "103";
		}
		// 请求超过次数限制
		Integer unused_cnt = (Integer) wea.get(0).get("unused_cnt");
		if (unused_cnt == 0) {
			return "104";
		}
		//所有参数都为空
		if(province_name==null&&city_name==null&&district_name==null&&weather_date==null){
			return "105";
		}
		
		

		// 根据条件获得数据库筛选数据
		String weather_date2=weather_date+"%";
		if(weather_date2.equals("null%")){
			weather_date2=null;
		}
		List<Map> weatherData = weatherService.getWeatherbyData(province_name, city_name, district_name, weather_date2);
		
		//数据不存在
		if(weatherData.size()==0){
			return "106";
		}
		Gson gson = new Gson();
		String str = gson.toJson(weatherData);
		
		// 变更count_apply统计数据 未用-1 已使用+1
		weatherService.updateCountDate(user_id, api_id);

		// 新增调用详情
		HttpServletRequest httpRequest=(HttpServletRequest)request; 
		String canshu = null;
		try {
			canshu = URLDecoder.decode(httpRequest.getQueryString(),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		String use_url = "http://" + request.getServerName() // 服务器地址
				+ ":" + request.getServerPort() // 端口号
				+ httpRequest.getContextPath() // 项目名称
				+ httpRequest.getServletPath() // 请求页面或其他地址
				+ "?" + canshu; // 参数 ;
		String use_ip = GetIP.getIpAddr(httpRequest);
		String params = province_name + "," + city_name + "," + district_name + "," + weather_date;
		weatherService.addUseDetail(user_id, api_id, use_ip, use_url, params, str);

		return str;
	}

	// 02.黄历跳转
	@RequestMapping("/lunar.do")
	public String lunar() {

		return "/fore/api/api_lunar";
	}

	// 申请黄历API
	// 验证用户是否登录
	@RequestMapping("/lunarValidateUser.do")
	public String lunarApi(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "/login";
		} else {
			return "/fore/user/123465";
		}
	}

	// 用户获取黄历数据
	@RequestMapping("/getLunarData.do")
	public String lunarApiData(Model model, @RequestParam String year, @RequestParam String month,
			@RequestParam String day) {
		// User user = (User)SecurityUtils.getSubject().getPrincipal();
		// String existedAppKey=user.getAppKey();
		String date = year + "年" + month + "月" + day + "日";
		List<Lunar> lunarStr = calenderService.selectLunarData(date);
		model.addAttribute("lunarStr", lunarStr);
		return "/fore/api/require_data/lunar_require_data";
	}

	@RequestMapping("/getlotterydate.do")
	@ResponseBody
	public String lotteryApiData(Model model, @RequestParam String year, @RequestParam String month,
			@RequestParam String day,HttpSession session) {
		// 判断key是否正确
		try {
			User u = (User) session.getAttribute("user");
			u.getAppKey();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("用户没登陆？");
			String msg = "{msg:101,result: [appkey为空或者不正确]}";
			return msg;// APPKEY为空或不存在
		}
		return lotteryService.selectLotteryData(year, month, day);
	}

	// 03.星座跳转
	@RequestMapping("/constellation.do")
	public String constellation() {
		return "/fore/api/api_constellation";
	}
		//03_1.获得当日的星座数据
	@RequestMapping("/getConTodayDetail.do")
	@ResponseBody
	public String getConTodayDetail(){
		//01.首先是对apikey的一个验证，通过apikey查看此apikey中对应的接口内容和容量
		//02.apikey容量的报警
		//03.apikey验证之后，查找对应apikey的接口主键
		/*验证
		 * 
		 */
		
		
		return null;
	}
	
		

	// 04.彩票跳转
	@RequestMapping("/lottery.do")
	public String lottery() {
		return "/fore/api/api_lottery";
	}
}
