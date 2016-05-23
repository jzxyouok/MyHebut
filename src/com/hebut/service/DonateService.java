package com.hebut.service;

import java.util.List;

import com.hebut.entity.Donate;

public interface DonateService {

	/**
	 * 获取捐赠列表
	 */
	public List<Donate> getDonate();
}
