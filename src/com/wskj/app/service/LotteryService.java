package com.wskj.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.wskj.app.mapper.LotteryMapper;
import com.wskj.app.mapper.UserMapper;

@Service
public class LotteryService {

	@Autowired
	private LotteryMapper lotteryMapper;
	
	
	/**
	 * 根据时间查询彩票数据
	 * @param cdate
	 * @return
	 */
	public List<Map<String, Object>> selectLottery(String cdate){
		return lotteryMapper.selectLottery(cdate);
	}

	/**
	 * 判断用户是否登陆
	 * 根据时间查询彩票数据并返回一个json类型的数据
	 */
	public String selectLotteryData(String year, String month, String day) {
		// TODO Auto-generated method stub
		if (Integer.parseInt(month)<10) {
			month=0+month;
		}
		if (Integer.parseInt(day)<10) {
			day=0+day;
		}
		
		String date=year+month+day;
		
		List<Map<String, Object>> lst = lotteryMapper.selectLottery(date);
		Gson gs=new Gson();
		String json=gs.toJson(lst);
		return json;
	}
	
}
