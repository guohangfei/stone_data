package com.wskj.app.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wskj.app.mapper.WeatherMapper;

@Service
public class WeatherService {

	@Autowired
	private WeatherMapper weatherMapper;

	/**
	 * 插入所有省份
	 * @param text
	 */
	public void addProvince(String province_name) {
		// TODO Auto-generated method stub
		weatherMapper.addProvince(province_name);
	}

	/**
	 * 根据省份名称获得Id
	 * @param province_name
	 * @return
	 */
	public Integer getNoidByProvinceName(String province_name) {
		
		return weatherMapper.getNoidByProvinceName(province_name);
	}

	/**
	 * 新增城市列表
	 * @param city_name
	 * @param proNoid
	 * @return 
	 */
	public void addCity(String city_name, Integer proNoid) {
		 weatherMapper.addCity(city_name,proNoid);
	}

	/**
	 * 根据城市名称获得城市Id
	 * @param city_name
	 * @param proNoid 
	 * @return
	 */
	public Integer getNoidByCityName(String city_name, Integer proNoid) {
		// TODO Auto-generated method stub
		return weatherMapper.getNoidByCityName(city_name,proNoid);
	}

	/***
	 * 新增区县
	 * @param dis_name
	 * @param cityNoid
	 * @param proNoid
	 */
	public void addDis(String dis_name, Integer cityNoid, Integer proNoid) {
		weatherMapper.addDis(dis_name,cityNoid,proNoid);
	}

	/**
	 * 根据天气状况获得noid
	 * @param weather_detail
	 * @return
	 */
	public Integer getNoidByWeatherDetail(String weather_detail) {
		// TODO Auto-generated method stub
		return weatherMapper.getNoidByWeatherDetail(weather_detail);
	}

	/**
	 * 删除所有天气数据
	 */
	public void delAllWeatherData() {
		// TODO Auto-generated method stub
		weatherMapper.delAllWeatherData();
	}

	/**
	 * 插入全国各地区七天的天气数据
	 * @param province_name
	 * @param city_name
	 * @param dis_name
	 * @param weather_date
	 * @param max_temp
	 * @param nin_temp
	 * @param wind_level 
	 * @param weather_detail_img_end 
	 * @param weather_detail_img_sta 
	 * @param humidity
	 * @param humidity2 
	 * @param air_quality
	 */
	public void addDisWeather(String province_name, String city_name, String dis_name, String weather_date,
			String max_temp, String nin_temp, String wind_level, String weather_detail, String weather_detail_img_sta, String weather_detail_img_end, String humidity,
			String air_quality) {
		weatherMapper.addDisWeather(province_name,city_name,dis_name,weather_date,
				max_temp,nin_temp,wind_level,weather_detail,weather_detail_img_sta,weather_detail_img_end,humidity,air_quality);
		
	}

	/**
	 *  根据条件获得数据库数据
	 * @param province_name
	 * @param city_name
	 * @param districe_name
	 * @param weather_date
	 * @return
	 */
	 public List<Map> getWeatherbyData(String province_name, String city_name, String district_name,
				String weather_date) {
			// TODO Auto-generated method stub
			return weatherMapper.getWeatherbyData(province_name,city_name,district_name,weather_date);
		}
	

	/**
	 * 删除所有的地区
	 */
	public void delAllDistrict() {
		// TODO Auto-generated method stub
		weatherMapper.delAllDistrict();
	}

	/**
	 * 删除所有的城市
	 */
	public void delAllCity() {
		// TODO Auto-generated method stub
		weatherMapper.delAllCity();
		
	}

	/**
	 * 删除所有的省
	 */
	public void delAllProvince() {
		// TODO Auto-generated method stub
		weatherMapper.delAllProvince();
	}

	/**
	 * 获得天气的api数据
	 * @return
	 */
	public List<Map> getWeatherApi() {
		// TODO Auto-generated method stub
		return weatherMapper.getWeatherApi();
	}

	/**
	 * 根据key获得天气数据
	 * @param appkey
	 * @return
	 */
	public List<Map> getWeatherDataByKey(String appkey) {
		// TODO Auto-generated method stub
		return weatherMapper.getWeatherDataByKey(appkey);
	}

	/**
	 * 根据用户id 和api id获得现用的用户购买数据情况
	 * @param user_id
	 * @param api_id
	 * @return
	 */
	public List<Map> getCountApply(Integer user_id, Integer api_id) {
		// TODO Auto-generated method stub
		return weatherMapper.getCountApply(user_id,api_id);
	}

	/**
	 * 变更count_apply统计数据 未用-1 已使用+1
	 * @param user_id
	 * @param api_id
	 */
	public void updateCountDate(Integer user_id, Integer api_id) {
		// TODO Auto-generated method stub
		weatherMapper.updateCountDate(user_id,api_id);
	}

	/**
	 * 新增调用详情
	 * @param user_id
	 * @param api_id
	 * @param use_ip
	 * @param use_url
	 * @param params
	 * @param str
	 */
	public void addUseDetail(Integer user_id, Integer api_id, String use_ip, String use_url, String params,
			String str) {
		// TODO Auto-generated method stub
		weatherMapper.addUseDetail(user_id,api_id,use_ip,use_url,params,str);
	}



	
	
}
