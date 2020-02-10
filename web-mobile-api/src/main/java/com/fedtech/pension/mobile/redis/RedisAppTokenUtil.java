package com.fedtech.pension.mobile.redis;

import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.commons.utils.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

/**
 * @author gengqiang
 * @date 2018/1/12
 */
@Service
public class RedisAppTokenUtil {

    public Long TIME_OUT = 60 * 30L;


    @Autowired
    private RedisTemplate redisTemplate;


    public void putAppToken(Integer userId, String token) {
        redisTemplate.opsForValue().set(getKey(userId), token, TIME_OUT, TimeUnit.SECONDS);
    }

    public String getAppToken(Integer userId) {
        redisTemplate.expire(getKey(userId), TIME_OUT, TimeUnit.SECONDS);//更新过期时间
        Object object = redisTemplate.opsForValue().get(getKey(userId));
        if (ObjectUtils.isNotNull(object)) {
            return object.toString();
        } else {
            return null;
        }
    }

    public void removeAppToken(Integer userId) {
        redisTemplate.delete(getKey(userId));
    }


    public String getKey(Integer userId) {
        return RedisUtils.CACHE_APP_TOKEN + "_" + userId;
    }

}
