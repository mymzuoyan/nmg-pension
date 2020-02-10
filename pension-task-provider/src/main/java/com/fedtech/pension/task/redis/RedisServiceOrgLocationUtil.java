package com.fedtech.pension.task.redis;

import com.fedtech.commons.utils.RedisUtils;
import com.fedtech.pension.org.entity.ServiceOrgLocation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Set;

/**
 * @author gengqiang
 * @date 2017/12/20
 */
@Service
public class RedisServiceOrgLocationUtil {

    @Autowired
    private RedisTemplateUtil redisTemplateUtil;


    public Set<Integer> getKeys() {
        HashMap hashMap = (HashMap<Integer, ServiceOrgLocation>) redisTemplateUtil.getHash(RedisUtils.CACHE_SERVICE_ORG_LOCATION);
        return hashMap.keySet();
    }

    public HashMap<Integer, ServiceOrgLocation> getHasMap() {
        return (HashMap<Integer, ServiceOrgLocation>) redisTemplateUtil.getHash(RedisUtils.CACHE_SERVICE_ORG_LOCATION);
    }


    public void putServiceOrgLocation(Integer serviceId, ServiceOrgLocation serviceOrgLocation) {
        HashMap hashMap = (HashMap<Integer, ServiceOrgLocation>) redisTemplateUtil.getHash(RedisUtils.CACHE_SERVICE_ORG_LOCATION);
        hashMap.put(serviceId, serviceOrgLocation);
        redisTemplateUtil.setHash(RedisUtils.CACHE_SERVICE_ORG_LOCATION, hashMap);
    }

    public Object getServiceOrgLocation(Integer serviceId) {
        HashMap hashMap = (HashMap<Integer, ServiceOrgLocation>) redisTemplateUtil.getHash(RedisUtils.CACHE_SERVICE_ORG_LOCATION);
        return hashMap.get(serviceId);
    }

    public void removeServiceOrgLocation(Integer serviceId) {
        HashMap hashMap = (HashMap<Integer, ServiceOrgLocation>) redisTemplateUtil.getHash(RedisUtils.CACHE_SERVICE_ORG_LOCATION);
        hashMap.remove(serviceId);
        redisTemplateUtil.delete(RedisUtils.CACHE_SERVICE_ORG_LOCATION);
        redisTemplateUtil.setHash(RedisUtils.CACHE_SERVICE_ORG_LOCATION, hashMap);
    }
}
