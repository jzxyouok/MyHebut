package com.hebut.entity;

public class Note {

	/** 错题Id */
	private int noteId;
	/** 题号Id */
	private int questionId;
	/** 错题绑定的用户Id */
	private int userId;
	/** 在线考试时用户选项 */
	private String answerF;
	/** 错题详细内容(与数据库无关) */
	private Question question;

	public int getNoteId() {
		return noteId;
	}

	public void setNoteId(int noteId) {
		this.noteId = noteId;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getAnswerF() {
		return answerF;
	}

	public void setAnswerF(String answerF) {
		this.answerF = answerF;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	@Override
	public String toString() {
		return "Note [noteId=" + noteId + ", userId=" + userId + ",questionId=" + questionId + ",answerF="
				+ answerF + ",question=" + question + "]";
	}
}
