package com.yuan.quartz.task;

import com.yuan.common.feige.FeigeService;
import com.yuan.common.mail.MyMailService;
import com.yuan.modules.warn.domain.Warn;
import com.yuan.modules.warn.service.IWarnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Component
public class WarnTask {

    @Autowired
    public IWarnService warnService;

    @Autowired
    public MyMailService myMailService;

    @Autowired
    public FeigeService feigeService;

    public static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

    //@Scheduled(fixedRate = 1000)
    //每天上下午各执行一次
    @Scheduled(cron = "0 30,32 8,14 * * ? ")
    public void reportCurrentTime() {
        List<Warn> listWarn = warnService.sendQuarzMessage(15);
        for (Warn warn :listWarn) {
            System.out.println(warn);
            //warn.getEmail()
            //myMailService.sendSimpleMail("936477475@qq.com",warn.getMatter(),warn.getRemark());
            //feigeService.sendFeige("17839229318",warn.getRemark());
        }
        System.out.println("当前时间是" + dateFormat.format(new Date()));
    }

}
