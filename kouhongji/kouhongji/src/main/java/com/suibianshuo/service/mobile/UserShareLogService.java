package com.suibianshuo.service.mobile;


import com.suibianshuo.entity.mobile.UserShareLog;

public interface UserShareLogService {  
	/**
	 * 新增用户分享
	 * @param user
	 * @return
	 */
	public int addUserShareLog(UserShareLog userShareLog);
	
	public int getCount(UserShareLog userShareLog);
}  
