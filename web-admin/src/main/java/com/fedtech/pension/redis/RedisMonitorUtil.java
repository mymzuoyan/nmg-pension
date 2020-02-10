package com.fedtech.pension.redis;

import com.fedtech.commons.utils.RedisUtils;
import com.fedtech.pension.call.vo.MonitorInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Set;

/**
 * @author gengqiang
 * @date 2018/4/26
 */
@Service
public class RedisMonitorUtil {


    @Autowired
    private RedisTemplateUtil redisTemplateUtil;


    public Set<String> getKeys() {
        HashMap hashMap = (HashMap<String, MonitorInfo>) redisTemplateUtil.getHash(RedisUtils.CACHE_MONITOR_INFO);
        return hashMap.keySet();
    }

    public HashMap<String, MonitorInfo> getHasMap() {
        return (HashMap<String, MonitorInfo>) redisTemplateUtil.getHash(RedisUtils.CACHE_MONITOR_INFO);
    }


    public void putMonitorInfo(String agentId, MonitorInfo monitorInfo) {
        HashMap hashMap = (HashMap<String, MonitorInfo>) redisTemplateUtil.getHash(RedisUtils.CACHE_MONITOR_INFO);
        hashMap.put(agentId, monitorInfo);
        redisTemplateUtil.setHash(RedisUtils.CACHE_MONITOR_INFO, hashMap);
    }

    public Object getMonitorInfo(String agentId) {
        HashMap hashMap = (HashMap<String, MonitorInfo>) redisTemplateUtil.getHash(RedisUtils.CACHE_MONITOR_INFO);
        return hashMap.get(agentId);
    }

    public void removeMonitorInfo(String agentId) {
        HashMap hashMap = (HashMap<String, MonitorInfo>) redisTemplateUtil.getHash(RedisUtils.CACHE_MONITOR_INFO);
        hashMap.remove(agentId);
        redisTemplateUtil.delete(RedisUtils.CACHE_MONITOR_INFO);
        redisTemplateUtil.setHash(RedisUtils.CACHE_MONITOR_INFO, hashMap);
    }

}
