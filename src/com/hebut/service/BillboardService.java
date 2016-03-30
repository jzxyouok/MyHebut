package com.hebut.service;

import java.util.List;

import com.hebut.entity.Billboard;

public interface BillboardService {
	
	/**
	 * 删除通告
	 */
	public void deleteBillboard(int boardId);
	
	/**
	 * 发布通告
	 */
	public void addBillboard(String title, String detail);

	/**
	 * 获取公告内容
	 */
	public Billboard getBoardDetail(int boardId);
	
	/**
	 * 获取所有公告
	 */
	public List<Billboard> getBoards();

}
