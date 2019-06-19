package com.yuan.fullcalendar.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@ToString
public class CalendarModel {
    /**
     * 事件id
     */
    private Integer id;
    /**
     * 事件标题
     */
    private String title;
    /**
     * 事件开始时间
     */
    private String start;
    /**
     * 结束时间
     */
    private String end;
    /**
     * 是否为全天事件
     */
    private Integer allDay;


    /**
     * 创建时间
     */
    private String createTime;
    /**
     * 用户ID
     */
    private String userID;
    /**
     * 事件的背景色
     */
    private String color;
    /**
     * 文本颜色,可以不填，默认为白色
     */
    private String textColor;
    private String backgroundColor;
    private String borderColor;
    /**
     * 是否完成，1 - 是，0 - 不是  控制颜色
     */
    private String className;
    private String hour;
    private String minu;

    private List<String> hours = Arrays.asList("00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12",  "13", "14", "15", "16", "17", "18", "19", "20", "21", "22","23");
    private List<String> minus = Arrays.asList("00", "10", "20", "30", "40", "50");

}
