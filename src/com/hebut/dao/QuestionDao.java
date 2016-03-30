package com.hebut.dao;

import java.util.List;

import com.hebut.entity.Question;

public interface QuestionDao {

	/**
	 * 获得题目内容
	 */
	public Question selectQuestionById(int questionId);

	/**
	 * 根据关键词搜索单选题
	 */
	public List<Question> selectSingleQuestionsByKeyword(String keyword, String subject);

	/**
	 * 根据关键词搜索多选题
	 */
	public List<Question> selectMultipleQuestionsByKeyword(String keyword, String subject);

	/**
	 * 随机获取一定数目单选题
	 */
	public List<Question> selectSingleQuestions(int amount, String subject);

	/**
	 * 随机获取一定数目的多选题
	 */
	public List<Question> selectMultipleQuestions(int aomunt, String subject);

	/**
	 * 获取章节内的所有单选题
	 */
	public List<Question> selectSingleQuestionsBySection(String section, String subject);

	/**
	 * 获取章节内的所有多选题
	 */
	public List<Question> selectMultipleQuestionsBySection(String section, String subject);
}
