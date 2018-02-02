package com.wskj.app.mapper.back;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface CountMapper {
	/**
	 * 获取总收入
	 * 
	 * @return
	 */
	@Select("SELECT api.`api_name` apiName,IFNULL(SUM(cnt.all_apply_money),0) cntMoney,"
			+ "IFNULL(SUM(cnt.`all_apply_cnt`),0) cntItem,IFNULL(SUM(cnt.`used_cnt`),0) usedCnt,"
			+ "IFNULL(SUM(cnt.`unused_cnt`),0) unusedCnt FROM t_count_apply cnt RIGHT JOIN "
			+ "t_api api ON api.noid=cnt.`api_id` GROUP BY api.`api_name`")
	List<Map<String, Object>> getCnt();
	
	/**
	 * 首页 ，获取总收入
	 * @return
	 */
	@Select("SELECT api.`api_name` apiName,IFNULL(SUM(cnt.`all_apply_money`),0) cntMoney "
			+ "FROM t_count_apply cnt RIGHT JOIN t_api api ON api.`noid`=cnt.`api_id` "
			+ "GROUP BY api.`api_name`")
	List<Map<String, Object>> getMoney();

}
