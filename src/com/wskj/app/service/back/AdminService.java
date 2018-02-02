package com.wskj.app.service.back;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wskj.app.mapper.back.AdminMapper;

@Service
public class AdminService {

	@Autowired
	private AdminMapper adminMapper;

	/**
	 * 从数据库获得所有的管理员列表
	 */
	public List<Map> getAdminList() {
		// TODO Auto-generated method stub
		return adminMapper.getAdminList();
	}

	/**
	 * 从数据库获得所有的管理员对应的权限列表
	 * 
	 * @param admin_id
	 */
	public List<Map> getAdminPowerList(Integer admin_id) {
		// TODO Auto-generated method stub
		return adminMapper.getAdminPowerList(admin_id);
	}

	/**
	 * 得到所有的权限
	 * 
	 * @return
	 */
	public List<Map> getAllPowerList() {
		// TODO Auto-generated method stub
		return adminMapper.getAllPowerList();
	}

	/**
	 * 执行新增admin
	 * 
	 * @param admin_pwd
	 * @param admin_code
	 * @return
	 */
	public Integer add_admin_do(String admin_code, String admin_pwd) {
		// TODO Auto-generated method stub
		return adminMapper.add_admin_do(admin_code, admin_pwd);
	}

	/**
	 * 根据code获得noid
	 * 
	 * @param admin_code
	 * @return
	 */
	public Integer getNoidByCode(String admin_code) {
		// TODO Auto-generated method stub
		Map ma = adminMapper.getNoidByCode(admin_code);
		return (Integer) ma.get("noid");
	}

	/**
	 * 新增关系表
	 * 
	 * @param noid
	 * @param integer
	 */
	public void add_relation_do(Integer noid, Integer integer) {
		// TODO Auto-generated method stub
		adminMapper.add_relation_do(noid, integer);
	}

	/**
	 * 执行管理员删除
	 * 
	 * @param noid
	 */
	public void del_admin_do(Integer noid) {
		// TODO Auto-generated method stub
		adminMapper.del_admin_do(noid);
	}

	/**
	 * 执行权限新增
	 * 
	 * @param power_name
	 * @param power_symbol
	 * @return
	 */
	public Integer add_power_do(String power_name, String power_symbol) {
		// TODO Auto-generated method stub
		return adminMapper.add_power_do(power_name, power_symbol);
	}

	/**
	 * 根据noid获得权限数据
	 * 
	 * @param noid
	 * @return
	 */
	public List<Map> getPowerByNoid(Integer noid) {
		// TODO Auto-generated method stub
		return adminMapper.getPowerByNoid(noid);
	}

	/**
	 * 执行编辑权限
	 * 
	 * @param noid
	 * @param power_name
	 * @param power_symbol
	 * @return
	 */
	public void update_power_do(Integer noid, String power_name, String power_symbol) {
		// TODO Auto-generated method stub
		adminMapper.update_power_do(noid, power_name, power_symbol);
	}

	/**
	 * 执行权限删除
	 * 
	 * @return
	 */
	public void del_power_do(Integer noid) {
		// TODO Auto-generated method stub
		adminMapper.del_power_do(noid);
	}

	/**
	 * 进入管理员admin编辑页面
	 * 
	 * @param noid
	 * @return
	 */
	public List<Map> getAdminByNoid(Integer noid) {
		// TODO Auto-generated method stub
		return adminMapper.getAdminByNoid(noid);
	}

	/**
	 * 根据管理员noid获得权限管理员所有权限
	 * 
	 * @param noid
	 * @return
	 */
	public List<Map> getAllPowerByNoid(Integer noid) {
		// TODO Auto-generated method stub

		return adminMapper.getAllPowerByNoid(noid);
	}

	/**
	 * 删除关系表对应的权限
	 * 
	 * @param noid
	 */
	public void del_relation_do(Integer admin_id) {
		// TODO Auto-generated method stub
		adminMapper.del_relation_do(admin_id);
	}

	/**
	 * 编辑管理员
	 * 
	 * @param noid
	 * @param admin_code
	 * @param admin_pwd
	 */
	public void update_admin_do(Integer noid, String admin_code, String admin_pwd) {
		// TODO Auto-generated method stub
		adminMapper.update_admin_do(noid, admin_code, admin_pwd);

	}

	/**
	 * 通过账号获取管理员信息
	 * 
	 * @param adminCode
	 * @return
	 */
	public Map<String, Object> checkAdmin(String adminCode) {
		return adminMapper.checkAdmin(adminCode);
	}

	/**
	 * 获取当前登陆用户的权限集合
	 * 
	 * @param noid
	 * @return
	 */
	public List<String> getPowersById(Integer noid) {
		return adminMapper.getPowersById(noid);
	}
}
