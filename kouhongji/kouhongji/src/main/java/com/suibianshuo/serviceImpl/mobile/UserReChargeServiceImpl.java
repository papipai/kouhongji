package com.suibianshuo.serviceImpl.mobile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suibianshuo.entity.mobile.UserReCharge;
import com.suibianshuo.mybatis.mapper.UserReChargeDao;
import com.suibianshuo.service.mobile.UserReChargeService;

@Service
public class UserReChargeServiceImpl implements UserReChargeService{
	@Autowired
    private UserReChargeDao userReChargeDao;

	@Override
	public List<UserReCharge> getUserReCharge(UserReCharge userReCharge) {
		// TODO Auto-generated method stub
		return userReChargeDao.getUserRecharge(userReCharge);
	}

	@Override
	public int addUserReCharge(UserReCharge userReCharge) {
		// TODO Auto-generated method stub
		return userReChargeDao.addUserReCharge(userReCharge);
	}

	@Override
	public int getCount(UserReCharge userReCharge) {
		// TODO Auto-generated method stub
		return userReChargeDao.getCount(userReCharge);
	}

	@Override
	public List<UserReCharge> getOffLineUserSumRecharge(List list) {
		// TODO Auto-generated method stub
		return userReChargeDao.getOffLineUserSumRecharge(list);
	}



	
	

}