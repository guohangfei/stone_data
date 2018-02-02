package com.wskj.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wskj.app.mapper.PublicityMapper;
import com.wskj.app.vo.PageInfo;

/**
 * 广告的service类
 * @author Administrator
 *
 */
@Service
public class PublicityService {
	
	@Autowired
	private PublicityMapper publicityMapper;

	/**
	 * 分页查找全部广告的方法
	 * @param currPage 
	 * @return
	 */
	public PageInfo<Map<String, Object>> listByPublicity(Integer currPage) {
		PageInfo<Map<String,Object>> pageInfo = new PageInfo<Map<String,Object>>();
		if(currPage==null){
			currPage=1;
			pageInfo.setPageSize(7);
		}
		//求出需跳过的信息数目
		int passSize = (currPage-1)*pageInfo.getPageSize();
		List<Map<String,Object>> publicities =  publicityMapper.listByPublicity(passSize,pageInfo.getPageSize());
		int totalSize = (int)publicityMapper.countPublicity();
		pageInfo.setCurrPage(currPage);
		pageInfo.setRows(publicities);
		pageInfo.setTotal(totalSize);
		return pageInfo;
	}
	
	/**
	 * 根据广告ID查询此广告详细信息
	 * @param noid
	 * @return
	 */
	public List<Map<String, Object>> getPublicityeByNoid(Integer noid) {
		return publicityMapper.getPublicityeByNoid(noid);
	}
	
	/**
	 * 增加指定广告信息点击量的方法
	 * @param noid
	 */
	public void addPublicityClick(Integer noid) {
		List<Map<String, Object>> list = getPublicityeByNoid(noid);
		for (Map<String, Object> map : list) {
			if(map.get("click")!=null){
				int click = (int)map.get("click");
				click++;
				publicityMapper.addPublicityClick(click,noid);
				break;				
			}
		}
	}
}
