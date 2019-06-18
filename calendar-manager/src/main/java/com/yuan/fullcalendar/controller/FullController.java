/*
 * All rights Reserved, Designed By DataDriver
 * Copyright:    DataDriver.Inc
 * Company:      Zhuo Wo Infomation Technology (ShangHai) CO.LTD
 */
package com.yuan.fullcalendar.controller;

import com.yuan.fullcalendar.model.CalendarModel;
import com.yuan.fullcalendar.services.ICalendarService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;


/**
 * @Description
 * @Date 2019-06-18 15:35
 */
@RequestMapping("fullcalendar")
@Controller
public class FullController {

    @Resource
    private ICalendarService calendarService;


    @RequestMapping(value = "fullIndex")
    public String fullIndex() {
        return "fullcalendar/full_index";
    }

    /**
     * 取所有数据
     */
    @RequestMapping(value = "JsonServlet")
    @ResponseBody
    public List<CalendarModel> JsonServlet() {
        List<CalendarModel> list = calendarService.getList();
        System.out.println(list);
        return calendarService.getList();
    }

    /**
     * 新增编辑界面
     */
    @RequestMapping(value = "initEditPage.do")
    public String initEditPage(String selDate) {
        System.out.println(selDate);
        return "fullcalendar/event";
    }
}