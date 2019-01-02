package com.suibianshuo.mybatis.mapper;



import org.springframework.stereotype.Repository;

import com.suibianshuo.entity.mobile.UserShareLog;

@Repository
public interface UserShareLogDao {
	//添加地址
	public int addUserShareLog(UserShareLog userShareLog);
	
	public int getCount(UserShareLog userShareLog);
}
