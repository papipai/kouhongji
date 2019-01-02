package com.suibianshuo.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suibianshuo.entity.mobile.AccessToken;
import com.suibianshuo.mybatis.mapper.AccessTokenDao;
import com.suibianshuo.service.AccessTokenService;
@Service
public class AccessTokenServiceImpl implements AccessTokenService {
	@Autowired
	private AccessTokenDao accessTokenDao;
	
	public AccessToken selectToken() {
		return accessTokenDao.selectToken();
	};
	public int updateToken(AccessToken accessToken) {
		return accessTokenDao.updateToken(accessToken);
	};
	public int addToken(AccessToken accessToken) {
		return accessTokenDao.addToken(accessToken);
	};
}
