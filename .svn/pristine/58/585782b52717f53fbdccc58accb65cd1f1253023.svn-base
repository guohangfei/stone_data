package com.wskj.app.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wskj.app.mapper.NoticeMapper;
import com.wskj.app.vo.PageInfo;

/**
 * 公告的service类
 * @author Administrator
 *
 */
@Service
public class NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;

	/**
	 * 分页查询全部公告的方法
	 * @param currPage 
	 * @return
	 */
	public PageInfo<Map<String,Object>> listByNotice(Integer currPage) {
		PageInfo<Map<String,Object>> pageInfo = new PageInfo<Map<String,Object>>();
		if(currPage==null){
			currPage=1;
			pageInfo.setPageSize(7);
		}
		//求出需跳过的信息数目
		int passSize = (currPage-1)*pageInfo.getPageSize();
		List<Map<String,Object>> notices =  noticeMapper.listByNotice(passSize,pageInfo.getPageSize());
		int totalSize = (int)noticeMapper.countNotice();
		pageInfo.setRows(notices);
		pageInfo.setCurrPage(currPage);
		pageInfo.setTotal(totalSize);
		return pageInfo;
	}
	
	
	/**
	 * 根据公告ID查询指定公告信息的方法
	 * @param noid
	 * @return
	 */
	public List<Map<String, Object>> getNoticeByNoid(Integer noid) {
		return noticeMapper.getNoticeByNoid(noid);
	}
	
	
	/**
	 * 增加指定公告信息点击量的方法
	 * @param noid
	 */
	public void addNoticeClick(Integer noid) {
		List<Map<String, Object>> list = getNoticeByNoid(noid);
		for (Map<String, Object> map : list) {
			if(map.get("click")!=null){
				int click = (int)map.get("click");
				click++;
				noticeMapper.addNoticeClick(click,noid);
				break;				
			}else{
				noticeMapper.setNoticeClick(noid);
				break;
			}
		}
	}
	
	
	/**
	 * 多条件分页查询所有公告信息
	 * 
	 * @param page
	 * @param rows
	 * @param title
	 * @param beginDate
	 * @param endDate
	 * @param typeId
	 * @return
	 */
	public PageInfo<Map<String, Object>> listByNoticeWithConditions(Integer page, Integer rows, String title, String beginDate,
			String endDate, Integer typeId) {
		PageInfo<Map<String,Object>> pageInfo = new PageInfo<Map<String,Object>>();
		int totalSize = noticeMapper.countConditionsNotice(title,beginDate,endDate,typeId);
		pageInfo.setTotal(totalSize);
		Integer jumpItem=(page-1)*rows;
		List<Map<String, Object>> list = noticeMapper.listByNoticeWithConditions(jumpItem,rows,title,beginDate,endDate,typeId);
		pageInfo.setRows(list);
		return pageInfo;
	}
	
	
	/**
	 * 添加公告信息
	 * 
	 * @param title
	 * @param symbol
	 * @param typeId
	 * @param orderNumb
	 * @param state
	 * @param content
	 * @param picUrl
	 * @return
	 */
	public int addNotice(String title, Integer symbol, Integer typeId, Integer orderNumb, Integer state,
			String content, String picUrl) {
		return noticeMapper.addNotice(title, symbol,typeId,orderNumb,state,content,picUrl);
	}
	
	
	/**
	 * 根据noid删除公告信息
	 * 
	 * @param integer
	 * @return
	 */
	public int deleteNoticeById(Integer integer) {
		return noticeMapper.deleteNoticeById(integer);
	}
	
	
	/**
	 * 根据noid修改公告信息
	 * 
	 * @param title
	 * @param symbol
	 * @param typeId
	 * @param orderNumb
	 * @param state
	 * @param content
	 * @param picUrl
	 * @param noid
	 * @param click
	 * @param createTime
	 * @return
	 */
	public int updateNotice(String title, Integer symbol, Integer typeId, Integer orderNumb, Integer state,
			String content, String picUrl, Integer noid, Integer click, String createTime) {
		return noticeMapper.updateNotice(title, symbol,typeId,orderNumb,state,content,picUrl,noid,click,createTime);
	}
	
	
	/**
	 * 删除公告信息图片
	 * 
	 * @param noticeNoid
	 * @return
	 */
	public int deleteNoticePicture(Integer noticeNoid) {
		return noticeMapper.deleteNoticePicture(noticeNoid);
	}
	
	
	/**
	 * 查询公告信息图片的地址
	 * 
	 * @param noticeNoid
	 * @return
	 */
	public String getNoticePictureUrl(Integer noticeNoid) {
		return noticeMapper.getNoticePictureUrl(noticeNoid);
	}

}
