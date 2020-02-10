package com.fedtech.pension.datadock.redis;

import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.commons.utils.RedisUtils;
import com.fedtech.pension.nurse.entity.NurseElderlyLocation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

/**
 * @author gengqiang
 * @date 2018/1/12
 */
@Service
public class RedisNurseElderlyLocationUtil {

    public Long TIME_OUT = 60 * 30L;


    @Autowired
    private RedisTemplate redisTemplate;


    public void putElderlyLocation(Integer id, NurseElderlyLocation elderlyLocation) {
        redisTemplate.opsForValue().set(getKey(id), elderlyLocation, TIME_OUT, TimeUnit.SECONDS);
    }

    public NurseElderlyLocation getElderlyLocation(Integer id) {
        //更新过期时间
        redisTemplate.expire(getKey(id), TIME_OUT, TimeUnit.SECONDS);
        Object object = redisTemplate.opsForValue().get(getKey(id));
        if (ObjectUtils.isNotNull(object)) {
            return (NurseElderlyLocation) object;
        } else {
            return null;
        }
    }

    public void removeAppToken(Integer id) {
        redisTemplate.delete(getKey(id));
    }


    public String getKey(Integer userId) {
        return RedisUtils.CACHE_NURSE_ELDERLY_LOCATION + "_" + userId;
    }

}
