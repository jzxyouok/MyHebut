package com.hebut.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.hebut.entity.JsonResult;
import com.hebut.entity.Setting;
import com.hebut.entity.User;
import com.hebut.service.UserService;

@Controller
public class SettingController {

	@Autowired
	UserService userService;

	/**
	 * 个人设置
	 */
	@RequestMapping(value = "setting", method = RequestMethod.GET)
	public String setting() {
		return "setting";
	}

	/**
	 * 更新个人设置之头像
	 */
	@RequestMapping(value = "settingUpdateTouxiang", method = RequestMethod.POST)
	@ResponseBody
	public String settingUpdateTouxiang(HttpServletRequest request) {

		int userId = userService.getUserId(request);
		User user = userService.getUserByUserId(userId);
		String userName = user.getUserName();
		String oldAvatar = user.getAvatar();

		JsonResult jsonResult = new JsonResult();
		jsonResult.setResultCode(0);
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("touxiang");
		if (!multipartFile.isEmpty()) {
			// 更新用户头像
			userService.alterAvatar(userId, userName, oldAvatar, multipartFile);
			// 更新用户登录信息
			User loginedUser = userService.getUserByUserId(userId);
			request.getSession().setAttribute("loginedUser", loginedUser);
		}
		jsonResult.setResultCode(0);
		return new Gson().toJson(jsonResult);
	}

	/**
	 * 更新个人设置之其他
	 */
	@RequestMapping(value = "settingUpdateOther", method = RequestMethod.POST)
	@ResponseBody
	public String settingUpdateOther(@RequestBody Setting setting, HttpServletRequest request) {
		JsonResult jsonResult = new JsonResult();
		int userId = userService.getUserId(request);
		String nickName = setting.getNickName();
		// 更新用户昵称
		boolean flag = userService.alterNickName(nickName, userId);
		// 更新用户登录信息
		User user = userService.getUserByUserId(userId);
		request.getSession().setAttribute("loginedUser", user);
		jsonResult.setResultCode(flag ? 0 : 1);
		return new Gson().toJson(jsonResult);
	}

	/**
	 * 修改密码
	 */
	@RequestMapping(value = "alterMyPass", method = RequestMethod.POST)
	@ResponseBody
	public String alterMyPass(@RequestBody Map<String, String> params, HttpServletRequest request) {
		String oldPass = params.get("oldPass");
		String newPass = params.get("newPass");

		JsonResult jsonResult = new JsonResult();
		int userId = userService.getUserId(request);
		User user = userService.getUserByUserId(userId);
		if (oldPass.equals(user.getUserPass())) {
			userService.alterPass(userId, newPass);
			jsonResult.setResultCode(0);
		} else {
			jsonResult.setResultCode(1);
		}
		return new Gson().toJson(jsonResult);
	}

}
