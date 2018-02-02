package com.wskj.app.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.cache.annotation.CacheEvict;

/**
 * 广告、公告类Mapper接口
 * @author Administrator
 *
 */
@MapperScan
public interface WeatherMapper {

	/**
	 * 插入省份
	 * @param province_name
	 */
	@CacheEvict(value="weatherCache",allEntries=true)
	@Insert("INSERT INTO t_province (province_name) VALUES(#{param1})")
	void addProvince(String province_name);

	/**
	 * 根据省份名称获得Noid
	 * @param province_name
	 * @return
	 */
	@Select("SELECT noid FROM t_province WHERE province_name=#{param1}")
	Integer getNoidByProvinceName(String province_name);

	/**
	 * 新增城市列表
	 * @param city_name
	 * @param proNoid
	 * @return
	 */
	@CacheEvict(value="weatherCache",allEntries=true)
	@Insert("INSERT INTO t_city (city_name,province_id) VALUES(#{param1},#{param2})")
	void addCity(String city_name, Integer proNoid);

	/**
	 * 根据城市名称获得城市Id
	 * @param city_name
	 * @param proNoid 
	 * @return
	 */
	@Select("SELECT noid FROM t_city WHERE city_name=#{param1} and province_id=#{param2}")
	Integer getNoidByCityName(String city_name, Integer proNoid);

	/***
	 * 新增区县
	 * @param dis_name
	 * @param cityNoid
	 * @param proNoid
	 */
	@CacheEvict(value="weatherCache",allEntries=true)
	@Insert("INSERT INTO t_district (district_name,city_id,province_id) VALUES(#{param1},#{param2},#{param3})")
	void addDis(String dis_name, Integer cityNoid, Integer proNoid);

	/**
	 *  根据天气状况获得noid
	 * @param weather_detail
	 * @return
	 */
	@Select("SELECT noid FROM t_weather_detail WHERE weather_detail=#{param1}")
	Integer getNoidByWeatherDetail(String weather_detail);

	/**
	 * 删除所有天气数据
	 */
	@CacheEvict(value="weatherCache",allEntries=true)
	@Delete("truncate table t_weather")
	void delAllWeatherData();


	/**
	 * 插入全国各地区七天的天气数据
	 * @param province_name
	 * @param city_name
	 * @param dis_name
	 * @param weather_date
	 * @param max_temp
	 * @param nin_temp
	 * @param weather_detail_img_end 
	 * @param weather_detail_img_sta 
	 * @param humidity
	 * @param air_quality
	 */
	@CacheEvict(value="weatherCache",allEntries=true)
	@Insert("INSERT  INTO t_weather (province_name,city_name,district_name,weather_date,max_temp,min_temp,wind_level,weather_detail,weather_detail_img_sta,weather_detail_img_end,humidity,air_quality)"
			+ " VALUES(#{param1},#{param2},#{param3},#{param4},#{param5},#{param6},#{param7},#{param8},#{param9},#{param10},#{param11},#{param12})")
	void addDisWeather(String province_name, String city_name, String dis_name, String weather_date, String max_temp,
			String nin_temp, String wind_level, String weather_detail, String weather_detail_img_sta, String weather_detail_img_end, String humidity, String air_quality);

	
	/**
	 *  根据条件获得数据库数据
	 * @param province_name
	 * @param city_name
	 * @param districe_name
	 * @param weather_date
	 * @return
	 */
	@Select("<script> select * from t_weather where 1=1 "
			+ " <if test=\"province_name!= null\">and province_name = #{param1}</if>"
			+ " <if test=\"city_name!=null\">and city_name=#{param2} </if>"
			+ " <if test=\"district_name!= null\">and district_name=#{param3} </if>"
 			+ " <if test=\"weather_date!= null\">and weather_date LIKE #{param4} </if>"
			+ " </script>")
	List<Map> getWeatherbyData(@Param("province_name")String province_name, @Param("city_name")String city_name, @Param("district_name")String district_name,@Param("weather_date")String weather_date);

	/**
	 * 删除所有的地区
	 */
	@CacheEvict(value="weatherCache",allEntries=true)
	@Delete("DELETE FROM t_district")
	void delAllDistrict();

	/**
	 * 删除所有的城市
	 */
	@CacheEvict(value="weatherCache",allEntries=true)
	@Delete("DELETE FROM t_city")
	void delAllCity();

	/**
	 * 删除所有的省
	 */
	@CacheEvict(value="weatherCache",allEntries=true)
	@Delete("DELETE FROM t_province")
	void delAllProvince();

	/**
	 * 获得天气的api数据
	 * @return
	 */
	@Select("SELECT * FROM t_set_meal tsm JOIN t_api ON tsm.`api_id`=t_api.noid  WHERE price >0 AND api_id=1 ORDER BY price LIMIT 0,1")
	List<Map> getWeatherApi();

	/**
	 * 根据key获得天气数据
	 * @param appkey
	 * @return
	 */
	@Select("SELECT * FROM t_user WHERE app_key=#{param1}")
	List<Map> getWeatherDataByKey(String appkey);

	/**
	 * 根据用户id 和api id获得现用的用户购买数据情况
	 * @param user_id
	 * @param api_id
	 * @return
	 */
	@Select("SELECT * FROM t_count_apply WHERE  user_id=#{param1} AND api_id=#{param2}")
	List<Map> getCountApply(Integer user_id, Integer api_id);

	/**
	 * 变更count_apply统计数据 未用-1 已使用+1
	 * @param user_id
	 * @param api_id
	 */
	@Update("UPDATE t_count_apply SET used_cnt =used_cnt+1,unused_cnt=unused_cnt-1 WHERE api_id=#{param2} AND user_id=#{param1}")
	void updateCountDate(Integer user_id, Integer api_id);

	/**
	 * 新增调用详情
	 * @param user_id
	 * @param api_id
	 * @param use_ip
	 * @param use_url
	 * @param params
	 * @param str
	 */
	@Insert("INSERT INTO t_use_detail (user_id,api_id,use_time,use_ip,use_url,params,return_json)"
			+ " VALUES(#{param1},#{param2},NOW(), #{param3},#{param4},#{param5},#{param6})")
	void addUseDetail(Integer user_id, Integer api_id, String use_ip, String use_url, String params, String str);

}
