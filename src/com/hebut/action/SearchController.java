package com.hebut.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hebut.entity.Question;
import com.hebut.service.SubjectService;

@Controller
public class SearchController {

	@Autowired
	SubjectService subjectService;

	/**
	 * 搜索功能
	 */
	@RequestMapping(value = "search", method = RequestMethod.POST)
	public String search(Map<String, Object> model, HttpServletRequest request) {
		String keyword = request.getParameter("search");
		model.put("keyword", keyword);
		return "search";
	}

	/**
	 * 选择科目 返回搜索结果
	 */
	@RequestMapping(value = "result", method = RequestMethod.POST)
	public String result(Map<String, Object> model, HttpServletRequest request) {
		String keyword = request.getParameter("keyword");
		String subject = request.getParameter("subject");
		List<Question> singleQuestions = null;
		List<Question> multipleQuestions = null;

		if (subject.equals("0")) {
			singleQuestions = subjectService.getSingleQuestionByKeyword(keyword, subject);
			multipleQuestions = subjectService.getMultipleQuestionByKeyword(keyword, subject);
			model.put("subject", "马原");
		} else if (subject.equals("1")) {
			singleQuestions = subjectService.getSingleQuestionByKeyword(keyword, subject);
			multipleQuestions = subjectService.getMultipleQuestionByKeyword(keyword, subject);
			model.put("subject", "毛概");
		} else {
			System.out.println("not exist");
		}

		model.put("keyword", keyword);
		model.put("subject", subject);
		model.put("singleQuestions", singleQuestions);
		model.put("multipleQuestions", multipleQuestions);
		return "result";
	}

}
