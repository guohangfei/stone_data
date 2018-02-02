package com.wskj.app.service.back;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wskj.app.mapper.back.DataApiMapper;

@Service
public class DataApiService {

	@Autowired
	private DataApiMapper dataApiMapper;

	/**
	 * 获取接口列表
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getApiList() {
		return dataApiMapper.getApiList();
	}

	/**
	 * 获取单条接口信息
	 * 
	 * @param noid
	 * @return
	 */
	public Map<String, Object> getApiMap(Integer noid) {
		return dataApiMapper.getApiMap(noid);
	}

	/**
	 * 获取对应接口的套餐
	 * 
	 * @param noid
	 * @return
	 */
	public List<Map<String, Object>> getMeals(Integer noid) {
		return dataApiMapper.getMeals(noid);
	}

	/**
	 * 修改Api接口信息
	 * 
	 * @param apiName
	 * @param apiDetail
	 * @param orderNumb
	 * @param meal
	 * @return
	 */
	public Integer updateApi(String apiName, String apiDetail, Integer orderNumb, Integer meal, Integer noid) {
		return dataApiMapper.updateApi(apiName, apiDetail, orderNumb, meal, noid);
	}

	/**
	 * 获取接口资费套餐列表
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getMealList() {
		return dataApiMapper.getMealList();
	}

	/**
	 * 获取一条套餐资费列表
	 * 
	 * @param noid
	 * @return
	 */
	public Map<String, Object> getMealMap(Integer noid) {
		return dataApiMapper.getMealMap(noid);
	}

	/**
	 * 修改资费套餐
	 * @param noid
	 * @param numb
	 * @param noid2
	 * @return
	 */
	public Integer updateMeal(Integer noid, Integer numb, BigDecimal price) {
		return dataApiMapper.updatMeal(noid,numb,price);
	}

	/**
	 * 检查顺序号是否存在
	 * @param orderNumb
	 * @return
	 */
	public Integer checkOrderNumb(Integer orderNumb) {
		return dataApiMapper.checkOrderNumb(orderNumb);
	}

}
