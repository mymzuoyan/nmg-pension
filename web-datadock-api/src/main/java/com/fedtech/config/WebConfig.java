package com.fedtech.config;

import com.fedtech.pension.datadock.interceptor.AppInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * WebMvc 配置
 *
 * @author Shawn
 */

@Configuration
public class WebConfig extends WebMvcConfigurerAdapter {

    @Autowired
    AppInterceptor appInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(appInterceptor).addPathPatterns("/api/**")
                .excludePathPatterns("/api/getToken", "/api/lian/saveElderly", "/api/lian/sendHealthData");
        super.addInterceptors(registry);
    }

}
