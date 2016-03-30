package com.hebut.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hebut.dao.MessageDao;
import com.hebut.entity.Message;
import com.hebut.service.MessageService;
import com.hebut.util.TimeUtil;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	MessageDao messageDao;

	@Override
	public void addMessage(int userId, String content, String reply, String create_time) {
		Message advice = new Message();
		advice.setUserId(userId);
		advice.setContent(content);
		advice.setReply(reply);
		advice.setCreate_time(create_time);
		messageDao.insertMessage(advice);
	}

	@Override
	public void addReply(int messageId, String reply) {
		messageDao.updateReply(messageId, reply);
	}

	@Override
	public List<Message> getMessages() {
		List<Message> messages = messageDao.selectAllMessages();
		TimeUtil.setMessageDate(messages);
		return messages;
	}
	
	@Override
	public List<Message> getMessagesByUserId(int userId) {
		List<Message> messages = messageDao.selectMessagesByUserId(userId);
		TimeUtil.setMessageDate(messages);
		return messages;
	}

}
