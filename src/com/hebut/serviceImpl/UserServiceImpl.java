package com.hebut.serviceImpl;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.ObjectMetadata;
import com.hebut.config.SystemProperties;
import com.hebut.dao.UserDao;
import com.hebut.entity.User;
import com.hebut.service.UserService;
import com.hebut.util.TimeUtil;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserDao userDao;
	

	@Override
	public User getUser(String userName) {
		User user = userDao.selectUserByUserName(userName);
		return user;
	}

	@Override
	public String loginCheck(User user) {
		User loginedUser = userDao.selectUserByUserName(user.getUserName());	
		// 用户存在,且密码正确,则返回true
		if (loginedUser != null) {
			if (loginedUser.getUserPass().equals(user.getUserPass())) {
				return "success";
			} else {
				return "您输入的密码有误";
			}
		}
		return "您输入的用户名不存在";
	}

	@Override
	public int getUserId(HttpServletRequest request) {
		User loginedUser = (User)request.getSession().getAttribute("loginedUser");
		int userId = loginedUser.getUserId();
		return userId;
	}

	@Override
	public boolean addUser(User user) {
		User loginedUser = userDao.selectUserByUserName(user.getUserName());	
		// 如果用户名不存在,则可以成功注册添加
		if (loginedUser == null) {
			userDao.insertUser(user);
			return true;
		}
		return false;
	}

	@Override
	public User getUserByUserId(int userId) {
		User user = userDao.selectUserByUserId(userId);
		return user;
	}

	@Override
	public boolean alterNickName(String nickName, int userId) {
		// 如果设置中昵称不为空,则进行更新
		if (!nickName.equals("")) {
		    userDao.updateNameByUserId(userId, nickName);
		}
		return true;
	}

	@Override
	public boolean alterAvatar(int userId, String userName, String oldAvatar, MultipartFile multipartFile) {
		String accessKeyId = SystemProperties.getAccessKeyId();
		String accessKeySecret = SystemProperties.getAccessKeySecret();
		String endpoint = SystemProperties.getEndpoint();
		
		// 初始化一个OSSClient
		OSSClient client = new OSSClient(endpoint,accessKeyId, accessKeySecret);
		InputStream in = null;
		try {
			in = multipartFile.getInputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}

		long length = multipartFile.getSize();
		
		ObjectMetadata meta = new ObjectMetadata();
		// 必须设置ContentLength
		meta.setContentLength(length);
		// 随机一个头像名
		String avatar = userName + TimeUtil.getDate4Save();
		// 上传Object.
		client.putObject("myhebut", "touxiang/" + avatar + ".jpg", in, meta);
		// 删除Object中原来的头像
		client.deleteObject("myhebut", "touxiang/" + oldAvatar + ".jpg");
		//更新头像地址
		userDao.updateAvatarUrlByUserId(userId, avatar);
		return true;
 	}
	
	@Override
	public void alterPass(int userId, String userPass) {
		userDao.updatePassByUserId(userId, userPass);
	}
	
	@Override
	public int getRegisterAmount() {
		int amount = userDao.getRegisterAmount();
		return amount;
	}

	@Override
	public List<User> getUsers(int start_row, int page_size) {
		List<User> users = userDao.selectUsers(start_row, page_size);
		return users;
	}

	@Override
	public List<User> getUserByNickName(String nickName) {
		List<User> users = userDao.selectUserByNickName(nickName);
		return users;
	}

	
}