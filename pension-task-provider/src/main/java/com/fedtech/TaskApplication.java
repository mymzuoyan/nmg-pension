package com.fedtech;

import com.fedtech.config.listener.MyApplicationListener;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author gengqiang
 * @date 2018/1/5
 */
@SpringBootApplication
public class TaskApplication {

    public static void main(String[] args) {
        SpringApplication springApplication = new SpringApplication(TaskApplication.class);
        springApplication.addListeners(new MyApplicationListener());
        springApplication.run(args);
    }

}
