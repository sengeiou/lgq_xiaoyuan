/*
 * All rights Reserved, Designed By DataDriver
 * Copyright:    DataDriver.Inc
 * Company:      Zhuo Wo Infomation Technology (ShangHai) CO.LTD
 */
package com.yuan.fullcalendar.services.impl;

import com.yuan.fullcalendar.mapper.CalendarMapper;
import com.yuan.fullcalendar.model.CalendarModel;
import com.yuan.fullcalendar.services.ICalendarService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description
 * @Date 2019-06-18 17:38
 */
@Service
public class CalendarServiceImpl implements ICalendarService {

    @Resource
    private CalendarMapper calendarMapper;

    @Override
    public List<CalendarModel> getList(){
        return calendarMapper.selectList();
    }

}
