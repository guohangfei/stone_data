package com.wskj.app.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.wskj.app.mapper.AppkeyHandleMapper;

@Service
public class AppkeyHandleService {
	@Autowired
	private AppkeyHandleMapper appkeyHandleMapper;
	@Autowired
	private ConstellSelService constellSelService;
	
	//09.对接口调用数据的业务业务处理
			public String doGetConstellData(String keyValue,Integer orderNum,Integer conNum,String dateStr){
				Map map = new HashMap();
				Gson gson=new Gson();
				//返回参数判断旗标
				Integer flag = this.judge(keyValue, orderNum,dateStr);
				System.out.println(flag);
				switch(flag)
				{
				case 100:
					Map map1 = appkeyHandleMapper.selUserByUUID(keyValue);
					Integer userId = (Integer) map1.get("noid");
					Map map2 = appkeyHandleMapper.selTCountApplyById(orderNum, userId);
					Integer usedCnt = (Integer) map2.get("used_cnt")+1;
					Integer unUsedCnt = (Integer) map2.get("unused_cnt")-1;
					
					this.updateCntById(orderNum, userId);
					
					System.out.println(usedCnt);
					System.out.println(unUsedCnt);
					System.out.println(userId);
					//this.editCntById(orderNum, keyValue);
					return constellSelService.selAllConInfo(conNum, dateStr);
				case 101:
					map.put("status", "101");
					map.put("msg", "appkey为空或不存在");
					map.put("result", null);
					return gson.toJson(map);
				case 102:
					map.put("status", "102");
					map.put("msg", "appkey无请求此数据权限");
					map.put("result", null);
					return gson.toJson(map);
				case 103:
					map.put("status", "103");
					map.put("msg", "请求次数超过限制");
					map.put("result", null);
					return gson.toJson(map);
				case 104:
					map.put("status", "104");
					map.put("msg", "日期格式不正确或者日期最晚为当天日期");
					map.put("result", null);
					return gson.toJson(map);
				default:
					//this.editCntById(orderNum, keyValue);
					return constellSelService.selAllConInfo(conNum, dateStr);
				}			
			}
	
	/**
	 * 对接口调用参数的验证
	 * @param keyValue
	 * @param orderNum
	 * @return
	 */
	public Integer judge(String keyValue,Integer orderNum,String dateStr){
		//01.先判断appkey是否存在
		if(keyValue==null){
			return 101;
		}
		//02.判断通过uuid查询的用户信息
		Map map = appkeyHandleMapper.selUserByUUID(keyValue);
		if(map==null){
			return 101;
		}
		//03.通过apiid和userid获得对象
		Integer userId = (Integer) map.get("noid");
		map = appkeyHandleMapper.selTCountApplyById(orderNum, userId);
		//04.执行对对象的判断
		if(map==null){
			return 102;
		}
		//05.如果对象存在，执行对参数统计的查询
		Integer unUsedCnt = (Integer) map.get("unused_cnt");
		//06.对剩余统计的判断
		if(unUsedCnt<=0){
			return 103;
		}
		
		//07.对日期的判断
		SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		Date dateB;
		try {
			dateB = sdf.parse(dateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//日期格式不正确或者日期最晚为当天日期
			return 104;
		}
		
		//日期格式不正确或者日期最晚为当天日期
		long aa = date.getTime();
		long bb = dateB.getTime();	
		if((aa-bb)<0){
			return 104;
		}
			
		//00.如果都没有错误，返回一个100
		return 100;
	}
	
	public void updateCntById(Integer apiId,Integer userId){
		System.out.println("---------------------");
		Integer cnt = appkeyHandleMapper.updateCntById(apiId, userId);			
		System.out.println(cnt);
	}
	
	
	
		
}
