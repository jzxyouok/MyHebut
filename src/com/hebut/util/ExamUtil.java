package com.hebut.util;

import java.util.LinkedHashMap;
import java.util.Map;

import com.hebut.entity.Record;
import com.hebut.entity.Note;

public class ExamUtil {

	/**
	 * request获得的多选题答案为字符串数组 将字符串数组转化为字符串,并返回
	 */
	public static String getCheckBoxValue(String[] checkBoxValue) {
		// 如果数组为null,则answerOwns.length会报错
		if (checkBoxValue == null) {
			return null;
		} else {
			StringBuffer sb = new StringBuffer();
			for (int j = 0; j < checkBoxValue.length; j++) {
				sb.append(checkBoxValue[j]);
			}
			return sb.toString();
		}
	}

	/**
	 * 考试记录生成
	 */
	public static Record initRecord(int userId, String begin_time, String last_time, float score, String subject) {
		Record record = new Record();
		record.setUserId(userId);
		record.setBegin_time(begin_time);
		record.setLast_time(last_time);
		record.setScore(score);
		int percent = (int) (((float) score / 40) * 100);
		record.setPercent(percent + "%");
		record.setSubject(Integer.parseInt(subject));
		return record;
	}

	/**
	 * 错题信息生成
	 */
	public static Note initNote(int userId, int questionId, String answerF) {
		Note note = new Note();
		note.setUserId(userId);
		note.setQuestionId(questionId);
		note.setAnswerF(answerF);
		return note;
	}

	/**
	 * 数字对应章节
	 */
	public static Map<String, String> initSections(String subject) {
		Map<String, String> sectionMap = new LinkedHashMap<String, String>();
		if (subject.equals("0")) {
			sectionMap.put("0", "绪论");
			sectionMap.put("1", "哲学第一章");
			sectionMap.put("2", "哲学第二章");
			sectionMap.put("3", "哲学第三章");
			sectionMap.put("4", "政治经济学第四章");
			sectionMap.put("5", "政治经济学第五章");
			sectionMap.put("6", "科学社会主义第六章");
			sectionMap.put("7", "科学社会主义第七章");
		} else if (subject.equals("1")) {
			sectionMap.put("1", "马克思主义中国化两大理论成果");
			sectionMap.put("2", "新民主主义革命理论");
			sectionMap.put("3", "社会主义改造理论");
			sectionMap.put("4", "社会主义建设道路初步探索的理论成果");
			sectionMap.put("5", "建设中国特色社会主义总依据");
			sectionMap.put("6", "社会主义本质和总任务");
		} else if (subject.equals("2")) {
			sectionMap.put("7", "社会主义改革开放理论");
			sectionMap.put("8.1", "建设中国特色社会主义经济");
			sectionMap.put("8.2", "建设中国特色社会主义政治");
			sectionMap.put("8.3", "建设中国特色社会主义文化");
			sectionMap.put("8.4", "建设社会主义和谐社会");
			sectionMap.put("8.5", "建设社会主义生态文明");
			sectionMap.put("9", "实现祖国完全统一的理论");
			sectionMap.put("10", "中国特色社会主义外交和国际战略");
			sectionMap.put("11", "建设中国特色社会主义的根本目的和依靠力量理论");
			sectionMap.put("12", "中国特色社会主义领导核心理论");
		} else {
			sectionMap.put("0", "开篇的话");
			sectionMap.put("0.5", "综述 风云变幻的八十年");
			sectionMap.put("1", "第一章");
			sectionMap.put("2", "第二章");
			sectionMap.put("3", "第三章");
			sectionMap.put("3.5", "中篇综述");
			sectionMap.put("4", "第四章");
			sectionMap.put("5", "第五章");
			sectionMap.put("6", "第六章");
			sectionMap.put("7", "第七章");
		}
		return sectionMap;
	}

	/**
	 * 毛概章节名过长,重新设置章节名,仅用于显示
	 */
	public static String getShortSectionName(String section_num) {
		switch (section_num) {
		case "1":
			return "两大理论成果";
		case "2":
			return "新民主主义革命理论";
		case "3":
			return "社会主义改造理论";
		case "4":
			return "初步探索的理论成果";
		case "5":
			return "建设特色社会主义总依据";
		case "6":
			return "社会主义本质和总任务";
		case "7":
			return "社会主义改革开放理论";
		case "8.1":
			return "中国特色社会主义经济";
		case "8.2":
			return "中国特色社会主义政治";
		case "8.3":
			return "中国特色社会主义文化";
		case "8.4":
			return "建设社会主义和谐社会";
		case "8.5":
			return "建设社会主义生态文明";
		case "9":
			return "实现祖国完全统一的理论";
		case "10":
			return "外交和国际战略";
		case "11":
			return "根本目的和依靠力量理论";
		case "12":
			return "社会主义领导核心理论";
		default:
			return "error";
		}
	}

}
