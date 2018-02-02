package com.wskj.app.mapper;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.ws.rs.DELETE;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.mybatis.spring.annotation.MapperScan;

import com.wskj.app.vo.User;

/**
 * 用户Mapper接口
 * 
 * @author Administrator
 *
 */
@MapperScan
public interface UserMapper {

	/**
	 * 用户注册时查询账号是否存在
	 * 
	 * @param userCode
	 * @return
	 */
	@Select("select user_code usercode from t_user where user_code=#{param1}")
	String checkUserCode(String userCode);

	/**
	 * 通过用户账号查询用户信息进行shiro登录验证
	 * 
	 * @param username
	 * @return
	 */
	@Select("select noid,user_code userCode,user_pwd userPwd,app_key appKey,nick_name nickName,remember from t_user where user_code=#{param1}")
	Map<String, Object> checkUser(String userCode);

	/**
	 * 添加用户
	 * 
	 * @param userCode
	 * @param userPwd
	 * @param appKey
	 * @return
	 */
	@Insert("insert into t_user (user_code,user_pwd,app_key) values (#{param1},#{param2},#{param3})")
	Integer addUser(String userCode, String userPwd, String appKey);

	/**
	 * 查询用户昵称
	 * 
	 * @param userCode
	 * @param userPwd
	 * @return
	 */
	@Select("select nick_name nickname from t_user where noid=#{param1}")
	String getUserNickName(Integer noid);

	/**
	 * 修改密码
	 * 
	 * @param noid
	 * @param pwd
	 * @return
	 */
	@Update("update t_user set user_pwd=#{param2} where noid=#{param1}")
	Integer editPwd(Integer noid, String pwd);

	/**
	 * 获取用户基本信息
	 * 
	 * @param noid
	 * @return
	 */
	@Select("select noid,user_code userCode,nick_name nickName,user_sex sex,user_age age,"
			+ "province_id pId,city_id cId,district_id dId,user_mail mail,phone_numb phoneNumb,"
			+ " app_key appKey from t_user where noid=#{param1}")
	Map<String, Object> getUserInfoById(Integer noid);

	/**
	 * 获取省份列表
	 * 
	 * @return
	 */
	@Select("select noid,province_name pName from t_province")
	List<Map<String, Object>> getProvinces();

	/**
	 * 根据省份id获取城市列表
	 * 
	 * @return
	 */
	@Select("select noid,city_name cName from t_city where province_id=#{param1}")
	List<Map<String, Object>> getCitys(Integer pId);

	/**
	 * 根据城市id获取区县列表
	 * 
	 * @return
	 */
	@Select("select noid,district_name dName from t_district where city_id=#{param1}")
	List<Map<String, Object>> getDistricts(Integer cId);

	/**
	 * 获取当前用户的地址信息
	 * 
	 * @param noid
	 * @return
	 */
	@Select("SELECT province_id pId,city_id cId,district_id dId FROM t_user where noid=#{param1}")
	Map<String, Object> getAddressById(Integer noid);

	/**
	 * 更新用户信息
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
	@Update("update t_user set nick_name=#{param2},user_sex=#{param3},user_age=#{param4},"
			+ "phone_numb=#{param5},user_mail=#{param6},province_id=#{param7},"
			+ "city_id=#{param8},district_id=#{param9} where noid=#{param1}")
	Integer updateUserInfo(Integer noid, String nickName, Integer sex, Integer age, String mobile, String email,
			Integer province, Integer city, Integer district);

	/**
	 * 获取当前用户头像地址
	 * @param noid
	 * @return
	 */
	@Select("select avatar_url url from t_user where noid=#{param1}")
	String getAvatarUrl(Integer noid);

	/**
	 * 保存用户上传的图片地址
	 * @param targetPath
	 * @param noid
	 * @return
	 */
	@Update("update t_user set avatar_url=#{param1} where noid=#{param2}")
	Integer updateAvatar(String targetPath, Integer noid);

	/**
	 * 获取账户余额
	 * @param noid
	 * @return
	 */
	@Select("select balance from t_user where noid=#{param1}")
	Float getBalanceById(Integer noid);

	/**
	 * 更新用户账户余额
	 * @param noid
	 * @param balance
	 */
	@Update("update t_user set balance=#{param2} where noid=#{param1}")
	void updateBalance(Integer noid, Float nowBalance);

	/**
	 * 获取用户充值记录
	 * @param noid
	 * @return
	 */
	@Select("select noid, order_numb orderNumb,recharge_time rechargeTime,recharge_money rechargeMoney from t_recharge_record where user_id=#{param1}")
	List<Map<String, Object>> rechargeLog(Integer noid);

	/**
	 * 新增充值记录
	 * @param orderNumb
	 * @param date
	 * @param money
	 * @param noid
	 */
	@Insert("insert into t_recharge_record (order_numb,recharge_time,recharge_money,user_id) values"
			+ " (#{param1},#{param2},#{param3},#{param4})")
	void addRecord(String orderNumb, Date date, Float money, Integer noid);

	/**
	 * 删除一条充值记录
	 * @param noid
	 * @return
	 */
	@Delete("delete from t_recharge_record where noid=#{param1}")
	Integer delRecharge(Integer noid);

	/**
	 * 获取套餐信息
	 * @param api_id 
	 * @return
	 */
	@Select("SELECT * FROM t_set_meal WHERE api_id=#{param1} ORDER BY price")
	List<Map> getSetMeal(Integer api_id);

	/**
	 * 根据用户id获得数据汇总
	 * @param user_id
	 * @return
	 */
	@Select("SELECT * FROM t_count_apply tca JOIN t_api ON t_api.`noid`=tca.`api_id` WHERE user_id=#{param1}")
	List<Map> getCountApplybyUserId(Integer user_id);

	/**
	 * 从账号中获得余额
	 * @param user_id
	 * @return
	 */
	@Select("SELECT * FROM t_user WHERE noid=#{param1}")
	List<Map> getBalenceByUserId(Integer user_id);
	
	/**
	 * 根据meal的主键获得对应的套餐详情
	 * @param integer
	 * @return
	 */
	@Select("SELECT * FROM t_set_meal WHERE noid=#{param1}")
	Map getOnePriceByMealId(Integer meal_id);

	/**
	 * 插入申请详情表t_apply_detail
	 * @param api_id
	 * @param user_id
	 * @param totalfee
	 * @param apply_cut
	 */
	@Insert("INSERT INTO t_apply_detail (api_id,user_id,apply_time,apply_money,apply_cnt)"
			+ " VALUES(#{param1},#{param2},NOW(),#{param3},#{param4})")
	void addApplyDetail(Integer api_id, Integer user_id, Integer totalfee, Integer apply_cut);

	/**
	 * 根据api_id user_id  判断count统计列表是否存在
	 * @param api_id
	 * @param user_id
	 * @return
	 */
	@Select("SELECT * FROM t_count_apply WHERE api_id=#{param1} AND user_id=#{param2}")
	List<Map> getCountState(Integer api_id, Integer user_id);

	/**
	 * 更新统计数据
	 * @param api_id
	 * @param user_id
	 * @param all_apply_money
	 * @param all_apply_cnt
	 */
	@Update("UPDATE t_count_apply SET all_apply_money=#{param3},all_apply_cnt=all_apply_cnt+#{param4},unused_cnt=unused_cnt+#{param4},last_apply_time=NOW()"
			+ "  WHERE api_id=#{param1} AND user_id=#{param2}")
	void updateCountApply(Integer api_id, Integer user_id, Integer all_apply_money, Integer apply_cut);

	/**
	 * 插入统计数据
	 * @param api_id
	 * @param user_id
	 * @param totalfee
	 * @param apply_cut
	 */
	@Insert("INSERT INTO t_count_apply (api_id,user_id,all_apply_money,all_apply_cnt,used_cnt,unused_cnt,last_apply_time)"
			+ " VALUES(#{param1},#{param2},#{param3},#{param4},0,#{param4},NOW())")
	void addCountApply(Integer api_id, Integer user_id, Integer totalfee, Integer apply_cut);

	/**
	 * 变更用户余额
	 * @param user_id
	 * @param balance
	 */
	@Update("UPDATE t_user SET balance=#{param2} WHERE noid=#{param1}")
	void updateUserBalance(Integer user_id, Float balance);

	/**
	 * 获得api
	 * @param api_id
	 * @return
	 */
	@Select("SELECT * FROM t_api WHERE noid=#{param1}")
	Map getApiData(Integer api_id);
	
	/**
	 * 验证用户账号是否与电话匹配
	 * @param userCode
	 * @param mobile
	 * @return
	 */
	@Select("select noid from t_user where user_code=#{param1} and phone_numb=#{param2}")
	Integer checkUserPhone(String userCode, String mobile);
	
	/**
	 * 重置密码
	 * @param userCode
	 * @param password
	 * @return 
	 */
	@Update("update t_user set user_pwd=#{param2} where user_code=#{param1}")
	Integer updateUserPwdByReset(String userCode, String password);
	
	/**
	 * 修改用户自动登录状态
	 * @param rememberCode
	 * @param userCode 
	 */
	@Update("update t_user set remember=#{param1} where user_code=#{param2}")
	void updateUserRemember(Integer rememberCode, String userCode);
	

}
