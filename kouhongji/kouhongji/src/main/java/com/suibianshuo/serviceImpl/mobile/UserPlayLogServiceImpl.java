package com.suibianshuo.serviceImpl.mobile;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suibianshuo.entity.mobile.UserPlayLog;
import com.suibianshuo.mybatis.mapper.UserPlayLogDao;
import com.suibianshuo.service.mobile.UserPlayLogService;

@Service
public class UserPlayLogServiceImpl implements UserPlayLogService{
	@Autowired
    private UserPlayLogDao userPlayLogDao;

	@Override
	public int addUserPlayLog(UserPlayLog userPlayLog) {
		// TODO Auto-generated method stub
		return userPlayLogDao.addUserPlayLog(userPlayLog);
	}



	
	

}