package com.wskj.app.controller.back;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.wskj.app.service.back.AdminService;

@Controller
@RequestMapping("/back")
public class AdminController {

	@Autowired
	private AdminService adminService;


	/**
	 * 进入客服1页面
	 */
	@RequestMapping("/servicer1.do")
	public String servicer1() {

		return "back/admin/servicer1";
	}
	
	/**
	 * 进入客服2页面
	 */
	@RequestMapping("/servicer2.do")
	public String servicer2() {

		return "back/admin/servicer2";
	}
	
	/**
	 * 进入admin列表页面
	 * 
	 * @return
	 */
	@RequestMapping("/admin_list.do")
	public String list() {
		return "back/admin/admin_list";
	}

	/**
	 * 获得所有的管理员 Ajax
	 * 
	 * @return
	 */
	@RequestMapping(value = "/get_all_admin_list.do", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getAllAdminList() {
		// 获得所有的管理员
		List<Map> alladm = adminService.getAdminList();

		for (int i = 0; i < alladm.size(); i++) {
			Integer admin_id = Integer.parseInt(alladm.get(i).get("noid").toString());
			// 获得管理员对应的权限放入Map中
			List<Map> allpow = adminService.getAdminPowerList(admin_id);
			if (allpow.get(0) != null) {
				alladm.get(i).put("power_name", allpow.get(0).get("power_name"));
			} else {
				continue;
			}
			System.err.println(alladm.toString());
		}
		Gson gson = new Gson();
		String jsonStr = gson.toJson(alladm);
		return jsonStr;
	}

	/**
	 * 进入admin新增页面
	 * 
	 * @return
	 */
	@RequestMapping("/admin_add.do")
	public String getPowerList(Model mo) {
		// 读取数据库中所有权限数据
		List<Map> allpow = adminService.getAllPowerList();
		mo.addAttribute("allpow", allpow);
		return "back/admin/admin_add";
	}

	/**
	 * 执行新增管理员admin
	 * 
	 * @return
	 */
	@RequestMapping("/add_admin_do.do")
	@ResponseBody
	public String do_admin_add(Integer[] chockbox, String admin_code, String admin_pwd) {

		// 新增管理员
		Integer inte = adminService.add_admin_do(admin_code, admin_pwd);
		if (inte == 0) {
			return "no";
		} else {
			// 获得新增的管理员的noid
			Integer noid = adminService.getNoidByCode(admin_code);

			// 循环新增关系表中数据
			for (int i = 0; i < chockbox.length; i++) {
				try {
					adminService.add_relation_do(noid, chockbox[i]);
				} catch (Exception e) {
					return "no";
				}
			}
			return "ok";
		}
	}

	/**
	 * 进入删除管理员页面
	 */
	@RequestMapping("/admin_del.do")
	public String admin_del(Integer noid, Model mo) {
		mo.addAttribute("noid", noid);
		return "back/admin/admin_del";
	}

	/**
	 * 执行管理员删除
	 * 
	 * @return
	 */
	@RequestMapping("/del_admin_do.do")
	@ResponseBody
	public String del_admin_do(Integer noid) {
		// 删除管路员
		try {
			adminService.del_admin_do(noid);
		} catch (Exception e) {
			// TODO: handle exception
			return "no";
		}
		return "ok";
	}

	/**
	 * 进入管理员admin编辑页面
	 * 
	 * @param noid
	 * @return
	 */
	@RequestMapping("/admin_edit.do")
	public String admin_edit(Integer noid, Model mo) {
		// 根据noid获得管理员信息
		List<Map> adm = adminService.getAdminByNoid(noid);
		// //根据管理员noid获得权限管理员所有权限
		// List<Map> pow=adminService.getAllPowerByNoid(noid);
		// 获得所有权限
		List<Map> allpow = adminService.getAllPowerList();
		mo.addAttribute("allpow", allpow);
		// mo.addAttribute("pow",pow);
		mo.addAttribute("adm", adm);
		return "back/admin/admin_edit";
	}

	/**
	 * 进入权限管理列表
	 * 
	 * @return
	 */
	@RequestMapping("/power_list.do")
	public String power_list() {
		return "back/admin/power_list";
	}

	/**
	 * 获得所有的权限 Ajax
	 * 
	 * @return
	 */
	@RequestMapping(value = "/get_all_power_list.do", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getAllPowerList() {
		List<Map> allpow = adminService.getAllPowerList();
		Gson gson = new Gson();
		String jsonStr = gson.toJson(allpow);
		try {
			String newStr = new String(jsonStr.getBytes(), "UTF-8");
			return newStr;
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 进入权限power新增页面
	 * 
	 * @return
	 */
	@RequestMapping("/power_add.do")
	public String powerAdd() {
		// 读取数据库中所有权限数据
		return "back/admin/power_add";
	}

	/**
	 * 执行新增管理员admin
	 * 
	 * @return
	 */
	@RequestMapping("/add_power_do.do")
	@ResponseBody
	public String add_power_do(String power_name, String power_symbol) {
		// 新增权限
		Integer inte = adminService.add_power_do(power_name, power_symbol);
		if (inte == 0) {
			return "no";
		} else {
			return "ok";
		}
	}

	/**
	 * 进入权限power编辑页面
	 * 
	 * @param noid
	 * @return
	 */
	@RequestMapping("/power_edit.do")
	public String power_edit(Integer noid, Model mo) {
		// 根据noid获得权限
		List<Map> pow = adminService.getPowerByNoid(noid);
		mo.addAttribute("pow", pow);
		return "back/admin/power_edit";
	}

	/**
	 * 执行编辑权限
	 * 
	 * @param noid
	 * @param power_name
	 * @param power_symbol
	 * @return
	 */
	@RequestMapping("/update_power_do.do")
	@ResponseBody
	public String update_power_do(Integer noid, String power_name, String power_symbol) {
		try {
			adminService.update_power_do(noid, power_name, power_symbol);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "no";
		}
		return "ok";
	}

	/**
	 * 进入删除权限页面
	 */
	@RequestMapping("/power_del.do")
	public String power_del(Integer noid, Model mo) {
		mo.addAttribute("noid", noid);
		return "back/admin/power_del";
	}

	/**
	 * 执行权限删除
	 * 
	 * @return
	 */
	@RequestMapping("/del_power_do.do")
	@ResponseBody
	public String del_power_do(Integer noid) {
		// 删除权限
		try {
			adminService.del_power_do(noid);
		} catch (Exception e) {
			// TODO: handle exception
			return "no";
		}
		return "ok";
	}

	/**
	 * 执行编辑管理员
	 * 
	 * @param admin_code
	 * @param admin_pwd
	 * @param noid
	 * @return
	 */
	@RequestMapping("/update_admin_do.do")
	@ResponseBody
	public String update_admin_do(Integer noid, String admin_code, String admin_pwd, Integer[] noids) {
		try {
			// 编辑管理员
			adminService.update_admin_do(noid, admin_code, admin_pwd);
			// 编辑权限1删除对应权限，2，新增权限
			adminService.del_relation_do(noid);
			for (int i = 0; i < noids.length; i++) {
				adminService.add_relation_do(noid, noids[i]);
			}
		} catch (Exception e) {
			return "no";
		}
		return "ok";
	}

	/**
	 * 退出登录
	 * 
	 * @return
	 */
	@RequestMapping("/admin_logout.do")
	public String adminLogout() {
		SecurityUtils.getSubject().logout();
		return "redirect:/login.do";
	}

}
