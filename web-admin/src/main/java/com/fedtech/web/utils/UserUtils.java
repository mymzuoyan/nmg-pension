package com.fedtech.web.utils;

import com.fedtech.web.shiro.Principal;
import org.apache.commons.codec.binary.Hex;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;


/**
 * Created by Shawn on 2017/9/22.
 */
public class UserUtils {

//    /**
//     * 密码加密
//     *
//     * @param originalPassword
//     * @return
//     */
//    public static String encryptPassword(String originalPassword) {
//        byte[] salt = Digests.randomSalt(8);
//        byte[] hashPassword = Digests.sha256(originalPassword.getBytes(), salt, Digests.HASH_INTERATIONS);
//        return Hex.encodeHexString(salt) + Hex.encodeHexString(hashPassword);
//    }

    /**
     * 获取已登录用户
     *
     * @return
     */
    public static Principal getPrincipal() {
        Subject subject = SecurityUtils.getSubject();
        Principal principal = (Principal) subject.getPrincipal();
        if (principal != null) {
            return principal;
        }
        return null;
    }

    /**
     * 获取当前用户
     *
     * @return
     */
    public static Subject getSubject() {
        return SecurityUtils.getSubject();
    }

    /**
     * 获取Session
     *
     * @return
     */
    public static Session getSession() {
        Subject subject = SecurityUtils.getSubject();
        Session session = subject.getSession(false);
        if (session == null) {
            session = subject.getSession(true);
        }
        return session;
    }
}
