package com.suibianshuo.serviceImpl.mobile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suibianshuo.entity.mobile.Goods;
import com.suibianshuo.entity.mobile.User;
import com.suibianshuo.mybatis.mapper.GoodsDao;
import com.suibianshuo.service.mobile.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService{
	@Autowired
    private GoodsDao goodsDao;

	@Override
	public List<Goods> getAllGoods() {
		// TODO Auto-generated method stub
		return goodsDao.getAllGoods();
	}

	@Override
	public int getCount(String search_name, String search_account) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUserById(int id) {
		// TODO Auto-generated method stub
		return 0;
	}  
	
}