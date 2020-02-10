package com.fedtech.web.shiro.session;

import com.alibaba.dubbo.common.utils.CollectionUtils;
import com.alibaba.fastjson.JSON;
import com.fedtech.commons.utils.Keys;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.core.RedisTemplate;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * @author Shawn
 */
public class RedisSessionDao extends EnterpriseCacheSessionDAO {

    Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * session在redis过期时间是30分钟30*60
     */
    private static int expireTime = 1800;

    private static String prefix = "shiro-active-sessions-";

    @Resource
    RedisTemplate<String, Object> redisTemplate;

    // 创建session，保存到数据库
    @Override
    protected Serializable doCreate(Session session) {
        Serializable sessionId = super.doCreate(session);
        logger.debug("创建session:{}", session.getId());
        redisTemplate.opsForValue().set(getSessionKey(sessionId), session);
        return sessionId;
    }

    // 获取session
    @Override
    protected Session doReadSession(Serializable sessionId) {
        logger.debug("获取session:{}", sessionId);
        // 先从缓存中获取session，如果没有再去数据库中获取
        Session session = super.doReadSession(sessionId);
        if (session == null) {
            session = (Session) redisTemplate.opsForValue().get(getSessionKey(sessionId));
        }
        return session;
    }

    // 更新session的最后一次访问时间
    @Override
    protected void doUpdate(Session session) {
        super.doUpdate(session);
        String key = getSessionKey(session.getId());
        if (!redisTemplate.hasKey(key)) {
            redisTemplate.opsForValue().set(key, session);
        }
        redisTemplate.expire(key, expireTime, TimeUnit.SECONDS);
    }

    // 删除session
    @Override
    protected void doDelete(Session session) {
        logger.debug("删除session:{}", session.getId());
        super.doDelete(session);
        redisTemplate.delete(getSessionKey(session.getId()));
    }

    @Override
    public Collection<Session> getActiveSessions() {
        Collection<Session> sessions = new ArrayList<>();
        Set<String> keys = redisTemplate.keys(prefix + "*");
        if (CollectionUtils.isEmpty(keys)) {
            return null;
        }
        keys.forEach(key -> {
            Session session = (Session) redisTemplate.opsForValue().get(key);
            if (session.getAttribute(Keys.LOGIN_USER) != null) {
                sessions.add(session);
            }
        });
        logger.debug("session列表:{}", JSON.toJSONString(sessions));

        return sessions;
    }

    public void updateSession(Session session) {
        super.update(session);
        String key = getSessionKey(session.getId());
        if (redisTemplate.hasKey(key)) {
            redisTemplate.opsForValue().set(key, session);
        }
    }

    private String getSessionKey(Serializable sessionId) {
        return prefix + sessionId.toString();
    }

}
