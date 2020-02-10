package com.fedtech.config;

import com.github.binarywang.wxpay.service.WxPayService;
import com.github.binarywang.wxpay.service.impl.WxPayServiceImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author gengqiang
 * @date 2018/1/3
 */
@Configuration
public class WxPayConfig {

    @Bean
    public WxPayService wxPayService() {
        return new WxPayServiceImpl();
    }
}
