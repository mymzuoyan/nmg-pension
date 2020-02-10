package com.fedtech.pension.redis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * @author liun
 * @date 2018/3/23
 *
 */
@Component
public class RedisCacheUtils {

    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * 缓存集合
     * @param key key
     * @param value value
     */
    public void setCacheList(String key, List<?> value) {
        ListOperations listOperations = redisTemplate.opsForList();
        listOperations.leftPush(key, value);
    }

    /**
     * 获取缓存集合
     * @param key key
     * @return res
     */
    public Object getCacheList(String key) {
        return redisTemplate.opsForList().leftPop(key);
    }

    /**
     * 根基key删除缓存
     * @param key key
     */
    public void delete(String key) {
        redisTemplate.delete(key);
    }


    public void setHash(String key, Map<?, ?> value) {
        HashOperations hashOperations = redisTemplate.opsForHash();
        hashOperations.putAll(key, value);
    }

    public Object getHash(String key) {
        return redisTemplate.opsForHash().entries(key);
    }

}
