package com.szcwdhy.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang.StringUtils;

import sun.misc.BASE64Encoder;


public class DateUtil {
	
	
	public static String urlEncoder(String url) {
	    BASE64Encoder encoder = new BASE64Encoder();
	    String result = encoder.encode(url.getBytes());
	    return result;
	} 

	public static String getCurrentTime() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(new Date());
	}

	public static String getCurrentDate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(new Date());
	}

	public static String getCurrentString(String format) {
		return getDateString(new Date(), format);
	}

	public static String getDateString(Date date, String format) {
		SimpleDateFormat formater = new SimpleDateFormat(format);
		return formater.format(date);
	}

	public static String getCurrentTimeWithMS() {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		return format.format(new Date());
	}

	public static long getMinuteBetween(Date date1, Date date2) {
		long result = 0L;
		try {
			result = (date2.getTime() - date1.getTime()) / 60000;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static long getSecBetween(Date date1, Date date2) {
		long result = 0L;
		try {
			result = (date2.getTime() - date1.getTime())/1000;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static long getDateSecBetween(String dateS, String dateE) {
		
		try{
			Date daS=parseDate(dateS, "yyyy-MM-dd HH:mm:ss");
			Date daE=parseDate(dateE,"yyyy-MM-dd HH:mm:ss");
			
			return getSecBetween(daS,daE);	
		}catch(Exception e){
			
			e.printStackTrace();
			return 0;
		}
	}

	public static Date date = null;

	public static DateFormat dateFormat = null;

	public static Calendar calendar = null;

	public static Date parseDate(String dateStr, String format) {
		try {
			dateFormat = new SimpleDateFormat(format);
			// String dt = dateStr.replaceAll("-", "/");
			if ((!dateStr.equals("")) && (dateStr.length() < format.length())) {
				dateStr += format.substring(dateStr.length()).replaceAll("[YyMmDdHhSs]", "0");
			}
			date = (Date) dateFormat.parse(dateStr);
		} catch (Exception e) {
		}
		return date;
	}

	public static Date parseDate(String dateStr) {
		return parseDate(dateStr, "yyyy/MM/dd");
	}

	public static String format(Date date, String format) {
		String result = "";
		try {
			if (date != null) {
				dateFormat = new SimpleDateFormat(format);
				result = dateFormat.format(date);
			}
		} catch (Exception e) {
		}
		return result;
	}

	public static String format(Date date) {
		return format(date, "yyyy-MM-dd HH:mm:ss");
	}

	public static int getYear(Date date) {
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.YEAR);
	}

	public static int getMonth(Date date) {
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.MONTH) + 1;
	}

	public static int getDay(Date date) {
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.DAY_OF_MONTH);
	}

	public static int getHour(Date date) {
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.HOUR_OF_DAY);
	}

	public static int getMinute(Date date) {
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.MINUTE);
	}

	public static int getSecond(Date date) {
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.SECOND);
	}

	public static long getMillis(Date date) {
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.getTimeInMillis();
	}

	public static String getDate(Date date) {
		return format(date, "yyyy/MM/dd");
	}

	public static String getTime(Date date) {
		return format(date, "HH:mm:ss");
	}

	public static String getDateTime(Date date) {
		return format(date, "yyyy/MM/dd HH:mm:ss");
	}

	public static Date addDate(Date date, int day) {
		calendar = Calendar.getInstance();
		long millis = getMillis(date) + ((long) day) * 24 * 3600 * 1000;
		calendar.setTimeInMillis(millis);
		return calendar.getTime();
	}

	public static int diffDate(Date date, Date date1) {
		return (int) ((getMillis(date) - getMillis(date1)) / (24 * 3600 * 1000));
	}
	
	 /**
     * 获得当天日期的前一天
     *
     *     *
     *     
     * @return
     * @throws Exception
     */
	public static String getDayBefore() {
		Calendar c = Calendar.getInstance();
        Date date = null;
        try {
            date = new SimpleDateFormat("yy-MM-dd").parse(getCurrentDate());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        c.setTime(date);
        int day = c.get(Calendar.DATE);
        c.set(Calendar.DATE, day - 1);

        String dayBefore = new SimpleDateFormat("yyyy-MM-dd").format(c
                .getTime());
        return dayBefore;
	}
	

	public static String getMonthBegin(String strdate) {
		date = parseDate(strdate);
		return format(date, "yyyy-MM") + "-01";
	}

	public static String getMonthEnd(String strdate) {
		date = parseDate(getMonthBegin(strdate));
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, 1);
		calendar.add(Calendar.DAY_OF_YEAR, -1);
		return formatDate(calendar.getTime());
	}

	public static String formatDate(Date date) {
		return formatDateByFormat(date, "yyyy-MM-dd");
	}

	public static String formatDateByFormat(Date date, String format) {
		String result = "";
		if (date != null) {
			try {
				SimpleDateFormat sdf = new SimpleDateFormat(format);
				result = sdf.format(date);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return result;
	}

	/**
	 * 给定日期获取中文星期
	 * 
	 * @param date
	 * @return
	 */
	public static String getWeekZh(Date date) {
		String[] weekDays = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
		calendar = Calendar.getInstance();
		calendar.setTime(date);

		int week = calendar.get(Calendar.DAY_OF_WEEK) - 1;
		if (week < 0) {
			week = 0;
		}

		return weekDays[week];
	}

	/**
	 * 将HH:mm:ss 格式时间转化为秒数
	 * 
	 * @param time
	 * @return
	 */
	public static Integer timeFormat(String time) {
		if (StringUtils.isBlank(time)) {
			return null;
		}

		String[] strs = time.split(":");
		return Integer.parseInt(strs[0]) * 3600 + Integer.parseInt(strs[1]) * 60
				+ Integer.parseInt(strs[2]);
	}

	/**
	 * 将秒数转化成HH:mm:ss时间格式
	 * 
	 * @param time
	 * @return
	 */
	public static String timeParse(Integer time) {
		int h = time / 3600;
		int m = (time - h * 3600) / 60;
		int s = time % 60;
		return h + ":" + m + ":" + s;
	}

	/**
	 * 日期计算
	 * 
	 * @param date
	 *            按某个日期计算
	 * @param calendarType
	 *            如Calendar.DAY_OF_WEEK等
	 * @param digit
	 *            具体计算数字
	 * @return
	 */
	public static Date dateDiff(Date date, int calendarType, int digit) {
		if (date != null) {
			calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.add(calendarType, digit);
			return calendar.getTime();
		}
		return null;
	}

}
