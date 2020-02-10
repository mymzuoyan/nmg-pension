package com.fedtech.web.shiro;

import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.apache.shiro.web.servlet.ShiroHttpServletResponse;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

/**
 * 去除ShiroHttpServletResponse中重定向时url中带有JSESSIONID参数
 * @author Shawn
 */
public class ShiroServletResponse extends ShiroHttpServletResponse {
    public ShiroServletResponse(HttpServletResponse wrapped, ServletContext context, ShiroHttpServletRequest request) {
        super(wrapped, context, request);
    }

    @Override
    protected String toEncoded(String url, String sessionId) {
        if (url != null && sessionId != null) {
            String path = url;
            String query = "";
            String anchor = "";
            int question = url.indexOf(63);
            if (question >= 0) {
                path = url.substring(0, question);
                query = url.substring(question);
            }

            int pound = path.indexOf(35);
            if (pound >= 0) {
                anchor = path.substring(pound);
                path = path.substring(0, pound);
            }

            StringBuilder sb = new StringBuilder(path);
            sb.append(anchor);
            sb.append(query);
            return sb.toString();
        } else {
            return url;
        }
    }
}
