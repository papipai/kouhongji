package com.suibianshuo.mybatis.mapper;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.suibianshuo.entity.mobile.User;

@Repository
public interface UserDao {
	//取全部用户 + 分页 + 按条件匹配
	public List<User> getUserList(User user);
	//通过openID获取
	public User getUser(User user);
	//用户线上
	public User getUpperLine(User user);
	//用户下线
	public List<User> getOffLineList(User user);
	//用户数量
	public int getCount(User user); 
	//添加用户
	public int addUser(User user);
    //更新
	public int updateUser(User user);
    //删除
	public int deleteUserById(int id);
}
