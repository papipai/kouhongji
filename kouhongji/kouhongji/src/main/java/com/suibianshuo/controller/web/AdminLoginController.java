package com.suibianshuo.controller.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.suibianshuo.entity.web.AdminUser;
import com.suibianshuo.serviceImpl.web.AdminUserServiceImpl;

/**
 * 管理员后台
 * @author Administrator
 *
 */
@Controller
public class AdminLoginController {
	@Autowired
	private AdminUserServiceImpl adminUserServiceImpl;
	
	@RequestMapping(value="/login.java",method= {RequestMethod.POST})
	public String login(HttpServletRequest request,HttpSession session) {
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		AdminUser adminUser = new AdminUser();
		if (StringUtils.isNotEmpty(account)) {
			adminUser.setAccount(account);
		}
		if (StringUtils.isNotEmpty(password)) {
			adminUser.setPassword(password);
		}
		
		adminUser = adminUserServiceImpl.getAdminUser(adminUser);
		if (adminUser != null) {
			session.setAttribute("adminUser", adminUser);
			return "web/index";
		}else {
			return "web/login";
		}
		
	}
	
}
