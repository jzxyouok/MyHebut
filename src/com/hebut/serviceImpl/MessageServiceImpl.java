package com.hebut.serviceImpl;

import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hebut.config.SystemProperties;
import com.hebut.dao.MessageDao;
import com.hebut.entity.Message;
import com.hebut.service.MessageService;
import com.hebut.util.MessageUtil;
import com.hebut.util.TimeUtil;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageDao messageDao;

	@Override
	public void addMessage(int userId, String content, String create_time) {
		Message advice = new Message();
		advice.setUserId(userId);
		advice.setContent(content);
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

	@Override
	public void sendEmail(int userId, String email, String content) {
		try {
			// 配置发送邮件的环境属性
			final Properties props = new Properties();
			// 表示SMTP发送邮件，需要进行身份验证
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.host", "smtp.163.com");
			props.put("mail.transport.protocol", "smtp");
			// 发件人email账号
			props.put("mail.user", SystemProperties.getSendUser());
			// 访问SMTP服务时需要提供的密码
			props.put("mail.password", SystemProperties.getSendPassword());
			// 构建授权信息，用于进行SMTP进行身份验证
			Authenticator authenticator = new Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					// 用户名、密码
					String userName = props.getProperty("mail.user");
					String password = props.getProperty("mail.password");
					return new PasswordAuthentication(userName, password);
				}
			};
			// 使用环境属性和授权信息，创建邮件会话
			Session mailSession = Session.getInstance(props, authenticator);
			// 创建邮件消息
			MimeMessage message = new MimeMessage(mailSession);
			// 设置发件人
			InternetAddress form = new InternetAddress(props.getProperty("mail.user"));
			message.setFrom(form);
			// 设置收件人
			InternetAddress to = new InternetAddress(SystemProperties.getReceiver());
			message.setRecipient(RecipientType.TO, to);
			// 设置邮件标题
			message.setSubject("悦河工:有新的留言!");
			// 设置邮件的内容体
			message.setContent(MessageUtil.initEmail(userId, email, content), "text/html;charset=UTF-8");
			// 发送邮件
			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
