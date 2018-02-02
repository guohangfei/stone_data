package com.wskj.app.controller.fore;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wskj.app.service.CalenderService;
import com.wskj.app.service.ConstellSelService;
import com.wskj.app.vo.ConDay;
import com.wskj.app.vo.ConLove;
import com.wskj.app.vo.ConMain;
import com.wskj.app.vo.ConMonth;
import com.wskj.app.vo.ConWeek;
import com.wskj.app.vo.ConYear;

/**
 * 说明：此页是爬虫数据详情的控制页面
 * 	包括：星座，天气，黄历，彩票
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/fore/api_detail")
public class ApiDetailController {
	
	@Autowired
	private CalenderService calenderService;
	@Autowired
	private ConstellSelService constellSelService;//星座查询服务对象
	
	/**
	 * 说明：关于星座的跳转的页面
	 */
	@RequestMapping("/consToday.do")
	public String consToday(Model model,Integer conNum) throws ParseException{
		/*
		 * 日期处理部分
		 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		int day = cal.get(Calendar.DATE);
		int month = cal.get(Calendar.MONTH)+1;
		int year = cal.get(Calendar.YEAR);		
		Date date = sdf.parse(year+"-"+month+"-"+day);		
		
		//顺序号为空的操作
		String conDate = "2000-"+month+"-"+day;		
		ConMain conMain;
		if(conNum==null){
			conMain = constellSelService.selOneMainByDate(conDate);
		}else{
			conMain = constellSelService.selOneMainByNoid(conNum);			
		}
		ConDay conDay = constellSelService.selOneConDayByDate(conMain.getOrderNum(), date);
		
		model.addAttribute("conMain",conMain);
		model.addAttribute("conDay", conDay);
		return "/fore/api_detail/constellation/cons_today";
	}
	
	@RequestMapping("/consTomorrow.do")
	public String consTomorrow(Model model,Integer conNum) throws ParseException{
		/*
		 * 日期处理部分
		 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 1);//执行日期的加1
		
		int day = cal.get(Calendar.DATE);
		int month = cal.get(Calendar.MONTH)+1;
		int year = cal.get(Calendar.YEAR);		
		Date date = sdf.parse(year+"-"+month+"-"+day);		
		
		//顺序号为空的操作
		String conDate = "2000-"+month+"-"+day;		
		ConMain conMain;
		if(conNum==null){
			conMain = constellSelService.selOneMainByDate(conDate);
		}else{
			conMain = constellSelService.selOneMainByNoid(conNum);			
		}
		ConDay conDay = constellSelService.selOneConTomoByDate(conMain.getOrderNum(), date);
		
		model.addAttribute("conMain",conMain);
		model.addAttribute("conDay", conDay);
		
		return "/fore/api_detail/constellation/cons_tomorrow";
	}
	
	@RequestMapping("/consWeek.do")
	public String consWeek(Model model,Integer conNum) throws ParseException{
		/*
		 * 日期处理部分
		 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		//cal.add(Calendar.DATE, 1);
		int day = cal.get(Calendar.DATE);
		int month = cal.get(Calendar.MONTH)+1;
		int year = cal.get(Calendar.YEAR);		
		Date date = sdf.parse(year+"-"+month+"-"+day);		
		
		//顺序号为空的操作
		String conDate = "2000-"+month+"-"+day;		
		ConMain conMain;
		if(conNum==null){
			conMain = constellSelService.selOneMainByDate(conDate);
		}else{
			conMain = constellSelService.selOneMainByNoid(conNum);		
		}	
		ConWeek conWeek = constellSelService.selOneConWeekByDate(conMain.getOrderNum(), date);
		
		model.addAttribute("conMain",conMain);
		model.addAttribute("conWeek",conWeek);
		return "/fore/api_detail/constellation/cons_week";
	}
	
	@RequestMapping("/consMonth.do")
	public String consMonth(Model model,Integer conNum) throws ParseException{
		/*
		 * 日期处理部分
		 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 1);
		int day = cal.get(Calendar.DATE);
		int month = cal.get(Calendar.MONTH)+1;
		int year = cal.get(Calendar.YEAR);		
		Date date = sdf.parse(year+"-"+month+"-"+day);	
		
		String conDate = "2000-"+month+"-"+day;		
		ConMain conMain;
		if(conNum==null){
			conMain = constellSelService.selOneMainByDate(conDate);
		}else{
			conMain = constellSelService.selOneMainByNoid(conNum);		
		}		
		ConMonth conMonth = constellSelService.selOneConMonthByMonth(conMain.getOrderNum(), month);
		
		model.addAttribute("conMain",conMain);
		model.addAttribute("conMonth",conMonth);
		return "/fore/api_detail/constellation/cons_month";
	}
	
	@RequestMapping("/consYear.do")
	public String consYear(Model model,Integer conNum) throws ParseException{
		/*
		 * 日期处理部分
		 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 1);
		int day = cal.get(Calendar.DATE);
		int month = cal.get(Calendar.MONTH)+1;
		int year = cal.get(Calendar.YEAR);		
		Date date = sdf.parse(year+"-"+month+"-"+day);	
		
		String conDate = "2000-"+month+"-"+day;		
		ConMain conMain;
		if(conNum==null){
			conMain = constellSelService.selOneMainByDate(conDate);
		}else{
			conMain = constellSelService.selOneMainByNoid(conNum);		
		}			
		ConYear conYear = constellSelService.selOneConYearByYear(conMain.getOrderNum(), year);
		
		model.addAttribute("conMain",conMain);
		model.addAttribute("conYear",conYear);
		
		return "/fore/api_detail/constellation/cons_year";
	}
	
	@RequestMapping("/consLove.do")
	public String consLove(Model model,Integer conNum) throws ParseException{
		/*
		 * 日期处理部分
		 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 1);
		int day = cal.get(Calendar.DATE);
		int month = cal.get(Calendar.MONTH)+1;
		int year = cal.get(Calendar.YEAR);		
		Date date = sdf.parse(year+"-"+month+"-"+day);	
		
		String conDate = "2000-"+month+"-"+day;		
		ConMain conMain;
		if(conNum==null){
			conMain = constellSelService.selOneMainByDate(conDate);
		}else{
			conMain = constellSelService.selOneMainByNoid(conNum);		
		}			
		ConLove conLove = constellSelService.selOneConLoveByYear(conMain.getOrderNum(), year);
		
		model.addAttribute("conMain",conMain);
		model.addAttribute("conLove",conLove);
		
		return "/fore/api_detail/constellation/cons_love";
	}
	
	/**
	 * 说明：天气跳转
	 */
	@RequestMapping("/weather.do")
	public String weather(){
		//数据库获得本地7天的天气详情
		
		return "/fore/api_detail/weather/wea_main";
	}
	
	/**
	 * 说明：黄历跳转
	 */
	@RequestMapping("/lunar.do")
	public String lunar(String accordingDate,Model model){
		//处理获得的系统时间字符串
		//定义查询条件
		String selectAccordingDate=null;
		
		Date sysDate=new Date();
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy年MM月dd日");
		String sysDateStr=dateFormat.format(sysDate);
		if(accordingDate==null){

			String monthIfZore = sysDateStr.substring(5, 6);
	
			if(monthIfZore.equals("0")){
				String head = sysDateStr.substring(0, 5);
				String body = sysDateStr.substring(6);
				String whole=head+body;
				selectAccordingDate=whole;
			}
			String dayIfZore = sysDateStr.substring(8, 9);
			
			if(dayIfZore.equals("0")){
				String head = sysDateStr.substring(0, 8);
				String body = sysDateStr.substring(9);
				String whole=head+body;
				selectAccordingDate=whole;	
			}
		}
		//处理页面获得的日期字符串
		if(!(accordingDate==null)){
              
		String gainMonthIfZore = accordingDate.substring(5, 6);
		String gainDayIfZore = accordingDate.substring(8, 9);
		String whole=null;
		
			if(gainMonthIfZore.equals("0")&&gainDayIfZore.equals("0")){
		    	String fore = accordingDate.substring(0, 5);
		    	String middle=accordingDate.substring(6, 8);
		    	String tail = accordingDate.substring(9);
		    	whole=fore+middle+tail;
		    	
		    	String newStr=whole.replace("-", "年");
				//System.out.println(newStr);
				String start = newStr.substring(0, 6);
				String oldLastTail = newStr.substring(6);
				//System.out.println(oldLastTail);
				String newLastTail = oldLastTail.replace("年", "月")+"日";
				//System.out.println(newLastTail);
				String totalStr=start+newLastTail;
				//System.out.println(totalStr);
				selectAccordingDate=totalStr;

		    }
		    if(gainMonthIfZore.equals("0")&&!gainDayIfZore.equals("0")){
		    	String fore = accordingDate.substring(0, 5);
		    	String tail = accordingDate.substring(6);
		    	whole=fore+tail;
		    	
		    	String newStr=whole.replace("-", "年");
				//System.out.println(newStr);
				String start = newStr.substring(0, 6);
				String oldLastTail = newStr.substring(6);
				//System.out.println(oldLastTail);
				String newLastTail = oldLastTail.replace("年", "月")+"日";
				//System.out.println(newLastTail);
				String totalStr=start+newLastTail;
				//System.out.println(totalStr);
		    	selectAccordingDate=totalStr;
		    	
		    }
		    if(!gainMonthIfZore.equals("0")&&gainDayIfZore.equals("0")){
		    	String fore = accordingDate.substring(0, 8);
		    	String tail = accordingDate.substring(9);
		    	whole=fore+tail;
		    	
		    	String newStr=whole.replace("-", "年");
				//System.out.println(newStr);
				String start = newStr.substring(0, 7);
				String oldLastTail = newStr.substring(7);
				//System.out.println(oldLastTail);
				String newLastTail = oldLastTail.replace("年", "月")+"日";
				//System.out.println(newLastTail);
				String totalStr=start+newLastTail;
				//System.out.println(totalStr);
		    	selectAccordingDate=totalStr;
		    	
		    }
		    if(!gainMonthIfZore.equals("0")&&!gainDayIfZore.equals("0")){
		    	whole=accordingDate;
		    	
		    	String newStr=whole.replace("-", "年");
				//System.out.println(newStr);
				String start = newStr.substring(0, 7);
				String oldLastTail = newStr.substring(7);
				//System.out.println(oldLastTail);
				String newLastTail = oldLastTail.replace("年", "月")+"日";
				//System.out.println(newLastTail);
				String totalStr=start+newLastTail;
				//System.out.println(totalStr);
		    	selectAccordingDate=totalStr;
		    	
		    }
		    
		}	
		//获取简约日期
		String accordDate=calenderService.selectSelectAccordingDateByAccordingDate(selectAccordingDate);
		//获取公历
		String solarCalendarDay=calenderService.selectSolarCalendarDayByAccordingDate(selectAccordingDate);
		//获取农历
		String lunarCalendarDate=calenderService.selectLunarCalendarDateByAccordingDate(selectAccordingDate);
		//获取干支年
		String lunarCalendarYear=calenderService.selectLunarCalendarYearByAccordingDate(selectAccordingDate);
		//获取干支月
		String lunarCalendarMonth=calenderService.selectLunarCalendarMonthByAccordingDate(selectAccordingDate);
		//获取干支日
		String lunarCalendarDay=calenderService.selectLunarCalendarDayByAccordingDate(selectAccordingDate);
		//获取今日所宜
		String suit=calenderService.selectSuitByAccordingDate(selectAccordingDate);
		System.out.println(selectAccordingDate);
		String shortSuit=suit.substring(0, 27);
		//获取今日所忌
		String taboo=calenderService.selectTabooByAccordingDate(selectAccordingDate);
		String shortTaboo=taboo.substring(0, 27);
		//获取二十四节气
		String solarTerm=calenderService.selectSolarTermByAccordingDate(selectAccordingDate);
		String lastsolarTerm = solarTerm.substring(0, 25);
		String nextsolarTerm=solarTerm.substring(25);
		
		model.addAttribute("accordingDate",accordDate);
		model.addAttribute("solarCalendarDay",solarCalendarDay);
		model.addAttribute("lunarCalendarDate",lunarCalendarDate);
		model.addAttribute("lunarCalendarYear",lunarCalendarYear);
		model.addAttribute("lunarCalendarMonth",lunarCalendarMonth);
		model.addAttribute("lunarCalendarDay",lunarCalendarDay);
		model.addAttribute("suit",shortSuit);
		model.addAttribute("taboo",shortTaboo);
		model.addAttribute("lastsolarTerm",lastsolarTerm);
		model.addAttribute("nextsolarTerm",nextsolarTerm);
				
		return "/fore/api_detail/lunar/lun_main";
	
	}
	
}	
