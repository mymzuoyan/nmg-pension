package com.fedtech.pension.redis;

import com.fedtech.commons.utils.RedisUtils;
import com.fedtech.pension.sys.entity.Area;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Set;

/**
 * @author gengqiang
 * @date 2018/4/26
 */
@Service
public class RedisAreaUtil {


    @Autowired
    private RedisTemplateUtil redisTemplateUtil;


    public Set<Integer> getKeys() {
        HashMap hashMap = (HashMap<Integer, Area>) redisTemplateUtil.getHash(RedisUtils.CACHE_AREA);
        return hashMap.keySet();
    }

    public HashMap<Integer, Area> getHasMap() {
        return (HashMap<Integer, Area>) redisTemplateUtil.getHash(RedisUtils.CACHE_AREA);
    }


    public void putArea(Integer areaId, Area area) {
        HashMap hashMap = (HashMap<Integer, Area>) redisTemplateUtil.getHash(RedisUtils.CACHE_AREA);
        hashMap.put(areaId, area);
        redisTemplateUtil.setHash(RedisUtils.CACHE_AREA, hashMap);
    }

    public Object getArea(Integer areaId) {
        HashMap hashMap = (HashMap<Integer, Area>) redisTemplateUtil.getHash(RedisUtils.CACHE_AREA);
        return hashMap.get(areaId);
    }

    public void removeArea(Integer areaId) {
        HashMap hashMap = (HashMap<Integer, Area>) redisTemplateUtil.getHash(RedisUtils.CACHE_AREA);
        hashMap.remove(areaId);
        redisTemplateUtil.delete(RedisUtils.CACHE_AREA);
        redisTemplateUtil.setHash(RedisUtils.CACHE_AREA, hashMap);
    }

}
