package com.suibianshuo.serviceImpl.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suibianshuo.entity.web.Partner;
import com.suibianshuo.mybatis.mapper.PartnerDao;
import com.suibianshuo.service.web.PartnerService;

@Service
public class PartnerServiceImpl implements PartnerService{
	@Autowired
    private PartnerDao partnerDao;

	@Override
	public List<Partner> getAllPartner(Partner partner) {
		// TODO Auto-generated method stub
		return partnerDao.getAllPartner(partner);
	}

	@Override
	public int addPartner(Partner partner) {
		// TODO Auto-generated method stub
		return partnerDao.addPartner(partner);
	}

	@Override
	public int updatePartner(Partner partner) {
		// TODO Auto-generated method stub
		return partnerDao.updatePartner(partner);
	}

	@Override
	public int deletePartnerById(int id) {
		// TODO Auto-generated method stub
		return partnerDao.deletePartnerById(id);
	}

	@Override
	public int getCountPartner() {
		// TODO Auto-generated method stub
		return partnerDao.getCountPartner();
	}


	
}