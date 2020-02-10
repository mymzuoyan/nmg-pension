package com.fedtech.pension.task.redis;

import com.fedtech.commons.utils.ObjectUtils;
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


    public void add(String key, Long count) {
        Long value = (Long) redisTemplateUtil.get(key);
        Long today = (Long) redisTemplateUtil.get("today_" + key);
        if (value == null) {
            value = 0L;
        }
        if (today == null) {
            today = 0L;
        }
        value += count;
        today += count;
        redisTemplateUtil.set(key, value);
        redisTemplateUtil.set("today_" + key, today);
    }

    public Long getValue(String key) {
        Long result = 0L;
        Object object = redisTemplateUtil.get(key);
        if (ObjectUtils.isNotNull(object)) {
            result = (Long) object;
        }
        return result;
    }
}
