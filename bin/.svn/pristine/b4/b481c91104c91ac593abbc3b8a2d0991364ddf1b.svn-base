package com.wskj.app.mapper.back;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.cache.annotation.CacheEvict;

import com.wskj.app.vo.Publicity;
import com.wskj.app.vo.PublicityType;

@MapperScan
public interface PublicityBackMapper {

	//查询展示所有广告信息
	@Select("SELECT * FROM `t_publicity`")
	List<Map> getPubList();
	
	//查询所有广告分类
	@Select("SELECT * FROM `t_publicity_type`")
	List<Map> getPubTypeList();
	
	//删除广告分类(执行删除广告分类)
	@CacheEvict(value="publicityCache",allEntries=true)
	@Delete("DELETE FROM `t_publicity_type` WHERE `noid`=#{param1}")
    String delPubTyExecute(Integer noid);
	
	//增加广告分类(执行增加广告分类)
	@CacheEvict(value="publicityCache",allEntries=true)
	@Insert("INSERT INTO `t_publicity_type` (`type_name`,`type_symbol`,`order_numb`) VALUES (#{param1},#{param2},#{param3})")
	Integer addPubTyExecute(String type_name, Integer type_symbol, Integer order_numb);
	
	//回顯要修改的項
	@Select("SELECT * FROM `t_publicity_type` WHERE `noid`=#{param1}")
	List<Map> getPubTypeListByNoid(Integer noid);
	//執行修改分類
	@CacheEvict(value="publicityCache",allEntries=true)
	@Update("UPDATE `t_publicity_type` SET `type_name`=#{param1},`type_symbol`=#{param2},`order_numb`=#{param3} WHERE `noid`=#{param4}")
	Integer updatePubTyExecute(String type_name, Integer type_symbol, Integer order_numb, Integer noid);

	//执行删除广告信息
	@CacheEvict(value="publicityCache",allEntries=true)
	@Delete("DELETE FROM `t_publicity` WHERE `noid`=#{param1}")
	void delPubExecute(Integer noid);
	
	//查询分类的可选项内容
	@Select("SELECT * FROM `t_publicity_type`")
	List<Map> getAllTypes();

	//增加广告(执行增加广告)
	@CacheEvict(value="publicityCache",allEntries=true)
	@Insert("INSERT INTO `t_publicity` (`title`,`content`,`type_id`,`pic_url`,`link_url`,`order_numb`,`create_time`,`state`,`click`) VALUES (#{param1},#{param2},#{param3},#{param4},#{param5},#{param6},#{param7},#{param8},#{param9})")
	Integer addPubExecute(String title, String content, Integer type_id, String pic_url, String link_url,
			Integer order_numb, Date create_time, Integer state, Integer click);
	
	//回顯要修改的广告項
	@Select("SELECT * FROM `t_publicity` WHERE `noid`=#{param1}")
	List<Map> getPubOne(Integer noid);

	//修改广告（执行修改广告）
	@CacheEvict(value="publicityCache",allEntries=true)
	@Update("UPDATE `t_publicity` SET `title`=#{param1},`content`=#{param2},`type_id`=#{param3},`pic_url`=#{param4},`link_url`=#{param5},`order_numb`=#{param6},`state`=#{param7} WHERE `noid`=#{param8}")
	Integer updatePubExecute(String title, String content, Integer type_id, String pic_url, String link_url,
			Integer order_numb, Integer state, Integer noid);
	
	
}
