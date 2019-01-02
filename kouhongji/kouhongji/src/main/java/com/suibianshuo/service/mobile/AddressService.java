package com.suibianshuo.service.mobile;

import java.util.List;

import com.suibianshuo.entity.mobile.Address;

public interface AddressService {  
	/**
	 * 用户地址
	 * @param user
	 * @return
	 */
	public List<Address> getAllAddress(String openid);
	/**
	 * 新增地址
	 * @param user
	 * @return
	 */
	public int addAddress(Address address);
	/**
	 * 更新用户
	 * @param user
	 * @return
	 */
	public int updateAddress(Address address);
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	public int deleteAddressById(int id);
}  
