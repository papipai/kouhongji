package com.suibianshuo.service.mobile;

import java.util.List;

import com.suibianshuo.entity.mobile.Order;

public interface OrderService {  
	/**
	 * 所有口红
	 * @return
	 */
	public List<Order> getAllOrder(Order order);
	/**
	 * 口红数量
	 * @return
	 */
	public int getCount(Order order);
	/**
	 * 新增订单
	 * @param user
	 * @return
	 */
	public int addOrder(Order order);
	/**
	 * 更新订单
	 * @param user
	 * @return
	 */
	public int updateOrder(Order order);
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	public int deleteUserById(int id);
}  
