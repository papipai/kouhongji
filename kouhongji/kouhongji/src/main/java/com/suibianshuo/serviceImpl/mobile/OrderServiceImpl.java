package com.suibianshuo.serviceImpl.mobile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suibianshuo.entity.mobile.Order;
import com.suibianshuo.mybatis.mapper.OrderDao;
import com.suibianshuo.service.mobile.OrderService;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
    private OrderDao orderDao;

	@Override
	public List<Order> getAllOrder(Order order) {
		// TODO Auto-generated method stub
		return orderDao.getAllOrder(order);
	}

	@Override
	public int getCount(Order order) {
		// TODO Auto-generated method stub
		return orderDao.getCount(order);
	}

	@Override
	public int addOrder(Order order) {
		// TODO Auto-generated method stub
		return orderDao.addOrder(order);
	}

	@Override
	public int updateOrder(Order order) {
		// TODO Auto-generated method stub
		return orderDao.updateOrder(order);
	}

	@Override
	public int deleteUserById(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}