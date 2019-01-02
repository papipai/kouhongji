package com.suibianshuo.serviceImpl.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suibianshuo.entity.web.AdminUser;
import com.suibianshuo.mybatis.mapper.AdminUserDao;
import com.suibianshuo.service.web.AdminUserService;

@Service
public class AdminUserServiceImpl implements AdminUserService{
	@Autowired
    private AdminUserDao adminUserDao;

	@Override
	public AdminUser getAdminUser(AdminUser adminUser) {
		// TODO Auto-generated method stub
		return adminUserDao.getAdminUser(adminUser);
	}



	

}