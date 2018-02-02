package com.wskj.app.shiro;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wskj.app.service.back.AdminService;
import com.wskj.app.vo.Admin;

/**
 * 管理员登录的Realm
 * 
 * @author Administrator
 *
 */
@Component(value="adminRealm")
public class AdminRealm extends AuthorizingRealm {

	@Autowired
	private AdminService adminService;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		Admin admin = (Admin) principals.getPrimaryPrincipal();
		if (admin.getPowerNames().isEmpty()) {
			List<String> powers = adminService.getPowersById(admin.getNoid());
			for (String string : powers) {
				admin.getPowerNames().add(string);
			}
		}
		SimpleAuthorizationInfo auth = new SimpleAuthorizationInfo();
		auth.addStringPermissions(admin.getPowerNames());
		return auth;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken adminToken = (UsernamePasswordToken) token;
		String adminCode = adminToken.getUsername();
		Map<String, Object> map = adminService.checkAdmin(adminCode);
		if (map != null) {
			Admin admin = new Admin();
			admin.setNoid((Integer) map.get("noid"));
			admin.setAdminCode((String) map.get("adminCode"));
			admin.setAdminPwd((String) map.get("adminPwd"));
			SimpleAuthenticationInfo saci = new SimpleAuthenticationInfo(admin, admin.getAdminPwd(), this.getName());
			return saci;
		}
		return null;
	}

}
