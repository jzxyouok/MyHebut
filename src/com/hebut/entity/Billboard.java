package com.hebut.entity;

public class Billboard {

	/** 公告id */
	private int boardId;
	/** 公告标题 */
	private String title;
	/** 公告详细内容 */
	private String detail;
	/** 公告发布时间 */
	private String create_time;

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

}
