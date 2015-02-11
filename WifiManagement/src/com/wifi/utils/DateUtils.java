package com.wifi.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils {
	
	public static String getCurrentDateTime() {
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		return df.format(new Date());// new Date()为获取当前系统时间
	}
	
	public static String getCurrentDate() {
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		return df.format(new Date());// new Date()为获取当前系统时间
	}
	
	public static String getDate(Calendar c) {
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		return df.format(c.getTime());// new Date()为获取当前系统时间
	}
	
	public static String getWeekOfCalendar(Calendar c) {
		
		int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
		switch (dayOfWeek) {
		case Calendar.SUNDAY:
			return "周日";
		case Calendar.MONDAY:
			return "周一";
		case Calendar.TUESDAY:
			return "周二";
		case Calendar.WEDNESDAY:
			return "周三";
		case Calendar.THURSDAY:
			return "周四";
		case Calendar.FRIDAY:
			return "周五";
		case Calendar.SATURDAY:
			return "周六";
		}
		return null;
	}
	
	public static Date getDateFromString(String date) {

		SimpleDateFormat formatDate = new SimpleDateFormat(
				"yyyy-MM-dd");
		Date time = null;
		try {
			time = formatDate.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return time;
	}
	
	public static Calendar getCalendarFromString(String dateStr) {

		Date date = getDateFromString(dateStr);
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		return c;
	}
	
	public static Calendar convertToCalendar(String date) {
		
		SimpleDateFormat formatDate = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		Date time = null;
		try {
			time = formatDate.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar res = Calendar.getInstance();
		res.setTime(time);
		return res;
	}
	
	public static String getFirstDayOfWeek(String dateStr) {
		
		Calendar c = getCalendarFromString(dateStr);
		int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
		int offset = dayOfWeek - Calendar.SUNDAY;
		c.add(Calendar.DAY_OF_WEEK, -offset);
		return getDate(c);
	}
	
	public static String getLastDayOfWeek(String dateStr) {
		
		Calendar c = getCalendarFromString(dateStr);
		int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
		int offset = dayOfWeek - Calendar.SUNDAY;
		c.add(Calendar.DAY_OF_WEEK, 6-offset);
		return getDate(c);
	}
	
	public static String getFirstDayOfMonth(String date) {
		
		Calendar c = getCalendarFromString(date);
		c.set(Calendar.DAY_OF_MONTH, 1);
		return getDate(c);
	}
	
	public static String getLastDayOfMonth(String date) {
		
		Calendar c = getCalendarFromString(date);
		c.set(Calendar.DAY_OF_MONTH, 1);
		c.add(Calendar.MONTH, 1);;
		c.add(Calendar.DAY_OF_YEAR, -1);
		return getDate(c);
	}
	
	public static int getDayNumsOfMonth(String date) {
		
		Calendar c = getCalendarFromString(date);
		return c.getActualMaximum(Calendar.DAY_OF_MONTH);
	}
	
	public static String getYearAndMonth(String date) {
		
		Calendar c = getCalendarFromString(date);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");//设置日期格式
		return df.format(c.getTime());// new Date()为获取当前系统时间
	}
	
	public static String getYearAndMonth(Calendar date) {
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");//设置日期格式
		return df.format(date.getTime());// new Date()为获取当前系统时间
	}
	
	public static String getFirstDayOfYear(String date) {
		
		Calendar c = getCalendarFromString(date);
		c.set(Calendar.DAY_OF_YEAR, 1);
		return getDate(c);
	}
	
	public static String getLastDayOfYear(String date) {
		
		Calendar c = getCalendarFromString(date);
		c.set(Calendar.DAY_OF_YEAR, 1);
		c.add(Calendar.YEAR, 1);
		c.add(Calendar.DAY_OF_YEAR, -1);
		return getDate(c);
	}
	
	
}
