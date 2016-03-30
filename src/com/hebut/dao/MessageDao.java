package com.hebut.dao;

import java.util.List;

import com.hebut.entity.Message;

public interface MessageDao {

	/**
	 * 添加留言
	 */
	public void insertMessage(Message message);
	
	/**
	 * 添加回复
	 */
	public void updateReply(int messageId, String reply);
	
	/**
	 * 获取全部留言
	 */
	public List<Message> selectAllMessages();
	
	/**
	 * 获取用户自己发布的留言
	 */
	public List<Message> selectMessagesByUserId(int userId);
 
}
