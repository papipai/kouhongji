package com.suibianshuo.mybatis.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.suibianshuo.entity.mobile.Goods;
import com.suibianshuo.entity.mobile.User;

@Repository
public interface GoodsDao {
	//查询所有口红
	public List<Goods> getAllGoods();
	//用户数量
	public int getCount(); 
	//添加用户
	public int addUser(User user);
    //更新
	public int updateUser(User user);
    //删除
	public int deleteUserById(int id);
}
