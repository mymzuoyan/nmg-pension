package com.fedtech;

import com.fedtech.config.listener.MyApplicationListener;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author gengqiang
 * @date 2018/1/3
 */
@SpringBootApplication
public class OrgApplication {
    public static void main(String[] args) {
        SpringApplication springApplication = new SpringApplication(OrgApplication.class);
        springApplication.addListeners(new MyApplicationListener());
        springApplication.run(args);
    }
}
