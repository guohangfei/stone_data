package com.wskj.app.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.cache.annotation.CacheEvict;

/**
 * 公告分类信息Mapper
 * @author Administrator
 *
 */
@MapperScan
public interface NoticeTypeMapper {
	
	/**
	 * 查询全部公告分类信息
	 * 
	 * @return
	 */
	@Select("select noid,type_name typeName,type_symbol,order_numb from t_notice_type")
	List<Map<String, Object>> listByNoticeType();
	
	
	/**
	 * 根据noid删除公告分类信息
	 * 
	 * @param parseInt
	 * @return
	 */
	@CacheEvict(value="noticeCache",allEntries=true)
	@Delete("delete from t_notice_type where noid=#{param1}")
	int deleteNoticeTypeById(int parseInt);
	
	
	/**
	 * 修改公告分类信息
	 * 
	 * @param typeName
	 * @param typeSymbol
	 * @param typeOrderNumb
	 * @param noid
	 * @return
	 */
	@CacheEvict(value="noticeCache",allEntries=true)
	@Update("update t_notice_type set type_name=#{param1},type_symbol=#{param2},order_numb=#{param3} where noid=#{param4}")
	int updateNoticeType(String typeName, Integer typeSymbol, Integer typeOrderNumb, Integer noid);
	
	
	/**
	 * 根据noid查询公告分类信息
	 * 
	 * @param noid
	 * @return
	 */
	@Select("select noid,type_name typeName,type_symbol typeSymbol,order_numb typeOrderNumb from t_notice_type where noid=#{param1}")
	List<Map<String, Object>> getNoticeTypeByNoid(Integer noid);
	
	
	/**
	 * 添加公告分类信息
	 * 
	 * @param typeName
	 * @param typeSymbol
	 * @param typeOrderNumb
	 * @return
	 */
	@CacheEvict(value="noticeCache",allEntries=true)
	@Insert("insert into t_notice_type (type_name,type_symbol,order_numb) values (#{param1},#{param2},#{param3})")
	int addNoticeType(String typeName, Integer typeSymbol, Integer typeOrderNumb);
}
