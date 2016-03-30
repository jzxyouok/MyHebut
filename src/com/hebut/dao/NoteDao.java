package com.hebut.dao;

import java.util.List;

import com.hebut.entity.Note;

public interface NoteDao {

	/**
	 * 获取用户的所有单选错题
	 */
	public List<Note> selectSingleNotesByUserId(int userId, String subject);

	/**
	 * 获取用户的所有多选错题
	 */
	public List<Note> selectMultipleNotesByUserId(int userId, String subject);

	/**
	 * 添加错题
	 */
	public void addNote(Note note);

	/**
	 * 删除错题
	 */
	public void deleteNote(int noteId);

	/**
	 * 查找用户的指定错题
	 * 用于判断错题是否已存在
	 */
	public Note selectNote(int userId, int questionId);
	
}
