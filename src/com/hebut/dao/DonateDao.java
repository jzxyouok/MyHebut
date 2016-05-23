package com.hebut.dao;

import java.util.List;

import com.hebut.entity.Donate;

public interface DonateDao {

	/**
	 * 获取所有捐赠信息
	 */
	public List<Donate> selectDonates();

	
}
