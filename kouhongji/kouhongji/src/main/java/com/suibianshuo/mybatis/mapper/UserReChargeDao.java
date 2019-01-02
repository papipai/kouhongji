package com.suibianshuo.mybatis.mapper;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.suibianshuo.entity.mobile.UserReCharge;

@Repository
public interface UserReChargeDao {
	//
	public List<UserReCharge> getUserRecharge(UserReCharge userReCharge);
	//
	public List<UserReCharge> getOffLineUserSumRecharge(List list);
	public int getCount(UserReCharge userReCharge); 
	//添加用户充值记录
	public int addUserReCharge(UserReCharge userReCharge);
}
