package com.fedtech;

import com.fedtech.config.listener.MyApplicationListener;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 老人模块
 *
 * @author Shawn
 */
@SpringBootApplication
public class ElderlyApplication {

    public static void main(String[] args) {
        SpringApplication springApplication = new SpringApplication(ElderlyApplication.class);
        springApplication.addListeners(new MyApplicationListener());
        springApplication.run(args);
    }

}
