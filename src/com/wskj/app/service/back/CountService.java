package com.wskj.app.service.back;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wskj.app.mapper.back.CountMapper;

@Service
public class CountService {

	@Autowired
	private CountMapper countMapper;

	/**
	 * 获取总收入
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getCnt() {
		return countMapper.getCnt();
	}

	/**
	 * 首页，获取总收入
	 * @return
	 */
	public List<Map<String, Object>> getMoney() {
		return countMapper.getMoney();
	}

}
