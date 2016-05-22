package com.hebut.action;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.hebut.entity.Record;
import com.hebut.entity.JsonResult;
import com.hebut.entity.Question;
import com.hebut.entity.Note;
import com.hebut.service.SubjectService;
import com.hebut.service.UserService;
import com.hebut.util.ExamUtil;
import com.hebut.util.TimeUtil;

@Controller
public class SubjectController {

	@Autowired
	UserService userService;

	@Autowired
	SubjectService subjectService;

	/**
	 * 考试练习
	 */
	@RequestMapping(value = "exam", method = RequestMethod.GET)
	public String examPratice(Map<String, Object> model, HttpServletRequest request) {
		String subject = request.getParameter("subject");

		List<Question> singleQuestions = subjectService.getSingleQuestions(subject);
		List<Question> multipleQuestions = subjectService.getMultipleQuestions(subject);

		model.put("subject", subject);
		model.put("Singlequestions", singleQuestions);
		model.put("Multiplequestions", multipleQuestions);
		return "exam";
	}

	/**
	 * 考试批改
	 */
	@RequestMapping(value = "correct", method = RequestMethod.POST)
	public String examCorrect(HttpServletRequest request, Map<String, Object> model) {
		String subject = request.getParameter("subject");

		// 登录用户Id
		int userId = userService.getUserId(request);
		// 总分40分
		float score = 40;
		// 单选题数
		int single_size = Integer.parseInt(request.getParameter("singleAmount"));
		// 多选题数
		int multiple_size = Integer.parseInt(request.getParameter("multipleAmount"));
		// 单选多选错题List
		List<Question> singleWrongQuestions = new ArrayList<>();
		List<Question> multipleWrongQuestions = new ArrayList<>();
		// time为js计时器当前时间
		int time = Integer.parseInt(request.getParameter("time"));
		// 获得考试所用时间
		String last_time = TimeUtil.getLastTime(time);
		// 获得考试开始时间
		String begin_time = TimeUtil.getDate();
		// 存储单选题题号及用户选择
		Map<Integer, String> single_messages = new LinkedHashMap<>();
		// 存储多选题号号及用户选择
		Map<Integer, String> multiple_messages = new LinkedHashMap<>();
		// 判断用户是否需要自动记录错题,如果为1,则需要自动记录错题
		int auto_flag = Integer.parseInt(request.getParameter("auto"));

		// 单选题批改
		for (int i = 0; i < single_size; i++) {
			// 获得用户的选择答案
			String answerOwn = request.getParameter(Integer.toString(i) + "_single");
			if (answerOwn == null) {
				answerOwn = "未选择";
			}
			String string_id = request.getParameter(Integer.toString(i) + "_id_single");
			int questionId = Integer.parseInt(string_id);
			// 记录考试题号及用户选择信息
			single_messages.put(questionId, answerOwn);
			// 如果答错,则记录错题信息,用于考试批改后页面的反馈
			Question question = subjectService.getQuestionById(questionId);
			if (!question.getAnswerT().equals(answerOwn)) {
				// 记录错题题号
				question.setExamId(i + 1);
				// 记录错题选择
				question.setAnswerF(answerOwn);
				// 将错题添加到wrongQuestions
				singleWrongQuestions.add(question);
				// 单选每道0.5分
				score -= 0.5;
				// auto_flag为1则需要自动添加错题
				if (auto_flag == 1) {
					subjectService.addNote(userId, questionId, answerOwn);
				}
			}
		}

		// 多选题批改
		for (int i = 0; i < multiple_size; i++) {
			String[] answerOwns = request.getParameterValues(Integer.toString(i) + "_multiple");
			// 将多选题答案从字符串数组转化为字符串
			String answerOwn = ExamUtil.getCheckBoxValue(answerOwns);
			if (answerOwn == null) {
				answerOwn = "未选择";
			}
			String string_id = request.getParameter(Integer.toString(i) + "_id_multiple");
			int questionId = Integer.parseInt(string_id);
			// 记录考试题号及用户选择信息
			multiple_messages.put(questionId, answerOwn);
			// 如果答错,则记录错题信息,用于考试批改后页面的反馈
			Question question = subjectService.getQuestionById(questionId);
			if (!question.getAnswerT().equals(answerOwn)) {
				// 记录错题题号
				question.setExamId(i + 1);
				// 记录错题选择
				question.setAnswerF(answerOwn);
				// 将错题添加到wrongQuestions
				multipleWrongQuestions.add(question);
				if (subject.equals("0")) {
					score -= 1;
				} else {
					score -= 0.5;
				}
				// auto_flag为1则需要自动添加错题
				if (auto_flag == 1) {
					subjectService.addNote(userId, questionId, answerOwn);
				}
			}
		}

		// 记录本次考试
		if (score > 5) {
			subjectService.addRecord(userId, begin_time, last_time, score, subject);
		}
		model.put("subject", subject);
		model.put("singleWrongQuestions", singleWrongQuestions);
		model.put("multipleWrongQuestions", multipleWrongQuestions);
		model.put("singleWrongAmount", singleWrongQuestions.size());
		model.put("multipleWrongAmount", multipleWrongQuestions.size());
		model.put("score", score);
		return "correct";
	}

	/**
	 * 普通批改(非考试) 相比考试批改,不需要计算分数,记录考试
	 */
	@RequestMapping(value = "questionsCorrect", method = RequestMethod.POST)
	public String questionsCorrect(HttpServletRequest request, Map<String, Object> model) {
		String subject = request.getParameter("subject");

		// 登录用户Id
		int userId = userService.getUserId(request);
		// 单选题数
		int single_size = Integer.parseInt(request.getParameter("singleAmount"));
		// 多选题数
		int multiple_size = Integer.parseInt(request.getParameter("multipleAmount"));
		// 单选多选错题List
		List<Question> singleWrongQuestions = new ArrayList<>();
		List<Question> multipleWrongQuestions = new ArrayList<>();
		// 判断用户是否需要自动记录错题,如果为1,则需要自动记录错题
		int auto_flag = Integer.parseInt(request.getParameter("auto"));

		for (int i = 0; i < single_size; i++) {
			// 获得用户的选择答案
			String answerOwn = request.getParameter(Integer.toString(i) + "_single");
			if (answerOwn == null) {
				answerOwn = "未选择";
			}
			String string_id = request.getParameter(Integer.toString(i) + "_id_single");
			int questionId = Integer.parseInt(string_id);
			// 如果答错,则记录错题信息,用于考试批改后页面的反馈
			Question question = subjectService.getQuestionById(questionId);
			if (!question.getAnswerT().equals(answerOwn)) {
				// 记录错题题号
				question.setExamId(i + 1);
				// 记录错题选择
				question.setAnswerF(answerOwn);
				// 将错题添加到wrongQuestions
				singleWrongQuestions.add(question);
				// auto_flag为1则需要自动添加错题
				if (auto_flag == 1) {
					subjectService.addNote(userId, questionId, answerOwn);
				}
			} else { // 答对情况下要判断是否需要删除错题
				if (auto_flag == 2) {
					subjectService.deletePraticeNote(userId, questionId);
				}
			}
		}

		// 多选题批改
		for (int i = 0; i < multiple_size; i++) {
			String[] answerOwns = request.getParameterValues(Integer.toString(i) + "_multiple");
			// 将多选题答案从字符串数组转化为字符串
			String answerOwn = ExamUtil.getCheckBoxValue(answerOwns);
			if (answerOwn == null) {
				answerOwn = "未选择";
			}
			String string_id = request.getParameter(Integer.toString(i) + "_id_multiple");
			int questionId = Integer.parseInt(string_id);
			// 如果答错,则记录错题信息,用于考试批改后页面的反馈
			Question question = subjectService.getQuestionById(questionId);
			if (!question.getAnswerT().equals(answerOwn)) {
				// 记录错题题号
				question.setExamId(i + 1);
				// 记录错题选择
				question.setAnswerF(answerOwn);
				// 将错题添加到wrongQuestions
				multipleWrongQuestions.add(question);
				// auto_flag为1则需要自动添加错题
				if (auto_flag == 1) {
					subjectService.addNote(userId, questionId, answerOwn);
				}
			} else { // 答对情况下要判断是否需要删除错题
				if (auto_flag == 2) {
					subjectService.deletePraticeNote(userId, questionId);
				}
			}
		}
		model.put("subject", subject);
		model.put("singleWrongQuestions", singleWrongQuestions);
		model.put("multipleWrongQuestions", multipleWrongQuestions);
		return "questionsCorrect";
	}

	/**
	 * 添加错题到错题集
	 */
	@RequestMapping(value = "add", method = RequestMethod.POST)
	@ResponseBody
	public String addWrongQuestion(@RequestBody Map<String, String> params, HttpServletRequest request) {
		JsonResult jsonResult = new JsonResult();
		int userId = userService.getUserId(request);
		int questionId = Integer.parseInt(params.get("questionId"));
		String answerF = params.get("answerF");
		// 返回true则添加成功,false则表明错题已存在
		boolean flag = subjectService.addNote(userId, questionId, answerF);
		jsonResult.setResultCode(flag ? 0 : 1);
		return new Gson().toJson(jsonResult);
	}

	/**
	 * 错题集
	 */
	@RequestMapping(value = "note", method = RequestMethod.GET)
	public String myNote(Map<String, Object> model, HttpServletRequest request) {
		String subject = request.getParameter("subject");

		int userId = userService.getUserId(request);
		List<Note> singleNotes = subjectService.getSingleNotes(userId, subject);
		List<Note> multipleNotes = subjectService.getMultipleNotes(userId, subject);
		model.put("subject", subject);
		model.put("singleNotes", singleNotes);
		model.put("multipleNotes", multipleNotes);
		return "note";
	}

	/**
	 * 将错题从错题集中删除
	 */
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public String deleteWrongQuestion(@RequestBody Map<String, String> params, HttpServletRequest request) {
		JsonResult jsonResult = new JsonResult();
		int noteId = Integer.parseInt(params.get("noteId"));
		subjectService.deleteNote(noteId);
		jsonResult.setResultCode(0);
		return new Gson().toJson(jsonResult);
	}

	/**
	 * 错题练习
	 */
	@RequestMapping(value = "notePractice", method = RequestMethod.GET)
	public String notePractice(Map<String, Object> model, HttpServletRequest request) {
		String subject = request.getParameter("subject");

		int userId = userService.getUserId(request);
		List<Note> singleQuestionNotes = subjectService.getSingleNotes(userId, subject);
		List<Note> multipleQuestionNotes = subjectService.getMultipleNotes(userId, subject);

		model.put("subject", subject);
		model.put("singleQuestionNotes", singleQuestionNotes);
		model.put("MultipleQuestionNotes", multipleQuestionNotes);
		return "notePractice";
	}

	/**
	 * 全部题库
	 */
	@RequestMapping(value = "questions", method = RequestMethod.GET)
	public String questions(Map<String, Object> model, HttpServletRequest request) {
		String subject = request.getParameter("subject");

		Map<String, String> sections = ExamUtil.initSections(subject);
		model.put("subject", subject);
		model.put("sections", sections);
		return "questions";
	}

	/**
	 * 跳转章节
	 */
	@RequestMapping(value = "section", method = RequestMethod.GET)
	public String section(Map<String, Object> model, HttpServletRequest request) {
		String subject = request.getParameter("subject");

		// 将前台发送的章节的字符串数字转化为对应的章节
		String section_num = request.getParameter("section");
		Map<String, String> sectionMap = ExamUtil.initSections(subject);
		String section = sectionMap.get(section_num);
		// 通过章节名搜索试题
		List<Question> singleQuestions = subjectService.getSingleQuestionsBySection(section, subject);
		List<Question> multipleQuestions = subjectService.getMultipleQuestionsBySection(section, subject);
		// 将章节名转换为短章节名
		if (subject.equals("1")) {
			section = ExamUtil.getShortSectionName(section_num);
		}
		model.put("subject", subject);
		model.put("section", section);
		model.put("singleQuestions", singleQuestions);
		model.put("multipleQuestions", multipleQuestions);
		return "section";
	}

	/**
	 * 考试记录
	 */
	@RequestMapping(value = "record", method = RequestMethod.GET)
	public String record(Map<String, Object> model, HttpServletRequest request) {
		String subject = request.getParameter("subject");

		int userId = userService.getUserId(request);
		List<Record> examRecords = subjectService.getRecords(userId, subject);
		model.put("subject", subject);
		model.put("examRecords", examRecords);
		return "record";
	}

	/**
	 * 删除考试记录
	 */
	@RequestMapping(value = "deleteRecord", method = RequestMethod.POST)
	@ResponseBody
	public String deleteRecord(@RequestBody Map<String, String> params, HttpServletRequest request) {
		JsonResult jsonResult = new JsonResult();
		int recordId = Integer.parseInt(params.get("recordId"));
		// 删除考试记录
		subjectService.deleteRecord(recordId);
		jsonResult.setResultCode(0);
		return new Gson().toJson(jsonResult);
	}

	/**
	 * 随机练习
	 */
	@RequestMapping(value = "randomPratice", method = RequestMethod.GET)
	public String randomPratice(Map<String, Object> model, HttpServletRequest request) {
		String subject = request.getParameter("subject");

		Map<String, String> sections = ExamUtil.initSections(subject);

		model.put("subject", subject);
		model.put("sections", sections);
		return "randomPratice";
	}

	/**
	 * 根据用户设置的信息 返回练习题
	 */
	@RequestMapping(value = "randomQuestions", method = RequestMethod.POST)
	public String randomQuestions(Map<String, Object> model, HttpServletRequest request) {
		String subject = request.getParameter("subject");

		String[] sections = request.getParameterValues("sections");
		String questionType = request.getParameter("questionType");
		List<Question> questions = subjectService.getRandomQuestions(sections, questionType, subject);
		int questionsAmount = questions.size();
		model.put("subject", subject);
		model.put("questions", questions);
		model.put("questionsAmount", questionsAmount);
		if (questionType.equals("0")) {
			return "randomSingleQuestions";
		} else {
			return "randomMultipleQuestions";
		}
	}

}
