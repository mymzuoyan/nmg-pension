package com.fedtech.web.shiro;

import com.fedtech.pension.sys.entity.User;
import org.apache.commons.lang3.time.DateFormatUtils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 保存用户登录信息
 *
 * @author Shawn
 */
public class Principal implements Serializable {

    private static final long serialVersionUID = -5390201434189016795L;
    private Integer userId;
    private Integer areaId;
    private String username;
    private String name;

    public Principal() {

    }

    public Principal(User loginUser) {
        this.userId = loginUser.getUid();
        this.name = loginUser.getName();
        this.username = loginUser.getName();
        this.areaId = loginUser.getAreaId();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
