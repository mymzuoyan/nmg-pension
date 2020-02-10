package com.fedtech.pension.sys.entity;

import java.io.Serializable;

/**
 * 用户权限表
 * Created by zhnn on 2017/2/27.
 */
public class UserApprove implements Serializable {

    private Integer id;

    /**
     * uid
     */
    private Integer uid;

    /**
     * 业务类型
     */
    private String type;

    /**
     * 添加权限值
     */
    private String permission;

    /**
     * uid在user表联查loginName
     */
    private String loginName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }
}
