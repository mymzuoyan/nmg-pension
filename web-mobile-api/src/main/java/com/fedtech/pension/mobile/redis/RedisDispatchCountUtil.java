package com.fedtech.pension.mobile.redis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author gengqiang
 * @date 2018/1/5
 */
@Service
public class RedisDispatchCountUtil {
    @Autowired
    private RedisTemplateUtil redisTemplateUtil;


    public void add(String key, Integer count) {
        Integer value = (Integer) redisTemplateUtil.get(key);
        value += count;
        redisTemplateUtil.set(key, value);
    }
}
