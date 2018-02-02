package com.wskj.app.service.back;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wskj.app.mapper.back.ApplyMapper;

@Service
public class ApplyService {

	@Autowired
	private ApplyMapper applyMapper;

	/**
	 * 获取星座列表
	 * @return
	 */
	public List<Map<String, Object>> getApplyList_constellation(){
		return applyMapper.getApplyList_constellation();
	}
	
	/**
	 * 获取天气列表
	 * @return
	 */
	public List<Map<String, Object>> getApplyList_weather(){
		return applyMapper.getApplyList_weather();
	}
	
	/**
	 * 获取黄历列表
	 * @return
	 */
	public List<Map<String, Object>> getApplyList_lucky_day(){
		return applyMapper.getApplyList_lucky_day();
	}
	
	/**
	 * 获取彩票列表
	 * @return
	 */
	public List<Map<String, Object>> getApplyList_lottery(){
		return applyMapper.getApplyList_lottery();
	}

	/**
	 * 获得所有的购买的列表信息
	 * @param api_id 
	 * @param user_id 
	 * @return
	 */
	public List<Map> getAppleDetailList(Integer user_id, Integer api_id) {
		// TODO Auto-generated method stub
		return applyMapper.getAppleDetailList(user_id,api_id);
	}

	/**
	 * 获得统计（合计）的申请列表
	 * @return
	 */
	public List<Map> getCountAppleList() {
		// TODO Auto-generated method stub
		return applyMapper.getCountAppleList();
	}

	/**
	 * AJAX获得已调用信息列表
	 * @param user_id
	 * @param api_id
	 * @param rows 
	 * @param page 
	 * @return
	 */
	public List<Map> getUseDetailList(Integer user_id, Integer api_id, Integer pageStart, Integer rows) {
		// TODO Auto-generated method stub
		return applyMapper.getUseDetailList(user_id,api_id,pageStart,rows);
	}

	/**
	 * 根据user_id，api_id获得总调用的条数
	 * @param user_id
	 * @param api_id
	 * @return
	 */
	public Map getAppleDetailTotal(Integer user_id, Integer api_id) {
		// TODO Auto-generated method stub
		Map ma=applyMapper.getAppleDetailTotal(user_id,api_id);
		return ma;
	}

}
