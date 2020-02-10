package com.fedtech;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 *
 * @author csn
 * @date 2018/1/5
 */
@SpringBootApplication
@EnableScheduling
public class GoldElderlyApplication {
    public static void main(String[] args) {
        SpringApplication.run(GoldElderlyApplication.class);
    }
}
