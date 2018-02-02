package com.wskj.app.mapper.back;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface DataApiMapper {

	/**
	 * 获取接口列表
	 * @return
	 */
	@Select("SELECT api.noid,api.`api_name` apiName,api.`api_detail` apiDetail,api.`order_numb` orderNumb,"
			+ "CONCAT(meal.`number`,'条/',meal.`price`,'元') meal "
			+ "FROM t_api api LEFT JOIN t_set_meal meal ON api.`default_meal`=meal.`noid` ")
	List<Map<String, Object>> getApiList();

	/**
	 * 获取单条接口信息
	 * @param noid
	 * @return
	 */
	@Select("SELECT api.noid noid,api.`api_name` apiName,api.`api_detail` apiDetail,api.`order_numb` orderNumb,"
			+ "meal.`noid` mealId,CONCAT(meal.`number`,'条/',meal.`price`,'元') meal FROM t_api api LEFT JOIN t_set_meal meal"
			+ " ON api.`default_meal`=meal.`noid` WHERE api.`noid`=#{param1}")
	Map<String, Object> getApiMap(Integer noid);

	/**
	 * 获取对应接口的套餐集合
	 * @param noid
	 * @return
	 */
	@Select("SELECT noid mealId,CONCAT(number,'条/',price,'元') meal FROM t_set_meal WHERE api_id=#{param1}")
	List<Map<String, Object>> getMeals(Integer noid);

	/**
	 * 修改Api接口信息
	 * @param apiName
	 * @param apiDetail
	 * @param orderNumb
	 * @param meal
	 * @return
	 */
	@Update("update t_api set api_name=#{param1},api_detail=#{param2},order_numb=#{param3},default_meal=#{param4} where noid=#{param5}")
	Integer updateApi(String apiName, String apiDetail, Integer orderNumb, Integer meal,Integer noid);

	/**
	 * 获取接口资费套餐列表
	 * @return
	 */
	@Select("SELECT meal.noid noid,api.`api_name` apiName,meal.name meal, meal.`number` number,"
			+ "meal.`price` price FROM t_set_meal meal LEFT JOIN t_api  api "
			+ "ON meal.`api_id`=api.`noid` ")
	List<Map<String, Object>> getMealList();

	/**
	 * 获取要修改的资费信息的单条记录
	 * @param noid
	 * @return
	 */
	@Select("SELECT meal.noid noid,api.`api_name` apiName,meal.`name` mealLevel,meal.`number` numb,meal.`price` price"
			+ " FROM t_set_meal meal LEFT JOIN t_api api ON meal.`api_id`=api.noid WHERE meal.noid=#{param1}")
	Map<String, Object> getMealMap(Integer noid);

	/**
	 * 修改资费信息的方法
	 * @param noid
	 * @param numb
	 * @param price
	 * @return
	 */
	@Update("update t_set_meal set number=#{param2},price=#{param3} where noid=#{param1}")
	Integer updatMeal(Integer noid, Integer numb, BigDecimal price);

	/**
	 * 检查顺序号是否存在
	 * @param orderNumb
	 * @return
	 */
	@Select("select noid from t_api where order_numb=#{param1}")
	Integer checkOrderNumb(Integer orderNumb);

}
