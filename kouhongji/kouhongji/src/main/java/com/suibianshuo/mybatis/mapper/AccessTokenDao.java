package com.suibianshuo.mybatis.mapper;

import org.springframework.stereotype.Repository;

import com.suibianshuo.entity.mobile.AccessToken;

@Repository
public interface AccessTokenDao {
	public	AccessToken selectToken();
	public	int updateToken(AccessToken accessToken);
	public	int addToken(AccessToken accessToken);
}
