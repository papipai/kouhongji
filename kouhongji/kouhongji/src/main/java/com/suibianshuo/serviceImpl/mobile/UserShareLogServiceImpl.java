package com.suibianshuo.serviceImpl.mobile;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suibianshuo.entity.mobile.UserShareLog;
import com.suibianshuo.mybatis.mapper.UserShareLogDao;
import com.suibianshuo.service.mobile.UserShareLogService;

@Service
public class UserShareLogServiceImpl implements UserShareLogService{
	@Autowired
    private UserShareLogDao userShareLogDao;

	@Override
	public int addUserShareLog(UserShareLog userShareLog) {
		// TODO Auto-generated method stub
		return userShareLogDao.addUserShareLog(userShareLog);
	}

	@Override
	public int getCount(UserShareLog userShareLog) {
		// TODO Auto-generated method stub
		return userShareLogDao.getCount(userShareLog);
	}


	
	

}