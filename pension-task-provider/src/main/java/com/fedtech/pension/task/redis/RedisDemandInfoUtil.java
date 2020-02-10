package com.fedtech.pension.task.redis;

import com.fedtech.commons.utils.RedisUtils;
import com.fedtech.pension.task.entity.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Set;

/**
 * @author gengqiang
 * @date 2017/12/21
 */
@Service
public class RedisDemandInfoUtil {

    @Autowired
    private RedisTemplateUtil redisTemplateUtil;


    public Set<Integer> getKeys() {
        HashMap hashMap = (HashMap<Integer, Task>) redisTemplateUtil.getHash(RedisUtils.CACHE_DEMAND_INFO);
        return hashMap.keySet();
    }

    public HashMap<Integer, Task> getHasMap() {
        return (HashMap<Integer, Task>) redisTemplateUtil.getHash(RedisUtils.CACHE_DEMAND_INFO);
    }


    public void putDemandInfo(Integer taskId, Task task) {
        HashMap hashMap = (HashMap<Integer, Task>) redisTemplateUtil.getHash(RedisUtils.CACHE_DEMAND_INFO);
        hashMap.put(taskId, task);
        redisTemplateUtil.setHash(RedisUtils.CACHE_DEMAND_INFO, hashMap);
    }

    public Object getDemandInfo(Integer taskId) {
        HashMap hashMap = (HashMap<Integer, Task>) redisTemplateUtil.getHash(RedisUtils.CACHE_DEMAND_INFO);
        return hashMap.get(taskId);
    }

    public void removeDemandInfo(Integer taskId) {
        HashMap hashMap = (HashMap<Integer, Task>) redisTemplateUtil.getHash(RedisUtils.CACHE_DEMAND_INFO);
        hashMap.remove(taskId);
        redisTemplateUtil.delete(RedisUtils.CACHE_CALLING_INFO);
        redisTemplateUtil.setHash(RedisUtils.CACHE_DEMAND_INFO, hashMap);
    }

}
