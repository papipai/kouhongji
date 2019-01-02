package com.suibianshuo.mybatis.mapper;



import org.springframework.stereotype.Repository;

import com.suibianshuo.entity.web.AdminUser;

@Repository
public interface AdminUserDao {
	
	public AdminUser getAdminUser(AdminUser adminUser);
}
