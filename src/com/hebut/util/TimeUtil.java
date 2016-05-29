package com.hebut.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.hebut.entity.Billboard;
import com.hebut.entity.Message;
import com.hebut.entity.Record;

public class TimeUtil {

	/**
	 * 获得考试所用时间
	 */
	public static String getLastTime(int seconds){
		String last_time; 
		// 转化格式
		int minute = seconds/60;
		int second = seconds - minute * 60;
		if(second > 9){
			last_time = minute + "分" + second + "秒";
		}else{
			last_time = minute + "分0" + second + "秒";
		}
		return last_time;
	}
	
	/**
	 * 获得当前时间
	 */
	public static String getDate(){
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    Date date = new Date();
	    String time = dateFormat.format(date);
	    return time;
	}
	
	/**
	 * 获得当前时间,用于保存文件
	 */
	public static String getDate4Save(){
		DateFormat dateFormat = new SimpleDateFormat("yyMMddHHmmss");
	    Date date = new Date();
	    String time = dateFormat.format(date);
	    return time;
	}
	

	/**
	 * 重新设置数据库返回的时间
	 * 修复日期显示问题,删去末尾两位字符
	 */
	public static void setRecordDate(List<Record> records) {
		String begin_time;
		for (int i = 0; i < records.size(); i++) {
			// 获取
			begin_time = records.get(i).getBegin_time();
			// 截去最后面的两个字符
			begin_time = begin_time.substring(0, begin_time.length() - 2);
			// 重新设置
			records.get(i).setBegin_time(begin_time);
		}
	}
	
	/**
	 * 重新设置数据库返回的时间
	 * 修复日期显示问题,删去末尾两位字符
	 */
	public static void setBoardDate(List<Billboard> boards) {
		String create_time;
		for (int i = 0; i < boards.size(); i++) {
			// 获取
			create_time = boards.get(i).getCreate_time();
			// 截去最后面的两个字符
			create_time = create_time.substring(0, create_time.length() - 2);
			// 重新设置
			boards.get(i).setCreate_time(create_time);
		}
	}
	
	/**
	 * 重新设置数据库返回的时间
	 * 修复日期显示问题,删去末尾两位字符
	 */
	public static void setMessageDate(List<Message> messages) {
		String create_time;
		for (int i = 0; i < messages.size(); i++) {
			// 获取
			create_time = messages.get(i).getCreate_time();
			// 截去最后面的两个字符
			create_time = create_time.substring(0, create_time.length() - 2);
			// 重新设置
			messages.get(i).setCreate_time(create_time);
		}
	}
}
