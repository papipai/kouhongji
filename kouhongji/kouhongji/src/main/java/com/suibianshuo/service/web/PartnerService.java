package com.suibianshuo.service.web;


import java.util.List;

import com.suibianshuo.entity.web.Partner;

public interface PartnerService {  
	/**
	 * 获取用户
	 * @return
	 */
	public List<Partner> getAllPartner(Partner partner);
	/**
	 * 新增用户
	 * @param user
	 * @return
	 */
	public int addPartner(Partner partner);
	/**
	 * 更新用户
	 * @param user
	 * @return
	 */
	public int updatePartner(Partner partner);
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	public int deletePartnerById(int id);
	
	public int getCountPartner();
}  
