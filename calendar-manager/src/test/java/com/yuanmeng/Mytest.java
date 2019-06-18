package com.yuanmeng;

import com.yuan.fullcalendar.services.ICalendarService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@SpringBootTest
@RunWith(SpringRunner.class)
public class Mytest {


    @Resource
    private ICalendarService calendarService;

    @Test
    public void test1() {
        System.out.println("-------------------------");
        System.out.println(calendarService.getList());
    }


}
