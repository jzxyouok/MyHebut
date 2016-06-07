package com.hebut.dao;

import java.util.List;

import com.hebut.entity.Record;

public interface RecordDao {
	
	/**
	 * 添加考试练习记录
	 */
	public void addRecord(Record record);
	
	/**
	 * 获取用户所有的考试记录
	 */
	public List<Record> selectRecordsByUserId(int userId, String subject);
	
	/**
	 * 删除考试记录
	 */
	public void deleteRecord(int recordId);
	
	/**
	 * 获取考试排行榜
	 */
	public List<Record> selectRank(String subject);

}
