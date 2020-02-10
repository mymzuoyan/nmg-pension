package com.fedtech.pension.controller;

import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.Keys;
import com.fedtech.pension.sys.entity.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Gong
 * @date 2016/4/7
 */
public class BaseController {

    public Logger logger = LoggerFactory.getLogger(BaseController.class);
    public final String ADMIN_PREFIX = "/admin/";
    public final String ADMIN_CALL_PREFIX = "/admin/call/";
    public final String ADMIN_DICTIONARY_PREFIX = "/admin/dictionary/";
    public final String ADMIN_NURSE_PREFIX = "/admin/nurse/";
    public final String ADMIN_BRACELET_PREFIX = "/admin/bracelet/";
    public final String ADMIN_CARD_PREFIX = "/admin/card/";
    public final String VIEW_PREFIX = "/view/";

    public final String UNAUTH_PAGE = "/unauth";


    protected User currentUser() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return (User) request.getSession().getAttribute(Keys.LOGIN_USER);
    }

    protected Subject getCurrentUser() {
        return SecurityUtils.getSubject();
    }

    protected void setCurrentUser(HttpServletRequest request, User user) {
        try {
            request.getSession().removeAttribute(Keys.LOGIN_USER);
            request.getSession().setAttribute(Keys.LOGIN_USER, user);
        } catch (Exception ex) {
        }
    }

    protected Integer getRoleId() {
        Subject currentUser = getCurrentUser();
        for (RoleType s : RoleType.values()) {
            if (currentUser.hasRole(s.getValue())) {
                return s.getId();
            }
        }
        return null;
    }

}
