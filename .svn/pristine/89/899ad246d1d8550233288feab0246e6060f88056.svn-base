package com.wskj.app.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.cache.annotation.Cacheable;

import com.wskj.app.vo.Lunar;

@MapperScan
public interface CalenderMapper {

	//获取简约日期
	@Select("SELECT `select_according_date` FROM `t_lucky_day` WHERE `select_according_date`=#{param1}")
	String selectSelectAccordingDateByAccordingDate(String select_according_date);
	//获取公历信息
	@Select("SELECT `solar_calendar_day` FROM `t_lucky_day` WHERE `select_according_date`=#{param1}")
	String selectSolarCalendarDayByAccordingDate(String select_according_date);
	
	//获取农历信息
	@Select("SELECT `lunar_calendar_date` FROM `t_lucky_day` WHERE `select_according_date`=#{param1}")
	String selectLunarCalendarDateByAccordingDate(String select_according_date);
	
	//获取干支年
	@Select("SELECT `lunar_calendar_year` FROM `t_lucky_day` WHERE `select_according_date`=#{param1}")
	String selectLunarCalendarYearByAccordingDate(String select_according_date);
	
	//获取干支月
	@Select("SELECT `lunar_calendar_month` FROM `t_lucky_day` WHERE `select_according_date`=#{param1}")
	String selectLunarCalendarMonthByAccordingDate(String select_according_date);
	
	//获取干支日
	@Select("SELECT `lunar_calendar_day` FROM `t_lucky_day` WHERE `select_according_date`=#{param1}")
	String selectLunarCalendarDayByAccordingDate(String select_according_date);
	
	//获取今日所宜
	@Select("SELECT `suit` FROM `t_lucky_day` WHERE `select_according_date`=#{param1}")
	String selectSuitByAccordingDate(String select_according_date);
	
	//获取今日所忌
	@Select("SELECT `taboo` FROM `t_lucky_day` WHERE `select_according_date`=#{param1}")
	String selectTabooByAccordingDate(String select_according_date);
	
	//获取二十四节气
	@Select("SELECT `solar_term` FROM `t_lucky_day` WHERE `select_according_date`=#{param1}")
	String selectSolarTermByAccordingDate(String select_according_date);

	//--------------------------我是帅气分隔线--------------------------------

	//以下是黄历API的查询方法
	@Select("SELECT * FROM `t_lucky_day` WHERE `select_according_date`=#{param1}")
	List<Lunar> selectLunarData(String date);







}
