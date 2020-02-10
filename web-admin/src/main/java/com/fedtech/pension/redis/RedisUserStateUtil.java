package com.fedtech.pension.redis;

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


    public void putUserState(Integer uid, UserState us) {
        HashMap hashMap = (HashMap<Integer, UserState>) redisTemplateUtil.getHash(RedisUtils.CACHE_USER_STATE);
        hashMap.put(uid, us);
        redisTemplateUtil.setHash(RedisUtils.CACHE_USER_STATE, hashMap);
    }

    public Object getUserState(Integer uid) {
        HashMap hashMap = (HashMap<Integer, UserState>) redisTemplateUtil.getHash(RedisUtils.CACHE_USER_STATE);
        return hashMap.get(uid);
    }

    public void removeUserState(Integer uid) {
        HashMap hashMap = (HashMap<Integer, UserState>) redisTemplateUtil.getHash(RedisUtils.CACHE_USER_STATE);
        hashMap.remove(uid);
        redisTemplateUtil.setHash(RedisUtils.CACHE_USER_STATE, hashMap);
    }

}
