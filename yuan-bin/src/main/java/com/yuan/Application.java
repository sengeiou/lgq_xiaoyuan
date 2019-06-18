package com.yuan;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * 启动程序
 */
@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)//(exclude = {DataSourceAutoConfiguration.class},scanBasePackages = {"com.yuan.**"})
@MapperScan("com.yuan.**.mapper.**")
@EnableScheduling
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
        System.out.println("" +
                "(♥◠‿◠)ﾉﾞ 启动成功 \n" +
                "(♥◠‿◠)ﾉﾞ 启动成功 \n" +
                "(♥◠‿◠)ﾉﾞ 启动成功 \n" +
                "(♥◠‿◠)ﾉﾞ 启动成功 \n" +
                "(♥◠‿◠)ﾉﾞ 启动成功 \n" +
                "(♥◠‿◠)ﾉﾞ 启动成功 \n"
        );
    }
}