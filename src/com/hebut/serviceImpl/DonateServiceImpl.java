package com.hebut.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hebut.dao.DonateDao;
import com.hebut.entity.Donate;
import com.hebut.service.DonateService;

@Service
public class DonateServiceImpl implements DonateService {
	
	@Autowired
	DonateDao donateDao;

	@Override
	public List<Donate> getDonate() {
		List<Donate> donates = donateDao.selectDonates();
		return donates;
	}
 
}
