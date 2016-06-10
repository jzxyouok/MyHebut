package com.hebut.util;

public class MessageUtil {
	
	/**
	 * 邮件内容
	 */
	public static String initEmail(int userId, String email, String content) {
		String emailContent = "用户Id:" + userId + ", email:" + email + ", 留言内容:" + content;
		return emailContent;
	}
}
