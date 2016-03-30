package com.hebut.dao;

import java.util.List;

import com.hebut.entity.Billboard;

public interface BillboardDao {

	/**
	 * 获取所有公告
	 */
	public List<Billboard> selectBoards();
	
	/**
	 * 获取某条公告具体内容
	 */
	public Billboard selectBoardByBoardId(int boardId);
	
	/**
	 * 管理员添加公告
	 */
	public void addBoard(Billboard billboard);
	
	/**
	 * 管理员删除公告
	 */
	public void deleteBoardByBoardId(int boardId);

}
