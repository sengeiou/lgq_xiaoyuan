/*
 * All rights Reserved, Designed By DataDriver
 * Copyright:    DataDriver.Inc
 * Company:      Zhuo Wo Infomation Technology (ShangHai) CO.LTD
 */
package com.yuan.fullcalendar.controller;

import com.yuan.fullcalendar.model.CalendarModel;
import com.yuan.fullcalendar.services.ICalendarService;
import com.yuan.fullcalendar.util.RResp;
import com.yuan.fullcalendar.util.Utils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    /**
     * 入口
     */
    @RequestMapping(value = "fullIndex")
    public String fullIndex() {
        return "fullcalendar/full_index";
    }

    /**
     * 取所有数据
     */
    @RequestMapping(value = "JsonServlet.json")
    @ResponseBody
    public List<CalendarModel> JsonServlet() {
        return calendarService.getList();
    }

    /**
     * 新增编辑界面
     */
    @RequestMapping(value = "initEditPage.do")
    public String initEditPage(CalendarModel calendarModel, Model model) {
        if (!Utils.isEmpty(calendarModel.getId().toString())){
            calendarModel = calendarService.selectById(calendarModel.getId());
        }
        model.addAttribute("calendarModel",calendarModel);
        return "fullcalendar/event";
    }

    /**
     * 保存
     */
    @RequestMapping(value = "saveFullFrom.json")
    @ResponseBody
    public RResp saveFullFrom(CalendarModel calendarModel){
        if (calendarService.saveFullFrom(calendarModel)){
            return RResp.ok("ok");
        }else {
            return RResp.error();
        }
    }
}
