package com.wskj.app.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.wskj.app.mapper.BaseMapper;

@Service
public class BaseService {

	@Autowired
	private BaseMapper baseMapper;

	/**
	 * 从天气数据库获的当天的天气
	 * @param province_name
	 * @param city_name
	 * @param district_name
	 * @param nowDay
	 * @return
	 */
	public List<Map> getNowDayWeather(String province_name, String city_name, String district_name, String nowDay) {
		// TODO Auto-generated method stub
		return baseMapper.getNowDayWeather(province_name,city_name,district_name,nowDay);
	}

	/**
	 * 根据当天时间从彩票数据库获取当天已开奖的彩票数据
	 * @param date
	 * @return
	 */
	public List<Map<String, Object>> getNowDayLottery(String date){
		return baseMapper.getNowDayLottery(date);
	}
	
	/**
	 * 获取2017年到开奖之前的数据
	 */
	public void add_lottery() {

		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String dates = dateFormat.format(date);
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy");
		SimpleDateFormat dateFormat3 = new SimpleDateFormat("MM");
		SimpleDateFormat dateFormat4 = new SimpleDateFormat("dd");
		String year = dateFormat2.format(date);
		String monfmt = dateFormat3.format(date);
		String dayfmt = dateFormat4.format(date);

		int mons = Integer.parseInt(monfmt);
		int days = Integer.parseInt(dayfmt);
		for (int i = 1; i <= mons; i++) {
			for (int j = 1; j <= days; j++) {
				String mon = i + "";
				if (i < 10) {
					mon = "0" + i;
				}
				String day = j + "";
				if (j < 10) {
					day = "0" + j;
				}

				Document doc = null;
				try {
					Document doc1 = Jsoup.connect("http://kaijiang.500.com/hebk3.shtml").get();
					String url = "http://kaijiang.500.com/static/info/kaijiang/xml/hebk3/2017" + mon + day + ".xml";
					doc = Jsoup.connect(url).get();
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(year + mon + day + "出错。");
					continue;
				}
				
				int numb = doc.select("row").size();
				if (numb < 1) {
					continue;
				}

				for (int k = numb; k > 0; k--) {
					String opendate = year + mon + day;
					String expect = doc.select("row").get(k-1).attr("expect");
					String opencode = doc.select("row").get(k-1).attr("opencode");
					String opentime = doc.select("row").get(k-1).attr("opentime");

					baseMapper.add_lotteried(expect, opendate, opentime, opencode, dates);

				}
			}
		}
	}
	
	/**
	 * 根据定时在规定时间抓取最新一期彩票数据
	 *
	 **/
	@Scheduled(cron = "23 3,13,23,33,43,53 8-21 * * ?")
	@Scheduled(cron = "7 4,14,24,34,44,54 8-21 * * ?")
	public void add() {
		
		Date date = new Date();
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyyMMdd");
		String dated = dateFormat1.format(date);// 开奖日期

		Document doc;
		try {

			Jsoup.connect("http://kaijiang.500.com/hebk3.shtml").get();
			String url = "http://kaijiang.500.com/static/info/kaijiang/xml/hebk3/" + dated + ".xml";
			doc = Jsoup.connect(url).get();
		} catch (Exception e) {
			// TODO: handle exception
			return;
		}
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String dates = dateFormat.format(date);// 抓取时间
		String expect = doc.select("row").get(0).attr("expect");//开奖期号
		String opencode = doc.select("row").get(0).attr("opencode");//开奖号码
		String opentime = doc.select("row").get(0).attr("opentime");//开奖时间

		try {
			baseMapper.add_lotteried(expect, dated, opentime, opencode, dates);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("插入重复数据！");
			return;
		}

	}
	
}
