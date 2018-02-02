package com.wskj.app.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;

/**
 * 广告信息的Mapper接口
 * @author Administrator
 *
 */
@MapperScan
public interface PublicityMapper {
	
	/**
	 * 分页查询所有可用的广告信息
	 * @param currPage 
	 * @return
	 */
	@Cacheable(value="publicityCache",key="'listByPublicity'+#passSize+#pageSize")
	@Select("SELECT tp.noid,type_id typeId,title,content,pic_url picUrl,create_time createTime,click,"
			+ "link_url linkUrl,type_name typeName FROM t_publicity tp left join t_publicity_type tpt on tp.type_id=tpt.noid"
			+ " WHERE state=1 limit #{param1},#{param2}")
	List<Map<String, Object>> listByPublicity(Integer passSize,Integer pageSize);
	
	/**
	 * 查询可用的广告信息总数
	 * @param currPage 
	 * @return
	 */
	@Cacheable(value="publicityCache",key="'countPublicity'")
	@Select("select count(noid)  from t_publicity where state=1")
	long countPublicity();


	/**
	 * 根据广告ID查询此广告详细信息
	 * @param noid
	 * @return
	 */
	@Select("SELECT tp.noid,type_id typeId,title,content,pic_url picUrl,create_time createTime,click,"
			+ "link_url linkUrl,type_name typeName FROM t_publicity tp left join t_publicity_type tpt on tp.type_id=tpt.noid"
			+ " WHERE tp.noid=#{param1}")
	List<Map<String, Object>> getPublicityeByNoid(Integer noid);
	
	/**
	 * 增加指定广告的点击量
	 * @param noid
	 */
	@CacheEvict(value="publicityCache",allEntries=true)
	@Update("update t_publicity set click=#{param1} where noid=#{param2}")
	void addPublicityClick(Integer click, Integer noid);
}
