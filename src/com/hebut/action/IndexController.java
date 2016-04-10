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
import com.hebut.entity.User;
import com.hebut.service.BillboardService;
import com.hebut.service.UserService;
import com.hebut.util.TimeUtil;

@Controller
public class IndexController {

	@Autowired
	UserService userService;

	@Autowired
	BillboardService boardService;

	/**
	 * myhebut首页
	 */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String myhebut() {
		return "myhebut";
	}
	
	/**
	 * 源码下载
	 */
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public String download() {
		return "download";
	}
	
	/**
	 * 捐赠
	 */
	@RequestMapping(value = "donate", method = RequestMethod.GET)
	public String donate() {
		return "donate";
	}

	/**
	 * 核对用户名和密码
	 */
	@RequestMapping(value = "loginCheck", method = RequestMethod.POST)
	@ResponseBody
	public String loginCheck(@RequestBody User user, HttpServletRequest request) {
		JsonResult jsonResult = new JsonResult();
		String result = userService.loginCheck(user);
		// 如果用户存在,则表示登录成功
		if (result.equals("success")) {
			// 设置登录信息
			User loginedUser = userService.getUser(user.getUserName());
			request.getSession().setAttribute("loginedUser", loginedUser);
			jsonResult.setResultCode(0);
		} else {
			jsonResult.setResultCode(1);
			jsonResult.setData(result);
		}
		return new Gson().toJson(jsonResult);
	}

	/**
	 * 注销
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "myhebut";
	}

	/**
	 * 首页
	 */
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(Map<String, Object> model) {
		List<Billboard> boards = boardService.getBoards();
		model.put("boards", boards);
		return "index";
	}

	/**
	 * 注册
	 */
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register() {
		return "register";
	}

	/**
	 * 增加新用户
	 */
	@RequestMapping(value = "addUser", method = RequestMethod.POST)
	@ResponseBody
	public String addUser(@RequestBody User user, HttpServletRequest request) {
		JsonResult jsonResult = new JsonResult();
		// 昵称默认为登录用户名
		user.setNickName("(请设置昵称)");
		// 设置创建时间
		String create_time = TimeUtil.getDate();
		user.setCreate_time(create_time);
		// 返回true则添加成功,false则表明用户已存在
		boolean flag = userService.addUser(user);
		jsonResult.setResultCode(flag ? 0 : 1);
		return new Gson().toJson(jsonResult);
	}

	/**
	 * 访问公告详细内容
	 */
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(Map<String, Object> model, HttpServletRequest request) {
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		Billboard billboard = boardService.getBoardDetail(boardId);

		model.put("billboard", billboard);

		return "detail";
	}

}
