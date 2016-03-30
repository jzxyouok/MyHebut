package com.hebut.entity;

/**
 * 个人设置
 * 用于前后端传值
 */
public class Setting {
	
	/** 用户昵称 */
	private String nickName;
	/** 用户头像 */
	private Object touxiang;
	
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Object getTouxiang() {
		return touxiang;
	}

	public void setTouxiang(Object touxiang) {
		this.touxiang = touxiang;
	}
	
}
