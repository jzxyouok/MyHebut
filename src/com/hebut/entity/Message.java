package com.hebut.entity;

public class Message {

	/** 留言Id */
	private int messageId;
	/** 留言者用户Id */
	private int userId;
	/** 留言内容 */
	private String content;
	/** 网站回复 */
	private String reply;
	/** 留言时间 */
	private String create_time;

	public int getMessageId() {
		return messageId;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

}
