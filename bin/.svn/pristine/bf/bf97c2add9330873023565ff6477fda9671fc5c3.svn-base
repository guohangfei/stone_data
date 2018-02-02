package com.wskj.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wskj.app.mapper.CalenderMapper;
import com.wskj.app.vo.Lunar;

@Service
public class CalenderService {

	@Autowired
	private CalenderMapper calenderMapper;
	
		//获取简约日历
	public String selectSelectAccordingDateByAccordingDate(String select_according_date) {
		return calenderMapper.selectSelectAccordingDateByAccordingDate(select_according_date);
	}
	    //获取公历信息
	public String selectSolarCalendarDayByAccordingDate(String select_according_date) {
			return calenderMapper.selectSolarCalendarDayByAccordingDate(select_according_date);
		}
		
		//获取农历信息
	public String selectLunarCalendarDateByAccordingDate(String select_according_date) {
			return calenderMapper.selectLunarCalendarDateByAccordingDate(select_according_date);
		}
		
		//获取干支年
	public String selectLunarCalendarYearByAccordingDate(String select_according_date) {
			return calenderMapper.selectLunarCalendarYearByAccordingDate(select_according_date);
		}
		
		//获取干支月
	public String selectLunarCalendarMonthByAccordingDate(String select_according_date) {
			return calenderMapper.selectLunarCalendarMonthByAccordingDate(select_according_date);
		}
		
		//获取干支日
	public String selectLunarCalendarDayByAccordingDate(String select_according_date) {
			return calenderMapper.selectLunarCalendarDayByAccordingDate(select_according_date);
		}
		
		//获取今日所宜
	public String selectSuitByAccordingDate(String select_according_date) {
			return calenderMapper.selectSuitByAccordingDate(select_according_date);
		}
		
		//获取今日所忌
	public String selectTabooByAccordingDate(String select_according_date) {
			return calenderMapper.selectTabooByAccordingDate(select_according_date);
		}
		
		//获取二十四节气
	public String selectSolarTermByAccordingDate(String select_according_date) {
			return calenderMapper.selectSolarTermByAccordingDate(select_according_date);
		}

	//--------------------------我是帅气分隔线--------------------------------

    //以下是黄历API的查询方法
	public List<Lunar> selectLunarData(String date){
		return calenderMapper.selectLunarData(date);
		
	}
	
}
