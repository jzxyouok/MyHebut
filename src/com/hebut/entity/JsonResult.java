package com.hebut.entity;

import java.io.Serializable;

public class JsonResult implements Serializable {

	/** serialVersionUID */
	private static final long serialVersionUID = -6781968810773357539L;
	/** 返回结果码 0成功，非0失败 */
	private int resultCode = 0;
	/** 返回数据 */
	private Object Data;
	/** 学号校验情况 0成功，非0失败 */
	private int idStatus = 0;
	/** 返回数据,成绩信息 */
	private Object scoreData;
	/** 返回数据,学生信息 */
	private Object stuData;

	public int getResultCode() {
		return resultCode;
	}

	public void setResultCode(int resultCode) {
		this.resultCode = resultCode;
	}

	public Object getData() {
		return Data;
	}

	public void setData(Object Data) {
		this.Data = Data;
	}

	public int getIdStatus() {
		return idStatus;
	}

	public void setIdStatus(int idStatus) {
		this.idStatus = idStatus;
	}

	public Object getScoreData() {
		return scoreData;
	}

	public void setScoreData(Object scoreData) {
		this.scoreData = scoreData;
	}

	public Object getStuData() {
		return stuData;
	}

	public void setStuData(Object stuData) {
		this.stuData = stuData;
	}

}
