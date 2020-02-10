package com.fedtech.pension.redis;

import com.fedtech.commons.utils.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Set;

/**
 * @author gengqiang
 * @date 2018/4/26
 */
@Service
public class RedisCallInfoUtil {


    @Autowired
    private RedisTemplateUtil redisTemplateUtil;


    public Set<String> getKeys() {
        HashMap hashMap = (HashMap<String, String>) redisTemplateUtil.getHash(RedisUtils.CACHE_CALLING_INFO);
        return hashMap.keySet();
    }

    public HashMap<String, String> getHasMap() {
        return (HashMap<String, String>) redisTemplateUtil.getHash(RedisUtils.CACHE_CALLING_INFO);
    }


    public void putCallingInfo(String num, String type) {
        HashMap hashMap = (HashMap<String, String>) redisTemplateUtil.getHash(RedisUtils.CACHE_CALLING_INFO);
        hashMap.put(num, type);
        redisTemplateUtil.setHash(RedisUtils.CACHE_CALLING_INFO, hashMap);
    }

    public Object getCallingInfo(String num) {
        HashMap hashMap = (HashMap<String, String>) redisTemplateUtil.getHash(RedisUtils.CACHE_CALLING_INFO);
        return hashMap.get(num);
    }

    public void removeCallingInfo(String num) {
        HashMap hashMap = (HashMap<String, String>) redisTemplateUtil.getHash(RedisUtils.CACHE_CALLING_INFO);
        hashMap.remove(num);
        redisTemplateUtil.delete(RedisUtils.CACHE_CALLING_INFO);
        redisTemplateUtil.setHash(RedisUtils.CACHE_CALLING_INFO, hashMap);
    }

}
