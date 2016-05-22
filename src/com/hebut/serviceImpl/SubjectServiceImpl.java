package com.hebut.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hebut.dao.NoteDao;
import com.hebut.dao.QuestionDao;
import com.hebut.dao.RecordDao;
import com.hebut.entity.Note;
import com.hebut.entity.Question;
import com.hebut.entity.Record;
import com.hebut.service.SubjectService;
import com.hebut.util.ExamUtil;
import com.hebut.util.TimeUtil;

@Service
public class SubjectServiceImpl implements SubjectService {

	@Autowired
	QuestionDao questionDao;

	@Autowired
	NoteDao noteDao;

	@Autowired
	RecordDao recordDao;

	@Override
	public Question getQuestionById(int questionId) {
		Question question = questionDao.selectQuestionById(questionId);
		return question;
	}


	@Override
	public List<Question> getSingleQuestions(String subject) {
		if(subject.equals("0")){
			List<Question> singleQuestions = questionDao.selectSingleQuestions(60, subject);
			return singleQuestions;
		} else if(subject.equals("1")){
			List<Question> singleQuestions = questionDao.selectSingleQuestions(40, subject);
			return singleQuestions;
		} else{
			List<Question> singleQuestions = questionDao.selectSingleQuestions(40, subject);
			return singleQuestions;
		}
	}

	@Override
	public List<Question> getMultipleQuestions(String subject) {
		if(subject.equals("0")){
			List<Question> multipleQuestions = questionDao.selectMultipleQuestions(10, subject);
			return multipleQuestions;
		} else if(subject.equals("1")){
			List<Question> multipleQuestions = questionDao.selectMultipleQuestions(40, subject);
			return multipleQuestions;
		} else{
			List<Question> multipleQuestions = questionDao.selectMultipleQuestions(40, subject);
			return multipleQuestions;
		}
	}

	@Override
	public List<Note> getSingleNotes(int userId, String subject) {
		List<Note> singleQuestionNotes = noteDao.selectSingleNotesByUserId(userId, subject);
		return singleQuestionNotes;
	}

	@Override
	public List<Note> getMultipleNotes(int userId, String subject) {
		List<Note> multipleQuestionNotes = noteDao.selectMultipleNotesByUserId(userId, subject);
		return multipleQuestionNotes;
	}
	
	@Override
	public boolean addNote(int userId, int questionId, String answerF) {
		Note questionNote = new Note();
		// questionNote相比question,多记录了错题题号及错题选择
		questionNote = ExamUtil.initNote(userId, questionId, answerF);
		// 错题题库中不存在重复的题,则添加该错题,并返回true,否则返回false
		if (noteDao.selectNote(userId, questionId) == null) {
			noteDao.addNote(questionNote);
			return true;
		}
		return false;
	}

	@Override
	public void deleteNote(int noteId) {
		noteDao.deleteNote(noteId);
	}

	@Override
	public List<Question> getSingleQuestionsBySection(String section, String subject) {
		List<Question> singleQuestions = questionDao.selectSingleQuestionsBySection(section, subject);
		return singleQuestions;
	}

	@Override
	public List<Question> getMultipleQuestionsBySection(String section, String subject) {
		List<Question> multipleQuestions = questionDao.selectMultipleQuestionsBySection(section, subject);
		return multipleQuestions;
	}

	@Override
	public List<Record> getRecords(int userId, String subject) {
		List<Record> examRecords = recordDao.selectRecordsByUserId(userId, subject);
		TimeUtil.setRecordDate(examRecords);
		return examRecords;
	}

	@Override
	public void deleteRecord(int id) {
		recordDao.deleteRecord(id);
	}

	@Override
	public void addRecord(int userId, String begin_time, String last_time, float score, String subject) {
		Record record = ExamUtil.initRecord(userId, begin_time, last_time, score, subject);
		recordDao.addRecord(record);
	}

	@Override
	public List<Question> getRandomQuestions(String[] sections, String questionType, String subject) {
		Map<String, String> sectionMap = ExamUtil.initSections(subject);
		List<Question> questions = null;
		// 单选
		if (questionType.equals("0")) {
			questions = questionDao.selectSingleQuestionsBySection(sectionMap.get(sections[0]), subject);
			for (int i = 1; i < sections.length; i++) {
				questions.addAll(questionDao.selectSingleQuestionsBySection(sectionMap.get(sections[i]), subject));
			}
		} else { // 多选
			questions = questionDao.selectMultipleQuestionsBySection(sectionMap.get(sections[0]), subject);
			for (int i = 1; i < sections.length; i++) {
				questions.addAll(questionDao.selectMultipleQuestionsBySection(sectionMap.get(sections[i]), subject));
			}
		}
		return questions;
	}

	@Override
	public List<Question> getSingleQuestionByKeyword(String keyword, String subject) {
		List<Question> singleQuestions = questionDao.selectSingleQuestionsByKeyword(keyword, subject);
		return singleQuestions;
	}

	@Override
	public List<Question> getMultipleQuestionByKeyword(String keyword, String subject) {
		List<Question> multipleQuestions = questionDao.selectMultipleQuestionsByKeyword(keyword, subject);
		return multipleQuestions;
	}


	@Override
	public void deletePraticeNote(int userId, int questionId) {
		noteDao.deleteNoteByQuestionId(userId, questionId);
	}
}
