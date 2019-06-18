package com.yuan.fullcalendar.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CalendarModel {
	private Integer id;// 事件id
	private String title;// 事件标题
	private String start;// 事件开始时间
	private String end;// 结束时间
	private Integer allDay;// 是否为全天事件
	private String color;// 事件的背景色


}
