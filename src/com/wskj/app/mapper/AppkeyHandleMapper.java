package com.wskj.app.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.mybatis.spring.annotation.MapperScan;
/**
 * 尝试用动态的的mybatis sql语句
 * @author Administrator
 *
 */
@MapperScan
public interface AppkeyHandleMapper {
	
	/**
	 * 通过uuid获得用户对象
	 * @param uuid
	 * @return
	 */
	@Select("SELECT * FROM t_user WHERE app_key=#{param1}")
	Map selUserByUUID(String uuid);
	
	/**
	 * 通过apiid和userid获得对象""
	 * @param apiId
	 * @param userId
	 * @return
	 */
	@Select("SELECT * FROM t_count_apply WHERE api_id=#{param1} AND user_id=#{param2}")
	Map selTCountApplyById(Integer apiId,Integer userId);
	
	/**
	 * 执行对对象的修改
	 * @param apiId
	 * @param userId
	 * @param usedCnt
	 * @param unUsedCnt
	 */
	@Update("UPDATE t_count_apply SET used_cnt=used_cnt+1,unused_cnt=unused_cnt-1,all_apply_cnt=all_apply_cnt+1  WHERE api_id=#{param1}  AND user_id=#{param2}")
	Integer updateCntById(Integer apiId,Integer userId);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
