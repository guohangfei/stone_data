package com.wskj.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wskj.app.mapper.NoticeTypeMapper;

/**
 * 公告分类信息Service
 * @author Administrator
 *
 */
@Service
public class NoticeTypeService {

	@Autowired
	private NoticeTypeMapper noticeTypeMapper;
	
	
	/**
	 * 查询全部公告分类信息
	 * 
	 * @return
	 */
	public List<Map<String, Object>> listByNoticeType() {
		return noticeTypeMapper.listByNoticeType();
	}
	
	
	/**
	 * 根据noid删除公告分类信息
	 * 
	 * @param parseInt
	 * @return
	 */
	public int deleteNoticeTypeById(int parseInt) {
		return noticeTypeMapper.deleteNoticeTypeById(parseInt);
	}
	
	
	/**
	 * 修改公告分类信息
	 * 
	 * @param typeName
	 * @param typeSymbol
	 * @param typeOrderNumb
	 * @param noid
	 * @return
	 */
	public int updateNoticeType(String typeName, Integer typeSymbol, Integer typeOrderNumb, Integer noid) {
		return noticeTypeMapper.updateNoticeType(typeName,typeSymbol,typeOrderNumb,noid);
	}
	
	
	/**
	 * 查询指定公告分类信息
	 * 
	 * @param noid
	 * @return
	 */
	public List<Map<String, Object>> getNoticeTypeByNoid(Integer noid) {
		return noticeTypeMapper.getNoticeTypeByNoid(noid);
	}
	
	
	/**
	 * 添加公告分类信息
	 * 
	 * @param typeName
	 * @param typeSymbol
	 * @param typeOrderNumb
	 * @return
	 */
	public int addNoticeType(String typeName, Integer typeSymbol, Integer typeOrderNumb) {
		return noticeTypeMapper.addNoticeType(typeName,typeSymbol,typeOrderNumb);
	}
}
