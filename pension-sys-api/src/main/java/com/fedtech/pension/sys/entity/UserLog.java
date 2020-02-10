package com.fedtech.pension.sys.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户操作记录
 * @author gengqiang
 */
public class UserLog implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 用户id
     */
    private Integer uid;

    /**
     * 角色名称
     */
    private String uname;

    /**
     * 角色ID
     */
    private Integer uRoleId;

    /**
     * 操作
     */
    private String action;

    /**
     * 描述
     */
    private String description;

    /**
     * IP地址
     */
    private String ip;

    private Date createTime;

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

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action == null ? null : action.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public Integer getuRoleId() {
        return uRoleId;
    }

    public void setuRoleId(Integer uRoleId) {
        this.uRoleId = uRoleId;
    }
}