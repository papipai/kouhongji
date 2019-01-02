package com.suibianshuo.service.mobile;


import java.util.List;

import com.suibianshuo.entity.mobile.User;

public interface UserService {  
	/**
	 * 获取用户
	 * @return
	 */
	public List<User> getUserList(User user);
	public User getUser(User user);
	/**
	 * 获取用户线上
	 * @return
	 */
	public User getUpperLine(User user);
	/**
	 * 获取用户下线
	 * @return
	 */
	public List<User> getOffLineList(User user);
	/**
	 * 用户总数
	 * @param user
	 * @return
	 */
	public int getCount(User user); 
	/**
	 * 新增用户
	 * @param user
	 * @return
	 */
	public int addUser(User user);
	/**
	 * 更新用户
	 * @param user
	 * @return
	 */
	public int updateUser(User user);
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	public int deleteUserById(int id);
}  
