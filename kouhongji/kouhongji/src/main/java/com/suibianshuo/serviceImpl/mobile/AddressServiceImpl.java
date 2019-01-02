package com.suibianshuo.serviceImpl.mobile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suibianshuo.entity.mobile.Address;
import com.suibianshuo.mybatis.mapper.AddressDao;
import com.suibianshuo.service.mobile.AddressService;

@Service
public class AddressServiceImpl implements AddressService{
	@Autowired
    private AddressDao addressDao;


	@Override
	public int addAddress(Address address) {
		System.out.println("addressDao="+addressDao);
		return addressDao.addAddress(address);
	}

	@Override
	public int updateAddress(Address address) {
		// TODO Auto-generated method stub
		return addressDao.updateAddress(address);
	}

	@Override
	public int deleteAddressById(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Address> getAllAddress(String openid) {
		// TODO Auto-generated method stub
		return addressDao.getAllAddress(openid);
	}  
	
}