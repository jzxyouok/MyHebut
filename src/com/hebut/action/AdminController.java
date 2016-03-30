package com.hebut.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.hebut.entity.Billboard;
import com.hebut.entity.JsonResult;
import com.hebut.entity.Message;
import com.hebut.entity.User;
import com.hebut.service.BillboardService;
import com.hebut.service.MessageService;
import com.hebut.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	UserService userService;

	@Autowired
	BillboardService boardService;

	@Autowired
	MessageService messageService;

	/**
	 * 用户管理界面
	 */
	@RequestMapping(value = "user", method = RequestMethod.GET)
	public String adminUser(Map<String, Object> model) {
		return "admin/user";
	}

	/**
	 * 根据用户昵称搜索用户
	 */
	@RequestMapping(value = "searchUser", method = RequestMethod.POST)
	public String searchUser(Map<String, Object> model, HttpServletRequest request) {
		// 每页数据条数
		int page_size = 50;
		String nickName = request.getParameter("nickName");
		int page_now = Integer.parseInt(request.getParameter("page_now"));
		int start_row = (page_now - 1) * page_size;
		List<User> users = null;
		if (nickName.equals("")) {
			users = userService.getUsers(start_row, page_size);
		} else {
			users = userService.getUserByNickName(nickName);
		}
		int page_num = userService.getRegisterAmount()/page_size + 1;
		model.put("users", users);
		model.put("page_now", page_now);
		model.put("page_num", page_num);
		model.put("nickName", nickName);
		return "admin/user";
	}

	/**
	 * 公告管理界面
	 */
	@RequestMapping(value = "billboard", method = RequestMethod.GET)
	public String adminBillboard(Map<String, Object> model) {
		List<Billboard> boards = boardService.getBoards();
		model.put("boards", boards);
		return "admin/billboard";
	}

	/**
	 * 删除公告
	 */
	@RequestMapping(value = "deleteBoard", method = RequestMethod.POST)
	@ResponseBody
	public String deleteBoard(@RequestBody Map<String, String> params) {
		int boardId = Integer.parseInt(params.get("boardId"));
		boardService.deleteBillboard(boardId);

		JsonResult jsonResult = new JsonResult();
		jsonResult.setResultCode(0);
		return new Gson().toJson(jsonResult);
	}

	/**
	 * 添加公告
	 */
	@RequestMapping(value = "addBoard", method = RequestMethod.POST)
	@ResponseBody
	public String addBoard(@RequestBody Map<String, String> params, HttpServletRequest request) {
		String title = params.get("title");
		String detail = params.get("detail");

		boardService.addBillboard(title, detail);

		JsonResult jsonResult = new JsonResult();
		jsonResult.setResultCode(0);
		return new Gson().toJson(jsonResult);
	}

	/**
	 * 留言管理界面
	 */
	@RequestMapping(value = "message", method = RequestMethod.GET)
	public String problem(Map<String, Object> model) {
		List<Message> messages = messageService.getMessages();
		model.put("messages", messages);
		return "admin/message";
	}

	/**
	 * 添加回复
	 */
	@RequestMapping(value = "addReply", method = RequestMethod.POST)
	@ResponseBody
	public String addReply(@RequestBody Map<String, String> params, HttpServletRequest request) {
		int messageId = Integer.parseInt(params.get("messageId"));
		String reply = params.get("reply");
		messageService.addReply(messageId, reply);
		JsonResult jsonResult = new JsonResult();
		jsonResult.setResultCode(0);
		return new Gson().toJson(jsonResult);
	}

}
