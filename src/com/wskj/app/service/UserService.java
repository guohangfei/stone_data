package com.wskj.app.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wskj.app.mapper.UserMapper;
import com.wskj.app.vo.User;

/**
 * 用户Service类
 * 
 * @author Administrator
 *
 */
@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;
	

	/**
	 * 验证用户账号是否存在
	 * 
	 * @param userCode
	 * @return
	 */
	public String checkUserCode(String userCode) {
		return userMapper.checkUserCode(userCode);
	}

	/**
	 * 添加用户
	 * 
	 * @param userCode
	 * @param appKey
	 * @return
	 */
	public Integer addUser(String userCode, String userPwd, String appKey) {
		return userMapper.addUser(userCode, userPwd, appKey);
	}

	/**
	 * 获取用户昵称
	 * 
	 * @param userCode
	 * @return
	 */
	public String getUserNickName(Integer noid) {
		return userMapper.getUserNickName(noid);
	}

	/**
	 * 通过用户账号查询用户信息进行shiro登录验证
	 * 
	 * @param username
	 * @return
	 */
	public Map<String, Object> checkUser(String username) {
		return userMapper.checkUser(username);
	}

	/**
	 * 修改密码的方法
	 * 
	 * @param noid
	 * @param pwd
	 */
	public Integer editPwd(Integer noid, String pwd) {
		return userMapper.editPwd(noid, pwd);
	}

	/**
	 * 通过id获取用户信息
	 * 
	 * @param noid
	 * @return
	 */
	public Map<String, Object> getUserInfoById(Integer noid) {
		return userMapper.getUserInfoById(noid);
	}

	/**
	 * 获取省份列表
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getProvinces() {
		return userMapper.getProvinces();
	}

	/**
	 * 通过省份id获取城市列表
	 * 
	 * @param pId
	 * @return
	 */
	public List<Map<String, Object>> getCitys(Integer pId) {
		return userMapper.getCitys(pId);
	}

	/**
	 * 通过城市id获取区县列表
	 * 
	 * @param cId
	 * @return
	 */
	public List<Map<String, Object>> getDistricts(Integer cId) {
		return userMapper.getDistricts(cId);
	}

	/**
	 * 通过主键获取用户地址信息
	 * 
	 * @param noid
	 * @return
	 */
	public Map<String, Object> getAddressById(Integer noid) {
		return userMapper.getAddressById(noid);
	}

	/**
	 * 更新用户信息
	 * 
	 * @param noid
	 * @param nickName
	 * @param sex
	 * @param age
	 * @param mobile
	 * @param email
	 * @param province
	 * @param city
	 * @param district
	 * @return
	 */
	public Integer updateUserInfo(Integer noid, String nickName, Integer sex, Integer age, String mobile, String email,
			Integer province, Integer city, Integer district) {
		return userMapper.updateUserInfo(noid, nickName, sex, age, mobile, email, province, city, district);
	}

	/**
	 * 获取当前用户url地址
	 * 
	 * @param noid
	 * @return
	 */
	public String getAvatarUrl(Integer noid) {
		return userMapper.getAvatarUrl(noid);
	}

	/**
	 * 保存用户头像地址
	 * 
	 * @param targetPath
	 * @param noid
	 * @return
	 */
	public Integer updateAvatar(String targetPath, Integer noid) {
		return userMapper.updateAvatar(targetPath, noid);
	}

	/**
	 * 获取账户余额
	 * 
	 * @param noid
	 * @return
	 */
	public Float getBalanceById(Integer noid) {
		return userMapper.getBalanceById(noid);
	}

	/**
	 * 更新用户账户余额
	 * @param noid
	 * @param balance
	 */
	public void updateBalance(Integer noid, Float nowBalance) {
		userMapper.updateBalance(noid,nowBalance);

	}

	/**
	 * 获取当前用户充值记录
	 * @param noid
	 * @return
	 */
	public List<Map<String, Object>> rechargeLog(Integer noid) {
		return userMapper.rechargeLog(noid);
	}

	/**
	 * 新增充值记录
	 * @param orderNumb
	 * @param date
	 * @param money
	 * @param noid
	 */
	public void addRecord(String orderNumb, Date date, Float money, Integer noid) {
		userMapper.addRecord(orderNumb,date,money,noid);
		
	}

	/**
	 * 删除一条充值记录
	 * @param noid
	 * @return
	 */
	public Integer delRecharge(Integer noid) {
		return userMapper.delRecharge(noid);
		
	}
	
	/**
	 * 读取套餐信息
	 * @param api_id 
	 * @return
	 */
	public List<Map> getSetMeal(Integer api_id) {
		// TODO Auto-generated method stub
		return userMapper.getSetMeal(api_id);
	}

	/**
	 * 根据用户id获得数据汇总
	 * @param user_id
	 * @return
	 */
	public List<Map> getCountApplybyUserId(Integer user_id) {
		// TODO Auto-generated method stub
		return userMapper.getCountApplybyUserId(user_id);
	}

	/**
	 * 从账号中获得余额
	 * @param user_id
	 * @return
	 */
	public Float getBalenceByUserId(Integer user_id) {
		// TODO Auto-generated method stub
		List<Map> bance= userMapper.getBalenceByUserId(user_id);
		return (Float) bance.get(0).get("balance");
	}

	/**
	 * 根据meal的主键获得对应的套餐详情
	 * @param integer
	 * @return
	 */
	public Map getOnePriceByMealId(Integer meal_id) {
		// TODO Auto-generated method stub
		return userMapper.getOnePriceByMealId(meal_id);
	}

	/**
	 * 插入申请详情表t_apply_detail
	 * @param api_id
	 * @param user_id
	 * @param totalfee
	 * @param apply_cut
	 */
	public void addApplyDetail(Integer api_id, Integer user_id, Integer totalfee, Integer apply_cut) {
		userMapper.addApplyDetail(api_id,user_id,totalfee,apply_cut);
		
	}

	/**
	 * 根据api_id user_id  判断count统计列表是否存在
	 * @param api_id
	 * @param user_id
	 * @return
	 */
	public List<Map> getCountState(Integer api_id, Integer user_id) {
		// TODO Auto-generated method stub
		List<Map> co=userMapper.getCountState(api_id,user_id);
		return co;
	}

	/**
	 * 更新统计数据
	 * @param api_id
	 * @param user_id
	 * @param all_apply_money
	 * @param all_apply_cnt
	 */
	public void updateCountApply(Integer api_id, Integer user_id, Integer all_apply_money, Integer apply_cut) {
		// TODO Auto-generated method stub
		userMapper.updateCountApply(api_id,user_id,all_apply_money,apply_cut);
	}

	/**
	 * 插入统计数据
	 * @param api_id
	 * @param user_id
	 * @param totalfee
	 * @param apply_cut
	 */
	public void addCountApply(Integer api_id, Integer user_id, Integer totalfee, Integer apply_cut) {
		// TODO Auto-generated method stub
		userMapper.addCountApply(api_id,user_id,totalfee,apply_cut);

	}

	/**
	 * 变更用户余额
	 * @param user_id
	 * @param balance
	 */
	public void updateUserBalance(Integer user_id, Float balance) {
		// TODO Auto-generated method stub
		userMapper.updateUserBalance(user_id,balance);
	}

	/**
	 * 获得api数据
	 * @param api_id
	 * @return
	 */
	public Map getApiData(Integer api_id) {
		// TODO Auto-generated method stub
		return userMapper.getApiData(api_id);
	}

	/**
	 * 验证电话号码是否与用户账号匹配
	 * @param userCode
	 * @param mobile
	 * @return
	 */
	public Integer checkUserPhone(String userCode, String mobile) {
		
		return userMapper.checkUserPhone(userCode,mobile);
	}
	
	/**
	 * 重置密码
	 * @param userCode
	 * @param password
	 * @return
	 */
	public Integer updateUserPwdByReset(String userCode, String password) {
		// TODO Auto-generated method stub
		return userMapper.updateUserPwdByReset(userCode,password);
	}
	
	/**
	 * 修改用户自动登录状态
	 * @param rememberCode
	 * @param userCode 
	 */
	public void updateUserRemember(Integer rememberCode, String userCode) {
		// TODO Auto-generated method stub
		userMapper.updateUserRemember(rememberCode,userCode);
	}

}
