package com.fedtech.web.shiro.session;

import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.SessionContext;
import org.apache.shiro.session.mgt.SessionKey;
import org.apache.shiro.session.mgt.SimpleSession;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;

import java.util.Collection;
import java.util.Date;

/**
 * @author Shawn
 */
public class SessionManager extends DefaultWebSessionManager {

    public SessionManager() {
        super();
    }

    @Override
    public void validateSessions() {
        super.validateSessions();
    }

    @Override
    protected Session retrieveSession(SessionKey sessionKey) {
        try {
            return super.retrieveSession(sessionKey);
        } catch (UnknownSessionException e) {
            // 获取不到SESSION不抛出异常
            return null;
        }
    }

    @Override
    public Date getStartTimestamp(SessionKey key) {
        try {
            return super.getStartTimestamp(key);
        } catch (InvalidSessionException e) {
            // 获取不到SESSION不抛出异常
            return null;
        }
    }

    @Override
    public Date getLastAccessTime(SessionKey key) {
        try {
            return super.getLastAccessTime(key);
        } catch (InvalidSessionException e) {
            // 获取不到SESSION不抛出异常
            return null;
        }
    }

    @Override
    public long getTimeout(SessionKey key) {
        try {
            return super.getTimeout(key);
        } catch (InvalidSessionException e) {
            // 获取不到SESSION不抛出异常
            return 0;
        }
    }

    @Override
    public void setTimeout(SessionKey key, long maxIdleTimeInMillis) {
        try {
            super.setTimeout(key, maxIdleTimeInMillis);
        } catch (InvalidSessionException e) {
            // 获取不到SESSION不抛出异常
        }
    }

    @Override
    public void touch(SessionKey key) {
        try {
            super.touch(key);
        } catch (InvalidSessionException e) {
            // 获取不到SESSION不抛出异常
        }
    }

    @Override
    public String getHost(SessionKey key) {
        try {
            return super.getHost(key);
        } catch (InvalidSessionException e) {
            // 获取不到SESSION不抛出异常
            return null;
        }
    }

    @Override
    public Collection<Object> getAttributeKeys(SessionKey key) {
        try {
            return super.getAttributeKeys(key);
        } catch (InvalidSessionException e) {
            // 获取不到SESSION不抛出异常
            return null;
        }
    }

    @Override
    public Object getAttribute(SessionKey sessionKey, Object attributeKey) {
        try {
            return super.getAttribute(sessionKey, attributeKey);
        } catch (InvalidSessionException e) {
            // 获取不到SESSION不抛出异常
            return null;
        }
    }

    @Override
    public void setAttribute(SessionKey sessionKey, Object attributeKey, Object value) {
        try {
            super.setAttribute(sessionKey, attributeKey, value);
        } catch (InvalidSessionException e) {
            // 获取不到SESSION不抛出异常
        }
    }

    @Override
    public Object removeAttribute(SessionKey sessionKey, Object attributeKey) {
        try {
            return super.removeAttribute(sessionKey, attributeKey);
        } catch (InvalidSessionException e) {
            // 获取不到SESSION不抛出异常
            return null;
        }
    }

    @Override
    public void stop(SessionKey key) {
        try {
            super.stop(key);
        } catch (InvalidSessionException e) {
            // 获取不到SESSION不抛出异常
        }
    }

    @Override
    public void checkValid(SessionKey key) {
        try {
            super.checkValid(key);
        } catch (InvalidSessionException e) {
            // 获取不到SESSION不抛出异常
        }
    }

    @Override
    protected Session doCreateSession(SessionContext context) {
        try {
            return super.doCreateSession(context);
        } catch (IllegalStateException e) {
            return null;
        }
    }

    @Override
    protected Session newSessionInstance(SessionContext context) {
        Session session = super.newSessionInstance(context);
        session.setTimeout(getGlobalSessionTimeout());
        return session;
    }

    @Override
    public Session start(SessionContext context) {
        try {
            return super.start(context);
        } catch (NullPointerException e) {
            SimpleSession session = new SimpleSession();
            session.setId(0);
            return session;
        }
    }


}
