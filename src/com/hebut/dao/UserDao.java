package com.hebut.dao;

import java.util.List;

import com.hebut.entity.User;

public interface UserDao {
	
	/**
	 * 管理员分页批量获取用户
	 */
	public List<User> selectUsers(int start_row, int page_size);
	
	/**
	 * 通过userId获取用户
	 */
	public User selectUserByUserId(int userId);
	
	/**
	 * 通过userName获取用户
	 */
	public User selectUserByUserName(String userName);

	/**
	 * 添加用户
	 */
	public void insertUser(User user);
	
	/**
	 * 更新个人昵称
	 */
	public void updateNameByUserId(int userId, String nickName);
	
	/**
	 * 更新个人头像
	 */
	public void updateAvatarUrlByUserId(int userId, String avatar);
		
	/**
	 * 更新个人密码
	 */
	public void updatePassByUserId(int userId, String userPass);
	
	/**
	 * 获取注册人数
	 */
	public int getRegisterAmount();
	
	/**
	 * 通过昵称获取用户
	 */
	public List<User> selectUserByNickName(String nickName);
	
}
