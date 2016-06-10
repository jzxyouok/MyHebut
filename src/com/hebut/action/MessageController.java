package com.hebut.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hebut.entity.Message;
import com.hebut.entity.User;
import com.hebut.service.MessageService;
import com.hebut.service.UserService;
import com.hebut.util.TimeUtil;

@Controller
public class MessageController {

	@Autowired
	UserService userService;

	@Autowired
	MessageService messageService;

	/**
	 * 留言界面
	 */
	@RequestMapping(value = "message", method = RequestMethod.GET)
	public String message(HttpServletRequest request, Map<String, Object> model) {
		int userId = userService.getUserId(request);
		List<Message> messages = messageService.getMessagesByUserId(userId);
		model.put("messages", messages);
		return "message";
	}

	/**
	 * 添加留言
	 */
	@RequestMapping(value = "addMessage", method = RequestMethod.POST)
	public String addMessage(HttpServletRequest request, Map<String, Object> model) {
		int userId = userService.getUserId(request);
		String content = request.getParameter("content");
		String create_time = TimeUtil.getDate();
		// 添加留言
		messageService.addMessage(userId, content, create_time);
		// 将留言情况发送给管理员
		User user = userService.getUserByUserId(userId);
		messageService.sendEmail(userId, user.getEmail(), content);
		// 重新返回留言界面
		List<Message> messages = messageService.getMessagesByUserId(userId);
		model.put("messages", messages);
		return "message";
	}

}
