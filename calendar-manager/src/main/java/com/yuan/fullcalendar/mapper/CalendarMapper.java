package com.yuan.fullcalendar.mapper;

import com.yuan.fullcalendar.model.Calendar;
import com.yuan.fullcalendar.model.CalendarModel;

import java.util.List;

public interface CalendarMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Calendar record);

    int insertSelective(Calendar record);

    Calendar selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Calendar record);

    int updateByPrimaryKey(Calendar record);

    List<CalendarModel> selectList();
}