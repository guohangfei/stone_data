package com.wskj.app.mapper.back;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface ApplyMapper {
	/**
	 * 查询星座
	 * @return
	 */
	@Select("select * from ")
	List<Map<String, Object>> getApplyList_constellation();
	
	/**
	 * 查询天气
	 * @return
	 */
	@Select("select * from ")
	List<Map<String, Object>> getApplyList_weather();
	
	/**
	 * 查询黄历
	 * @return
	 */
	@Select("select * from ")
	List<Map<String, Object>> getApplyList_lucky_day();
	
	/**
	 * 查询彩票
	 * @return
	 */
	@Select("select * from ")
	List<Map<String, Object>> getApplyList_lottery();

	/**
	 * 获得所有的购买详情的列表信息
	 * @param api_id 
	 * @param user_id 
	 * @return
	 */
	@Select("SELECT * FROM t_apply_detail tad JOIN t_user ON t_user.`noid`=tad.`user_id` JOIN t_api ON tad.api_id=t_api.`noid` AND  tad.api_id=#{param2} AND tad.user_id=#{param1}")
	List<Map> getAppleDetailList(Integer user_id, Integer api_id);

	/**
	 * 获得统计（合计）的申请列表
	 * @return
	 */           
	@Select("SELECT * FROM t_count_apply tca JOIN t_user ON t_user.`noid`=tca.`user_id` JOIN t_api ON t_api.`noid`=tca.`api_id`")
	List<Map> getCountAppleList();

	/**
	 * AJAX获得已调用信息列表
	 * @param user_id
	 * @param api_id
	 * @param rows 
	 * @param page 
	 * @return
	 */
	@Select("SELECT * FROM t_use_detail tud JOIN t_user ON t_user.`noid`=tud.`user_id` JOIN t_api ON t_api.`noid`=tud.`api_id` AND tud.user_id=#{param1}"
			+ "  AND tud.api_id=#{param2} LIMIT #{param3},#{param4}")
	List<Map> getUseDetailList(Integer user_id, Integer api_id, Integer pageStart, Integer rows);

	/**
	 * 根据user_id，api_id获得总调用的条数
	 * @param user_id
	 * @param api_id
	 * @return
	 */
	@Select("SELECT COUNT(*) AS total FROM t_use_detail tud JOIN t_user ON t_user.`noid`=tud.`user_id` JOIN t_api ON t_api.`noid`=tud.`api_id` AND tud.user_id=#{param1}"
			+ "  AND tud.api_id=#{param2}")
	Map getAppleDetailTotal(Integer user_id, Integer api_id);

}
