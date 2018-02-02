package com.wskj.app.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;

/**
 * 公告信息的Mapper接口
 * @author Administrator
 *
 */
@MapperScan
public interface NoticeMapper {
	
	/**
	 * 分页查询所有可用的公告信息
	 * 
	 * @param passSize 
	 * @param pageSize
	 * @return
	 */
	@Cacheable(value="noticeCache",key="'listByNotice'+#passSize+#pageSize")
	@Select("SELECT tno.noid,title,content,pic_url picUrl,create_time createTime,click,type_name typeName FROM t_notice tno "
			+ " left join t_notice_type tnot on tno.type_id=tnot.noid WHERE state=1 limit #{param1},#{param2}")
	List<Map<String, Object>> listByNotice(Integer passSize,Integer pageSize);
	
	
	/**
	 * 查询可用的公告信息总数
	 * 
	 * @param currPage 
	 * @return
	 */
	@Cacheable(value="noticeCache",key="'countNotice'")
	@Select("select count(noid)  from t_notice where state=1")
	long countNotice();

	
	/**
	 * 根据公告ID查询此公告详细信息
	 * 
	 * @param noid
	 * @return
	 */
	@Select("SELECT tno.noid,title,content,pic_url picUrl,create_time createTime,click,type_name typeName,type_id typeId,symbol,state,tno.order_numb orderNumb FROM t_notice tno"
	+ " left join t_notice_type tnot on tno.type_id=tnot.noid WHERE tno.noid=#{param1}")
	List<Map<String, Object>> getNoticeByNoid(Integer noid);
	
	
	/**
	 * 增加指定公告的点击量
	 * 
	 * @param noid
	 */
	@CacheEvict(value="noticeCache",allEntries=true)
	@Update("update t_notice set click=#{param1} where noid=#{param2}")
	void addNoticeClick(Integer click,Integer noid);
	
	
	/**
	 * 给公告信息点击量赋初始值
	 * 
	 * @param noid
	 */
	@Update("update t_notice set click=1 where noid=#{param1}")
	void setNoticeClick(Integer noid);
	
	
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
	@Select("<script> SELECT tno.noid,title,pic_url picUrl,create_time createTime,symbol,tno.order_numb orderNumb,state,click,type_name typeName,tnot.noid typeId "
			+ "FROM t_notice tno left join t_notice_type tnot on tno.type_id=tnot.noid "
			+ "<where><if test=\"title!=null\">title like '%${param3}%' </if>"
			+ "<if test=\"beginDate!=null\">and create_time&gt;#{param4} </if>"
			+ "<if test=\"endDate!=null\">and create_time&lt;#{param5} </if>"
			+ "<if test=\"typeId!=null\">and type_id=#{param6} </if>"
			+ "</where> limit #{param1},#{param2}</script>")
	List<Map<String, Object>> listByNoticeWithConditions(Integer page, Integer rows, @Param("title")String title,@Param("beginDate") String beginDate,
			@Param("endDate")String endDate,@Param("typeId") Integer typeId);
	
	
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
	@CacheEvict(value="noticeCache",allEntries=true)
	@Insert("insert into t_notice (title,symbol,type_id,order_numb,state,content,pic_url,create_time) values "
			+ "(#{param1},#{param2},#{param3},#{param4},#{param5},#{param6},#{param7},now())")
	int addNotice(String title, Integer symbol, Integer typeId, Integer orderNumb, Integer state, String content,
			String picUrl);
	
	/**
	 * 根据条件查询公告信息的总数
	 * 
	 * @param title
	 * @param beginDate
	 * @param endDate
	 * @param typeId
	 * @return
	 */
	@Select("<script>select count(tno.noid) FROM t_notice tno left join t_notice_type tnot on tno.type_id=tnot.noid "
			+ "<where><if test=\"title!=null\">title like '%${param1}%' </if>"
			+ "<if test=\"beginDate!=null\">and create_time&gt;#{param2} </if>"
			+ "<if test=\"endDate!=null\">and create_time&lt;#{param3} </if>"
			+ "<if test=\"typeId!=null\">and type_id=#{param4} </if>"
			+ "</where></script>")
	int countConditionsNotice(@Param("title")String title, @Param("beginDate")String beginDate,@Param("endDate") String endDate,@Param("typeId") Integer typeId);
	
	
	/**
	 * 根据noid删除公告信息
	 * 
	 * @param integer
	 * @return
	 */
	@CacheEvict(value="noticeCache",allEntries=true)
	@Delete("delete from t_notice where noid=#{param1}")
	int deleteNoticeById(Integer integer);
	
	
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
	@CacheEvict(value="noticeCache",allEntries=true)
	@Update("update t_notice set title=#{param1},symbol=#{param2},type_id=#{param3},order_numb=#{param4},state=#{param5},content=#{param6},pic_url=#{param7},click=#{param9},create_time=#{param10}"
			+ "where noid=#{param8}")
	int updateNotice(String title, Integer symbol, Integer typeId, Integer orderNumb, Integer state, String content,
			String picUrl, Integer noid, Integer click, String createTime);
	
	/**
	 * 删除公告信息图片
	 * 
	 * @param noticeNoid
	 * @return
	 */
	@CacheEvict(value="noticeCache",allEntries=true)
	@Delete("update t_notice set pic_url=null where noid=#{param1}")
	int deleteNoticePicture(Integer noticeNoid);
	
	/**
	 * 查询公告信息图片的地址
	 * 
	 * @param noticeNoid
	 * @return
	 */
	@Select("select pic_url from t_notice where noid=#{param1}")
	String getNoticePictureUrl(Integer noticeNoid);

}
