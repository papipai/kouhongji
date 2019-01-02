package com.suibianshuo.service;

import com.suibianshuo.entity.mobile.AccessToken;

public interface AccessTokenService {
	public AccessToken selectToken();
	public int updateToken(AccessToken accessToken);
	public int addToken(AccessToken accessToken);
}
