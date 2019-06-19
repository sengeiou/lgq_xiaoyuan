package com.yuan.fullcalendar.mapper;

import com.yuan.fullcalendar.model.CalendarModel;

import java.util.List;

public interface CalendarMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(CalendarModel calendarModel);

    int insertSelective(CalendarModel calendarModel);

    CalendarModel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CalendarModel calendarModel);

    int updateByPrimaryKey(CalendarModel calendarModel);

    List<CalendarModel> selectList();
}