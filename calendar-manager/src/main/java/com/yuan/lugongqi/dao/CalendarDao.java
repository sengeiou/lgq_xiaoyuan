package com.yuan.lugongqi.dao;

import com.yuan.lugongqi.model.CalendarModel;

import java.util.ArrayList;
import java.util.List;

public class CalendarDao {
	
	//添加日历事件
	public boolean add(CalendarModel calendar) {
		boolean flag = false;
		return flag;
	}
	
	//根据编号删除日历事件
	public boolean del(Integer id) {
		boolean flag = false;
		return flag;
	}
	
	//修改
	public boolean modify(CalendarModel calendar) {
		boolean flag = false;
		return flag;
	}
	
	//根据sql语句修改日历事件
	public boolean modify(String sql) {
		boolean flag = false;
		return flag;
	}
	
	//查询所有日历事件
	public List<CalendarModel> find() {
		List<CalendarModel> list = new ArrayList<CalendarModel>();
		return list;
	}
	
	//根据编号查询单个日历事件
	public CalendarModel findById(Integer id) {
		return null;
	}
}
