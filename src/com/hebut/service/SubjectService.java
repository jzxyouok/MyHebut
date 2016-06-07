package com.hebut.service;

import java.util.List;

import com.hebut.entity.Record;
import com.hebut.entity.Question;
import com.hebut.entity.Note;

public interface SubjectService {
	
	/**
	 * 获得题目内容
	 */
	public Question getQuestionById(int questionId);

	/**
	 * 出题(单选)
	 */
	public List<Question> getSingleQuestions(String subject);
	
	/**
	 * 出题(多选)
	 */
	public List<Question> getMultipleQuestions(String subject);

	/**
	 * 显示单选错题集
	 */
	public List<Note> getSingleNotes(int userId, String subject);
	
	/**
	 * 显示多选错题集
	 */
	public List<Note> getMultipleNotes(int userId, String subject);
	 
	/**
	 * 添加错题
	 */
	public boolean addNote(int userId, int questionId, String answerF);
	
	/**
	 * 删除错题
	 */
	public void deleteNote(int noteId);
	
	/**
	 * 删除错题练习时答对的错题
	 */
	public void deletePraticeNote(int userId, int questionId);
	
	
	/**
	 * 获得章节对应的单选题库
	 */
	public List<Question> getSingleQuestionsBySection(String section, String subject);
	
	/**
	 * 获得章节对应的多选题库
	 */
	public List<Question> getMultipleQuestionsBySection(String section, String subject);
	
	/**
	 * 获得考试记录
	 */
	public List<Record> getRecords(int userId, String subject);
	
	/**
	 * 添加考试记录
	 */
	public void addRecord(int userId, String begin_time, String last_time, float score, String subject, int seconds);
	
	/**
	 * 删除考试记录
	 */
	public void deleteRecord(int recordId);
	
	/**
	 * 根据章节信息,单选多选类型
	 * 返回题目
	 */
	public List<Question> getRandomQuestions(String[] sections, String questionType, String subject);
	
	/**
	 * 搜索功能(单选)
	 */
	public List<Question> getSingleQuestionByKeyword(String keyword, String subject);
	
	/**
	 * 搜索功能(多选)
	 */
	public List<Question> getMultipleQuestionByKeyword(String keyword, String subject);
	
	/**
	 * 获取排行榜
	 */
	public List<Record> getRank(String subject);

}
