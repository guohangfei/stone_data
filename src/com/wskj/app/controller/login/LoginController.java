package com.wskj.app.controller.login;

import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.code.kaptcha.Constants;
import com.wskj.app.service.UserService;
import com.wskj.app.util.other.EncryptionPwd;
import com.wskj.app.vo.User;

@Controller
public class LoginController {


	private String checkCode="";

/*	@Autowired
	Message message;*/
	
	@Autowired
	UserService userService;

	/**
	 * 跳转到登录界面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		return "fore/user/login";
	}

	/**
	 * 验证用户登录信息
	 * 
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(String username, String password, String autologin, Model model, HttpServletResponse rep,HttpSession session) {
		Map<String, Object> maps = userService.checkUser(username);
		if (maps==null) {
			model.addAttribute("errorItem", "账号不存在");
			return "/fore/user/login";
		}
		String pwd = (String) maps.get("userPwd");
		password = EncryptionPwd.MD5Encode(password);
		if (!pwd.equals(password)) {
			model.addAttribute("errorItem", "密码错误");
			return "/fore/user/login";
		}
		User u = new User();
		u.setNoid((Integer) maps.get("noid"));
		u.setUserCode((String) maps.get("userCode"));
		u.setUserPwd((String) maps.get("userPwd"));
		u.setAppKey((String) maps.get("appKey"));
		if (maps.get("nickName") != null) {
			u.setNickName((String) maps.get("nickName"));
		}
		if (autologin != null) {
			Cookie cookie = new Cookie("userCode", username);
			cookie.setMaxAge(1209600);
			rep.addCookie(cookie);
			userService.updateUserRemember(1,u.getUserCode());
		}
		session.setAttribute("user", u);
		return "redirect:/fore/index.do";
	}

	/**
	 * 跳转到用户注册页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
	public String register() {
		return "fore/user/register";
	}

	/**
	 * 验证用户注册信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String register(String username, String password, String checkCode, HttpServletRequest res, Model model) {
		HttpSession session = res.getSession();
		String sessionCheckCode = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
		if (!sessionCheckCode.equals(checkCode)) {
			model.addAttribute("errorItem", "验证码输入错误");
			model.addAttribute("username", username);
			return "fore/user/register";
		}
		String appKey = UUID.randomUUID().toString().replaceAll("-", "");
		//MD5进行密码加密
		password = EncryptionPwd.MD5Encode(password);
		Integer num = userService.addUser(username, password, appKey);
		if(num!=null){
			model.addAttribute("msg", "注册成功");
			model.addAttribute("targetUrl", "/login.do");
			model.addAttribute("targetName", "登录页面");
		}else{
			model.addAttribute("msg", "注册失败");
			model.addAttribute("targetUrl", "/registe.do");
			model.addAttribute("targetName", "注册页面");
		}
		return "alert/alert";
	}

	/**
	 * 用户注册时查询账号是否存在
	 * 
	 * @return
	 */
	@RequestMapping("/check.do")
	@ResponseBody
	public String checkUserCode(String username) {
		String userCode = userService.checkUserCode(username);
		return userCode;
	}

	/**
	 * 跳转到找回密码界面
	 */
	@RequestMapping(value = "/forget_password.do", method = RequestMethod.GET)
	public String forgetPassword() {
		return "/fore/user/forgetpassword";
	}

	/**
	 * 短信验证
	 * @return
	 */
	@RequestMapping("/getPhoneMessage.do")
	@ResponseBody
	public String getPhoneMessage(String mobile){
		checkCode="";
		String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Url);

		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");
		
		for (int i = 0; i < 6; i++) {
			checkCode+=(int)(Math.random()*10);
		}
	    String content = new String("您的验证码是：" + checkCode + "。请不要把验证码泄露给其他人。");

		NameValuePair[] data = {//提交短信
			    new NameValuePair("account", "C51418091"), //查看用户名请登录用户中心->验证码、通知短信->帐户及签名设置->APIID
			    //查看密码请登录用户中心->验证码、通知短信->帐户及签名设置->APIKEY
			    new NameValuePair("password", EncryptionPwd.MD5Encode("b0e2c82a975685259097b930c0be1efc")),
			    new NameValuePair("mobile", mobile), 
			    new NameValuePair("content", content),
		};
		method.setRequestBody(data);

		try {
			client.executeMethod(method);
			
			String SubmitResult =method.getResponseBodyAsString();

			Document doc = DocumentHelper.parseText(SubmitResult);
			Element root = doc.getRootElement();

			String code = root.elementText("code");
			String msg = root.elementText("msg");
			String smsid = root.elementText("smsid");

			if("2".equals(code)){
				return "提交成功";
			}
			 return msg;
		} catch (HttpException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}	
		return "";
	}
	
	/*@RequestMapping(value="/validate.do",produces="text/html;charset=utf-8")
	@ResponseBody
	public String getValidateCode(String phoneNum){
		String mes = message.getMessageByPhone(phoneNum);
		Gson gson = new Gson();
		return gson.toJson(mes);
	}*/
	
	/**
	 * 修改用户密码重置的密码
	 */
	@RequestMapping(value = "/forget_password.do", method = RequestMethod.POST)
	public String forgetPassword(String mobile,String userCode,String password,String verifycode,Model model) {
		Integer numb;
		if(verifycode!=null&&verifycode.trim().length()>0){
			numb = userService.checkUserPhone(userCode,mobile);
			if(numb == null){
				model.addAttribute("phoneErrorItem","电话号码不匹配");
				return "/fore/user/forgetpassword";
			}
			if(!verifycode.equals(checkCode)){
				model.addAttribute("validateErrorItem","验证码错误");
				return "/fore/user/forgetpassword";
			}
		}
		//密码加密
		password = EncryptionPwd.MD5Encode(password);
		numb = userService.updateUserPwdByReset(userCode,password);
		if(numb==null){
			model.addAttribute("msg", "重置密码失败");
			model.addAttribute("targetUrl", "//forget_password.do");
			model.addAttribute("targetName", "找回密码页面");
		}else{
			model.addAttribute("msg", "重置密码成功");
			model.addAttribute("targetUrl", "/login.do");
			model.addAttribute("targetName", "登录页面");
		}
		return "alert/alert";
	}
	
	/**
	 * 查看账号是否存在
	 * @param userCode
	 * @return
	 */
	@RequestMapping("/checkUserCode.do")
	@ResponseBody
	public boolean checkUser(String userCode){
		String user = userService.checkUserCode(userCode);
		if(user==null){
			return false;
		}else{
			return true;
		}
	}

	/**
	 * 注销的方法
	 * 
	 * @return
	 */
	@RequestMapping("/logout.do")
	@ResponseBody
	public String logout(HttpServletRequest req, HttpServletResponse rep) {
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				// cookie失效的方法
				if("userCode".equals(cookie.getName())){
					userService.updateUserRemember(2,cookie.getValue());
					cookie.setMaxAge(0);
					rep.addCookie(cookie);
					break;
				}
			}
		}
		req.getSession().removeAttribute("user");
		return "success";
	}

	/**
	 * 执行后台登陆
	 * 
	 * @return
	 */
	@RequestMapping("/do_back_login.do")
	public String do_index(String adminname, String password, Model model) {
		try {
			Subject currUser = SecurityUtils.getSubject();
			//密码加密
			UsernamePasswordToken customizedToken = new UsernamePasswordToken(adminname, password);
			currUser.login(customizedToken);
			return "redirect:/back/index.do";
		} catch (Exception e) {
			model.addAttribute("errorItem", "账号不存在或密码错误");
			return  "fore/user/login";
		}
	}

}