package com.hebut.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.hebut.entity.User;

public interface UserService {
	
	/**
	 * 根据用户名获得用户
	 */
	public User getUser(String userName);

	/**
	 * 核对用户名和密码 返回success则为用户名和密码正确 否则为错误信息
	 */
	public String loginCheck(User user);

	/**
	 * 获取登录用户的userId
	 */
	public int getUserId(HttpServletRequest request);

	/**
	 * 用户注册
	 */
	public boolean addUser(User user);

	/**
	 * 通过userId获得用户
	 */
	public User getUserByUserId(int userId);

	/**
	 * 修改用户昵称
	 */
	public boolean alterNickName(String nickName, int userId);

	/**
	 * 修改用户头像
	 */
	public boolean alterAvatar(int userId, String userName, String oldAvatar, MultipartFile multipartFile);

	/**
	 * 修改用户密码
	 */
	public void alterPass(int userId, String userPass);

	/**
	 * 管理员功能：获取注册人数
	 */
	public int getRegisterAmount();

	/**
	 * 管理员功能：获取所有用户
	 */
	public List<User> getUsers(int start_row, int page_size);

	/**
	 * 管理员功能：根据用户昵称获取用户
	 */
	public List<User> getUserByNickName(String nickName);

}