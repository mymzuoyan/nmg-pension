package com.fedtech.web.shiro;

import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.mgt.FilterChainManager;
import org.apache.shiro.web.filter.mgt.FilterChainResolver;
import org.apache.shiro.web.filter.mgt.PathMatchingFilterChainResolver;
import org.apache.shiro.web.mgt.WebSecurityManager;
import org.apache.shiro.web.servlet.AbstractShiroFilter;
import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.springframework.beans.factory.BeanInitializationException;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

/**
 * 扩展类
 *
 * @author Shawn
 */
public class ShiroFilterFactoryBeanExtend extends ShiroFilterFactoryBean {

    @Override
    public Class getObjectType() {
        return ShiroWebFilter.class;
    }

    @Override
    protected AbstractShiroFilter createInstance() throws Exception {
        SecurityManager securityManager = this.getSecurityManager();
        String msg;
        if (securityManager == null) {
            msg = "SecurityManager property must be set.";
            throw new BeanInitializationException(msg);
        } else if (!(securityManager instanceof WebSecurityManager)) {
            msg = "The security manager does not implement the WebSecurityManager interface.";
            throw new BeanInitializationException(msg);
        } else {
            FilterChainManager manager = this.createFilterChainManager();
            PathMatchingFilterChainResolver chainResolver = new PathMatchingFilterChainResolver();
            chainResolver.setFilterChainManager(manager);
            return new ShiroWebFilter((WebSecurityManager) securityManager, chainResolver);
        }
    }

    private static final class ShiroWebFilter extends AbstractShiroFilter {

        protected ShiroWebFilter(WebSecurityManager webSecurityManager, FilterChainResolver resolver) {
            if (webSecurityManager == null) {
                throw new IllegalArgumentException("WebSecurityManager property cannot be null.");
            } else {
                this.setSecurityManager(webSecurityManager);
                if (resolver != null) {
                    this.setFilterChainResolver(resolver);
                }
            }
        }

        @Override
        protected ServletResponse wrapServletResponse(HttpServletResponse orig, ShiroHttpServletRequest request) {
            return new ShiroServletResponse(orig, this.getServletContext(), request);
        }
    }
}
