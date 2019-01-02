package com.suibianshuo.mybatis.mapper;



import org.springframework.stereotype.Repository;

import com.suibianshuo.entity.mobile.UserPlayLog;

@Repository
public interface UserPlayLogDao {
	//添加地址
	public int addUserPlayLog(UserPlayLog userPlayLog);
}
