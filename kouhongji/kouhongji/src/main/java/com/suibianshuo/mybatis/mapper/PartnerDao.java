package com.suibianshuo.mybatis.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.suibianshuo.entity.web.Partner;

@Repository
public interface PartnerDao {
	//查询
	public List<Partner> getAllPartner(Partner partner);
	//添加
	public int addPartner(Partner partner);
	//合伙人数量
	public int getCountPartner(); 
	//更新订单
	public int updatePartner(Partner partner);
    //删除
	public int deletePartnerById(int id);
}
