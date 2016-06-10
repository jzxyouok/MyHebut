package com.hebut.service;

import java.util.List;

import com.hebut.entity.Message;

public interface MessageService {
	
	/**
	 * 添加留言
	 */
	public void addMessage(int userId, String content, String create_time);
	
	/**
	 * 添加回复
	 */
	public void addReply(int messageId, String reply);
	
	/**
	 * 获取全部留言
	 */
	public List<Message> getMessages();
	
	/**
	 * 获取用户自己发布的留言
	 */
	public List<Message> getMessagesByUserId(int userId);
	
	/**
	 * 邮件题型管理员有新留言
	 */
	public void sendEmail(int userId, String email, String content);

}
