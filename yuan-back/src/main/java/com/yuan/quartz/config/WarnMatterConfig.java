package com.yuan.quartz.config;

import org.quartz.*;
import org.springframework.context.annotation.Bean;

public class WarnMatterConfig {

   /*@Bean
    public JobDetail teatQuartzDetail() {
        return JobBuilder.newJob(TestQuartz.class).withIdentity("job1", "group1").storeDurably().build();
    }

    @Bean
    public Trigger testQuartzTrigger() {
        SimpleScheduleBuilder scheduleBuilder = SimpleScheduleBuilder.simpleSchedule().withIntervalInSeconds(1000).repeatForever();
        return TriggerBuilder.newTrigger().forJob(teatQuartzDetail()).withIdentity("trigger1", "group1").withSchedule(scheduleBuilder).build();
    }*/
}
