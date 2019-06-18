package com.yuan.quartz.task;

import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class AsyncTask {

    public static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

    @Async
    public void firstAsyncTask() {
        System.out.println("firstAsyncTask当前时间是" + dateFormat.format(new Date()));
    }

    @Async
    public void twoAsyncTask() {
        System.out.println("twoAsyncTask当前时间是" + dateFormat.format(new Date()));
    }

}
