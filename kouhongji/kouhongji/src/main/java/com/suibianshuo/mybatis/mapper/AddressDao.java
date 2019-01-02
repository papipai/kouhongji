package com.suibianshuo.mybatis.mapper;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.suibianshuo.entity.mobile.Address;

@Repository
public interface AddressDao {
	//添加地址
	public int addAddress(Address address);
	public int updateAddress(Address address);
	public List<Address> getAllAddress(String openid);
}
