package com.suibianshuo.service.mobile;

import java.util.List;

import com.suibianshuo.entity.mobile.Goods;
import com.suibianshuo.entity.mobile.User;

public interface GoodsService {  
	/**
	 * 所有口红信息
	 * @return
	 */
	public List<Goods> getAllGoods();
	/**
	 * 用户数量
	 * @return
	 */
	public int getCount(String search_name, String search_account);
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
