package com.fedtech.pension.org.entity;

import com.fedtech.pension.sys.entity.User;

import java.io.Serializable;
import java.util.Date;

/**
 * 组织评论
 *
 * @author gengqiang
 * @date 2019/6/26
 */
public class ServiceOrgComment implements Serializable {

    private static final Long serialVersionUID = 1L;

    /**
     * id
     */
    private Integer id;

    /**
     * 组织
     */
    private ServiceOrg serviceOrg;

    /**
     * 用户
     */
    private User user;

    /**
     * 评论
     */
    private String comment;

    /**
     * 分数
     */
    private Integer score;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 区域名称
     */
    private String areaName;

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public ServiceOrg getServiceOrg() {
        return serviceOrg;
    }

    public void setServiceOrg(ServiceOrg serviceOrg) {
        this.serviceOrg = serviceOrg;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
