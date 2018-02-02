package com.wskj.app.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.wskj.app.mapper.AppkeyHandleMapper;
import com.wskj.app.mapper.ConstellSel;
import com.wskj.app.vo.ConDay;
import com.wskj.app.vo.ConLove;
import com.wskj.app.vo.ConMain;
import com.wskj.app.vo.ConMonth;
import com.wskj.app.vo.ConWeek;
import com.wskj.app.vo.ConYear;

/**
 * 说明：此页用于查询数据
 * @author Administrator
 * 错误码介绍：
 * 	101 appkey为空或不存在
 * 	102 appkey无请求此数据权限
 * 	103 请求次数超过限制，也就是api_count为0的时候
 *
 */
@Service
public class ConstellSelService {
	@Autowired
	private ConstellSel constellSel;
	@Autowired
	private AppkeyHandleMapper appkeyHandleMapper;
				
		//07.通过顺序号和日期字符串获得map对象
		public String selAllConInfo(Integer conNum,String dateStr){
			//01.对字符串的日期进行处理
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");			
			Calendar calendar = Calendar.getInstance();
			Date date = null;
			Integer month = 0;
			Integer year = 0;
			try {
				//date month year 都有了
				date = sdf.parse(dateStr);
				calendar.setTime(date);
				
				month = calendar.get(Calendar.MONTH)+1;
				year = calendar.get(Calendar.YEAR);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//02.通过日期和星座顺序号获得对应的内容
			ConDay conToday = this.selOneConDayByDate(conNum, date);
			ConDay conTomo = this.selOneConTomoByDate(conNum, date);
			ConWeek conWeek = this.selOneConWeekByDate(conNum, date);
			ConMonth conMonth = this.selOneConMonthByMonth(conNum, month);
			ConYear conYear = this.selOneConYearByYear(conNum, year);
			ConLove conLove = this.selOneConLoveByYear(conNum, year);
			
			//03.通过顺序号获得主对象
			ConMain conMain = this.selOneMainByNoid(conNum);
			
			//04.声明一个map，向map中注入参数
			Map map = new HashMap();
			Map map2 = new HashMap();
			map2.put("conMain", conMain);
			map2.put("conToday", conToday);
			map2.put("conTomo", conTomo);
			map2.put("conWeek", conWeek);
			map2.put("conMonth", conMonth);
			map2.put("conYear", conYear);
			map2.put("conLove", conLove);
			
			map.put("status", "0");
			map.put("msg", "ok");
			map.put("result", map2);
			
			//05.返回map值
			Gson gson=new Gson();
			String jsonStr = gson.toJson(map);
			
			return jsonStr;			
		}
		
	
		//00.通过日期查询所对应的星座主对象
		public ConMain selOneMainByDate(String date){
			
			ConMain conMain = constellSel.selOneMainByDate(date);
			
			//执行对非空的判断
			if(conMain==null){
				return constellSel.selOneMainByDate("2000-12-22");
			}
			return conMain;		
		}
	
		//01.通过顺序号和日期查询星座的日数据
		public ConDay selOneConDayByDate(Integer conNum,Date date){
			return constellSel.selOneConDayByDate(conNum, date);
		}
		public ConDay selOneConTomoByDate(Integer conNum,Date date){
			return constellSel.selOneConTomoByDate(conNum, date);
		}
		
		//02.查询星座的周数据
		public ConWeek selOneConWeekByDate(Integer conNum,Date date){
			return constellSel.selOneConWeekByDate(conNum, date);
		}
		
		//03.查询星座的月数据
		public ConMonth selOneConMonthByMonth(Integer conNum,Integer month){
			return constellSel.selOneConMonthByMonth(conNum, month);			
		}
		
		//04.查询星座的年数据
		public ConYear selOneConYearByYear(Integer conNum,Integer year){
			return constellSel.selOneConYearByYear(conNum, year);
		}
		
		//05.查询星座的爱情数据
		public ConLove selOneConLoveByYear(Integer conNum,Integer year){
			return constellSel.selOneConLoveByYear(conNum, year);
		}
		
		//06.通过主键查询主对象
		public ConMain selOneMainByNoid(Integer noid){
			return constellSel.selOneMainByNoid(noid);
		}
}
