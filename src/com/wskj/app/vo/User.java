package com.wskj.app.vo;

/**
 * 用户实体类，存放用户登录后的信息
 * 
 * @author Administrator
 *
 */
public class User {

	private Integer noid;
	private String userCode;
	private String appKey;
	private String userPwd;
	private String nickName;
	private Integer remember;//自动登录状态  1-自动登录  2-不自动登录
	
	public Integer getRemember() {
		return remember;
	}

	public void setRemember(Integer remember) {
		this.remember = remember;
	}

	public Integer getNoid() {
		return noid;
	}

	public void setNoid(Integer noid) {
		this.noid = noid;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getAppKey() {
		return appKey;
	}

	public void setAppKey(String appKey) {
		this.appKey = appKey;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

}
