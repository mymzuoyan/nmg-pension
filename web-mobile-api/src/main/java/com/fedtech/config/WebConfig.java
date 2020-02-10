package com.fedtech.config;

import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import com.fedtech.pension.mobile.interceptor.AppInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.util.List;

/**
 * WebMvc 配置
 *
 * @author Shawn
 */

@Configuration
public class WebConfig extends WebMvcConfigurerAdapter {

    @Autowired
    AppInterceptor appInterceptor;

    /**
     * 拦截器配置
     *
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(appInterceptor).addPathPatterns("/api/**")
                .excludePathPatterns("/api/version", "/api/login",
                        "/api/advertisement/bootpages",
                        "/api/user/forgetPwd",
                        "/api/sendVerificationCode", "/api/serviceObject/register",
                        "/api/position/*", "/api/alipay/notify", "/api/wxpay/notify",
                        "/api/serviceOrg/list");
        super.addInterceptors(registry);
    }


    /**
     * 消息内容转换配置
     * 配置fastJson返回json转换
     *
     * @param converters
     */
    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        //调用父类的配置
        super.configureMessageConverters(converters);
        //创建fastJson消息转换器
        FastJsonHttpMessageConverter fastConverter = new FastJsonHttpMessageConverter();
        //创建配置类
        FastJsonConfig fastJsonConfig = new FastJsonConfig();
        //修改配置返回内容的过滤
        fastJsonConfig.setSerializerFeatures(
                SerializerFeature.WriteDateUseDateFormat,
                SerializerFeature.WriteMapNullValue,
                SerializerFeature.QuoteFieldNames
        );
        fastConverter.setFastJsonConfig(fastJsonConfig);
        //将fastjson添加到视图消息转换器列表内
        converters.add(fastConverter);
    }

}
