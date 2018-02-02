package com.wskj.app.mapper.back;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface AdminMapper {

	/**
	 * 获得所有管理员
	 * 
	 * @return
	 */
	@Select("SELECT * FROM t_admin")
	List<Map> getAdminList();

	/**
	 * 获得所有管理员对应的权限
	 * 
	 * @param admin_id
	 * @return
	 */
	@Select("SELECT GROUP_CONCAT(tap.`power_name`) as power_name FROM t_ad_po_relation tapr"
			+ " JOIN t_admin_power tap ON tapr.admin_power_id=tap.noid"
			+ " JOIN t_admin ta ON ta.`noid`=tapr.`admin_id` WHERE ta.noid=#{param1}")
	List<Map> getAdminPowerList(Integer admin_id);

	/**
	 * 获得所有的权限数据
	 * 
	 * @return
	 */
	@Select("SELECT * FROM t_admin_power")
	List<Map> getAllPowerList();

	/**
	 * 执行新增addmin
	 * 
	 * @param admin_pwd
	 * @param admin_code
	 * @return
	 */
	@Insert("INSERT INTO t_admin (admin_code,admin_pwd) VALUES(#{param1},#{param2})")
	Integer add_admin_do(String admin_code, String admin_pwd);

	/**
	 * 根据code获得noid
	 * 
	 * @param admin_code
	 * @return
	 */
	@Select("SELECT noid FROM t_admin WHERE admin_code=#{param1}")
	Map getNoidByCode(String admin_code);

	/**
	 * 新增关系表
	 * 
	 * @param noid
	 * @param integer
	 */
	@Insert("INSERT INTO t_ad_po_relation (admin_id,admin_power_id) VALUES(#{param1},#{param2})")
	void add_relation_do(Integer noid, Integer integer);

	/**
	 * 执行管理员删除
	 * 
	 * @param noid
	 */
	@Delete("DELETE FROM t_admin WHERE noid=#{param1}")
	void del_admin_do(Integer noid);

	/**
	 * 执行新增权限power
	 * 
	 * @param power_name
	 * @param power_symbol
	 * @return
	 */
	@Insert("INSERT INTO t_admin_power (power_name,power_symbol) VALUES(#{param1},#{param2})")
	Integer add_power_do(String power_name, String power_symbol);

	/**
	 * 根据noid获得权限数据
	 * 
	 * @param noid
	 * @return
	 */
	@Select("SELECT * FROM t_admin_power WHERE noid=#{param1}")
	List<Map> getPowerByNoid(Integer noid);

	/**
	 * 执行编辑权限
	 * 
	 * @param noid
	 * @param power_name
	 * @param power_symbol
	 * @return
	 */
	@Update("UPDATE t_admin_power SET power_name=#{param2},power_symbol=#{param3} WHERE noid=#{param1}")
	void update_power_do(Integer noid, String power_name, String power_symbol);

	/**
	 * 执行权限删除
	 * 
	 * @param noid
	 */
	@Delete("DELETE FROM t_admin_power WHERE noid=#{param1}")
	void del_power_do(Integer noid);

	/**
	 * 进入管理员admin编辑页面
	 * 
	 * @param noid
	 * @return
	 */
	@Select("SELECT * FROM t_admin WHERE noid=#{param1}")
	List<Map> getAdminByNoid(Integer noid);

	/**
	 * 根据管理员noid获得权限管理员所有权限
	 * 
	 * @param noid
	 * @return
	 */
	@Select("SELECT tap.`power_name` as power_name FROM t_ad_po_relation tapr"
			+ " JOIN t_admin_power tap ON tapr.admin_power_id=tap.noid"
			+ " JOIN t_admin ta ON ta.`noid`=tapr.`admin_id` WHERE ta.noid=#{param1}")
	List<Map> getAllPowerByNoid(Integer noid);

	/**
	 * 删除关系表对应的权限
	 * 
	 * @param noid
	 */
	@Delete("DELETE FROM t_ad_po_relation WHERE admin_id=#{param1}")
	void del_relation_do(Integer admin_id);

	/**
	 * 编辑管理员
	 * 
	 * @param noid
	 * @param noid
	 * @param admin_code
	 * @param admin_pwd
	 * @param admin_pwd2
	 */
	@Update("UPDATE t_admin SET admin_code=#{param2},admin_pwd=#{param3} WHERE noid=#{param1}")
	void update_admin_do(Integer noid, String admin_code, String admin_pwd);

	/**
	 * 通过账号获取管理员信息
	 * 
	 * @param adminCode
	 * @return
	 */
	@Select("select noid,admin_code adminCode,admin_pwd adminPwd from t_admin where admin_code=#{param1}")
	Map<String, Object> checkAdmin(String adminCode);

	/**
	 * 获取当前用户的权限集合
	 * 
	 * @param noid
	 * @return
	 */
	@Select("SELECT p.`power_symbol` powerSymbol FROM t_ad_po_relation r LEFT JOIN"
			+ " t_admin_power p ON r.admin_power_id=p.`noid` WHERE admin_id=#{param1}")
	List<String> getPowersById(Integer noid);

}
