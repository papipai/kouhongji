package com.suibianshuo.serviceImpl.mobile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suibianshuo.entity.mobile.User;
import com.suibianshuo.mybatis.mapper.UserDao;
import com.suibianshuo.service.mobile.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
    private UserDao userDao;

	@Override
	public List<User> getUserList(User user) {
		// TODO Auto-generated method stub
		return userDao.getUserList(user);
	}

	@Override
	public User getUser(User user) {
		// TODO Auto-generated method stub
		return userDao.getUser(user);
	}
	
	@Override
	public int getCount(User user) {
		// TODO Auto-generated method stub
		return userDao.getCount(user);
	} 
	
	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
		return userDao.addUser(user);
	}

	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return userDao.updateUser(user);
	}

	@Override
	public int deleteUserById(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public User getUpperLine(User user) {
		// TODO Auto-generated method stub
		return userDao.getUpperLine(user);
	}

	@Override
	public List<User> getOffLineList(User user) {
		// TODO Auto-generated method stub
		return userDao.getOffLineList(user);
	}


	

}