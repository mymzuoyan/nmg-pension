package com.fedtech.pension.task.redis;

import com.fedtech.commons.utils.RedisUtils;
import com.fedtech.pension.sys.entity.UserState;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Set;

/**
 * @author gengqiang
 * @date 2017/12/21
 */
@Service
public class RedisUserStateUtil {

    @Autowired
    private RedisTemplateUtil redisTemplateUtil;


    public Set<Integer> getKeys() {
        HashMap hashMap = (HashMap<Integer, UserState>) redisTemplateUtil.getHash(RedisUtils.CACHE_USER_STATE);
        return hashMap.keySet();
    }

    public HashMap<Integer, UserState> getHasMap() {
        return (HashMap<Integer, UserState>) redisTemplateUtil.getHash(RedisUtils.CACHE_USER_STATE);
    }


    public void putUserState(Integer taskId, UserState task) {
        HashMap hashMap = (HashMap<Integer, UserState>) redisTemplateUtil.getHash(RedisUtils.CACHE_USER_STATE);
        hashMap.put(taskId, task);
        redisTemplateUtil.setHash(RedisUtils.CACHE_USER_STATE, hashMap);
    }

    public Object getUserState(Integer taskId) {
        HashMap hashMap = (HashMap<Integer, UserState>) redisTemplateUtil.getHash(RedisUtils.CACHE_USER_STATE);
        return hashMap.get(taskId);
    }

    public void removeUserState(Integer taskId) {
        HashMap hashMap = (HashMap<Integer, UserState>) redisTemplateUtil.getHash(RedisUtils.CACHE_USER_STATE);
        hashMap.remove(taskId);
        redisTemplateUtil.setHash(RedisUtils.CACHE_USER_STATE, hashMap);
    }

}
