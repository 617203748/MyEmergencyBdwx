package com.taxi.utils;

import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class Util_Date {

    public static Date createExpiredTime(Date now) {
        // 30天过期
        Date ExpiredTime = new Date(now.getTime() + 7 * 24 * 60 * 60 * 1000);
        return ExpiredTime;
    }

    /**
     * 当天的日期
     *
     * @return
     */
    public static String getCurrentDate() {
        Date date = new Date(System.currentTimeMillis());

        SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd");
        return time.format(date);
    }

    /**
     * 当天的日期时间
     *
     * @return
     */
    public static String getCurrentDateTime() {
        Date date = new Date(System.currentTimeMillis());

        SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return time.format(date);
    }

    /**
     * 当天开始时间
     *
     * @return
     */
    private Long getStartTime() {
        Calendar todayStart = Calendar.getInstance();
        todayStart.set(Calendar.HOUR_OF_DAY, 0);
        todayStart.set(Calendar.MINUTE, 0);
        todayStart.set(Calendar.SECOND, 0);
        todayStart.set(Calendar.MILLISECOND, 0);
        return todayStart.getTime().getTime();
    }

    /**
     * 当天结束时间
     *
     * @return
     */
    private Long getEndTime() {
        Calendar todayEnd = Calendar.getInstance();
        todayEnd.set(Calendar.HOUR_OF_DAY, 23);
        todayEnd.set(Calendar.MINUTE, 59);
        todayEnd.set(Calendar.SECOND, 59);
        todayEnd.set(Calendar.MILLISECOND, 999);
        return todayEnd.getTime().getTime();
    }

    /**
     * 昨天日期
     */
    public static String getYesterdayDate() {
        Date date = new Date();// 取时间
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);
        calendar.add(calendar.DATE, -1);// 把日期往后增加一天.整数往后推,负数往前移动
        date = calendar.getTime(); // 这个时间就是日期往后推一天的结果
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = formatter.format(date);

        return dateString;
    }

    /**
     * 获取当前秒数的下10秒的时间戳
     */
    public static long getPlayTime() {
        Calendar calendar = Calendar.getInstance();
        int hours = calendar.get(Calendar.HOUR_OF_DAY); // 时
        int minutes = calendar.get(Calendar.MINUTE); // 分
        int seconds = calendar.get(Calendar.SECOND); // 秒
        System.out.println(String.format("hours: %s, minutes: %s, seconds: %s", hours, minutes, seconds));

        if (seconds >= 0 && seconds < 10) {
            seconds = 20;
        } else if (seconds > 10 && seconds <= 20) {
            seconds = 30;
        } else if (seconds > 20 && seconds <= 30) {
            seconds = 40;
        } else if (seconds > 30 && seconds <= 40) {
            seconds = 50;
        } else if (seconds > 40 && seconds <= 50) {
            seconds = 0;

            if (minutes == 59) {
                minutes = 0;
                hours++;
            } else {
                minutes++;
            }

        } else if (seconds > 50 && seconds <= 59) {
            seconds = 10;

            if (minutes == 59) {
                minutes = 0;
                hours++;
            } else {
                minutes++;
            }
        }

        String day = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

        String timePlay = day + " " + hours + ":" + minutes + ":" + seconds;

        try {
            return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(timePlay).getTime();
        } catch (ParseException e) {
            e.printStackTrace();
            return 0;
        }
    }
}
