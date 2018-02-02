package com.wskj.app.mapper;

import java.util.Date;

import org.springframework.cache.annotation.Cacheable;

import com.wskj.app.vo.ConDay;
import com.wskj.app.vo.ConLove;
import com.wskj.app.vo.ConMain;
import com.wskj.app.vo.ConMonth;
import com.wskj.app.vo.ConWeek;
import com.wskj.app.vo.ConYear;


/**
 * 说明：此页用于访问数据库中的数据
 * @author Administrator
 *
 */
//@MapperScan
public interface ConstellSel {
	
	//07.通过接口获得数据
	
	
	//00.通过日期查询星座的主对象
	ConMain selOneMainByDate(String date);
	
	//01.通过顺序号和日期查询星座的日数据
	ConDay selOneConDayByDate(Integer conNum,Date date);
	
	//01_2.通过顺序号和日期查询星座的明日数据
	ConDay selOneConTomoByDate(Integer conNum,Date date);
	
	//02.查询星座的周数据
	ConWeek selOneConWeekByDate(Integer conNum,Date date);
	
	//03.查询星座的月数据
	ConMonth selOneConMonthByMonth(Integer conNum,Integer month);
	
	//04.查询星座的年数据
	ConYear selOneConYearByYear(Integer conNum,Integer year);
	
	//05.查询星座的爱情数据
	ConLove selOneConLoveByYear(Integer conNum,Integer year);
	
	//06.通过主键查询星座的主对象
	ConMain selOneMainByNoid(Integer noid);
	
	
	
}
