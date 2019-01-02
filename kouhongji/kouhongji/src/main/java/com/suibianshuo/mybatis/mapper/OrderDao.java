package com.suibianshuo.mybatis.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.suibianshuo.entity.mobile.Order;

@Repository
public interface OrderDao {
	//查询所有订单
	public List<Order> getAllOrder(Order Order);
	//添加订单
	public int addOrder(Order order);
	//订单数量
	public int getCount(Order order); 
	//更新订单
	public int updateOrder(Order order);
    //删除
	public int deleteUserById(int id);
}
