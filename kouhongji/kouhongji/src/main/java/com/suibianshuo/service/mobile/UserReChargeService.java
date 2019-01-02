package com.suibianshuo.service.mobile;


import java.util.List;

import com.suibianshuo.entity.mobile.UserReCharge;

public interface UserReChargeService {  
	/**
	 * 获取用户
	 * @return
	 */
	public List<UserReCharge> getUserReCharge(UserReCharge userReCharge);
	/**
	 * 获取下线用户充值总额
	 * @return
	 */
	public List<UserReCharge> getOffLineUserSumRecharge(List list);
	/**
	 * 新增用户充值
	 * @param user
	 * @return
	 */
	public int addUserReCharge(UserReCharge userReCharge);
	public int getCount(UserReCharge userReCharge);
}  
